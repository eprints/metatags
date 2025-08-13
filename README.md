# metatags
Adds extra `<meta>` tags to summary pages to aid automatic scrapers like 'Google Scholar' in correctly reading the metadata associated with a particular EPrint.

Specifically this adds [Highwire Press](https://scholar.google.co.uk/intl/en/scholar/inclusion.html#indexing) and [PRISM](https://www.w3.org/submissions/2020/SUBM-prism-20200910/prism-basic.html#_Toc46322886) as these appear to be the most popular metatag formats that were not already supported by EPrints (Dublin Core and EPrints own format are already included in core).

> [!NOTE]
> The contents of this ingredient are included in EPrints core from 3.4.7 onwards so it should be disabled/removed from a repository that has been updated to that version or later to avoid errors.

## Installation
- Clone this repository into your `ingredients` directory with `git clone https://github.com/eprints/metatags.git`
- Enable it by adding `ingredients/metatags` to your `inc` file (`flavours/{flavour}/inc`)
- Regenerate the summary pages with `epadmin refresh_abstracts {repo}` or similar

### Manual Installation
If you wish to install these export plugins independently then you will need to enable them by adding:
```
$links->appendChild( $repository->plugin( "Export::HighwirePress" )->dataobj_to_html_header( $eprint ) );
$links->appendChild( $repository->plugin( "Export::Prism" )->dataobj_to_html_header( $eprint ) );
```
to `$c->{eprint_render}` alongside the existing `Export::Simple` and `Export::DC` blocks.
