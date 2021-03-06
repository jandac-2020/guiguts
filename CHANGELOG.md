# Changelog

## Version 1.1.1

### Changes
- Variation Selectors Unicode block is now available. These combining
  characters are generally not visible, but are in order VS1 to VS16.
  Hovering over the small squares or spaces where the characters are
  should also show you which is which. 
- Improvements made to Check for Updates dialog

### Bug Fixes
- Bundled CSS validator reported wrong line numbers
- Draw ascii boxes failed when text was rewrapped
- Clicking in an error list window jumped to previous error's line number
- Undo/redo in Page Separator dialog sometimes output error messages
- Poetry in footnotes was enclosed in `<p>` markup during HTML generation
- Save My View in Bookloupe View Options output error messages
- Three or more hyphens at start/end of line not converted to HTML emdashes
- `Save` did not prompt for a filename if file was unnamed and not edited
- Enable/disable Autosave output error messages
- `No count` pages in Roman style gave errors in Configure Page Labels
- Incorrect error message displayed when running Jeebies on file without he/be

## Version 1.1.0

### Improved HTML generation
- poetry HTML generation matches DP Best Practices document
- illustration code generated by Auto Illus Search or Markup Image
   - adds id to the fig div based on the image filename
   - uses CSS classes instead of styles on image divs
   - width of image may be specified in percent or em
   - calculates max width for image to fit portrait or landscape screens
   - restricts max width to image's natural size
   - optional override for percent width to 100% on handheld devices
- `/I...I/` or `/i...i/` markup is used to generate an index
- HTML/CSS for chapter headings works well for ePub formats
- default `<hr>` CSS defines margins to center correctly in ePub
- uses id instead of `<a>` element for anchors where possible
- uses improved CSS for pagenums within bold/italic/sc markup
- autotable uses CSS rather than HTML attributes
- all-small-caps are detected and coded during HTML generation
- HTML title wording puts book title first
- HTML header updated with code for including cover

### Improved Search & Replace functionality
- a Count button (`ctrl+b`) counts how many times the current search
  settings would find a match
- number of replacement terms can be changed by the user
- search & replace preserves the position of page markers
- search & replace histories are now updated by all search, replace
  and count operations

### Better utf-8 support
- bookloupe tool is used as a replacement for gutcheck by default
- HTML generation defaults to keep utf-8 chars and use CSS for blockquote
- files are now treated as utf-8 by default, rather than varying treatment
  depending on contents
  
### Major packaging changes
- instructions are given for installing and use on modern macOS
- uses Strawberry Perl rather than old bundled version
- includes latest version of EBookMaker, runnable from HTML menu
- Jeebies tool is updated to latest version (0.15a - 2009)
- ppvimage tool is updated to match new image size guidance
- local CSS validation tool is updated to validate CSS3 or CSS2.1
- `DPCustomMono2` font replaced with instructions on getting `DP Sans Mono`
- git checkout can be used as a live release (developers/testers)

### Other Changes
- Tony Browne's regex and Greek patches (aka 1.0.28) are included
- new Keyboard Shortcuts are included:
   - `ctrl+o` - open file
   - `ctrl+shift+s` - save as...
   - `ctrl+j` - goto line
   - `ctrl+b` - count number of search/replace matches
   - `ctrl+w` - rewrap selection
   - `ctrl+shift+w` - block rewrap selection
   - `ctrl+m` - indent +1
   - `ctrl+shift+m` - indent -1
   - `ctrl+alt+m` - indent +4
   - `ctrl+alt+shift+m` - indent -4
   - `ctrl+e` instead of `ctrl+o` - flood fill
- highlight quotes now includes curly quotes
- output from external tools such as online ppcomp, pptext, etc., can be
  loaded into error check dialog and used for navigation
- any number of External Operations can be defined
- Goto Line/Page dialogs can be closed with Escape key or close button
- RST/PGTEI support and `EPub friendly` check are removed

### Bug Fixes
- Word Frequency harmonics failed to spot single letter change
- `'.' not in @INC` error from newer versions of Perl
- italic markup across line breaks in poetry
- Word Frequency, Character Count could not search for backslash
- rewrapping changed y-umlaut character to space
- changes to HTML conversion settings lost when dialog dismissed
- inconsistency in menu, shortcuts and documentation with Column Copy/Cut
- close block rewrap failed when not followed by a blank line
- right-clicking in gutcheck error dialog could corrupt error listing
- file permissions now retained on file save
- `[foot` caused footnote code to fail
- adding good words to project dictionary failed under Linux

## Version 1.0.25
- bug fix: newly opened file displays as edited
- bug fix: gutcheck popup background
- bug fix: missing had/bad option in gutcheck
- bug fix: rewrap problems around page markers
- updated urls to sourceforge trackers
- updated default indent values
- bug fix: double `</p>` at `*/#/`
- bug fix: orphan brackets accepts mixed French and German guillemets
- bug fix: no return to GG dir after adding GWL
- default menu layout updated, old layout left as option
- unmaintained wizard menu layout removed
- shortcut keys cleaned up and updated (see Help -> Shortcuts)
- buggy bookmark shortcuts made opt-in and marked beta
- some cmd shortcuts added for mac
- footnote popup layout updated, auto-launch of Check FNs
- better joining of footnotes
- better separation of WF and S&R
- minor update of WF layout and behaviour
- spellcheck popup layout updated (with a pref for the old one)
- spellcheck use project language dictionary
- basic support for enchant (beta)
- better support for LOTE views in GC
- clearer warning when Windows Preview bug locks a file

## Version 1.0.24
- bug fix: auto-run Word Frequency before Stealth Scannos.
- bug fix: better file name suggestion in save as dialog.
- bug fix: tweaking spell check for non-ascii.
- bug fix: fixed a few issues with the new rewrap.

## Version 1.0.23
- bug fix: html page numbers being placed one line too early in poetry
- bug fix: Remove Markup from Selection removing markup not in selection
- updated rewrap algorithm
- updated Fix Page Separators dialog and added 99% auto mode
- updated display of 'edited' marker
- Operations History now stores January as 01, not 00, etc.
- HTML generate image captions as div instead of span, enclose in p
- some tweaking of aspell interaction
- various minor tweaks and cleanup

## Version 1.0.22
- updating ppvimage to 1.06.
- guiguts.bat renamed to run_guiguts.bat
- DP urls user-editable
- bug fix: indenting `/# #/` blocks with more than one paragraph
- bug fix: Link Checker with spaces in path
- bug fix: some issues with reading page markers when opening a file
- bug fix: proofer bar is now working
- bug fix: .bin file getting out of sync (saved too often)
- bug fix: file names with apostrophe making file history explode
- various minor bug fixes and menu cleanups

## Version 1.0.21
- HTML Fixup split in two: HTML Markup and HTML Generator.
- Rewrap margins made consistent.
- Added Txt Conversion popup.
- Centering and right-aligning of txt added.
- Orphaned brackets made less confusing.
- minor cleanup of menus and some popups.
- positionhash added as a supplement to geometryhash.
- Various bug fixes, including:
  - sentence-ending punctuation eaten by footnote markers.
  - $t in extops with no selection.
  - Save As while Page Markers visible.
  - bom is gone.
  - tidy handles unicode better.
  - some html page numbers inserted in a wrong place.
  - undo and redo will move the window to show the edited position.
  - some "undefined subroutine"s fixed.
  - some user settings would be ignored and overwritten by the default.
  - inserting from character popups didn't overwrite selection.

## Version 1.0.20
- Display and set language added to statusbar (+ some adjustments of
  language behaviour, which has been partially available since 1.0.16).
- BOOKLANG included in headerdefault.txt.
- Short footnote anchors option added to html popup.
- Move footnotes to containing para added to footnote popup.
- Added line breaks to improve readability of generated html.
- Added 'replace [::] with incremental counter'.
- Bug fix: escaping of single and double quotes around images in html
  cleaned up.
- Bug fix: External commands containing several commands
  separated by semicolon was broken since 1.0.5. Non-Windows only.

## Version 1.0.19
Fixed highlighting of newly selected wordlist. Fixed
undefined subroutine reference when choosing 'Enable Scanno Highlighting'.
Reset 'edited' flag after "Save As'. Fixed missing `<hr class="chap" />`
before a chapter heading in the middle of a page. Removed duplicate
insertion of footnote landing zone (FOOTNOTE) at end of file. Retained `*`
in word frequency list only if preceded by a hyphen. Set
'edited' flag after generating HTML.

## Version 1.0.18
Fixed removal of too many lines when moving
footnotes to landing zone.

## Version 1.0.17
Fixed error from hitting down arrow twice
after startup. Ignore tags in word frequency popup; ignore
away `*` characters (the way it used to be) except for `-*`
(not the way it used to be). Added spell check in multiple
languages to old menus and PP Wizard (actually done in 1.0.16).
Write setting.rc to guiguts home directory. Fixed problem
changing font sizes. Made check for two words (flash light
vs. flashlight vs. flash-light) optional.

## Version 1.0.16
Made Do All into a button rather than a checkbox.
Radiobuttons for menu structure selection. Fixed undefined
subroutine for Auto Save Interval and fontsize. Made choice of menus
a Radiobutton. Added warning for headers (`<h2>`) with four or more
lines through the invalid tag `<Warning: long header>`. Made
HTML labels and sorting language dependent with plugin files
for English (default) and Danish.

## Version 1.0.15.
In the PP Wizard menu structure, moved pptxt from
Source Check to the Text Version(s) menu. Fixed undefined subroutine
error for hyperlinkpagenumbers. Handled headers of 3 or more lines.
Removed upper case for &amp; in author. Fixed problem with flood fill
popup. Fixed problem with Draw Boxes. Corrected space in replace string
after regex search for `.` lower.

## Version 1.0.14
Added 'Do All (beta)' feature to Page Separator popup that
handles all page separators in one pass, assuming the file has been
proofread and footnotes handled with no extra or missing blank lines.
Possible soft hyphens `-*` are not rejoined. Fixed highlighting of
quotes.

## Version 1.0.13
Fixed Replace All where the search term has a regexp
metacharacter such as '['. Made the "div" and "span" entries on the
HTML Fixup popup sticky. Marked PP Wizard as beta and not
the default menu structure.

## Version 1.0.12
Provided message when current version is up to date, reset
the update clock when a new version is run, and added a "Working" message
while it is checking. Remove extra line before footnote being moved.
Further fix to Search and Replace All undefined subroutine error and
a handful of similar errors.

## Version 1.0.11
Rejoin footnotes no longer leaves an extra new line
where the rejoined footnote used to be. Search and Replace All no
longer produces undefined subroutine error.

## Version 1.0.10
Page markers are centered in Adjust Page Marker dialog with
an option "Do No Center Page Markers". Fixed an error "Undefined subroutine
b2scroll".

## Version 1.0.9
After "Find Next ... Block" screen is centered on what is
found. Size/location of main window and font are sticky again (broken
after 1.0.5).

## Version 1.0.8
In HTML generation, fixed pileup of page numbers at a
thought break (a fix for this in an earlier version was lost). Improved
placement of closing markup for a block of footnotes.

## Version 1.0.7
Poetry converted to HTML has an indent of one em for
every two spaces. Conversion does not assume poetry is already rewrapped
so all lines begin with four spaces. If all lines are indented by four
spaces, then measure indentation relative to the four spaces. If some
lines are not indented by four spaces, measure indentation relative to
the beginning of the line. Check Footnotes popup is clickable to jump
to the footnote; the popup is destroyed if "First Pass" is selected.
Added File, Export to two formats (page separators, or page markup
like `<Pg23>`).

## Version 1.0.6
Fixed problem with scannos highlighting taking forever to
turn on; default scannos file en-common.txt is selected. Handle spaces in
gutcheck path (mentioned in #3434768). In guiguts.bat, put tools\perl
higher on the path than the existing path; fixed path for ENCFONTS used
by the Gnutenberg Press. Made highlighting of scannos sticky. Set default
path for gutcheck and jeebies on non-Windows systems. `<g>gesperrt text</g>`
is converted to `<em class="gesperrt">gesperrt text</em>`. Added second
alternative menu structure for comment. Altered Fixup 'thought break'
response. Updated Greek transliteration of punctuation.

## Version 1.0.5
Introduced a PP Wizard, an alternative menu structure,
that steps PPers through the GG checklist, which is not the default
option. Added a rudimentary check of whether HTML is "Epub friendly".
Changed `<p>` css in headerdefault.txt to work better on mobi devices:
margin-top: .51em; margin-bottom: .49em;. Reorganized the Preference
menu. Fixed bug with Gutcheck hanging on rerun. Added check for whether
the string entered in the RegExp field in the Word Frequency popup is a
valid regular expression. Added PP Process Checklist to Help menu.
Copied headerdefault.txt to header.txt on startup if header.txt does not
exist. Spellcheck no longer double counts occurrences of a word if run a
second time. Tidy Up Footnotes works if there is only one footnote.
Autogenerate HTML no longer uses `/*` or captions as the title. Auto Illus
Search no longer doubles tags in figleft and figright. Import Prep Text
allows letters in png filenames. Additional external operations added.
Search at beginning works again (broken in 1.0.4) but search will not
find the very first text in a file (fixed in 1.0.4). Problem with spaces
in gutcheck and other paths fixed.

## Version 1.0.4
Hyphen check now also checks for "flash light" not only
"flash-light", "flash--light", and "flashlight". A regular expression
search over line breaks now respects the ignore case flag. Fixed path
and extension so EpubMaker will take .html files as input. PPV TXT and
PP HTML labeled more accurately as pptxt and pphtml. Only README.TXT
appears in the prepopulated recently used file list. Search can find the
first word in the file. Word frequency rerun after typing words in empty
file reports now works and bug with unresponsive save as dialog fixed.
Guiguts.bat calls perl in a way that should (may) ignore preexisting
installations of perl.

## Version 1.0.3
Relocated HTML page number outside an open `<span>` eg for a line
of poetry so page numbers align vertically. Auto List on HTML palette no
longer removes spaces before markup in multiline mode. HTML anchors for
chapter headings are no longer empty but surround the chapter title
text. Join Lines removes `*/ /*` `</i>` `<i>` etc. markup only if it matches. Fixed
Undo button on Fix Page Separator popup and added Redo button. Fixed
Find Greek on the Fixup menu to find all [Greek: ] occurrences.
Unicode->beta no longer converts \x{1FA7} and certain other characters
into %{HASH(0x4f10ff8)}. Added beta code for Greek character stigma.
Fixed bug if user tries to highlight scannos using the scannos list in
the scannos directory rather than a word list in the word list
directory.

## Version 1.0.2
Fixed problem in which a regex replace with \G in the
found text led to characters being converted to Greek. Added message to
run final W3C markup validation at validator.w3.org. Improved conversion
of `<` and `>` characters when autogenerating HTML.

## Version 1.0.1
Revamped spell checker including in Word Frequency popup
to handle UTF-8. Fixed "wide character in print" error by running
utf8::encode. Improved regexp to search for orphaned markup per
RoryConnor. Cleared undo cache after HTML autogenerate. Set command to
open browser for non-Windows OS and use it for external operations.
Dictionary search on the external operations menu now passes the
selection as a search argument. Made ASCII Boxes popup resizable.
Removed trailing space on last line of `/# #/` block after rewrap. Respect
preference to leave space after end of line hyphen during rewrap if Join
Lines Keep Hyphen is chosen. Removed period on "Set margins for rewrap."
Changed "Check Errors" box to "Run Checks". Run fixup ignores /X X/ (as
well as `/* */` and `/$ $/`) blocks if the first option is checked. Fixed
ordering of page numbers anchored inside HTML `<h1>` or `<h2>` tags. Add gutcheck
and jeebies directories without the .exe files to the guiguts-n.n.n.zip
file.

## Version 1.0.0
Relative to version 0.2.10, the main changes in version 1.0 are

1. One click installation on Windows and Macintosh/OSX computers with no need
   to install perl separately (see guiguts-win and guiguts-mac zip files)
2. Several major new features, including running all HTML checks with one
   button, side by side viewing of text and images, and support for RST
   and PGTEI
3. Fixes to many long-standing bugs


### Major New Features

All the HTML checks can be run with a  single click, and the output is
clickable in most cases. Second, HTML and CSS  validation can now be done on
your own computer (and PGTEI as well) and there are checks for unused CSS and
image issues (using the pphtml and ppimage scripts). Third, there is now an
option to view text and images side-by-side without having to click on "See
Image" for each page. For instance you move forward or back one page for both
text and image with the "<" and ">" buttons on the status bar. Also, the Auto
Show Images option lets you see the image for instance for the page you are
spellchecking or for each search hit.

### Other New Features

A "View in Browser" and Hyperlink page numbers buttons on the HTML palette,
tearoff of the Unicode menu, listing small caps in the Word Frequency popup,
automatic checking for updates (which can be turned off), horizontal rules as
css, an option if nothing is found to return to the starting point, better
ability to find executables automatically, GutWrench scanno files are
included, a warning to use human readable filenames, option to include
goodwords in spellcheck project dictionary, a text processing menu to ease
conversion of bold/italics/small caps, the label Image #nnn in Configure Page
Labels is clickable, added Find Transliterations and Find Orphaned Markup
(before it only searched for unmatched brackets) to Search menu, Adjust Page
Markers menu is accessible from the File menu. Most popups now remember if
they have been moved or resized. Unless the user has previously set the size
of the main screen, it is maximized (nearly) on the first run. Added to Word
Frequency buttons to check for ligatures and for an arbitrary regular
expression. For developers, there are internal improvements, including partial
refactoring of functionality into perl  modules and a unit testing framework.

### Bug Fixes

Dash or periods in the proofer's name no longer messes up display of proofers
or removal of page separators. Fixed moving of page markers. The default for
word search from the Word Frequency menu is now "Whole Word". Unicode menu is
now broken into two pieces so it does not run off the screen where Mac users
cannot see it. Also, the Unicode popup has a pulldown list to change UTF
blocks. Replace All now replaces all and is a factor of 10 faster (but not for
regexes). Double click in Word Frequency does whole word search by default.
"--" on a line by itself gets converted to an emdash. Fixed regex editor for
scannos, Ctrl-S saves the file. There is a much higher likelihood that this
version generates valid HTML. Page anchors are no longer placed at the end of
the previous paragraph or before the horizontal rule. Fixed
misplacement/overlapping of HTML page numbers, superscripts are converted to
HTML correctly (Philad^a) without curly brackets. Fixed multiple page markers
at a single location so they do not  overlap but stack vertically like `[Pg
32]<br />[Pg 33]`. Fixed problem with  moving mark left (entry for initial page
number was blank) or up (code was  garbled). Fixed bugs with small caps
conversion; replace all with regex and $1 backreferences, stripping markup
from captions in HTML. Changing the pngs path saves the .bin file immediately.
Multi term searching is sticky even after guiguts is closed and reopened.
Search history keeps track of searches more reliably (but still does not
include scanno searches). Tk TextEdit's FindAndReplaceAll native function goes
into an endless loop if the search term is in the replacement term (replace
"C" with "CC". In such cases, guiguts now reverts to the old very slow method.
Fixed missing space before close of img tag. Gutcheck or HTML Autogenerate on
empty window produces a warning. Fixed Export as Prep Text which left the page
headers if the header did not have enough -'s at the end. In PP HTML, fixed
0:1 report for double blanks. Project dictionary not ignored on restart even
if longer than 8 characters. Reversed order of "Title" and "Caption" in HTML
image popup. Word frequency count is run before any spell check. Toolbar font
is no longer italic for readability. Default poetry left rewrap margin set to
4. Fixed case sensitivity of searches from Word Frequency Popup. Made "Stay on
Top"  preference apply to most popups except Word Frequency. Fixed double
click search on Word Frequency popup to work for strings with nonalphanumeric
characters (',-,--) while searching from Character Cnts does not do a whole
word search. Word search from Word Frequency popup works if the word contains
an apostrophe. Allow search from Word Frequency popup for expressions with
regex metacharacters such as `\`. Made default sort order for the word
frequency list sticky. Made choice of poetry left margin sticky. Made all top
level menus tearoff. More revisions to accommodate non-numeric page markers.
Fixed page numbers when pngs begin with a letter such as "a001.png". Leave out
alt and title tags from `<img ...>` if blank.

### Configuring Side-by-Side Viewing of Text and Images

The side by side image viewing works best if the window for the viewer is
sized to match the image (in XnView, choose View, Auto Image Size, Fit Image
to Window) and only one instance of the viewer is allowed to avoid having one
instance for every page viewed (in XnView, choose Tools, Options, General,
Only One Instance; in Irfanview Options -> Properties/Setting -> Start/Exit
Options, or Options -> Properties/Setting -> Misc.1 Check "Only 1 instance of
IrfanView is active). To page through images, use the "<" and ">" buttons on
the status bar. To Auto Show Page Images, use the "Auto Img" button on the
status bar, use the option on the Prefs menu, or checkboxes in the various
search/spellcheck dialogs.
