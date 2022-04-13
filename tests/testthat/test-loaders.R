# Copyright 2021 Bedford Freeman & Worth Pub Grp LLC DBA Macmillan Learning.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

test_that("vocab works", {
  test_result <- morphemepiece_vocab()

  # Run a couple basic tests to help identify specific strangeness.
  expect_s3_class(
    test_result,
    c("morphemepiece_vocabulary", "character"),
    exact = TRUE
  )
  expect_null(names(test_result))

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
