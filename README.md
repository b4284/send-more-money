# 蟲食算問題

```  
   SEND
+) MORE
-------
  MONEY
```

每個英文字都代表一個 0-9 之間的數字，每個數對應的字母只有一個。

## 效能

在 i3-2310U 上測試，平台 linux (x86_64)，十次平均。

* C (gcc -O2): 0.130s
* Guile Scheme: 1.895s
* Haskell: 1.070s
* Racket: 1.687s
* SQL (PostgreSQL): 5.391s
