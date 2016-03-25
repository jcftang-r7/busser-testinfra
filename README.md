# <a name="title"></a> Busser::RunnerPlugin::Testinfra

A Busser runner plugin for testing testinfra scripts

## <a name="installation"></a> Installation and Setup

Please read the Busser [plugin usage][plugin_usage] page for more details.

## <a name="usage"></a> Usage

Please put test files into [COOKBOOK]/test/integration/[SUITES]/testinfra/

```cookbook
`-- test
    `-- integration
        `-- default
            `-- testinfra
                `--test_name.py
```

The exit code of the script is used as indicator for failure or success.

### <a name="note"></a> Note

Globbing pattern to match files is `"testinfra/test_*.py"`.

## <a name="development"></a> Development

* Source hosted at [GitHub][repo]
* Report issues/questions/feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every separate change you make. For
example:

1. Fork the repo
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## <a name="authors"></a> Authors

Created and maintained by [Jimmy Tang][author] (<jimmy_tang@rapid7.com>)

## <a name="license"></a> License

Apache 2.0 (see [LICENSE][license])
