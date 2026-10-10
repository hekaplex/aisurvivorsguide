#!/usr/bin/env bash
# Clone the companion code repositories for "Survivor's Guide to AI".
# Shallow clones (--depth 1) into repos/<part>/<repo>. Re-running pulls updates.
# Usage: ./clone-repos.sh            # clone everything
#        ./clone-repos.sh part4      # clone one part only
#        ./clone-repos.sh secondary  # clone only the secondary repos
set -euo pipefail
cd "$(dirname "$0")"

REPOS=(
  # Part 1: How we got here
  "part1-how-we-got-here karpathy/micrograd"
  "part1-how-we-got-here karpathy/nn-zero-to-hero"
  "part1-how-we-got-here karpathy/minbpe"
  "part1-how-we-got-here tmikolov/word2vec"
  "part1-how-we-got-here harvardnlp/annotated-transformer"
  "part1-how-we-got-here rasbt/LLMs-from-scratch"
  "part1-how-we-got-here karpathy/nanoGPT"
  "part1-how-we-got-here scikit-learn/scikit-learn"
  # Part 2: How it works
  "part2-how-it-works anthropics/claude-cookbooks"
  "part2-how-it-works openai/openai-cookbook"
  "part2-how-it-works facebookresearch/faiss"
  "part2-how-it-works chroma-core/chroma"
  "part2-how-it-works langchain-ai/langchain"
  "part2-how-it-works langchain-ai/langgraph"
  "part2-how-it-works run-llama/llama_index"
  "part2-how-it-works deepset-ai/haystack"
  "part2-how-it-works stanfordnlp/dspy"
  "part2-how-it-works huggingface/peft"
  "part2-how-it-works unslothai/unsloth"
  "part2-how-it-works agentskills/agentskills"
  "part2-how-it-works anthropics/skills"
  "part2-how-it-works modelcontextprotocol/servers"
  # Part 3: The big, the bad and the ugly
  "part3-threats contentauth/c2pa-rs"
  "part3-threats contentauth/c2patool"
  "part3-threats google-deepmind/synthid-text"
  "part3-threats paul-rottger/xstest"
  "part3-threats justincui03/or-bench"
  # Part 4: Hacking AI
  "part4-hacking-ai anthropics/prompt-eng-interactive-tutorial"
  "part4-hacking-ai anthropics/courses"
  "part4-hacking-ai dair-ai/Prompt-Engineering-Guide"
  "part4-hacking-ai trigaten/The_Prompt_Report"
  "part4-hacking-ai promptfoo/promptfoo"
  "part4-hacking-ai OWASP/www-project-top-10-for-large-language-model-applications"
  "part4-hacking-ai NVIDIA/garak"
  "part4-hacking-ai gitleaks/gitleaks"
  "part4-hacking-ai semgrep/semgrep"
  "part4-hacking-ai google-deepmind/habermas_machine"
  "part4-hacking-ai unitedstates/congress-legislators"
  "part4-hacking-ai unitedstates/congress"
  # Part 5: Defending your mind and owning your health
  "part5-defending-your-mind meg-tong/sycophancy-eval"
  "part5-defending-your-mind anthropics/evals"
  "part5-defending-your-mind am-bean/HELPMed"
  "part5-defending-your-mind data-privacy-stack/presidio"
  "part5-defending-your-mind ollama/ollama"
  "part5-defending-your-mind mozilla-ai/llamafile"
  "part5-defending-your-mind open-webui/open-webui"

  # Secondary: civic tech for activists and democracy
  "secondary/democracy-activism openstates/openstates-scrapers"
  "secondary/democracy-activism openstates/people"
  "secondary/democracy-activism compdemocracy/polis"
  "secondary/democracy-activism AIObjectives/tttc-light-js"
  "secondary/democracy-activism decidim/decidim"
  "secondary/democracy-activism bellingcat/auto-archiver"
  "secondary/democracy-activism Libr-AI/OpenFactVerification"
  # Secondary: solopreneurs and safe vibe coding
  "secondary/solopreneur-vibe-coding Aider-AI/aider"
  "secondary/solopreneur-vibe-coding OpenHands/OpenHands"
  "secondary/solopreneur-vibe-coding stackblitz-labs/bolt.diy"
  "secondary/solopreneur-vibe-coding nextjs/saas-starter"
  "secondary/solopreneur-vibe-coding n8n-io/n8n"
  "secondary/solopreneur-vibe-coding DataDog/guarddog"
  "secondary/solopreneur-vibe-coding OWASP/CheatSheetSeries"
  # Secondary: surviving job displacement
  "secondary/job-transition openai/GPTs-are-GPTs"
  "secondary/job-transition AIOE-Data/AIOE"
  "secondary/job-transition srbhr/Resume-Matcher"
  "secondary/job-transition speedyapply/JobSpy"
  "secondary/job-transition kamranahmedse/developer-roadmap"
  "secondary/job-transition mlabonne/llm-course"
)

FILTER="${1:-}"
failed=()
for entry in "${REPOS[@]}"; do
  read -r part slug <<<"$entry"
  [[ -n "$FILTER" && "$part" != "$FILTER"* ]] && continue
  dest="repos/$part/${slug#*/}"
  if [[ -d "$dest/.git" ]]; then
    echo "update  $slug"
    git -C "$dest" pull --ff-only --quiet || failed+=("$slug")
  else
    echo "clone   $slug"
    mkdir -p "repos/$part"
    git clone --depth 1 --quiet "https://github.com/$slug.git" "$dest" || failed+=("$slug")
  fi
done

if ((${#failed[@]})); then
  echo "Failed: ${failed[*]}" >&2
  exit 1
fi
echo "Done."
