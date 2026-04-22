---
aliases: ["Antigravity 작업 내역", "작업 로그"]
tags: [agent_log, antigravity, system_setup]
date: 2026-04-22
model: gemini-3.1-pro
task_status: success
---

# 🤖 Antigravity AI 시스템 통합 작업 히스토리 (2026-04-22)

현재 시간까지 Antigravity 봇이 지원하여 구축 완료한 **Hermes & Paperclip 시스템 확장 및 웹 퍼블리싱 파이프라인** 주요 작업 내역을 요약합니다.

## 🛠️ 주요 해결 및 구축 내역

### 1. 로컬 LLM (Ollama) 연동 및 404 에러 해결
*   **문제 사항:** Aider 스크립트 실행 중 `deepseek-coder-v2` 모델을 찾지 못하고 404 에러가 발생.
*   **해결:** `.env`에서 `OLLAMA_API_BASE`의 `/v1` 접미사를 제거하여 네이티브 API가 정상 호출되도록 경로 수정.
*   **추가 작업:** 명시된 `qwen2.5-coder` 모델이 없을 때, 유저의 수동 `ollama pull` 이후 워크플로우 정상 구동 됨을 확인.

### 2. 옵시디언 AI 연동 가이드 작성
*   AI가 생성하는 산출물과 로그를 가장 효율적으로 관리/검색하기 위한 설정 가이드라인 문서(`<workspace>/obsidian_ai_integration_guide.md`)를 작성.
*   **권장 폴더 구조** (`Inbox`, `Agent_Logs`, `Context`)와 **필수 플러그인**(Dataview, Linter, Smart Connections 등) 제시.

### 3. Quartz 4 기반의 자동화 디지털 정원(Digital Garden) 웹사이트 세팅
*   **Node.js 런타임 확보:** `nvm`을 활용하여 Node 22버전 설치.
*   **Web 폴더 구축:** `obsidian-web` 디렉토리에 Quartz 4 프레임워크 뼈대를 클론하고 패키지를 설치 (`npm i`).
*   **자동 동기화 스크립트(`sync_and_build.sh`):** 옵시디언 Vault 원본을 훼손하지 않도록, `rsync`를 사용해 로컬의 Vault 내용을 `obsidian-web/content/`로 안전하게 일방향 복사한 뒤 로컬 빌드를 수행하는 스크립트 작성.
*   **홈페이지 생성:** `/Users/jungsunan/Documents/Obsidian_Vault/index.md` 에 대문 파일 추가.

### 4. GitHub Actions를 통한 CI/CD 파이프라인 완성
*   **GitHub Pages 세팅:** Vercel의 복잡함을 피하기 위해, `.github/workflows/deploy.yml`을 작성하여 GitHub Actions를 통한 무료 호스팅 파이프라인 도입.
*   **커스텀 Base URL:** `quartz.config.ts`의 기본 테마 및 한글화, BaseURL (`anjungsun.github.io/obsidian-digital-garden`)을 수정 반영.
*   **강제 푸시(Force Push):** 잘못된 상위 디렉토리 커밋 문제를 해결하고자 `obsidian-web` 코드들을 유저의 `obsidian-digital-garden` 저장소로 직접 푸시 완수.

---
> [!info] 
> 앞으로 AI 코딩 시스템(Hermes/Paperclip)이 내놓는 산출물들은 이 Vault에 떨어지게 되며, `sync_and_build.sh` 스크립트를 실행한 뒤 GitHub으로 Push하면 전 세계 어디서나 모바일 웹으로도 확인할 수 있습니다!
