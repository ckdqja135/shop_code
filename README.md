# shop_code
JSP와 mysql을 사용하여 게임 판매 쇼핑몰 홈페이지를 제작하였습니다.

# 주의 사항
MYSQL 8을 사용중인데
데이터베이스가 기본 설정이 euc-kr로 만들어져 있어서 euc-kr 그대로 사용했습니다.
(데이터베이스 설정 utf-8로 변경후 소스들 전부 utf8로 변환했더니 오류가 생겼습니다.)

sell 테이블 존재하는 이유는 원래 판매량 best5를 사진을 띄워서 추천해주는 형식으로 하려했는데
이상하게 select 문에서 쿼리문에 as를 주는게 안되서 포기하고 랜덤 추천이 들어갔습니다.
테이블은 판매량을 일단 남겨두면 어딘가에 쓸 수 있을것 같아 남겨뒀습니다.

업로드 폴더의 경로는 C드라이브에 있는 upload 입니다.
웹컨텐츠 아래의 경로를 인식 시키는 것을 잘 안돼서 C드라이브로 설정했습니다.
