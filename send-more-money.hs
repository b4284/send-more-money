-- THIS IS NOT MY WORK !!
-- CREDIT GOES TO Mark Dominus
-- GRABBED FROM http://blog.plover.com/prog/haskell/monad-search.html

import Control.Monad (guard)

digits = [0..9]

to_number = foldl (\a -> \b -> a*10 + b) 0

remove rs ls = foldl remove' ls rs
  where remove' ls x = filter (/= x) ls

--     S E N D
--   + M O R E
--   ---------
--   M O N E Y

solutions = do
  s <- remove [0] digits
  e <- remove [s] digits
  n <- remove [s,e] digits
  d <- remove [s,e,n] digits
  let send = to_number [s,e,n,d]
  m <- remove [0,s,e,n,d] digits
  o <- remove [s,e,n,d,m] digits
  r <- remove [s,e,n,d,m,o] digits
  let more = to_number [m,o,r,e]
  y <- remove [s,e,n,d,m,o,r] digits
  let money = to_number [m,o,n,e,y]
  guard $ send + more == money
  return (send, more, money)

main = do
  print solutions
