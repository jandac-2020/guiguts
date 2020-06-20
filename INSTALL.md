# Installation

Upgrading requires a complete reinstall (save `header.txt`, `setting.rc`,
and any files you wish to keep in the `data/` directory, although in
theory these should not be overwritten).

Please direct any help requests to the
[DP forum Guiguts thread](https://www.pgdp.net/phpBB2/viewtopic.php?t=3075).

See also https://www.pgdp.net/wiki/PPTools/Guiguts/Install

## Windows

Using Guiguts on Windows requires installing the following pieces:

* Guiguts
* Perl & [Perl modules](#perl-modules)

These instructions walk you through using
[Strawberry Perl](http://strawberryperl.com/). Strawberry Perl is the
recommended Perl interpreter as that is what the developers have tested, it
supports the latest version of Perl, and includes all necessary Perl modules.
It can coexist along side other interpreters.

_If you have an existing Perl distribution installed (aside from the one that
was bundled in older versions of Guiguts) that you do not want to uninstall,
see [Other Perl distributions](#other-perl-distributions) before beginning._

### Extracting Guiguts

Unzip `guiguts-win-n.n.n.zip` to some location on your computer (double click
the zip file in Explorer). A common place for this is `c:\guiguts` although
it can be placed anywhere.

### Strawberry Perl & Perl modules

Download and install [Strawberry Perl](http://strawberryperl.com/). Installing
it in the default location, `c:\Strawberry`, is recommended but not required.

After Strawberry Perl is installed, we need to install all the necessary
[Perl modules](#perl-modules). This is most easily done by opening a command
line window and running the helper script included with Guiguts:

```
cd c:\guiguts
perl install_cpan_modules.pl
```

#### Other Perl distributions

_This section is for advanced users and most Guiguts Windows users can skip it._

When installing the Perl modules, either with the helper script or manually
running `cpanm`, ensure that the Strawberry Perl versions of `perl` and `cpanm`
are the ones being run. Both programs have a `--version` argument you can use
to see which version of perl is being run. Ensure the version matches that of
Strawberry Perl you installed. Note that ActiveState Perl puts its directories
at the front of the path and Strawberry Perl puts its directories at the end
of the path.

If you have multiple Perl distributions installed you should edit the
`run_guiguts.bat` file and adjust the PATH to the version you want to run
Guiguts. The batch file prepends the default Strawberry Perl directories to the
path and will preferentially use it if available.

Other Perl distributions, such as
[ActiveState Perl](https://www.activestate.com/products/perl/), may be used
to run Guiguts after installing additional [Perl modules](#perl-modules). Note
that ActiveState Perl versions after 5.10 will not successfully install Tk and
cannot be used with Guiguts.

The bundled perl interpreter included with Guiguts 1.0.25 may also work but
is no longer maintained. The bundled perl includes the required modules
used in 1.0.25 which may not be the full set needed by later versions.

### Starting Guiguts

Start Guiguts with:
```
run_guiguts.bat
```

### Helper applications

You will also need to install helper applications to view images and to
spell check.

## MacOS

To use Guiguts you need to be running macOS High Sierra (10.13) or higher.
Running Guiguts on MacOS requires installing the following pieces of software.
The list may seem intimidating but it's rather straightforward and only needs
to be done once. These instructions walk you through it.

* Guiguts code
* [Xcode Command Line Tools](https://developer.apple.com/library/archive/technotes/tn2339/_index.html)
* [Homebrew](https://brew.sh/)
* Perl & [Perl modules](#perl-modules)
* [XQuartz](https://www.xquartz.org/)

This is necessary because the version of Perl that comes with MacOS does not
have the necessary header files to build the Perl package dependencies that
Guiguts requires.

### Extracting Guiguts

Unzip `guiguts-n.n.n.zip` to some location on your computer (double click the
zip file in Finder or run `unzip guiguts-n.n.n.zip` on the command line). You
can move the `guiguts` folder it creates to anywhere you want. A common place
for this is your home directory.

### XCode Command Line Tools

Homebrew requires either the
[Xcode Command Line Tools](https://developer.apple.com/library/archive/technotes/tn2339/_index.html)
or full [Xcode](https://apps.apple.com/us/app/xcode/id497799835). If you
have the full Xcode installed, skip this step. Otherwise, install the Xcode
Command Line tools by opening Terminal.app and running:

```
xcode-select --install
```

### Homebrew

[Homebrew](https://brew.sh/) is a package manager for MacOS that provides the
version of Perl and relevant Perl modules that Guiguts needs. To install it,
your user account must have Administrator rights on the computer.

Open Terminal.app and install Homebrew with:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

You will be prompted for your password and walked through the installation.
You can accept the defaults it presents to you.

### Perl & Perl modules

Using Terminal.app, use Homebrew to install Perl and cpanm:

```
brew install perl
brew pin perl
brew install cpanm
```

Close Terminal.app and reopen it to ensure that the brew-installed perl is on
your path. Then install all the necessary [Perl modules](#perl-modules). This
is most easily done by running the helper script:

```
perl install_cpan_modules.pl
```

### XQuartz

[XQuartz](https://www.xquartz.org/) is an X11 windows manager. If you don't
have it installed already, you can either download and install it manually
via the link _or_ install it with Homebrew using:

```
brew cask install xquartz
```

After you install XQuartz, you must **log out and back in** before Guiguts can
use it as the X11 server.

### Starting Guiguts

Start Guiguts with:
```
perl guiguts.pl &
```

### Helper applications

Homebrew provides some additional helper applications you might find useful:

```
brew install aspell
brew install bookloupe
brew install tidy-html5
brew install open-sp
```

See also the [EBookMaker installation instructions](tools/ebookmaker/README.md).

## Other

For other platforms, you will need to install Perl and the necessary
[Perl modules](#perl-modules). Then extract `guiguts-n.n.n.zip` and run
```
perl guiguts.pl
```

## Perl Modules

Guiguts requires the following Perl modules to be installed via CPAN:

* LWP::UserAgent
* Tk
* Tk::ToolBar

The following modules are optional but recommended:

* Text::LevenshteinXS
* File::Which
* Image::Size
* LWP::Protocol::https

The required Perl modules can be installed with the included helper script:
```
perl install_cpan_modules.pl
```

*Or* you can install them individually using `cpanm`. For example:
```
cpanm --notest --install LWP::UserAgent
```