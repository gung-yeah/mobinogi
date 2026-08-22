# mobinogi 크래프팅 플래너

## 프로젝트 개요
마비노기 게임용 크래프팅 계획 도구. 정적 HTML/CSS/JS로 제작, 별도 빌드 시스템 없음.

## 배포 방식
- GitHub Pages로 호스팅: `gung-yeah.github.io/mobinogi`
- 티스토리 블로그(bbunye)에 iframe으로 임베드해서 사용
- `main` 브랜치에 push하면 자동으로 GitHub Pages에 반영됨 (별도 빌드 단계 없음)

## 폴더 구조
- `/jewel-change` — 보석 변경 관련 서브 프로젝트
- `/crafting-planner` — 해연, 드래케인 장비 관련 서브 프로젝트
- `/processing-techtree` — 생활 테크트리 관련 서브 프로젝트
- `/class-tracker` — 계정/캐릭터별 클래스 레벨 기록 및 정령의 흔적 계산, 재능 부자·올라운더 칭호 진행률 서브 프로젝트


## 작업 시 주의사항
- 보석 변경 관련 서브 프로젝트는 게시 계획 없음
- 정적 파일이라 별도 서버/백엔드 없음. 모든 로직은 클라이언트 JS로 처리
- 커밋 전 로컬에서 html 파일 직접 열어서 동작 확인
- 저작권 표기(카피라이트 노티스)는 블로그, 소스코드, 리포지토리 세 군데 모두에 유지할 것

## 버전 표시
- crafting-planner, class-tracker, processing-techtree 3개 서브 프로젝트 HTML에 `v1.0.0` 형식의 버전을 표시(소스 상단 주석 + 화면 하단 footer)
- 자릿수는 각 0~9, 10 넘으면 윗자리로 받아올림 (odometer 방식). 시작값 v1.0.0
- `.githooks/pre-commit` 훅이 커밋 시 스테이징된 대상 파일만 자동으로 버전을 올림 (파일별 커밋 수 기준, `.version-state.json`에 카운트 저장)
- 이 저장소를 새로 clone한 환경에서는 훅이 자동 적용되지 않으므로 `git config core.hooksPath .githooks` 를 한 번 실행해야 함
- 버전 문자열은 파일 내 `vX.Y.Z` 패턴을 전역 치환하는 방식이므로, 다른 용도로 `vX.Y.Z` 형태 텍스트를 파일에 넣지 말 것

## 코드 스타일
- 
