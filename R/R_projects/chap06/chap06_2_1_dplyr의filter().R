# dplyr 패키지 이용 데이터 가공하기
# 1. 패키지 로드
library(dplyr)

exam <- as.data.frame(read.csv("./res/csv_exam.csv"))
exam

# 2. 데이터 추출
# filter(): 원하는 행 추출하는 함수
# %>%: 파이프(Pipe): %>% 앞의 명령 결과를, %>% 뒤의 명령의 입력으로 넣어줌
exam %>% filter(class == 2)
exam %>% filter(class == 1)
exam %>% filter(math >= 70)
exam %>% filter(science <= 70)
exam %>% filter(english >= 80)
exam %>% filter(class != 3)

exam %>% filter(class %in% c(1, 2, 3))
exam %>% filter(class == 1 | class == 2 | class == 3)


# 3. 여러 조건을 충족하는 행 추출
exam %>% filter(class == 1 & math >= 50)
exam %>% filter(math >= 58 & english >= 85 & science >= 60)

# 아래와 같이 추출해도 되지만, 파이프로 하면 함수끼리 연결이 돼 편리
exam[1:3] # 1~3열
exam[exam$class == 1, "math" >= 50]

# 4. 변수 추가
exam$mean <- (exam$english + exam$math + exam$science) / 3

summary(exam)

exam$grade <- ifelse(exam$mean >= 70, "A",
                     ifelse(exam$mean >= 60, "B",
                            ifelse(exam$mean >= 50, "C", "D")))

head(exam)

table(exam$grade)

exam %>% filter(grade == "A")

?Syntax
