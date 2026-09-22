import pathlib, re

p = pathlib.Path("README.md")
text = p.read_text()
lines = text.split("\n")
problems = []

# 1. heading hierarchy
heads = [(i + 1, l) for i, l in enumerate(lines) if l.startswith("#")]
h1 = [h for h in heads if h[1].startswith("# ") and not h[1].startswith("## ")]
print("H1 count:", len(h1), h1)
print("total headings:", len(heads))

# 2. tables: consistent cell counts
i = 0
while i < len(lines):
    if lines[i].startswith("|"):
        block = []
        while i < len(lines) and lines[i].startswith("|"):
            block.append((i + 1, lines[i]))
            i += 1
        counts = set(len(re.findall(r"(?<!\\)\|", l[1])) for l in block)
        if len(counts) != 1:
            problems.append("table at line %d inconsistent pipes: %s" % (block[0][0], counts))
        if len(block) < 3:
            problems.append("table at line %d has only %d rows" % (block[0][0], len(block)))
        print("table @ line %-4d rows=%-3d cells=%s" % (block[0][0], len(block), list(counts)[0] - 1))
    else:
        i += 1

# 3. relative links exist
n_links = 0
for m in re.finditer(r"\]\(([^)]+)\)", text):
    target = m.group(1)
    if target.startswith("#") or target.startswith("http"):
        continue
    n_links += 1
    if not pathlib.Path(target.split("#")[0]).exists():
        problems.append("broken link: %s" % target)


# 4. TOC anchors vs headings
def slug(h):
    s = h.lstrip("#").strip().lower()
    s = re.sub(r"[^\w\s-]", "", s)
    return re.sub(r"\s+", "-", s)


anchors = set(slug(h) for _, h in heads)
n_anchor = 0
for m in re.finditer(r"\]\(#([^)]+)\)", text):
    n_anchor += 1
    if m.group(1) not in anchors:
        problems.append("anchor not found: #%s (available: %s)" % (m.group(1), sorted(anchors)))

print("relative links checked:", n_links)
print("anchor links checked:", n_anchor)
print("lines:", len(lines), "chars:", len(text))
print("PROBLEMS:", problems if problems else "none")
