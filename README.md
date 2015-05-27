# 蟲食算問題

```  
   SEND
+) MORE
-------
  MONEY
```

每個英文字都代表一個 0-9 之間的數字，每個數對應的字母只有一個。

## 效能

在 i3-2310U 上測試，十次平均。

* send-more-money.rkt: 1.687s
* send-more-money.c
    * -O2: 0.130s
