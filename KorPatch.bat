@echo off
setlocal

:: 데드락 갤러리 한글패치 원본 - 데드락번역맨, bat 파일 - 감솔
set "REPO_URL=https://github.com/flameblast12/DeadlockKRLocalization"

:: ZIP 파일 다운로드 및 압축 해제
curl -L -o repo.zip %REPO_URL%/archive/refs/heads/master.zip

powershell -command "Expand-Archive -Path 'repo.zip' -DestinationPath '.'"




:: citadel_* 폴더들을 \game\citadel\resource\localization 경로로 복사
xcopy /s /y "DeadlockKRLocalization-main\citadel_*" "%~dp0game\citadel\resource\localization\"


:: ZIP 파일 삭제
del repo.zip

:: deadlockKoreanLoc-main 폴더 삭제
if exist "DeadlockKRLocalization-main" (
    rmdir /s /q "DeadlockKRLocalization-main"
)

:: 다운로드 완료 메시지
echo Korean loc patch has been successfully done.

pause
