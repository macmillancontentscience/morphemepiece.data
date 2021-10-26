## Create the morphemepiece vocab and lookup.


# Setup -------------------------------------------------------------------

# Required packages (these are NOT included in Suggest, since they aren't all on
# CRAN and one creates a circular reference):

# dplyr
# fs
# morphemepiece
# purrr
# wikimorphemes remotes::install_github("macmillancontentscience/wikimorphemes")
# wordpiece.data

# Load functions used in this process.
source(here::here("data-raw", "make_vocab_and_lookup.R"), local = TRUE)


# Load data ---------------------------------------------------------------

# Load various data used in the process.
original_lookup <- readRDS(wikimorphemes::download_wikimorphemes_lookup())

# TODO: Host this on data.world and wrap it into one of the packages. Validate
# the source and make it clearer where it came from. Consider using
# [OpenWebTextCorpus](https://skylion007.github.io/OpenWebTextCorpus/) to create
# a new one. If you are helping with this package, talk to the maintainers and
# we'll provide you with a word frequency table.
word_frequency_table <- readRDS(
  fs::path(
    morphemepiece::morphemepiece_cache_dir(),
    "word_frequency_table.rds"
  )
)


# Make the Vocab & Lookup -------------------------------------------------

vandl_large <- make_vocab_and_lookup(
  full_lookup = original_lookup,
  full_vocabulary = wikimorphemes::wiktionary_word_list(),
  wordpiece_vocab = wordpiece.data::wordpiece_vocab(),
  target_vocab_size = 30000L,
  word_frequency_table = word_frequency_table
)

# Format for morphemepiece. Really make_vocab_and_lookup should just return in
# this format.
lookup <- .make_lookup_list(
  voc = vandl_large$vocab,
  lu = vandl_large$lookup,
  word_frequency_table = word_frequency_table
)

vocab <- morphemepiece::prepare_vocab(vandl_large$vocab)


# Save --------------------------------------------------------------------

saveRDS(
  lookup,
  here::here(
    "inst",
    "rds",
    "morphemepiece_lookup_30000.rds"
  )
)
saveRDS(
  vocab,
  here::here(
    "inst",
    "rds",
    "morphemepiece_vocab_30000.rds"
  )
)
rm(lookup)
rm(vocab)
rm(original_lookup)
rm(vandl_large)
rm(word_frequency_table)

rm(`%>%`)
rm(.data)
rm(count_tokens)
rm(make_vocab_and_lookup)
rm(.add_words_to_lookup)
rm(.get_actual_wp_words)
rm(.get_fancy_wp_tokens)
rm(.get_wp_proper_nouns)
rm(.make_lookup)
rm(.make_lookup_list)
rm(.unnest_lookup)
