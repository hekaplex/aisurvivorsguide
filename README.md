# Survivor's Guide to AI: Companion Code

This repository goes with the talk **"Survivor's Guide to AI"** by Dr. Drew Minkin (Hekaplex Innovations). The slides are in [docs/Survivor's Guide to AI.pptx](docs/Survivor's%20Guide%20to%20AI.pptx).

The talk has five parts. Each part ends with something you can use the same day. This README lists open-source code repositories that let you go further with each part, whether you want to see how the ideas work, build something, test an AI tool, or protect your privacy.

You don't need to be a programmer to use this list. Each part has a **Start here** pick for non-coders.

The list has two tiers:

- **[Core repositories](#part-1--how-we-got-here)** (46) follow the talk slide by slide.
- **[Secondary repositories](#secondary-repositories-take-action)** (20) are for taking action: tools for activists defending democracy, for solopreneurs vibe coding a business, and for workers getting through AI job displacement.

---

## Getting the code

The repositories aren't stored in this repo, because together they take about 8 GB. Use the script to download them:

```bash
./clone-repos.sh            # download all 66 repositories (about 8 GB)
./clone-repos.sh part4      # download only one part
./clone-repos.sh secondary  # download only the 20 secondary repositories (about 1.2 GB)
./clone-repos.sh            # run it again later to update what you have
```

The script makes shallow clones (latest version only) under `repos/<part>/<repo>`. The `repos/` folder is in `.gitignore`.

| Folder | Size on disk | Repositories |
|---|---|---|
| `repos/part1-how-we-got-here` | ~70 MB | 8 |
| `repos/part2-how-it-works` | ~3.6 GB | 14 |
| `repos/part3-threats` | ~380 MB | 5 |
| `repos/part4-hacking-ai` | ~2.2 GB | 12 |
| `repos/part5-defending-your-mind` | ~580 MB | 7 |
| `repos/secondary/democracy-activism` | ~430 MB | 7 |
| `repos/secondary/solopreneur-vibe-coding` | ~590 MB | 7 |
| `repos/secondary/job-transition` | ~260 MB | 6 |

---

## Part 1 · How we got here
*From logistic regression to large language models (slides 3–10)*

The point of this part is that LLMs aren't magic. Each of these repos shows one step of the 70-year story in code small enough to read.

| Repository | Slide topic | What it gives you |
|---|---|---|
| [karpathy/micrograd](https://github.com/karpathy/micrograd) | Weighted vote, backprop (5–6) | About 100 lines that train a neural network with backpropagation. It shows "nudge the weights to make fewer mistakes" exactly. |
| [karpathy/nn-zero-to-hero](https://github.com/karpathy/nn-zero-to-hero) | One neuron to deep networks (5–6, 9–10) | A video course with notebooks that goes from one neuron to building GPT. **Start here** if you'd rather watch than read. |
| [scikit-learn/scikit-learn](https://github.com/scikit-learn/scikit-learn) | Logistic regression, ensembles (5, 7) | The standard Python ML library. See `examples/linear_model/` for logistic regression and `examples/ensemble/` for voting, stacking and bagging. |
| [tmikolov/word2vec](https://github.com/tmikolov/word2vec) | Words become numbers (8) | The original 2013 word2vec code from Mikolov's team, where "king − man + woman ≈ queen" came from. |
| [karpathy/minbpe](https://github.com/karpathy/minbpe) | Tokens (12) | Shows how text gets split into the word pieces (tokens) a model reads. |
| [harvardnlp/annotated-transformer](https://github.com/harvardnlp/annotated-transformer) | Attention (9) | "Attention Is All You Need" (Vaswani et al., 2017) explained line by line next to working code. |
| [rasbt/LLMs-from-scratch](https://github.com/rasbt/LLMs-from-scratch) | Scale, instruction tuning (10, 12) | Build a small ChatGPT-like model chapter by chapter: tokens (ch02), attention (ch03), GPT (ch04), pretraining (ch05), fine-tuning (ch06–07). |
| [karpathy/nanoGPT](https://github.com/karpathy/nanoGPT) | Then came scale (10) | A short, readable script that trains and fine-tunes GPT-2-sized models. |

---

## Part 2 · How it works
*Prompts, RAG, fine-tuning, pretraining, and the systems around them (slides 11–21)*

These repos follow the "five rungs of customization" on slide 13, from cheapest to most expensive, plus the frameworks and agent tools on slides 17–21.

### Rungs 1–2: prompts and system instructions

| Repository | Slide topic | What it gives you |
|---|---|---|
| [anthropics/claude-cookbooks](https://github.com/anthropics/claude-cookbooks) | Rungs 1–3, agents (13–18) | Runnable recipes. See `capabilities/retrieval_augmented_generation/` for RAG, `tool_use/` for tools and `patterns/agents/` for agent designs. |
| [openai/openai-cookbook](https://github.com/openai/openai-cookbook) | Rungs 1–3 (13–15) | OpenAI's example notebooks covering prompting, embeddings, RAG and fine-tuning. |

### Rung 3: RAG (look it up, then answer)

| Repository | Slide topic | What it gives you |
|---|---|---|
| [run-llama/llama_index](https://github.com/run-llama/llama_index) | RAG; "the RAG specialist" (15, 20) | A framework for search and Q&A over your own documents. |
| [chroma-core/chroma](https://github.com/chroma-core/chroma) | Retrieve by meaning (15) | A simple embedding database for the "retrieve" step. Easy to run on a laptop. |
| [facebookresearch/faiss](https://github.com/facebookresearch/faiss) | Retrieve by meaning (15) | Meta's library for fast similarity search over large collections of embeddings. |

### Rungs 4–5: changing the model itself

| Repository | Slide topic | What it gives you |
|---|---|---|
| [huggingface/peft](https://github.com/huggingface/peft) | Fine-tuning (16) | Parameter-efficient fine-tuning methods such as LoRA. This is why fine-tuning now takes GPU hours, not months. |
| [unslothai/unsloth](https://github.com/unslothai/unsloth) | Fine-tuning (16) | Fine-tune open models on one GPU, with ready-made notebooks. |
| *Pretraining* | Pretraining (16) | See `nanoGPT` and `LLMs-from-scratch` ch05 in Part 1. |

### Compound systems, frameworks and agents

| Repository | Slide topic | What it gives you |
|---|---|---|
| [langchain-ai/langchain](https://github.com/langchain-ai/langchain) | Frameworks; "the general toolkit" (20) | Connects models, tools and data sources into chains and agents. |
| [langchain-ai/langgraph](https://github.com/langchain-ai/langgraph) | Agents (18, 20) | Builds agents as graphs with planning, memory and retries. |
| [deepset-ai/haystack](https://github.com/deepset-ai/haystack) | Frameworks; "the production pipeline" (20) | Explicit, auditable pipelines for RAG and agents. |
| [stanfordnlp/dspy](https://github.com/stanfordnlp/dspy) | "The prompt compiler" (20, 36) | Tunes prompts automatically against a metric. This automates tip 10, "test on a set." |
| [modelcontextprotocol/servers](https://github.com/modelcontextprotocol/servers) | Agent tools (18) | Reference servers that connect agents to files, search, Git and other tools through the Model Context Protocol. |

### Agent skills

| Repository | Slide topic | What it gives you |
|---|---|---|
| [agentskills/agentskills](https://github.com/agentskills/agentskills) | Agent skills (21) | The open specification behind [agentskills.io](https://agentskills.io/). |
| [anthropics/skills](https://github.com/anthropics/skills) | Agent skills (21) | Example skills you can copy. Each one is a folder with a `SKILL.md`. See `template/` to write your own. |

---

## Part 3 · The big, the bad and the ugly
*AI's threats to the world, and what the evidence says (slides 22–32)*

Most of the threats in this part (jobs, energy, fraud, copyright) come from reports and court cases, not code. These repos cover the parts you can inspect or test yourself.

| Repository | Slide topic | What it gives you |
|---|---|---|
| [contentauth/c2patool](https://github.com/contentauth/c2patool) | Provenance (32) | A command-line tool that reads and adds Content Credentials (C2PA) on images and video. **Start here** to check whether a file carries provenance data. |
| [contentauth/c2pa-rs](https://github.com/contentauth/c2pa-rs) | Provenance (32) | The core C2PA library that the tool above is built on. |
| [google-deepmind/synthid-text](https://github.com/google-deepmind/synthid-text) | Watermarks (32) | Google DeepMind's code for SynthID text watermarking and detection. |
| [paul-rottger/xstest](https://github.com/paul-rottger/xstest) | Over-cautious refusals (28) | XSTest: prompts that sound risky but are safe, for measuring over-refusal. |
| [justincui03/or-bench](https://github.com/justincui03/or-bench) | Over-cautious refusals (28) | OR-Bench, the over-refusal benchmark (ICML 2025) cited on the slide. |

---

## Part 4 · Hacking AI
*Prompt engineering for fun, profit and democracy (slides 33–61)*

### The ten prompting tips (slides 34–36)

| Repository | What it gives you |
|---|---|
| [anthropics/prompt-eng-interactive-tutorial](https://github.com/anthropics/prompt-eng-interactive-tutorial) | A 9-chapter interactive tutorial with exercises covering most of the ten tips. **Start here.** |
| [anthropics/courses](https://github.com/anthropics/courses) | Anthropic's courses on prompting, real-world prompting, prompt evaluation and tool use. *(Archived: still readable, no longer updated.)* |
| [dair-ai/Prompt-Engineering-Guide](https://github.com/dair-ai/Prompt-Engineering-Guide) | A broad guide to prompting techniques, RAG and agents, with links to the research papers. |
| [trigaten/The_Prompt_Report](https://github.com/trigaten/The_Prompt_Report) | Code and data for *The Prompt Report* (Schulhoff et al., 2024), the survey of more than 1,500 papers cited on slide 34. |
| [promptfoo/promptfoo](https://github.com/promptfoo/promptfoo) | Tip 10, "test on a set": score prompt changes against saved examples and compare models side by side. It also does red-team testing. |

### Prompt injection (slide 37)

| Repository | What it gives you |
|---|---|
| [OWASP/www-project-top-10-for-large-language-model-applications](https://github.com/OWASP/www-project-top-10-for-large-language-model-applications) | Source for the OWASP Top 10 for LLM Applications, which ranks prompt injection #1. |
| [NVIDIA/garak](https://github.com/NVIDIA/garak) | An LLM vulnerability scanner that probes a model or app for prompt injection, jailbreaks and data leaks. |
| *promptfoo* (above) | Its red-team mode tests your own app against injection attacks. |

### For profit: shipping vibe-coded software safely (slides 39–47, 84)

These tools put the "ship-safe checklist" on slide 44 into practice.

| Repository | Checklist item | What it gives you |
|---|---|---|
| [gitleaks/gitleaks](https://github.com/gitleaks/gitleaks) | "Never put API keys or passwords in code" | Scans your code and Git history for leaked secrets. |
| [semgrep/semgrep](https://github.com/semgrep/semgrep) | "Ask for a security review" | Free static analysis that catches common security flaws, a second reviewer alongside the AI. |
| *claude-cookbooks / openai-cookbook* (Part 2) | "Spec the MVP" prompts | Patterns for turning a spec into working code with an AI. |

### For democracy (slides 54–61)

| Repository | Slide topic | What it gives you |
|---|---|---|
| [google-deepmind/habermas_machine](https://github.com/google-deepmind/habermas_machine) | Finding common ground (54) | The dataset from the "Habermas Machine" study (Tessler et al., *Science*, 2024). |
| [unitedstates/congress-legislators](https://github.com/unitedstates/congress-legislators) | Find your representatives (59) | Public-domain data on every member of Congress, with contact details and social accounts. |
| [unitedstates/congress](https://github.com/unitedstates/congress) | Read the bill (55) | Tools that download bill text, amendments and votes, ready for the "read the bill" prompt. |

---

## Part 5 · Defending your mind and owning your health
*Use AI without handing it your judgment (slides 62–74)*

### Flattery and sycophancy (slides 64, 69)

| Repository | What it gives you |
|---|---|
| [meg-tong/sycophancy-eval](https://github.com/meg-tong/sycophancy-eval) | Datasets from *Towards Understanding Sycophancy in Language Models* (Anthropic, 2023). Use them to test whether a model agrees with you just to please you. |
| [anthropics/evals](https://github.com/anthropics/evals) | Model-written evaluations, including a `sycophancy/` set. |

### Owning your health (slides 66–71)

| Repository | Slide topic | What it gives you |
|---|---|---|
| [am-bean/HELPMed](https://github.com/am-bean/HELPMed) | "The AI knew. The people didn't." (68) | Code, medical scenarios and results from Bean, Mahdi et al. (Oxford, *Nature Medicine*, 2026). |
| [data-privacy-stack/presidio](https://github.com/data-privacy-stack/presidio) | "Strip names, birth dates and ID numbers" (70) | Finds and redacts personal information in text and images before you paste it into a chatbot. Formerly `microsoft/presidio`. |

### Keep private data on your own computer (slides 70, 73)

When you run a model locally, your health records, finances and personal notes never leave your machine.

| Repository | What it gives you |
|---|---|
| [ollama/ollama](https://github.com/ollama/ollama) | Download and run open models on your own computer with one command. **Start here.** |
| [open-webui/open-webui](https://github.com/open-webui/open-webui) | A ChatGPT-style chat window for local models in Ollama. |
| [mozilla-ai/llamafile](https://github.com/mozilla-ai/llamafile) | Packs a whole model into one file you can run with no installation. |

---

## Secondary repositories: take action

The core list explains the talk. These 20 repositories help you act on it. They go beyond the slides' own sources and focus on the three groups the talk speaks to most directly. Each table starts with the easiest entry point.

### For activists: support democracy
*Builds on "For democracy" (slides 54–61): read the bill, find your representatives, find common ground, check the claim.*

Much AI law is being written in state legislatures (slides 56 and 59), so state-level data comes first.

| Repository | What it helps you do |
|---|---|
| [openstates/people](https://github.com/openstates/people) | Look up every state legislator and governor, with contact details, in public-domain data. **Start here:** find who represents you in your statehouse, where AI bills are moving fastest. |
| [openstates/openstates-scrapers](https://github.com/openstates/openstates-scrapers) | Collects bills and votes from all 50 state legislatures. Use it to track AI bills in your state, or to feed bill text into the "read the bill" prompt on slide 55. |
| [compdemocracy/polis](https://github.com/compdemocracy/polis) | Run large-scale open conversations that map where people agree and disagree, the same goal as the Habermas Machine on slide 54. Used in public consultations, including in Taiwan. |
| [AIObjectives/tttc-light-js](https://github.com/AIObjectives/tttc-light-js) | Talk to the City: uses an LLM to group hundreds of open-ended comments into themes and claims. Useful for summarizing town hall input or a community survey. |
| [decidim/decidim](https://github.com/decidim/decidim) | A full platform for participatory democracy, with proposals, participatory budgets, assemblies and votes. Used by cities and organizations. |
| [bellingcat/auto-archiver](https://github.com/bellingcat/auto-archiver) | Bellingcat's tool for saving social media posts, videos and web pages in a verifiable way before they disappear. Use it to keep evidence of misinformation or deepfakes (slides 30–31). |
| [Libr-AI/OpenFactVerification](https://github.com/Libr-AI/OpenFactVerification) | "Loki" splits a text into claims and checks each one against sources. It automates the "check the claim" prompt (slide 55), but still open the sources yourself (slide 72). *Last updated 2024.* |

### For solopreneurs: vibe code safely
*Builds on "Build small, ship fast" (slides 39–47, 84–86): the weekend MVP, the ship-safe checklist and "one person, five departments."*

| Repository | Slide link | What it helps you do |
|---|---|---|
| [stackblitz-labs/bolt.diy](https://github.com/stackblitz-labs/bolt.diy) | Chat-to-app builders (84) | An open-source version of Bolt: describe an app, then run and edit it in your browser with any model you choose. **Start here** for a Saturday prototype. |
| [Aider-AI/aider](https://github.com/Aider-AI/aider) | AI code editors (84) | AI pair programming in your terminal. It commits each change to Git, so the "one-click way to roll back" (slide 44) comes built in. |
| [OpenHands/OpenHands](https://github.com/OpenHands/OpenHands) | Agentic coding tools (84) | An open-source coding agent for multi-step changes, tests and refactors. Use it when real customers depend on the code. |
| [nextjs/saas-starter](https://github.com/nextjs/saas-starter) | Ship-safe checklist (44–45) | A starter template with login, a Postgres database and Stripe payments already wired up, so you don't build your own login or handle card numbers. |
| [n8n-io/n8n](https://github.com/n8n-io/n8n) | One person, five departments (85) | Visual workflow automation with AI steps and more than 400 integrations. Automate support triage, invoices and outreach drafts. *Fair-code license: check the terms before commercial use.* |
| [DataDog/guarddog](https://github.com/DataDog/guarddog) | Fake packages (43–44) | Checks PyPI and npm packages for malicious code before you install them. It defends against "slopsquatting", where attackers register package names that AI tools make up. |
| [OWASP/CheatSheetSeries](https://github.com/OWASP/CheatSheetSeries) | Ship-safe checklist (44) | Short, practical security guides on authentication, secrets, input validation and more. Paste one into your AI's context before you ask it for a security review. |

Use these with the core tools [gitleaks](https://github.com/gitleaks/gitleaks) and [semgrep](https://github.com/semgrep/semgrep) from Part 4.

### For workers: survive AI job displacement
*Builds on "For profit, without a startup" (slides 48–53): know the risk, audit your job, learn one step over.*

| Repository | Slide link | What it helps you do |
|---|---|---|
| [openai/GPTs-are-GPTs](https://github.com/openai/GPTs-are-GPTs) | Know the risk (49) | Data from Eloundou et al.'s study of how exposed each U.S. occupation is to LLMs. **Start here:** look up your job in `data/occ_level.csv` before you do the three-column audit (slide 50). |
| [AIOE-Data/AIOE](https://github.com/AIOE-Data/AIOE) | Know the risk (24, 49) | AI exposure scores by occupation, industry and U.S. county (Felten, Raj & Seamans), plus separate scores for language models. Exposure isn't loss (slide 24). These scores show where to start moving. |
| [srbhr/Resume-Matcher](https://github.com/srbhr/Resume-Matcher) | Find my next step (53) | Tailors your résumé and cover letter to a job posting with a local model, so your work history stays on your computer (slide 70). |
| [speedyapply/JobSpy](https://github.com/speedyapply/JobSpy) | Learn one step over (51) | Pulls job listings from LinkedIn, Indeed, Glassdoor and others into one spreadsheet. Use it to see which adjacent roles are actually hiring. *Check each site's terms of use.* |
| [kamranahmedse/developer-roadmap](https://github.com/kamranahmedse/developer-roadmap) | Plan 90 days (53) | The roadmap.sh step-by-step learning paths, including AI agents, AI product builder, AI red teaming, prompt engineering, data analyst, product manager and UX design. |
| [mlabonne/llm-course](https://github.com/mlabonne/llm-course) | Be the AI-fluent one (51) | A free LLM course with roadmaps and Colab notebooks, from the basics through fine-tuning. It's a structured way to become "the AI-fluent one" at work. |

---

## Sources without code repositories

Many of the talk's sources are reports, surveys or court records, so they have no code to clone. These include the IMF, WEF, IEA, Pew, KFF, Common Sense Media, NewsGuard, Freedom House, Copyright Office, Stanford "Canaries" and Congressional Management Foundation sources. Links for these are on slides 76–79 of the deck.

These studies were checked for public code and none was found:

- "Your Brain on ChatGPT" (Kosmyna et al., MIT Media Lab, 2025)
- The conspiracy-belief chatbot study (Costello, Pennycook & Rand, 2024)
- "When Helpfulness Backfires" (Chen et al., 2025)
- R1dacted (2025)

The Lewis et al. RAG paper's reference implementation lives inside [huggingface/transformers](https://github.com/huggingface/transformers) and isn't cloned separately. It's listed in the next section.

## Considered but not cloned

These repositories were reviewed but left out of `clone-repos.sh`. Most are still worth a look. The reason for each is given so you can decide for yourself.

| Repository | Related to | Why it was left out |
|---|---|---|
| [huggingface/transformers](https://github.com/huggingface/transformers) | RAG (slide 15) | Contains the reference RAG implementation (Lewis et al., 2020), but it's a very large general-purpose library. The Part 2 RAG repos are easier places to start. |
| [microsoft/generative-ai-for-beginners](https://github.com/microsoft/generative-ai-for-beginners) | Learning (job transition) | A good 21-lesson course, but the download is about 6.5 GB because of translations and images. Read it on GitHub instead. [mlabonne/llm-course](https://github.com/mlabonne/llm-course) covers similar ground. |
| [ossu/computer-science](https://github.com/ossu/computer-science) | Learning (job transition) | A free, self-taught computer science curriculum. It was cut to keep the secondary list at 20, and it's a list of links, so there's little to clone. |
| [consuldemocracy/consuldemocracy](https://github.com/consuldemocracy/consuldemocracy) | Democracy (slides 54–61) | Open-government and e-participation software, still maintained. It overlaps heavily with [decidim/decidim](https://github.com/decidim/decidim). |
| [meedan/check](https://github.com/meedan/check) | Checking claims (slides 55, 72) | Meedan's collaborative fact-checking platform. The repo is only a development environment, so it helps newsrooms deploying Check more than individuals. |
| [AIObjectives/talk-to-the-city-reports](https://github.com/AIObjectives/talk-to-the-city-reports) | Democracy (slide 54) | Archived. Replaced by [AIObjectives/tttc-light-js](https://github.com/AIObjectives/tttc-light-js), which is in the secondary list. |
| [protectai/llm-guard](https://github.com/protectai/llm-guard) | Prompt injection (slide 37) | A security toolkit that scans what goes into and comes out of an LLM, but the repo is archived. Use [NVIDIA/garak](https://github.com/NVIDIA/garak) and [promptfoo/promptfoo](https://github.com/promptfoo/promptfoo) instead. |
| [cline/cline](https://github.com/cline/cline) | Agentic coding tools (slide 84) | An autonomous coding agent for VS Code and the command line. It was left out to avoid overlap with [Aider-AI/aider](https://github.com/Aider-AI/aider) and [OpenHands/OpenHands](https://github.com/OpenHands/OpenHands). |
| [supabase/supabase](https://github.com/supabase/supabase) | Managed back ends (slides 44, 84) | Named on slide 84. It's a hosted service, so you sign up rather than clone, and the repo is very large. [nextjs/saas-starter](https://github.com/nextjs/saas-starter) shows the same managed-login pattern. |
| [stripe-samples/checkout-one-time-payments](https://github.com/stripe-samples/checkout-one-time-payments) | Payments (slides 44–45) | A minimal sample of Stripe Checkout payments. Left out because `nextjs/saas-starter` already includes Stripe. Useful if you only need a "pay now" button. |
| [google-research/google-research](https://github.com/google-research/google-research) | General research | Checked as a possible source of study code. It's a very large monorepo of unrelated projects with no single entry point. |

## Notes

- Each repository has its own license. Check it before you reuse the code.
- These are examples, not endorsements. Tools and their terms change often.
- Nothing here is medical, legal or financial advice.
