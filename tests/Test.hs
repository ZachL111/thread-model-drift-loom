import PortfolioCore

expect :: Bool -> IO ()
expect True = pure ()
expect False = error "fixture mismatch"

main :: IO ()
main = do
  let signalcase_1 = Signal 63 95 13 23 7
  expect (score signalcase_1 == 92)
  expect (classify signalcase_1 == "review")
  let signalcase_2 = Signal 82 71 14 5 11
  expect (score signalcase_2 == 232)
  expect (classify signalcase_2 == "accept")
  let signalcase_3 = Signal 94 99 26 25 12
  expect (score signalcase_3 == 145)
  expect (classify signalcase_3 == "review")
