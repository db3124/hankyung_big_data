# 지?���? ?��?��??� 비율
# 1. 변?�� 검?�� �? ?��처리
# 1-1. 지?��
# 검?��
class(welfare$code_region)
table(welfare$code_region)

# ?��처리
list_region <- data.frame(code_region = c(1:7),
                          region = c("?��?��", "?��?���?(?���?/경기)", "부?��/경남/?��?��",
                                     "??��?/경북", "??�?��/충남", "강원/충북",
                                     "광주/?��?��/?���?/?��주도"))

list_region

welfare_region <- welfare %>% 
  select(c(code_region, ageg)) %>% 
  inner_join(list_region, by = "code_region")

View(welfare_region)
table(is.na(welfare_region$code_region))
table(is.na(welfare_region$region))
# 1-2. ?��?��??�

# 2. 변?�� �? 관�? 분석
# 2-1. 지?���? ?��?��??� 비율?�� 만들�?
region_ageg <- welfare_region %>%
  group_by(region, ageg) %>% 
  summarise(n = n()) %>% 
  mutate(tot_group = sum(n)) %>% 
  mutate(pct = round(n / tot_group * 100, 2))

region_ageg 

# 2-2. 그래?�� 만들�?
#지?���? ?���
ggplot(data = region_ageg, aes(x = reorder(region, n), y = n))+
  geom_col() +
  coord_flip()

# 지?���? ?��?��??��? 그래?��
ggplot(data = region_ageg, aes(x = region, y = pct, fill = ageg)) +
  geom_col() +
  coord_flip()

