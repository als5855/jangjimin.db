


-- # 1-1 
-- # 키워드
-- SELECT group_title, creator_id
-- FROM Meeting_Groups
-- WHERE group_title like '%keyword%'
-- GROUP BY group_title
-- ORDER BY group_title ;

-- # 취미
-- SELECT group_title, group_category
-- FROM Meeting_Groups
-- WHERE group_category in ('취미', '문화_예술', '스포츠_운동', '푸드_맛집', '자기계발', '여행', '연애', '힐링') 
-- GROUP BY group_title
-- ORDER BY group_title ;

-- # 지역
-- SELECT group_title, group_address
-- FROM Meeting_Groups
-- WHERE group_address like ('부산', '대구', '인천', '광주', '대전', '울산', '서울', '제주', '세종', '경기', '강원', '충북', '충남', '전북', '전남', '경북', '경남')
-- GROUP BY group_title
-- ORDER BY group_title;

-- #1-2
-- # 키워드 / 취미
-- SELECT  group_title, group_category
-- FROM Meeting_Groups
-- WHERE group_title LIKE '%keyword%'
-- 	AND group_category in ('취미', '문화_예술', '스포츠_운동', '푸드_맛집', '자기계발', '여행', '연애', '힐링')
-- GROUP BY group_title
-- ORDER BY group_title ;

-- # 키워드 / 지역
-- SELECT  group_title, group_category
-- FROM Meeting_Groups
-- WHERE group_title LIKE '%keyword%'
-- 	AND group_category in ('취미', '문화_예술', '스포츠_운동', '푸드_맛집', '자기계발', '여행', '연애', '힐링')
-- GROUP BY group_title
-- ORDER BY group_title;

-- # 취미 / 지역
-- SELECT group_title, group_category, group_address
-- FROM Meeting_Groups
-- WHERE group_title LIKE '%keyword%'
-- 	AND group_address like ('부산', '대구', '인천', '광주', '대전', '울산', '서울', '제주', '세종', '경기', '강원', '충북', '충남', '전북', '전남', '경북', '경남')
-- GROUP BY group_title
-- ORDER BY group_title;


-- group_title, group_content, group_type, meeting_type, group_category, group_address, group_image, group_supplies, group_date, group_question


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
출력되 카테고리 3개 안에서 출력되는 모임의 개수는 각각 3개이며 
Users에 있는 hobby와 Meeting_Groups의 취미카테고리가 일치하는 것만 출력한다.
*/

#3. 추천 버튼을 클릭하면 그 모임에 클릭한 유저의 수 만큼 카운트(추천순으로 모임을 나열할 때 쓰인다.)--
#4. 내정보관리 - 내 정보 조회, 수정, 회원탈퇴 기능 
#5. 모임 참가신청 페이지 - 원하는 모임에 참가를 신청한다. 모임 주의 사항을 확인한 후   
#6. 아이디 찾기



/*
1. 필터링 검색
필터링 기능 - 취미카테고리, 지역카테고리, 검색 키워드를 활용하여 연관된 키워드와 카테고리를 가지고 있는 모임을 출력한다.---
1. 키워드, 취미, 지역 따로 조회 따로 조회
2. 키워드 / 취미, 키워드 / 지역, 취미 / 지역 조회
3. 키워드 / 취미 / 지역 검색
- 제목, 취미카테고리, 지역카테고리를 Meeting_Groups 테이블에서 가져온다.
*/
SELECT group_title, group_address, group_category, group_address, group_image, group_date
FROM Meeting_Groups
WHERE group_title LIKE '%keyword%'
	OR group_category IN ('취미', '문화_예술', '스포츠_운동', '푸드_맛집', '자기계발', '여행', '연애', '힐링')
	OR group_address IN ('부산', '대구', '인천', '광주', '대전', '울산', '서울', '제주', '세종', '경기', '강원', '충북', '충남', '전북', '전남', '경북', '경남')
    -- spring에서 주소를 스트링으로 받을 때 앞에 두글자를 가져와서 넘기는 식으로 한다.
ORDER BY group_id; 

/*
2. 홈화면 필터링 - 회원가입하면서 체크한 카테고리 항목에 맞춰서 홈화면에 모임을 추천해준다.
출력된 카테고리 3개가 화면에 (모임이름, 모이주소, 모임사진, 모임날짜)데이터를 가지고온다. 이 3개의 카테고리에는 각각 3개의 모임이 랜덤으로 출력된다.
Users에 있는 hobby와 Meeting_Groups의 group_category 일치하는 카테고리만 출력한다.
*/

SELECT mg.group_id, mg.group_title, mg.group_address, mg.group_category, mg.group_image, mg.group_date
FROM Meeting_Groups mg LEFT JOIN Users u ON mg.group_category = u.hobby 
WHERE u.user_id = "userId"
AND mg.group_category IN  ('취미', '문화_예술', '스포츠_운동', '푸드_맛집', '자기계발', '여행', '연애', '힐링')
-- ORDER BY mg.group_category;                                                       
UNION
SELECT mg.group_id, group_title, group_address, group_category, group_image, group_date
FROM Meeting_Groups
WHERE group_category IN ('취미', '문화_예술', '스포츠_운동', '푸드_맛집', '자기계발', '여행', '연애', '힐링')
ORDER BY mg.group_category, RAND() LIMIT 3; -- 랜덤출력


#2-2. 단기/정기 모임 필터링
SELECT DISTINCT group_title, group_address, group_image, group_date
FROM Meeting_Groups 
WHERE  group_type IN ('단기모임', '정기모임')
ORDER BY group_id;


#3. 추천 버튼을 클릭하면 그 모임에 클릭한 유저의 수 만큼 카운트(추천순으로 모임을 나열할 때 쓰인다.)
#3-1.추천 / 추천순
SELECT DISTINCT mg.group_id, count(reco.user_id) As Recommendation_count
FROM Meeting_Groups mg LEFT JOIN Recommendations reco ON mg.group_id = reco.group_id
ORDER BY Recommendation_count DESC;

# 4. 내정보 관리
#4-1. 내정보관리 수정
UPDATE Users 
set user_name = 'userId', user_nickname = 'userNickname', hobby = 'hobby', 
profile_image = 'profileImage', region = 'region';

#4-2. 내정보관리 삭제(탈퇴)
DELETE FROM Users 
WHERE user_id = 'userId' AND user_password = 'userPassword';
 
#5. 모임 참여 신청 페이지
SELECT mg.group_title, mg.group_image, mg.group_question, ua.user_answer              
FROM User_Answers ua LEFT JOIN Meeting_Groups mg ON ua.group_id = mg.group_id;

#6. 아이디 찾기
SELECT DISTINCT user_id FROM Users
WHERE user_name ='userName' AND user_birth_date = 'userBirthdate';








