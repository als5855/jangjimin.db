/*
1. 필터링 검색
필터링 기능 - 취미카테고리, 지역카테고리, 검색 키워드를 활용하여 연관된 키워드와 카테고리를 가지고 있는 모임을 출력한다.---
1. 키워드, 취미, 지역 따로 조회 따로 조회
2. 키워드 / 취미, 키워드 / 지역, 취미 / 지역 조회
3. 키워드 / 취미 / 지역 검색
- 제목, 취미카테고리, 지역카테고리를 Meeting_Groups 테이블에서 가져온다.
*/

/*
2. 홈화면 필터링 - 회원가입하면서 체크한 카테고리 항목에 맞춰서 홈화면에 모임을 추천해준다.
Users에 있는 hobby와 Meeting_Groups의 취미카테고리가 일치하는 것만 출력한다.
*/
#3. 추천 버튼을 클릭하면 그 모임에 클릭한 유저의 수 만큼 카운트(추천순으로 모임을 나열할 때 쓰인다.)--
#4. 내정보관리 - 내 정보 조회, 수정, 회원탈퇴 기능 
#5. 모임 참가신청 페이지  
#6. 아이디 찾기

# 1-1 
# 키워드
SELECT group_title
FROM Meeting_Groups
WHERE group_title like '%keyword%'
GROUP BY group_title
ORDER BY group_title ;

# 취미
SELECT group_title, group_category
FROM Meeting_Groups
WHERE group_category in ('취미', '문화_예술', '스포츠_운동', '푸드_맛집', '자기계발', '여행', '연애', '힐링') 
GROUP BY group_title
ORDER BY group_title ;

# 지역
SELECT group_title, group_address
FROM Meeting_Groups
WHERE group_address like ('부산', '대구', '인천', '광주', '대전', '울산', '서울', '제주', '세종', '경기', '강원', '충북', '충남', '전북', '전남', '경북', '경남')
GROUP BY group_title
ORDER BY group_title;

#1-2
# 키워드 / 취미
SELECT  group_title, group_category
FROM Meeting_Groups
WHERE group_title LIKE '%keyword%'
	AND group_category in ('취미', '문화_예술', '스포츠_운동', '푸드_맛집', '자기계발', '여행', '연애', '힐링')
GROUP BY group_title
ORDER BY group_title ;

# 키워드 / 지역
SELECT  group_title, group_category
FROM Meeting_Groups
WHERE group_title LIKE '%keyword%'
	AND group_category in ('취미', '문화_예술', '스포츠_운동', '푸드_맛집', '자기계발', '여행', '연애', '힐링')
GROUP BY group_title
ORDER BY group_title;

# 취미 / 지역
SELECT group_title, group_category, group_address
FROM Meeting_Groups
WHERE group_title LIKE '%keyword%'
	AND group_address like ('부산', '대구', '인천', '광주', '대전', '울산', '서울', '제주', '세종', '경기', '강원', '충북', '충남', '전북', '전남', '경북', '경남')
GROUP BY group_title
ORDER BY group_title;


#1-3
# 키워드 / 취미 / 지역 검색
SELECT group_title, group_category, group_address
FROM Meeting_Groups
WHERE group_title LIKE '%keyword%'
	AND group_category in ('취미', '문화_예술', '스포츠_운동', '푸드_맛집', '자기계발', '여행', '연애', '힐링')
	AND group_address like ('부산', '대구', '인천', '광주', '대전', '울산', '서울', '제주', '세종', '경기', '강원', '충북', '충남', '전북', '전남', '경북', '경남')
GROUP BY group_title
ORDER BY group_title;


#2 홈화면 필터링
SELECT MG.group_title, U.hobby, MG.group_category
FROM Users AS U, Meeting_Groups AS MG
WHERE U.hobby LIKE MG.group_category
GROUP BY U.hobby
ORDER BY MG.group_title;

#3 추천




