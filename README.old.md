# Banking Data Science, Machine Learning & AI Projects

Ya. Kalau tujuannya membuat **peta besar Machine Learning / AI untuk banking**, masih ada beberapa kategori penting yang belum masuk. List Anda sebenarnya sudah mencakup sebagian besar **core ML task**, tetapi bisa diperluas menjadi beberapa kategori berikut.

| Jenis                          | Pertanyaan                                                    | Contoh Bank                      |
| ------------------------------ | ------------------------------------------------------------- | -------------------------------- |
| **Classification**             | Apa kategorinya?                                              | Fraud / Normal                   |
| **Regression**                 | Berapa nilainya?                                              | Loan Amount                      |
| **Clustering**                 | Kelompoknya apa?                                              | Customer Segmentation            |
| **Forecasting**                | Apa yang terjadi nanti?                                       | Loan Demand                      |
| **Anomaly Detection**          | Apa yang tidak normal?                                        | Fraud                            |
| **Recommendation**             | Apa yang sebaiknya ditawarkan?                                | Next Best Product                |
| **Dimensionality Reduction**   | Bagaimana menyederhanakan data?                               | Customer Profiling               |
| **NLP**                        | Apa makna teks?                                               | Complaint Analysis               |
| **Computer Vision**            | Apa isi gambar?                                               | KTP / OCR                        |
| **Reinforcement Learning**     | Tindakan apa yang optimal?                                    | Next Best Action                 |
| **Time Series Analysis**       | Bagaimana pola berubah dari waktu ke waktu?                   | Transaction / Cash Flow Pattern  |
| **Survival Analysis**          | Kapan suatu kejadian terjadi?                                 | Churn / Default / Retention      |
| **Causal Inference**           | Apa dampak sebenarnya dari suatu tindakan?                    | Efek promo terhadap transaksi    |
| **Association Rule Mining**    | Apa yang sering muncul bersama?                               | Product / Transaction Basket     |
| **Ranking / Learning to Rank** | Mana yang harus diprioritaskan?                               | Lead / Customer / Offer Ranking  |
| **Entity Resolution**          | Apakah data ini orang/entity yang sama?                       | Customer Deduplication           |
| **Graph / Graph ML**           | Bagaimana entity saling terhubung?                            | Fraud Network                    |
| **Semi-Supervised Learning**   | Bagaimana belajar dari sedikit data berlabel?                 | Fraud dengan label terbatas      |
| **Self-Supervised Learning**   | Bagaimana belajar dari data tanpa label?                      | Transaction Representation       |
| **Generative AI / LLM**        | Apa yang bisa dibuat/dihasilkan?                              | Report / Email / Summary         |
| **Information Retrieval**      | Dokumen mana yang relevan?                                    | Search SOP / Knowledge Base      |
| **Document Intelligence**      | Bagaimana memahami dokumen?                                   | Loan Document Processing         |
| **Speech / Audio AI**          | Apa yang dikatakan?                                           | Call Center Speech Analytics     |
| **Optimization**               | Keputusan apa yang memaksimalkan objective dengan constraint? | Allocation / Collection Strategy |
| **Simulation**                 | Apa yang terjadi jika kondisi diubah?                         | Credit / Liquidity Scenario      |
| **Survival / Event Modeling**  | Siapa yang akan mengalami event dan kapan?                    | Loan Default Timing              |

### Yang menurut saya paling penting untuk ditambahkan

Kalau Anda ingin membuat **kurikulum Machine Learning untuk Banking**, saya akan membaginya menjadi **5 kelompok besar**:

#### 1. Predictive ML

```text
Classification
Regression
Forecasting
Survival Analysis
```

Pertanyaan utamanya:

> **"Apa yang akan terjadi?"**

Contoh:

```text
Customer → Default?
Customer → Churn?
Customer → Berapa loan amount?
Bank → Berapa demand bulan depan?
```

---

#### 2. Unsupervised ML

```text
Clustering
Anomaly Detection
Dimensionality Reduction
Association Rule Mining
```

Pertanyaan:

> **"Apa pola yang ada di data?"**

Contoh:

```text
Customer → Segment apa?
Transaction → Normal atau unusual?
Product → Sering dibeli bersama apa?
Customer Data → Bisa disederhanakan menjadi beberapa dimensi?
```

---

#### 3. Decision & Optimization

Ini yang sering terlewat.

```text
Recommendation
Ranking
Reinforcement Learning
Optimization
Simulation
```

Pertanyaannya:

> **"Apa keputusan yang sebaiknya diambil?"**

Misalnya:

```text
Customer
   ↓
Prediction
   ↓
Recommendation
   ↓
Optimization
   ↓
Action
```

---

#### 4. Unstructured Data AI

```text
NLP
Computer Vision
Speech AI
Document Intelligence
LLM / Generative AI
Information Retrieval
```

Pertanyaannya:

> **"Bagaimana memahami data yang bukan tabel?"**

Contoh:

```text
Text       → Complaint Analysis
Image      → KTP / Document
Audio      → Call Center
PDF        → Loan Document
LLM        → Summary / Generation
```

---

#### 5. Advanced / Modern ML

```text
Causal Inference
Graph ML
Self-Supervised Learning
Semi-Supervised Learning
Entity Resolution
```

Pertanyaannya lebih advanced:

> **"Mengapa sesuatu terjadi, bagaimana entity saling terhubung, dan bagaimana belajar ketika label terbatas?"**

Contoh paling menarik di banking adalah:

### Graph ML

```text
Customer A
   │
   ├── Account
   │
   ├── Phone
   │
   ├── Device
   │
   └── Transaction
          │
       Customer B
```

Kemudian model mencari pola:

> **Apakah network transaksi ini menunjukkan pola fraud?**

Ini berbeda dengan anomaly detection biasa karena fokusnya pada **relationship/network**, bukan hanya nilai transaksi yang abnormal.

---

## Kalau dibuat menjadi "Banking ML Project Series"

Karena Anda sudah membuat notebook untuk masing-masing topik, saya justru menyarankan seri lengkapnya menjadi:

```text
01 Classification
   └── Fraud Detection

02 Regression
   └── Loan Amount Prediction

03 Clustering
   └── Customer Segmentation

04 Forecasting
   └── Loan Demand Forecasting

05 Anomaly Detection
   └── Transaction Anomaly

06 Recommendation
   └── Next Best Product

07 Dimensionality Reduction
   └── Customer Profiling

08 NLP
   └── Complaint Analysis

09 Computer Vision
   └── KTP / Document Classification

10 Reinforcement Learning
   └── Next Best Action

11 Survival Analysis
   └── Customer Churn / Loan Default Timing

12 Association Rule Mining
   └── Product Affinity

13 Ranking
   └── Lead / Customer Prioritization

14 Graph ML
   └── Fraud Network Detection

15 Causal Inference
   └── Campaign Effectiveness

16 Optimization
   └── Collection / Resource Allocation

17 Simulation
   └── Banking Scenario Analysis

18 Entity Resolution
   └── Customer Deduplication

19 Document Intelligence
   └── Automated Loan Document Processing

20 Speech AI
   └── Call Center Analytics

21 Generative AI / LLM
   └── Banking Copilot
```

Dengan demikian, **10 project yang sudah Anda buat adalah fondasi**, sementara 11–21 bisa menjadi level berikutnya.

Kalau targetnya untuk portfolio **Data Scientist/AI di bank**, saya akan memprioritaskan **Survival Analysis → Association Rule → Ranking → Graph ML → Causal Inference → Optimization → Generative AI** sebagai kelanjutan.
