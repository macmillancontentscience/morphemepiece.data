test_that("vocab works", {
  test_result <- morphemepiece_vocab()

  # Run a couple basic tests to help identify specific strangeness.
  expect_s3_class(test_result, c("morphemepiece_vocabulary", "integer"))
  expect_named(test_result)

  # This test will need to be updated if we change our rules for defining a
  # vocabulary, but otherwise it should be stable.
  expect_equal(length(test_result), 30000L)

  # The first 5 should remain stable.
  expect_snapshot(head(test_result, 5))
})

test_that("lookup works", {
  test_result <- morphemepiece_lookup()

  # Run a couple basic tests to help identify specific strangeness.
  expect_type(test_result, c("character"))
  expect_named(test_result)

  # I don't really test the content because the lookup depends pretty much
  # entirely on the vocab.
})
