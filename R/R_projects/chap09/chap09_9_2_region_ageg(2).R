# ?Έ?μΈ? λΉμ¨?΄ ??? ????λ‘? λ§λ? ? ?
list_older_old <- region_ageg %>% 
  filter(ageg == "the older") %>% 
  arrange(pct)

list_older_old

order <- list_older_old$region
order
class(order)

ggplot(data = region_ageg, aes(x = region, y = pct, fill = ageg)) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limits = order)

# ===========================================================
# ?°? Ή?? ??Όλ‘? λ§λ? ? ??΄?κΈ?
class(region_ageg$ageg)

# λ²‘ν°? λ¬Έμ?΄?΄κΈ? ?λ¬Έμ level?΄ ??
levels(region_ageg$ageg)

# ? λ²¨μ λ§λ€κΈ? ??΄ ?©?°??Όλ‘? λ°κΏ
region_ageg$ageg <- factor(region_ageg$ageg,
                           level = c("the older", "fifties",
                                     "forties", "thirties", "twenties"))
# ? λ²? ??λ₯? μ§? ?΄μ€?. μ§? ?μ§ ??Όλ©? λ¬Έμ?΄? ?¬κΈ°λ?λ‘? ?? ?€? ?¨.

class(region_ageg$ageg)
levels(region_ageg$ageg)

# κ·Έλ? κ·Έλ¦¬κΈ?
ggplot(data = region_ageg, aes(x = region, y = pct, fill = ageg)) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limits = order)







