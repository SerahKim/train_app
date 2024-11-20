# 가차 예매 어플

- flutter로 구현된 기차 예매 어플리케이션

### date

---

- 2024.11.11~2024.11.20
- 내일배움캠프 앱창업 4~5주치

### 프로그램 실행 방법

---

1. git repository 클론하기

```
git clone https://github.com/SerahKim/train_app.git
```

### 프로젝트 구조

---

- lib/pages/home
  - widgets
    - stationBox.dart : 첫 화면에서 보이는 역 선택 박스 구현된 다트 파일
  - homePage.dart : 첫 화면에서 보이는 역 선택 박스, 좌석 선택 버튼을 배치하기 위한 다트 파일
- lib/pages/seat
  - widgets
    - seatInfo.dart : 좌석 페이지의 좌석을 구현하기 위한 다트 파일
  - seatPage.dart : 전체적인 좌석 페이지 기능과 프레임 구성을 위한 다트 파일
- lib/pages/station_list
  - widgets
    - stationName.dart
  - stationlistPage.dart
- lib/main.dart

### 기본 기능

---

- 캐릭터 생성
  - 게임 시작 시 사용자로부터 이름을 입력받음.
  - 이름은 한글 또는 영문 대소문자만 허용. (특수문자 및 숫자 불가)
- 몬스터 생성
  - 텍스트 파일에 저장된 몬스터의 정보를 랜덤으로 가져옴.
  - 한번 소환된 후 턴이 끝난 몬스터는 게임이 끝날 때까지 호출되지 않음.
- 캐릭터 동작
  - 공격
    - 몬스터 공격
    - 몬스터의 체력이 0이하가 되면 캐릭터의 승리
  - 방어
    - 사용자가 방어 태세에 돌입하면 몬스터 데이터 파일에 설정된 최대 공격력에 캐릭터의 방어력을 제외한 데미지를 받게됨.
    - 받은 데미지의 값만큼 캐릭터의 체력이 추가됨.
- 몬스터 동작
  - 공격
    - 몬스터 데이터에 입력된 공격력을 최대로, 랜덤하게 공격력 생성
    - 몬스터의 공격력은 캐릭터의 방어력보다 작을 수 없음.
    - 캐릭터가 받는 공격의 값은 몬스터의 공격력에 캐릭터의 방어력을 뺀 값.
