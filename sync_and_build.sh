#!/bin/bash
# 이 스크립트는 로컬 옵시디언 Vault 데이터를 Quartz 폴더로 복사한 뒤, 정적 웹사이트로 빌드합니다.
echo "🔄 옵시디언 Vault 데이터 동기화 중..."
# content 내부의 백업용 markdown 제거 (기본 폴더 제외)
find content -type f -name "*.md" -delete

# 최신 데이터 복사 (숨김 파일/폴더 제외)
rsync -av --exclude='.obsidian' --exclude='.git' /Users/jungsunan/Documents/Obsidian_Vault/ content/

echo "🚀 Quartz 4 로컬 빌드 시작..."
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

npx quartz build
echo "✅ 빌드 완료! 'npx quartz build --serve' 명령어를 실행하면 로컬 호스트에서 결과물을 미리볼 수 있습니다."
