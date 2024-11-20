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
    - stationName.dart : 리스트업한 역 이름을 이용하여 역 페이지를 구성한 다트 파일
  - stationlistPage.dart : 역 이름을 리스트업한 다트 파일
- lib/main.dart

### 기본 기능

---

- 홈페이지에서 출발역, 도착역 선택
  - 역 선택 시 역이 리스트 업 된 페이지로 넘어감.
  - 선택된 역이 홈페이지의 역 선택 박스에 반영.
- 좌석 선택 버튼 클릭
  - 버튼 클릭 후 좌석 선택 페이지로 넘어감.
  - 홈페이지에서 선택된 역이 좌석 페이지에 반영.
  - 좌석을 클릭하면 선택된 좌석의 색깔 변경
  - 예매하기 버튼을 누르면 좌석에 대한 정보가 나오며 확인 또는 취소를 선택할 수 있음

### 도전 기능

---

- 다크 모드 설정
