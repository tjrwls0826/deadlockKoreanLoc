@echo off
setlocal

:: 데드락 갤러리 한글패치 원본 - 데드락번역맨, bat 파일 - 감솔
set "REPO_URL=https://github.com/yoon-goon/deadlockKoreanLoc"

:: ZIP 파일 다운로드 파일 압축 해제
curl -L -o repo.zip %REPO_URL%/archive/refs/heads/master.zip


powershell -command "Expand-Archive -Path 'repo.zip' -DestinationPath '.'"

:: game 폴더가 존재하는 경우, 기존 파일을 덮어씀
if exist "deadlockKoreanLoc-main\game" (
    xcopy /s /y "deadlockKoreanLoc-main\game\*" "%~dp0game\"
) else (
    echo "game" folder not found.
)

:: 파일 삭제
del repo.zip

:: deadlockKoreanLoc-main 폴더 삭제
if exist "deadlockKoreanLoc-main" (
    rmdir /s /q "deadlockKoreanLoc-main"
)

:: 다운로드 완료 메시지
echo korean loc patch has been successfully done.

pause
