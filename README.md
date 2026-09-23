# Banking Data Science, Machine Learning & AI Projects

End-to-end Data Science, Machine Learning and AI projects for retail banking — 18 self-contained Jupyter notebooks, each with its own synthetic sample dataset, covering the full analytics spectrum from credit-risk classification to generative AI.

| Item | Value |
| --- | --- |
| Projects | 18 end-to-end notebooks |
| Coverage | Supervised · Unsupervised · Decision & Optimization · Unstructured Data AI · Advanced / Modern ML |
| Sample data | 32 synthetic CSV datasets + 300 sample images (no real customer data) |
| Stack | Python 3.14 · pandas · scikit-learn 1.9 · TensorFlow/Keras · Jupyter |
| Notebook flow | Business case → data quality → EDA → feature engineering → modeling → evaluation → business impact → production architecture |

## Table of Contents

1. [Overview](#overview)
2. [Repository structure](#repository-structure)
3. [Project index](#project-index)
4. [ML task taxonomy for banking](#ml-task-taxonomy-for-banking)
5. [Curriculum map](#curriculum-map)
6. [Tech stack](#tech-stack)
7. [Getting started](#getting-started)
8. [Anatomy of a project notebook](#anatomy-of-a-project-notebook)
9. [Archive helper script](#archive-helper-script)
10. [Data and disclaimer](#data-and-disclaimer)
11. [Roadmap](#roadmap)

## Overview

This repository is a **banking-focused Data Science / ML / AI portfolio**. Every folder is one project: a single notebook that runs from business problem to executive summary, plus the synthetic sample data it needs. Nothing is a toy snippet — each notebook trains, evaluates and interprets a real model.

- **18 of 21 tasks** from the banking ML map below are implemented; the remaining three (forecasting, anomaly detection, recommendation) are tracked in the [roadmap](#roadmap).
- **Business-first framing** — each notebook opens with a business case and closes with business interpretation, production architecture, common mistakes and an executive summary.
- **Banking-specific evaluation** — threshold selection, PR-AUC vs ROC-AUC, uplift and calibration discussions, fairness and responsible-lending notes.
- **Reproducible** — fixed random seeds and relative data paths, so a notebook runs as-is from its own folder.
- **Safe by design** — all data is synthetic and generated for training purposes.

## Repository structure

```text
DS Training/
├── README.md                    # this file
├── future.md                    # 200-project banking DS & AI roadmap
├── extract_bank_zips.sh         # helper: extract project archives, skip existing files
│
├── 01_loan_approval_classification/               # 01 Classification
├── 02_loan_amount_regression/                     # 02 Regression
├── 03_customer_clustering/                        # 03 Clustering
├── 07_dimensionality_reduction/                   # 07 Dimensionality Reduction
├── 08_nlp/                                        # 08 NLP
├── 09_computer_vision/                            # 09 Computer Vision
├── 10_reinforcement_learning/                     # 10 Reinforcement Learning
├── 11_survival_analysis/                          # 11 Survival Analysis
├── 12_association_rule_mining/                    # 12 Association Rule Mining
├── 13_ranking_lead_prioritization/                # 13 Ranking
├── 14_graph_ml_fraud_network/                     # 14 Graph ML
├── 15_causal_inference_campaign/                  # 15 Causal Inference
├── 16_optimization_collection_allocation/         # 16 Optimization
├── 17_simulation_scenario_analysis/               # 17 Simulation
├── 18_entity_resolution_deduplication/            # 18 Entity Resolution
├── 19_document_intelligence_loan_processing/      # 19 Document Intelligence
├── 20_speech_ai_call_center/                      # 20 Speech AI
└── 21_generative_ai_llm_copilot/                  # 21 Generative AI / LLM
```

Folder names carry the two-digit project number from the banking ML map (and the 200-project roadmap in `future.md`), so numbering is consistent across the repository. Numbers `04` (Forecasting), `05` (Anomaly Detection) and `06` (Recommendation) are reserved for the planned projects in the [roadmap](#roadmap).

Each project folder contains **one notebook** plus its **synthetic `*.csv` sample data** (and the supporting files it references, e.g. `sample_images/` for the computer-vision project or a saved model for the loan-approval project).

Running a notebook writes all of its results — figures (`.png`), result tables (`.csv`) and persisted models (`.joblib`) — into an `output/` folder inside the project folder. The folder is created automatically on the first run; delete it at any time and it will be recreated on the next run.

## Project index

The `#` column is the position of the project in the 21-task banking ML map below. Row counts exclude the header.

### Supervised and predictive

| # | Project | Business question | Notebook | Sample data |
| --- | --- | --- | --- | --- |
| 01 | Loan Approval Prediction | Will this applicant repay the loan? | [Loan_Approval_Prediction_End_to_End.ipynb](01_loan_approval_classification/Loan_Approval_Prediction_End_to_End.ipynb) | `bank_loan_approval_sample.csv` (5,000 × 17) |
| 02 | Loan Amount Prediction | How much loan can this customer service? | [Bank_Loan_Amount_Regression_End_to_End.ipynb](02_loan_amount_regression/Bank_Loan_Amount_Regression_End_to_End.ipynb) | `bank_loan_amount_regression_sample.csv` (5,000 × 13) |
| 11 | Customer Churn Timing | When is this customer likely to churn? | [Bank_Survival_Analysis_End_to_End_Customer_Churn.ipynb](11_survival_analysis/Bank_Survival_Analysis_End_to_End_Customer_Churn.ipynb) | `bank_customer_survival_sample.csv` (3,000 × 14) |

The loan-approval project also persists its artifacts into `output/`: `loan_approval_model.joblib`, `loan_approval_model_metadata.json`, and scored output in `new_loan_applications_scored.csv` (12 × 4).

### Unsupervised

| # | Project | Business question | Notebook | Sample data |
| --- | --- | --- | --- | --- |
| 03 | Customer Segmentation | Which customer groups exist? | [Bank_Customer_Clustering_End_to_End.ipynb](03_customer_clustering/Bank_Customer_Clustering_End_to_End.ipynb) | `bank_customer_clustering_sample.csv` (5,000 × 11) |
| 07 | Customer Profiling (dimensionality reduction) | How can customer profiles be simplified without losing signal? | [Bank_Dimensionality_Reduction_End_to_End.ipynb](07_dimensionality_reduction/Bank_Dimensionality_Reduction_End_to_End.ipynb) | `bank_customer_sample.csv` (1,200 × 14) |
| 12 | Product Affinity | Which products are bought together? | [Bank_Association_Rule_Mining_Product_Affinity.ipynb](12_association_rule_mining/Bank_Association_Rule_Mining_Product_Affinity.ipynb) | `bank_product_baskets_sample.csv` (10,730 × 3) |

### Decision & optimization

| # | Project | Business question | Notebook | Sample data |
| --- | --- | --- | --- | --- |
| 10 | Next Best Action | Which action maximises customer value over time? | [Bank_Reinforcement_Learning_End_to_End_Next_Best_Action.ipynb](10_reinforcement_learning/Bank_Reinforcement_Learning_End_to_End_Next_Best_Action.ipynb) | `customer_states_sample.csv` (5,000 × 6), `historical_interactions_sample.csv` (5,000 × 4), `actions_sample.csv` (5 × 2) |
| 13 | Lead Prioritization | Which leads should agents call first? | [Bank_Ranking_Lead_Customer_Prioritization.ipynb](13_ranking_lead_prioritization/Bank_Ranking_Lead_Customer_Prioritization.ipynb) | `bank_lead_prioritization_sample.csv` (4,000 × 13) |
| 16 | Collection Resource Allocation | How should limited collection capacity be allocated? | [Bank_Optimization_Collection_Resource_Allocation.ipynb](16_optimization_collection_allocation/Bank_Optimization_Collection_Resource_Allocation.ipynb) | `bank_collection_resource_allocation_sample.csv` (2,500 × 11), `collection_resource_capacity.csv` (3 × 3) |
| 17 | Banking Scenario Analysis | What happens to the portfolio under different scenarios? | [Bank_Simulation_Banking_Scenario_Analysis.ipynb](17_simulation_scenario_analysis/Bank_Simulation_Banking_Scenario_Analysis.ipynb) | `bank_scenario_loan_portfolio_sample.csv` (5,000 × 14), `bank_scenario_assumptions.csv` (4 × 5) |

### Unstructured data AI

| # | Project | Business question | Notebook | Sample data |
| --- | --- | --- | --- | --- |
| 08 | Customer Feedback Analysis | What do customers complain about, and how do they feel? | [Bank_NLP_End_to_End_Customer_Feedback.ipynb](08_nlp/Bank_NLP_End_to_End_Customer_Feedback.ipynb) | `bank_customer_feedback_sample.csv` (2,000 × 5) |
| 09 | ATM Condition Classification | What is the physical condition of this ATM? | [Bank_Computer_Vision_End_to_End_ATM_Classification.ipynb](09_computer_vision/Bank_Computer_Vision_End_to_End_ATM_Classification.ipynb) | 300 image files + `image_metadata.csv` (300 × 2) |
| 19 | Automated Loan Document Processing | Can loan documents be validated and their fields extracted automatically? | [Bank_Document_Intelligence_Automated_Loan_Document_Processing.ipynb](19_document_intelligence_loan_processing/Bank_Document_Intelligence_Automated_Loan_Document_Processing.ipynb) | `loan_document_metadata.csv` (1,200 × 10), `loan_extracted_fields.csv` (1,000 × 9), `document_validation_rules.csv` (5 × 3) |
| 20 | Call Center Analytics | What is being said in our call-center conversations? | [Bank_Speech_AI_Call_Center_Analytics.ipynb](20_speech_ai_call_center/Bank_Speech_AI_Call_Center_Analytics.ipynb) | `call_center_calls.csv` (1,800 × 14), `call_center_analytics_features.csv` (1,800 × 22), `speech_topic_taxonomy.csv` (7 × 3) |
| 21 | Banking Copilot | Can an LLM assist staff with banking knowledge and tasks? | [Bank_Generative_AI_LLM_Banking_Copilot.ipynb](21_generative_ai_llm_copilot/Bank_Generative_AI_LLM_Banking_Copilot.ipynb) | `copilot_interaction_logs.csv` (1,500 × 13), `bank_knowledge_base.csv` (10 × 6), `copilot_evaluation_set.csv` (10 × 3) |

### Advanced / modern ML

| # | Project | Business question | Notebook | Sample data |
| --- | --- | --- | --- | --- |
| 14 | Fraud Network Detection | Does this transaction network show fraud patterns? | [Bank_Graph_ML_Fraud_Network_Detection.ipynb](14_graph_ml_fraud_network/Bank_Graph_ML_Fraud_Network_Detection.ipynb) | `bank_fraud_network_transactions_sample.csv` (7,000 × 7), `bank_fraud_network_accounts_sample.csv` (1,198 × 7) |
| 15 | Campaign Effectiveness | Did the campaign actually cause the uplift? | [Bank_Causal_Inference_Campaign_Effectiveness.ipynb](15_causal_inference_campaign/Bank_Causal_Inference_Campaign_Effectiveness.ipynb) | `bank_campaign_causal_sample.csv` (6,000 × 13) |
| 18 | Customer Deduplication | Are these records the same customer? | [Bank_Entity_Resolution_Customer_Deduplication.ipynb](18_entity_resolution_deduplication/Bank_Entity_Resolution_Customer_Deduplication.ipynb) | `bank_customer_source_records.csv` (3,900 × 8), `bank_customer_master.csv` (1,800 × 7) |

## ML task taxonomy for banking

The map that this repository is built on: the full range of ML/AI tasks that matter in a bank, their core question and the projects that implement them.

| ML task | Core question | Typical banking use case | Project |
| --- | --- | --- | --- |
| **Classification** | What category does this belong to? | Fraud / non-fraud, approve / reject | `01` |
| **Regression** | How much / how many? | Loan amount, expected balance, revenue | `02` |
| **Clustering** | What natural groups exist? | Customer segmentation | `03` |
| **Forecasting** | What happens in the next period? | Loan demand, cash flow, portfolio growth | planned |
| **Anomaly Detection** | What is abnormal? | Suspicious transactions, unusual behaviour | planned |
| **Recommendation** | What should we offer next? | Next best product | planned |
| **Dimensionality Reduction** | How can the data be simplified? | Customer profiling, visualisation | `07` |
| **NLP** | What does the text mean? | Complaint analysis, sentiment, intent | `08` |
| **Computer Vision** | What is in the image? | KTP/OCR, ATM and asset condition | `09` |
| **Reinforcement Learning** | Which action is optimal over time? | Next best action | `10` |
| **Time Series Analysis** | How do patterns change over time? | Transaction and cash-flow patterns | planned |
| **Survival Analysis** | When will the event happen? | Churn timing, default timing, retention | `11` |
| **Association Rule Mining** | What occurs together? | Product / transaction baskets | `12` |
| **Ranking / Learning to Rank** | What should be prioritised? | Lead, customer and offer ranking | `13` |
| **Graph / Graph ML** | How are entities connected? | Fraud rings, mule accounts | `14` |
| **Causal Inference** | What is the true effect of an action? | Campaign uplift, pricing impact | `15` |
| **Optimization** | Which decision maximises the objective under constraints? | Collection strategy, resource allocation | `16` |
| **Simulation** | What happens if conditions change? | Credit and liquidity scenarios | `17` |
| **Entity Resolution** | Are these the same person or entity? | Customer deduplication, KYC/AML | `18` |
| **Document Intelligence** | How do we understand a document? | Loan document processing | `19` |
| **Speech / Audio AI** | What was said? | Call-center speech analytics | `20` |
| **Generative AI / LLM** | What can be generated, summarised or explained? | Reports, summaries, banking copilot | `21` |
| **Information Retrieval** | Which document is relevant? | SOP / knowledge-base search | partly in `21` |
| **Semi-Supervised Learning** | How do we learn from few labels? | Fraud with limited labelled data | planned |
| **Self-Supervised Learning** | How do we learn without labels? | Transaction representation learning | planned |

## Curriculum map

The projects are organised into five tracks. Each track answers a different class of business question, and together they form a progression from prediction to decision-making to modern AI.

### 1. Predictive ML — "What will happen?"

```text
Classification · Regression · Forecasting · Survival Analysis
```

Projects: `01`, `02`, `11`

```text
Customer → Will they default?
Customer → Will they churn, and when?
Customer → How much loan can they service?
Bank     → How much demand next month?
```

### 2. Unsupervised ML — "What patterns exist in the data?"

```text
Clustering · Anomaly Detection · Dimensionality Reduction · Association Rule Mining
```

Projects: `03`, `07`, `12`

```text
Customer      → Which segment do they belong to?
Transaction   → Normal or unusual?
Product       → What is bought together?
Customer data → How many dimensions are really needed?
```

### 3. Decision & Optimization — "Which decision should we take?"

```text
Recommendation · Ranking · Reinforcement Learning · Optimization · Simulation
```

Projects: `10`, `13`, `16`, `17`

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

### 4. Unstructured Data AI — "How do we understand non-tabular data?"

```text
NLP · Computer Vision · Speech AI · Document Intelligence · LLM / Generative AI · Information Retrieval
```

Projects: `08`, `09`, `19`, `20`, `21`

```text
Text  → Complaint analysis
Image → KTP / document / ATM condition
Audio → Call-center conversations
PDF   → Loan document processing
LLM   → Summaries, reports, generation
```

### 5. Advanced / Modern ML — "Why did it happen, how are things connected, and how do we learn with limited labels?"

```text
Causal Inference · Graph ML · Entity Resolution · Semi-Supervised Learning · Self-Supervised Learning
```

Projects: `14`, `15`, `18`

Graph ML deserves a dedicated look in banking, because money moves through relationships:

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

The model then asks: *does this transaction network show a fraud pattern?* This differs from plain anomaly detection because the signal lives in the **relationship / network structure**, not only in an abnormal value of a single transaction.

## Tech stack

| Layer | Tools | Used in |
| --- | --- | --- |
| Language & environment | Python 3.14, Jupyter Notebook | all projects |
| Data wrangling | pandas, NumPy | all projects |
| Visualisation | Matplotlib, Seaborn | all projects |
| Classical ML | scikit-learn 1.9 — pipelines, Logistic/Ridge/Linear Regression, Random Forest, KMeans, PCA, TF-IDF, NMF, metrics | most projects |
| Association rules | mlxtend (Apriori, association rules) | `12` |
| Survival analysis | lifelines (Kaplan-Meier, Cox proportional hazards, log-rank test) | `11` |
| Graph analytics | NetworkX (centrality, communities, components, subgraph extraction) | `14` |
| Optimization | SciPy | `16` |
| Deep learning | TensorFlow / Keras (CNN image classifier) | `09` |
| Manifold learning | umap-learn (optional UMAP comparison) | `07` |
| Fuzzy matching | difflib | `18` |
| Image handling | Pillow | `09` |
| Model persistence | joblib | `01` |
| Standard library | pathlib, json, re, os, collections, warnings | several |

## Getting started

### Requirements

- Python 3.10 or newer (the notebooks in this repository were executed on Python 3.14)
- Jupyter Lab or Jupyter Notebook

### 1. Create an environment

```bash
cd "DS Training"
python3 -m venv .venv
source .venv/bin/activate          # Windows: .venv\Scripts\activate
```

### 2. Install the dependencies

```bash
pip install numpy pandas matplotlib seaborn scikit-learn jupyterlab \
            mlxtend lifelines networkx scipy joblib pillow umap-learn

# required only by the computer-vision project (09)
pip install tensorflow
```

### 3. Run a project

```bash
cd 08_nlp                           # or any other numbered project folder
jupyter lab
```

Then open the notebook and run all cells from top to bottom (`Kernel → Restart & Run All`).

> **Important:** every notebook loads its dataset by relative file name, e.g. `pd.read_csv("bank_customer_feedback_sample.csv")`. Start Jupyter **inside the project folder** (or make sure the notebook's working directory is that folder), otherwise the data-loading cells will fail.

## Anatomy of a project notebook

All 18 notebooks follow the same flow, so the analytical reasoning is easy to follow and reuse:

1. **Business case & objective** — the banking problem, the decision to be improved, and why this ML task type fits.
2. **Dataset dictionary & data quality** — field definitions, dtypes, missing values, leakage checks.
3. **Exploratory data analysis** — distributions, segments and business-relevant cuts.
4. **Feature engineering & preprocessing** — derived banking features (e.g. DTI, EMI, tenure) wrapped in scikit-learn pipelines.
5. **Modeling** — a transparent baseline first, then a stronger model, with an explicit train/test split and cross-validation.
6. **Evaluation** — metrics chosen for the banking context: ROC-AUC vs PR-AUC, concordance index, uplift, calibration, cost-based thresholds.
7. **Business interpretation** — feature importance, customer-level scoring, and thresholds translated into decisions.
8. **Production architecture, controls & common mistakes** — how the model would run inside a bank, plus governance pitfalls.
9. **Executive summary** — business problem, solution, value and recommended next steps.

## Archive helper script

`extract_bank_zips.sh` unpacks project archives that are dropped into this folder as `*.zip` files. It is safe to re-run.

- creates one folder per archive (`<name>_project.zip` → `<name>/`, e.g. `08_nlp_project.zip` → `08_nlp/`)
- **skips** projects that are already extracted — existing files are never overwritten (`unzip -n`)
- fills in only the missing files if a folder is incomplete
- **deletes the archive only after** every entry has been verified on disk, so a failed extraction keeps the zip

```bash
./extract_bank_zips.sh --dry-run     # preview what would happen
./extract_bank_zips.sh               # extract, verify, delete the archives
./extract_bank_zips.sh --keep-zip    # extract and verify, keep the archives
./extract_bank_zips.sh --help        # usage
```

## Data and disclaimer

- **All datasets in this repository are synthetic.** They were generated for training, demonstration and portfolio purposes and contain **no real customer data and no personally identifiable information**.
- The repository ships 32 CSV datasets and 300 generated images (~31 MB in total), sized so that every notebook runs in minutes on a laptop without GPU.
- The sample data is realistic enough to exercise real modelling pipelines (imbalance, censoring, leakage, graph structure), but it is **not** representative of any real portfolio.
- Models here are educational. Before any production use in lending, pricing, collections or KYC contexts, a bank would need validation, fairness testing, monitoring and model-risk governance.

## Roadmap

Still open from the 21-task banking ML map, plus natural extensions of existing projects. The long-term plan is the 200-project banking DS & AI roadmap in [`future.md`](future.md), organised into 20 domains (Core ML → Advanced & Generative AI → Credit Risk & AML → Customer Analytics → MLOps → Quant → Payments → Cybersecurity → Compliance & ESG → Open Banking → Agentic AI):

| # | Task | Next step | Status |
| --- | --- | --- | --- |
| 04 | Forecasting | Loan demand / cash-flow forecasting | planned |
| 05 | Anomaly Detection | Transaction anomaly detection | planned |
| 06 | Recommendation | Next best product | planned |
| — | Information Retrieval | SOP / knowledge-base search (RAG on top of `21`) | optional extension |
| — | Semi-Supervised Learning | Fraud detection with limited labels | optional extension |
| — | Self-Supervised Learning | Transaction representation learning | optional extension |
| 14+ | Graph Neural Networks | GCN / GraphSAGE extension of the fraud-network project | advanced extension |
| 21+ | LLM productionisation | Retrieval, evaluation and guardrails beyond the copilot notebook | advanced extension |

For a banking Data Scientist / AI portfolio, the recommended build order is **Survival Analysis → Association Rule Mining → Ranking → Graph ML → Causal Inference → Optimization → Generative AI**, i.e. projects `11 → 12 → 13 → 14 → 15 → 16 → 21`, since they show the decision-making and modern-ML skills that differentiate a banking data scientist from a generalist.

