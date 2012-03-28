package Guiguts::MenuStructure;
use strict;
use warnings;

BEGIN {
	use Exporter();
	our ( @ISA, @EXPORT );
	@ISA = qw(Exporter);
	@EXPORT =
	  qw(&menu_preferences &menu_bookmarks &menu_external &menubuildold &menubuild &menubuildtwo
	  &menurebuild &unicodemenu);
}

sub locateAspellExe {
	my $textwindow = shift;
	my $types;
	if ($::OS_WIN) {
		$types = [ [ 'Executable', [ '.exe', ] ], [ 'All Files', ['*'] ], ];
	} else {
		$types = [ [ 'All Files', ['*'] ] ];
	}
	$::lglobal{pathtemp} =
	  $textwindow->getOpenFile(
								-filetypes => $types,
								-title     => 'Where is the Aspell executable?',
								-initialdir => ::dirname($::globalspellpath)
	  );
	$::globalspellpath = $::lglobal{pathtemp}
	  if $::lglobal{pathtemp};
	return unless $::globalspellpath;
	$::globalspellpath = ::os_normal($::globalspellpath);
	::savesettings();
}

sub menu_preferences {
	my $textwindow = $::textwindow;
	[
	   [
		  Cascade  => 'File ~Paths',
		  -tearoff => 1,
		  -menuitems =>
			[  # FIXME: sub this and generalize for all occurences in menu code.
			  [
				 Button   => 'Locate Aspell Executable',
				 -command => sub { locateAspellExe($textwindow); }
			  ],
			  [
				 Button   => 'Locate Image Viewer Executable',
				 -command => sub { ::setviewerpath($textwindow) }
			  ],
			  [ 'separator', '' ],
			  [
				 Button   => 'Locate Gutcheck Executable',
				 -command => sub {
					 my $types;
					 if ($::OS_WIN) {
						 $types = [
									[ 'Executable', [ '.exe', ] ],
									[ 'All Files',  ['*'] ],
						 ];
					 } else {
						 $types = [ [ 'All Files', ['*'] ] ];
					 }
					 $::lglobal{pathtemp} =
					   $textwindow->getOpenFile(
								  -filetypes => $types,
								  -title => 'Where is the Gutcheck executable?',
								  -initialdir => ::dirname($::gutcommand)
					   );
					 $::gutcommand = $::lglobal{pathtemp}
					   if $::lglobal{pathtemp};
					 return unless $::gutcommand;
					 $::gutcommand = ::os_normal($::gutcommand);
					 ::savesettings();
				   }
			  ],
			  [
				 Button   => 'Locate Jeebies Executable',
				 -command => sub {
					 my $types;
					 if ($::OS_WIN) {
						 $types = [
									[ 'Executable', [ '.exe', ] ],
									[ 'All Files',  ['*'] ],
						 ];
					 } else {
						 $types = [ [ 'All Files', ['*'] ] ];
					 }
					 $::lglobal{pathtemp} =
					   $textwindow->getOpenFile(
								   -filetypes => $types,
								   -title => 'Where is the Jeebies executable?',
								   -initialdir => ::dirname($::jeebiescommand)
					   );
					 $::jeebiescommand = $::lglobal{pathtemp}
					   if $::lglobal{pathtemp};
					 return unless $::jeebiescommand;
					 $::jeebiescommand = ::os_normal($::jeebiescommand);
					 ::savesettings();
				   }
			  ],
			  [
				 Button   => 'Locate Tidy Executable',
				 -command => sub {
					 my $types;
					 if ($::OS_WIN) {
						 $types = [
									[ 'Executable', [ '.exe', ] ],
									[ 'All Files',  ['*'] ],
						 ];
					 } else {
						 $types = [ [ 'All Files', ['*'] ] ];
					 }
					 $::tidycommand =
					   $textwindow->getOpenFile(
									  -filetypes  => $types,
									  -initialdir => ::dirname($::tidycommand),
									  -title => 'Where is the Tidy executable?'
					   );
					 return unless $::tidycommand;
					 $::tidycommand = ::os_normal($::tidycommand);
					 ::savesettings();
				   }
			  ],
			  [
				 Button   => 'Locate W3C Validate (onsgmls) Executable',
				 -command => sub {
					 my $types;
					 if ($::OS_WIN) {
						 $types = [
									[ 'Executable', [ '.exe', ] ],
									[ 'All Files',  ['*'] ],
						 ];
					 } else {
						 $types = [ [ 'All Files', ['*'] ] ];
					 }
					 $::validatecommand =
					   $textwindow->getOpenFile(
						 -filetypes  => $types,
						 -initialdir => ::dirname($::validatecommand),
						 -title =>
'Where is the W3C Validate (onsgmls) executable (must be in tools\W3C)?'
					   );
					 return unless $::validatecommand;
					 $::validatecommand = ::os_normal($::validatecommand);
					 ::savesettings();
				   }
			  ],
			  [
				 Button =>
				   'Locate W3C CSS Validator (css-validator.jar) Executable',
				 -command => sub {
					 my $types;
					 if ($::OS_WIN) {
						 $types = [
									[ 'Executable', [ '.jar', ] ],
									[ 'All Files',  ['*'] ],
						 ];
					 } else {
						 $types = [ [ 'All Files', ['*'] ] ];
					 }
					 $::validatecsscommand =
					   $textwindow->getOpenFile(
						 -filetypes  => $types,
						 -initialdir => ::dirname($::validatecsscommand),
						 -title =>
'Where is the W3C CSS Validator (css-validator.jar) executable?'
					   );
					 return unless $::validatecsscommand;
					 $::validatecsscommand =
					   ::os_normal($::validatecsscommand);
					 ::savesettings();
				   }
			  ],
			  [
				 Button   => 'Locate Gnutenberg Press (if self-installed)',
				 -command => sub {
					 my $types;
					 $types =
					   [ [ 'Perl file', [ '.pl', ] ], [ 'All Files', ['*'] ], ];
					 $::gnutenbergdirectory =
					   $textwindow->getOpenFile(
							   -filetypes  => $types,
							   -initialdir => $::gnutenbergdirectory,
							   -title =>
								 'Where is the Gnutenberg Press (transform.pl)?'
					   );
					 return unless $::gnutenbergdirectory;
					 $::gnutenbergdirectory =
					   ::os_normal($::gnutenbergdirectory);
					 $::gnutenbergdirectory =
					   ::dirname($::gnutenbergdirectory);
					 ::savesettings();
				   }
			  ],
			  [ 'separator', '' ],
			  [
				 Button   => 'Set Images Directory',
				 -command => \&::setpngspath
			  ],
			]
	   ],
	   [
		  Cascade  => 'Appearance',
		  -tearoff => 0,
		  -menuitems =>
			[  # FIXME: sub this and generalize for all occurences in menu code.
			  [ Button => '~Font...', -command => \&::fontsize ],
			  [
				 Checkbutton => 'Keep Pop-ups On Top',
				 -variable   => \$::stayontop,
				 -onvalue    => 1,
				 -offvalue   => 0
			  ],
			  [
				 Checkbutton => 'Keep Word Frequency Pop-up On Top',
				 -variable   => \$::wfstayontop,
				 -onvalue    => 1,
				 -offvalue   => 0
			  ],
			  [
				 Checkbutton => 'Enable Bell',
				 -variable   => \$::nobell,
				 -onvalue    => 0,
				 -offvalue   => 1
			  ],
			  [
				 Checkbutton => 'Do Not Center Page Markers',
				 -variable   => \$::donotcenterpagemarkers,
				 -onvalue    => 1,
				 -offvalue   => 0
			  ],
			  [
				 Button   => 'Set Background Color...',
				 -command => sub {
					 my $thiscolor = ::setcolor($::bkgcolor);
					 $::bkgcolor = $thiscolor if $thiscolor;
					 ::savesettings();
				   }
			  ],
			  [
				 Button   => 'Set Button Highlight Color...',
				 -command => sub {
					 my $thiscolor = ::setcolor($::activecolor);
					 $::activecolor = $thiscolor if $thiscolor;
					 $::OS_WIN
					   ? $::lglobal{checkcolor} = 'white'
					   : $::lglobal{checkcolor} = $::activecolor;
					 ::savesettings();
				   }
			  ],
			  [
				 Button   => 'Set Scanno Highlight Color...',
				 -command => sub {
					 my $thiscolor = ::setcolor($::highlightcolor);
					 $::highlightcolor = $thiscolor if $thiscolor;
					 $textwindow->tagConfigure( 'scannos',
											 -background => $::highlightcolor );
					 ::savesettings();
				   }
			  ],
			  [
				 Checkbutton => 'Auto Show Page Images',
				 -variable   => \$::auto_show_images,
				 -onvalue    => 1,
				 -offvalue   => 0
			  ],
			  [ 'separator', '' ],
			  [
				 Checkbutton => 'Enable Quotes Highlighting',
				 -variable   => \$::nohighlights,
				 -onvalue    => 1,
				 -offvalue   => 0
			  ],
			  [
				 Checkbutton => 'Enable Scanno Highlighting',
				 -variable   => \$::scannos_highlighted,
				 -onvalue    => 1,
				 -offvalue   => 0,
				 -command    => \&highlight_scannos
			  ],
			  [
				 Checkbutton => 'Leave Bookmarks Highlighted',
				 -variable   => \$::bkmkhl,
				 -onvalue    => 1,
				 -offvalue   => 0
			  ],
			]
	   ],
	   [
		  Cascade  => 'Menu structure',
		  -tearoff => 0,
		  -menuitems =>
			[  # FIXME: sub this and generalize for all occurences in menu code.
			  [
				 Checkbutton => 'Old Menu Structure',
				 -variable   => \$::useoldmenus,
				 -onvalue    => 1,
				 -offvalue   => 0,
				 -command    => sub {
				 	$::useppwizardmenus = 0;
					$::usemenutwo = 0;
					::menurebuild();
				   }
			  ],
			  [
				 Checkbutton => 'PP Wizard Menu Structure (beta)',
				 -variable   => \$::useppwizardmenus,
				 -onvalue    => 1,
				 -offvalue   => 0,
				 -command    => sub {
					$::usemenutwo = 0;
				 	$::useoldmenus = 0;
					::menurebuild();
				   }
			  ],
			  [
				 Checkbutton => 'New menu structure',
				 -variable   => \$::usemenutwo,
				 -onvalue    => 1,
				 -offvalue   => 0,
				 -command    => sub {
					 $::useppwizardmenus = 0;
					 ::menurebuild();
				   }
			  ],
			]
	   ],
	   [
		  Cascade    => 'Toolbar',
		  -tearoff   => 1,
		  -menuitems => [
			  [
				 Checkbutton => 'Enable Toolbar',
				 -variable   => \$::notoolbar,
				 -command    => [ \&::toolbar_toggle ],
				 -onvalue    => 0,
				 -offvalue   => 1
			  ],
			  [
				 Radiobutton => 'Toolbar on Top',
				 -variable   => \$::toolside,
				 -command    => sub {
					 $::lglobal{toptool}->destroy
					   if $::lglobal{toptool};
					 undef $::lglobal{toptool};
					 ::toolbar_toggle();
				 },
				 -value => 'top'
			  ],
			  [
				 Radiobutton => 'Toolbar on Bottom',
				 -variable   => \$::toolside,
				 -command    => sub {
					 $::lglobal{toptool}->destroy
					   if $::lglobal{toptool};
					 undef $::lglobal{toptool};
					 ::toolbar_toggle();
				 },
				 -value => 'bottom'
			  ],
			  [
				 Radiobutton => 'Toolbar on Left',
				 -variable   => \$::toolside,
				 -command    => sub {
					 $::lglobal{toptool}->destroy
					   if $::lglobal{toptool};
					 undef $::lglobal{toptool};
					 ::toolbar_toggle();
				 },
				 -value => 'left'
			  ],
			  [
				 Radiobutton => 'Toolbar on Right',
				 -variable   => \$::toolside,
				 -command    => sub {
					 $::lglobal{toptool}->destroy
					   if $::lglobal{toptool};
					 undef $::lglobal{toptool};
					 ::toolbar_toggle();
				 },
				 -value => 'right'
			  ],
		  ],
	   ],
	   [
		  Cascade  => 'Backup',
		  -tearoff => 0,
		  -menuitems =>
			[  # FIXME: sub this and generalize for all occurences in menu code.
			  [
				 Checkbutton => 'Enable Auto Save',
				 -variable   => \$::autosave,
				 -command    => sub {
					 ::toggle_autosave();
					 ::savesettings();
				   }
			  ],
			  [
				 Button   => 'Auto Save Interval...',
				 -command => sub {
					 ::saveinterval();
					 ::savesettings();
					 ::set_autosave() if $::autosave;
				   }
			  ],
			  [
				 Checkbutton => 'Enable Auto Backups',
				 -variable   => \$::autobackup,
				 -onvalue    => 1,
				 -offvalue   => 0
			  ]
			]
	   ],
	   [
		  Cascade  => 'Processing',
		  -tearoff => 0,
		  -menuitems =>
			[  # FIXME: sub this and generalize for all occurences in menu code.
			  [
				 Checkbutton => 'Auto Set Page Markers On File Open',
				 -variable   => \$::auto_page_marks,
				 -onvalue    => 1,
				 -offvalue   => 0
			  ],
			  [
				 Checkbutton => 'Do W3C Validation Remotely',
				 -variable   => \$::w3cremote,
				 -onvalue    => 1,
				 -offvalue   => 0
			  ],
			  [
				 Checkbutton =>
				   'Leave Space After End-Of-Line Hyphens During Rewrap',
				 -variable => \$::rwhyphenspace,
				 -onvalue  => 1,
				 -offvalue => 0
			  ],
			  [
				 Checkbutton => 'Filter Word Freqs Intelligently',
				 -variable   => \$::intelligentWF,
				 -onvalue    => 1,
				 -offvalue   => 0
			  ],
			  [
				 Checkbutton => 'Return After Failed Search',
				 -variable   => \$::failedsearch,
				 -onvalue    => 1,
				 -offvalue   => 0
			  ],
			  [ 'separator', '' ],
			  [
				 Button   => 'Spellcheck Dictionary Select...',
				 -command => sub { ::spelloptions() }
			  ],
			  [
				 Button   => 'Search History Size...',
				 -command => sub {
					 ::searchsize();
					 ::savesettings();
				   }
			  ],
			  [
				 Button   => 'Set Rewrap ~Margins...',
				 -command => \&::setmargins
			  ],
			  [ 'separator', '' ],
			  [
				 Button   => 'Browser Start Command...',
				 -command => \&::setbrowser
			  ],
			]
	   ]
	];
}

sub menu_bookmarks {
	[
	   map ( [
				Button       => "Set Bookmark $_",
				-command     => [ \&::setbookmark, "$_" ],
				-accelerator => "Ctrl+Shift+$_"
			 ],
			 ( 1 .. 5 ) ),
	   [ 'separator', '' ],
	   map ( [
				Button       => "Go To Bookmark $_",
				-command     => [ \&::gotobookmark, "$_" ],
				-accelerator => "Ctrl+$_"
			 ],
			 ( 1 .. 5 ) ),
	];
}

sub menu_external {
	[
	   [
		  Button   => 'Setup External Operations...',
		  -command => \&::externalpopup
	   ],
	   [ 'separator', '' ],
	   map ( [
				Button   => "~$_ $::extops[$_]{label}",
				-command => [ \&::xtops, $_ ]
			 ],
			 ( 0 .. 9 ) ),
	];
}

sub menubuildold {
	my $textwindow = $::textwindow;
	my $top        = $::top;
	my $file = $::menubar->cascade(
		-label     => '~File',
		-tearoff   => 1,
		-menuitems => [
			[
			   'command', '~Open',
			   -command => sub { ::file_open($textwindow) }
			],
			[ 'separator', '' ],
			map ( [
					Button   => "$::recentfile[$_]",
					-command => [ \&::openfile, $::recentfile[$_] ]
				  ],
				  ( 0 .. scalar(@::recentfile) - 1 ) ),
			[ 'separator', '' ],
			[
			   'command',
			   '~Save',
			   -accelerator => 'Ctrl+s',
			   -command     => \&::savefile
			],
			[
			   'command', 'Save ~As',
			   -command => sub { ::file_saveas($textwindow) }
			],
			[
			   'command',
			   '~Include File',
			   -command => sub {
				   ::file_include($textwindow);
				 }
			],
			[
			   'command', '~Close',
			   -command => sub { ::file_close($textwindow) }
			],
			[ 'separator', '' ],
			[
			   Cascade    => '~Export',
			   -tearoff   => 0,
			   -menuitems => [
							   [
								  'command',
								  'Export As Prep Text Files',
								  -command => sub { ::file_export_preptext('separatefiles') }
							   ],
							   [
								  'command',
								  'Export with Page Separators',
								  -command => sub { ::file_export_preptext('onefile') }
							   ],
							   [
								  'command',
								  'Export with Page Markup',
								  -command => sub { ::file_export_pagemarkup(); }
							   ],
			   ]
			],
			[
			   Cascade    => 'Im~port',
			   -tearoff   => 0,
			   -menuitems => [
			[
			   'command',
			   'Import Prep Text Files',
			   -command => sub { ::file_import_preptext( $textwindow, $top ) }
			],
							   [
								  'command',
								  'Import with Page Markup',
								  -command => sub { ::file_import_markup(); }
							   ],
			   ]
			],
			[ 'separator', '' ],
			[
			   'command',
			   '~Guess Page Markers...',
			   -command => \&::file_guess_page_marks
			],
			[
			   'command',
			   'Set Page ~Markers...',
			   -command => \&::file_mark_pages
			],
			[ 'command', '~Adjust Page Markers', -command => \&::viewpagenums ],
			[ 'separator', '' ],
			[ 'command', 'E~xit', -command => \&::_exit ],
		]
	);
	my $edit = $::menubar->cascade(
		-label     => '~Edit',
		-tearoff   => 1,
		-menuitems => [
			[
			   'command', 'Undo',
			   -command     => sub { $textwindow->undo },
			   -accelerator => 'Ctrl+z'
			],
			[
			   'command', 'Redo',
			   -command     => sub { $textwindow->redo },
			   -accelerator => 'Ctrl+y'
			],
			[ 'separator', '' ],
			[
			   'command', 'Cut',
			   -command     => sub { ::cut() },
			   -accelerator => 'Ctrl+x'
			],
			[ 'separator', '' ],
			[
			   'command', 'Copy',
			   -command     => sub { ::textcopy() },
			   -accelerator => 'Ctrl+c'
			],
			[
			   'command', 'Paste',
			   -command     => sub { ::paste() },
			   -accelerator => 'Ctrl+v'
			],
			[
			   'command',
			   'Col Paste',
			   -command => sub {    # FIXME: sub edit_column_paste
				   $textwindow->addGlobStart;
				   $textwindow->clipboardColumnPaste;
				   $textwindow->addGlobEnd;
			   },
			   -accelerator => 'Ctrl+`'
			],
			[ 'separator', '' ],
			[
			   'command',
			   'Select All',
			   -command => sub {
				   $textwindow->selectAll;
			   },
			   -accelerator => 'Ctrl+/'
			],
			[
			   'command',
			   'Unselect All',
			   -command => sub {
				   $textwindow->unselectAll;
			   },
			   -accelerator => 'Ctrl+\\'
			],
		]
	);
	my $search = $::menubar->cascade(
		-label     => 'Search & ~Replace',
		-tearoff   => 1,
		-menuitems => [
			[ 'command', 'Search & ~Replace...', -command => \&::searchpopup ],
			[ 'command', '~Stealth Scannos...', -command => \&::stealthscanno ],
			[ 'command', 'Spell ~Check...',     -command => \&::spellchecker ],
			[
			   'command',
			   'Goto ~Line...',
			   -command => sub {
				   ::gotoline();
				   ::update_indicators();
				 }
			],
			[
			   'command',
			   'Goto ~Page...',
			   -command => sub {
				   ::gotopage();
				   ::update_indicators();
				 }
			],
			[
			   'command', '~Which Line?',
			   -command => sub { $textwindow->WhatLineNumberPopUp }
			],
			[ 'separator', '' ],
			[
			   'command',
			   'Find next /*..*/ block',
			   -command => [ \&::nextblock, 'default', 'forward' ]
			],
			[
			   'command',
			   'Find previous /*..*/ block',
			   -command => [ \&::nextblock, 'default', 'reverse' ]
			],
			[
			   'command',
			   'Find next /#..#/ block',
			   -command => [ \&::nextblock, 'block', 'forward' ]
			],
			[
			   'command',
			   'Find previous /#..#/ block',
			   -command => [ \&::nextblock, 'block', 'reverse' ]
			],
			[
			   'command',
			   'Find next /$..$/ block',
			   -command => [ \&::nextblock, 'stet', 'forward' ]
			],
			[
			   'command',
			   'Find previous /$..$/ block',
			   -command => [ \&::nextblock, 'stet', 'reverse' ]
			],
			[
			   'command',
			   'Find next /p..p/ block',
			   -command => [ \&::nextblock, 'poetry', 'forward' ]
			],
			[
			   'command',
			   'Find previous /p..p/ block',
			   -command => [ \&::nextblock, 'poetry', 'reverse' ]
			],
			[
			   'command',
			   'Find next indented block',
			   -command => [ \&::nextblock, 'indent', 'forward' ]
			],
			[
			   'command',
			   'Find previous indented block',
			   -command => [ \&::nextblock, 'indent', 'reverse' ]
			],
			[ 'separator', '' ],
			[
			   'command',
			   'Find ~Orphaned Brackets...',
			   -command => \&::orphanedbrackets
			],
			[
			   'command',
			   'Find Orphaned Markup...',
			   -command => \&::orphanedmarkup
			],
			[
			   'command',
			   'Find Proofer Comments',
			   -command => \&::find_proofer_comment
			],
			[
			   'command',
			   'Find Asterisks w/o slash',
			   -command => \&::find_asterisks
			],
			[
			   'command',
			   'Find Transliterations...',
			   -command => \&::find_transliterations
			],
			[ 'separator', '' ],
			[
			   'command', 'Highlight double quotes in selection',
			   -command     => [ \&::hilite, '"' ],
			   -accelerator => 'Ctrl+Shift+"'
			],
			[
			   'command', 'Highlight single quotes in selection',
			   -command     => [ \&::hilite, '\'' ],
			   -accelerator => 'Ctrl+\''
			],
			[
			   'command', 'Highlight arbitrary characters in selection...',
			   -command     => \&::hilitepopup,
			   -accelerator => 'Ctrl+Alt+h'
			],
			[
			   'command',
			   'Remove Highlights',
			   -command => sub {    # FIXME: sub search_rm_hilites
				   $textwindow->tagRemove( 'highlight', '1.0', 'end' );
				   $textwindow->tagRemove( 'quotemark', '1.0', 'end' );
			   },
			   -accelerator => 'Ctrl+0'
			],
		]
	);
	my $bookmarks = $::menubar->cascade(
										 -label     => '~Bookmarks',
										 -tearoff   => 1,
										 -menuitems => &::menu_bookmarks,
	);
	my $selection = $::menubar->cascade(
		-label     => '~Selection',
		-tearoff   => 1,
		-menuitems => [
			[
			   Button   => '~lowercase Selection',
			   -command => sub {
				   ::case( $textwindow, 'lc' );
				 }
			],
			[
			   Button   => '~Sentence case Selection',
			   -command => sub { ::case( $textwindow, 'sc' ); }
			],
			[
			   Button   => '~Title Case Selection',
			   -command => sub { ::case( $textwindow, 'tc' ); }
			],
			[
			   Button   => '~UPPERCASE Selection',
			   -command => sub { ::case( $textwindow, 'uc' ); }
			],
			[ 'separator', '' ],
			[
			   Button   => 'Surround Selection With...',
			   -command => sub {
				   if ( defined( $::lglobal{surpop} ) ) {
					   $::lglobal{surpop}->deiconify;
					   $::lglobal{surpop}->raise;
					   $::lglobal{surpop}->focus;
				   } else {
					   $::lglobal{surpop} = $top->Toplevel;
					   $::lglobal{surpop}->title('Surround text with:');
					   my $f =
						 $::lglobal{surpop}
						 ->Frame->pack( -side => 'top', -anchor => 'n' );
					   $f->Label( -text =>
"Surround the selection with?\n\\n will be replaced with a newline.",
						 )->pack(
								  -side   => 'top',
								  -pady   => 5,
								  -padx   => 2,
								  -anchor => 'n'
						 );
					   my $f1 =
						 $::lglobal{surpop}
						 ->Frame->pack( -side => 'top', -anchor => 'n' );
					   my $surstrt =
						 $f1->Entry(
									 -width      => 8,
									 -background => $::bkgcolor,
									 -font       => $::lglobal{font},
									 -relief     => 'sunken',
						 )->pack(
								  -side   => 'left',
								  -pady   => 5,
								  -padx   => 2,
								  -anchor => 'n'
						 );
					   my $surend =
						 $f1->Entry(
									 -width      => 8,
									 -background => $::bkgcolor,
									 -font       => $::lglobal{font},
									 -relief     => 'sunken',
						 )->pack(
								  -side   => 'left',
								  -pady   => 5,
								  -padx   => 2,
								  -anchor => 'n'
						 );
					   my $f2 =
						 $::lglobal{surpop}
						 ->Frame->pack( -side => 'top', -anchor => 'n' );
					   my $gobut = $f2->Button(
						   -activebackground => $::activecolor,
						   -command          => sub {
							   ::surroundit( $surstrt->get, $surend->get,
											  $textwindow );
						   },
						   -text  => 'OK',
						   -width => 16
						 )->pack(
								  -side   => 'top',
								  -pady   => 5,
								  -padx   => 2,
								  -anchor => 'n'
						 );
					   $::lglobal{surpop}->protocol(
						   'WM_DELETE_WINDOW' => sub {
							   $::lglobal{surpop}->destroy;
							   undef $::lglobal{surpop};
						   }
					   );
					   $surstrt->insert( 'end', '_' ) unless ( $surstrt->get );
					   $surend->insert( 'end', '_' ) unless ( $surend->get );
					   $::lglobal{surpop}->Icon( -image => $::icon );
				   }
				 }
			],
			[
			   Button   => 'Flood Fill Selection With...',
			   -command => sub {
				   $textwindow->addGlobStart;
				   $::lglobal{floodpop} =
					 ::flood();
				   $textwindow->addGlobEnd;
				 }
			],
			[ 'separator', '' ],
			[
			   Button   => 'Indent Selection 1',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::indent( $textwindow, 'in' );
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => 'Indent Selection -1',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::indent( $textwindow, 'out', $::operationinterrupt );
				   $textwindow->addGlobEnd;
				 }
			],
			[ 'separator', '' ],
			[
			   Button   => '~Rewrap Selection',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::selectrewrap( $textwindow, $::lglobal{seepagenums},
									$::scannos_highlighted, $::rwhyphenspace );
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => '~Block Rewrap Selection',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::blockrewrap();
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => 'Interrupt Rewrap',
			   -command => sub { $::operationinterrupt = 1 }
			],
			[ 'separator', '' ],
			[ Button => 'ASCII ~Boxes...', -command => \&::asciipopup ],
			[
			   Button   => '~Align text on string...',
			   -command => \&::alignpopup
			],
			[ 'separator', '' ],
			[
			   Button   => 'Convert To Named/Numeric Entities',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::tonamed($textwindow);
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => 'Convert From Named/Numeric Entities',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::fromnamed($textwindow);
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => 'Convert Fractions',
			   -command => sub {
				   my @ranges = $textwindow->tagRanges('sel');
				   $textwindow->addGlobStart;
				   if (@ranges) {
					   while (@ranges) {
						   my $end   = pop @ranges;
						   my $start = pop @ranges;
						   ::fracconv( $textwindow, $start, $end );
					   }
				   } else {
					   ::fracconv( $textwindow, '1.0', 'end' );
				   }
				   $textwindow->addGlobEnd;
				 }
			],
		]
	);
	my $fixup = $::menubar->cascade(
		-label     => 'Fi~xup',
		-tearoff   => 1,
		-menuitems => [
			[
			   Button   => 'Run ~Word Frequency Routine...',
			   -command => sub {
				   ::wordfrequency();
				 }
			],
			[ 'separator', '' ],
			[ Button => 'Run ~Gutcheck...',    -command => \&::gutcheck ],
			[ Button => 'Gutcheck options...', -command => \&::gutopts ],
			[ Button => 'Run ~Jeebies...',     -command => \&::jeebiespop_up ],
			[
			   Button   => 'pptxt...',
			   -command => sub {
				   ::errorcheckpop_up( $textwindow, $top, 'pptxt' );
				   unlink 'null' if ( -e 'null' );
			   },
			],
			[ 'separator', '' ],
			[
			   Button   => 'Remove End-of-line Spaces',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::endofline();
				   $textwindow->addGlobEnd;
				 }
			],
			[ Button => 'Run Fi~xup...', -command => \&::fixpopup ],
			[ 'separator', '' ],
			[
			   Button   => 'Fix ~Page Separators...',
			   -command => \&::separatorpopup
			],
			[
			   Button   => 'Remove Blank Lines Before Page Separators',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::delblanklines();
				   $textwindow->addGlobEnd;
				 }
			],
			[ 'separator', '' ],
			[ Button => '~Footnote Fixup...', -command => \&::footnotepop ],
			[
			   Button   => '~HTML Fixup...',
			   -command => sub { ::htmlpopup( $textwindow, $top ) }
			],
			[ Button => '~Sidenote Fixup...', -command => \&::sidenotes ],
			[
			   Button   => 'Reformat Poetry ~Line Numbers',
			   -command => \&::poetrynumbers
			],
			[
			   Button   => 'Convert Windows CP 1252 characters to Unicode',
			   -command => \&::cp1252toUni
			],
			[
			   Button   => 'HTML Auto ~Index (List)',
			   -command => sub { ::autoindex($textwindow) }
			],
			[
			   Cascade    => 'PGTEI Tools',
			   -tearoff   => 0,
			   -menuitems => [
				   [
					  Button   => 'W3C Validate PGTEI',
					  -command => sub {
						  ::errorcheckpop_up( $textwindow, $top,
											   'W3C Validate' );
						}
				   ],
				   [
					  Button   => 'Gnutenberg Press (HTML only)',
					  -command => sub { ::gnutenberg('html') }
				   ],
				   [
					  Button   => 'Gnutenberg Press (Text only)',
					  -command => sub { ::gnutenberg('txt') }
				   ],
				   [
					  Button   => 'Gnutenberg Press Online',
					  -command => sub {
						  ::runner(
								$::globalbrowserstart,
								"http://pgtei.pglaf.org/marcello/0.4/tei-online"
						  );
						}
				   ],
			   ]
			],
			[
			   Cascade    => 'RST Tools',
			   -tearoff   => 0,
			   -menuitems => [
				   [
					  Button   => 'EpubMaker Online',
					  -command => sub {
						  ::runner( $::globalbrowserstart,
									"http://epubmaker.pglaf.org/" );
						}
				   ],
				   [
					  Button   => 'EpubMaker (all formats)',
					  -command => sub { ::epubmaker() }
				   ],
				   [
					  Button   => 'EpubMaker (HTML only)',
					  -command => sub { ::epubmaker('html') }
				   ],
				   [
					  Button   => 'dp2rst Conversion',
					  -command => sub {
						  ::runner( $::globalbrowserstart,
									 "http://www.pgdp.net/wiki/Dp2rst" );
						}
				   ],
			   ]
			],
			[ 'separator', '' ],
			[
			   Button   => 'ASCII Table Special Effects...',
			   -command => \&::tablefx
			],
			[ 'separator', '' ],
			[
			   Button   => 'Clean Up Rewrap ~Markers',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::cleanup();
				   $textwindow->addGlobEnd;
				 }
			],
			[ 'separator', '' ],
			[ Button => 'Find Greek...', -command => \&::findandextractgreek ]
		]
	);
	my $text = $::menubar->cascade(
		-label     => 'Text Processing',
		-tearoff   => 1,
		-menuitems => [
			[
			   Button   => "Convert Italics",
			   -command => sub {
				   ::text_convert_italic( $textwindow, $::italic_char );
				 }
			],
			[
			   Button => "Convert Bold",
			   -command =>
				 sub { ::text_convert_bold( $textwindow, $::bold_char ) }
			],
			[
			   Button   => 'Convert <tb> to asterisk break',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::text_convert_tb($textwindow);
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => 'All of the above',
			   -command => sub {
				   ::text_convert_italic( $textwindow, $::italic_char );
				   ::text_convert_bold( $textwindow, $::bold_char );
				   $textwindow->addGlobStart;
				   ::text_convert_tb($textwindow);
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => '~Add a Thought Break',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::text_thought_break($textwindow);
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => 'Small caps to all caps',
			   -command => \&::text_convert_smallcaps
			],
			[
			   Button   => 'Remove small caps markup',
			   -command => \&::text_remove_smallcaps_markup
			],
			[
			   Button   => "Options...",
			   -command => sub { ::text_convert_options($top) }
			],
		]
	);
	my $external = $::menubar->cascade(
										-label     => 'External',
										-tearoff   => 1,
										-menuitems => &::menu_external,
	);
	::unicodemenu();
	$::menubar->Cascade(
						 -label     => '~Preferences',
						 -tearoff   => 1,
						 -menuitems => menu_preferences
	);
	$::menubar->Cascade(
		-label     => '~Help',
		-tearoff   => 1,
		-menuitems => [
			[ Button => '~About', -command => sub { ::about_pop_up($top) } ],
			[ Button => '~Versions', -command => [ \&::showversion ] ],
			[
			   Button   => '~Manual',
			   -command => sub {        # FIXME: sub this out.
				   ::runner( $::globalbrowserstart,
							  "http://www.pgdp.net/wiki/PPTools/Guiguts" );
				 }
			],

			# FIXME: Disable update check until it works
			[
			   Button   => 'Check For ~Updates',
			   -command => sub { ::checkforupdates(0) }
			],
			[ Button => '~Hot keys',              -command => \&::hotkeyshelp ],
			[ Button => '~Operations History',      -command => \&::opspop_up ],
			[ Button => '~Greek Transliteration', -command => \&::greekpopup ],
			[ Button => '~Latin 1 Chart',         -command => \&::latinpopup ],
			[ Button => '~Regex Quick Reference', -command => \&::regexref ],
			[ Button => '~UTF Character entry',   -command => \&::utford ],
			[ Button => '~UTF Character Search',  -command => \&::uchar ],
		]
	);
}

sub menubuild {
	my $menubar    = $::menubar;
	my $textwindow = $::textwindow;
	my $top        = $::top;
	unless ( $::useppwizardmenus or $::usemenutwo ) {
		::menubuildold();
		return;
	}
	if ($::usemenutwo) {
		menubuildtwo();
		return;
	}
	my $file = $menubar->cascade(
		-label     => '~File',
		-tearoff   => 1,
		-menuitems => [
			[
			   'command', '~Open',
			   -command => sub { ::file_open($textwindow) }
			],
			[ 'separator', '' ],
			map ( [
					Button   => "$::recentfile[$_]",
					-command => [ \&::openfile, $::recentfile[$_] ]
				  ],
				  ( 0 .. scalar(@::recentfile) - 1 ) ),
			[ 'separator', '' ],
			[
			   'command',
			   '~Save',
			   -accelerator => 'Ctrl+s',
			   -command     => \&::savefile
			],
			[
			   'command', 'Save ~As',
			   -command => sub { ::file_saveas($textwindow) }
			],
			[
			   'command',
			   '~Include File',
			   -command => sub { ::file_include($textwindow) }
			],
			[
			   Cascade    => '~Export',
			   -tearoff   => 0,
			   -menuitems => [
							   [
								  'command',
								  'Export As Prep Text Files',
								  -command => sub { ::file_export_preptext('separatefiles') }
							   ],
							   [
								  'command',
								  'Export with Page Separators',
								  -command => sub { ::file_export_preptext('onefile') }
							   ],
							   [
								  'command',
								  'Export with Page Markup',
								  -command => sub { ::file_export_pagemarkup(); }
							   ],
			   ]
			],
			[
			   Cascade    => 'Im~port',
			   -tearoff   => 0,
			   -menuitems => [
			[
			   'command',
			   'Import Prep Text Files',
			   -command => sub { ::file_import_preptext( $textwindow, $top ) }
			],
							   [
								  'command',
								  'Import with Page Markup',
								  -command => sub { ::file_import_markup(); }
							   ],
			   ]
			],
			[ 'separator', '' ],
			[
			   'command', '~Close',
			   -command => sub { ::file_close($textwindow) }
			],
			[ 'command', 'E~xit', -command => \&::_exit ],
		]
	);
	my $edit = $menubar->cascade(
		-label     => '~Edit',
		-tearoff   => 1,
		-menuitems => [
			[ 'command', 'Search & ~Replace...', -command => \&::searchpopup ],
			[
			   'command', 'Cut',
			   -command     => sub { ::cut() },
			   -accelerator => 'Ctrl+x'
			],
			[
			   'command', 'Copy',
			   -command     => sub { ::textcopy() },
			   -accelerator => 'Ctrl+c'
			],
			[
			   'command', 'Paste',
			   -command     => sub { ::paste() },
			   -accelerator => 'Ctrl+v'
			],
			[
			   'command',
			   'Col Paste',
			   -command => sub {    # FIXME: sub edit_column_paste
				   $textwindow->addGlobStart;
				   $textwindow->clipboardColumnPaste;
				   $textwindow->addGlobEnd;
			   },
			   -accelerator => 'Ctrl+`'
			],
			[
			   'command',
			   'Undo',
			   -command => sub {
				   $textwindow->undo;
			   },
			   -accelerator => 'Ctrl+z'
			],
			[
			   'command',
			   'Redo',
			   -command => sub {
				   $textwindow->redo;
			   },
			   -accelerator => 'Ctrl+y'
			],
			[ 'separator', '' ],
			[
			   'command',
			   'Select All',
			   -command => sub {
				   $textwindow->selectAll;
			   },
			   -accelerator => 'Ctrl+/'
			],
			[
			   'command',
			   'Unselect All',
			   -command => sub {
				   $textwindow->unselectAll;
			   },
			   -accelerator => 'Ctrl+\\'
			],
			[
			   'command',
			   'Goto ~Line...',
			   -command => sub {
				   ::gotoline();
				   ::update_indicators();
				 }
			],
			[
			   'command',
			   'Goto ~Page...',
			   -command => sub {
				   ::gotopage();
				   ::update_indicators();
				 }
			],
			[
			   'command', '~Which Line?',
			   -command => sub { $textwindow->WhatLineNumberPopUp }
			],
		]
	);
	my $selection = $menubar->cascade(
		-label     => '~Tools',
		-tearoff   => 1,
		-menuitems => [
			[
			   Button   => '~lowercase Selection',
			   -command => sub {
				   ::case( $textwindow, 'lc' );
				 }
			],
			[
			   Button   => '~Sentence case Selection',
			   -command => sub { ::case( $textwindow, 'sc' ); }
			],
			[
			   Button   => '~Title Case Selection',
			   -command => sub { ::case( $textwindow, 'tc' ); }
			],
			[
			   Button   => '~UPPERCASE Selection',
			   -command => sub { ::case( $textwindow, 'uc' ); }
			],
			[ 'separator', '' ],
			[
			   Button   => 'Surround Selection With...',
			   -command => sub {
				   if ( defined( $::lglobal{surpop} ) ) {
					   $::lglobal{surpop}->deiconify;
					   $::lglobal{surpop}->raise;
					   $::lglobal{surpop}->focus;
				   } else {
					   $::lglobal{surpop} = $top->Toplevel;
					   $::lglobal{surpop}->title('Surround text with:');
					   my $f =
						 $::lglobal{surpop}
						 ->Frame->pack( -side => 'top', -anchor => 'n' );
					   $f->Label( -text =>
"Surround the selection with?\n\\n will be replaced with a newline.",
						 )->pack(
								  -side   => 'top',
								  -pady   => 5,
								  -padx   => 2,
								  -anchor => 'n'
						 );
					   my $f1 =
						 $::lglobal{surpop}
						 ->Frame->pack( -side => 'top', -anchor => 'n' );
					   my $surstrt =
						 $f1->Entry(
									 -width      => 8,
									 -background => $::bkgcolor,
									 -font       => $::lglobal{font},
									 -relief     => 'sunken',
						 )->pack(
								  -side   => 'left',
								  -pady   => 5,
								  -padx   => 2,
								  -anchor => 'n'
						 );
					   my $surend =
						 $f1->Entry(
									 -width      => 8,
									 -background => $::bkgcolor,
									 -font       => $::lglobal{font},
									 -relief     => 'sunken',
						 )->pack(
								  -side   => 'left',
								  -pady   => 5,
								  -padx   => 2,
								  -anchor => 'n'
						 );
					   my $f2 =
						 $::lglobal{surpop}
						 ->Frame->pack( -side => 'top', -anchor => 'n' );
					   my $gobut = $f2->Button(
						   -activebackground => $::activecolor,
						   -command          => sub {
							   ::surroundit( $surstrt->get, $surend->get,
											  $textwindow );
						   },
						   -text  => 'OK',
						   -width => 16
						 )->pack(
								  -side   => 'top',
								  -pady   => 5,
								  -padx   => 2,
								  -anchor => 'n'
						 );
					   $::lglobal{surpop}->protocol(
						   'WM_DELETE_WINDOW' => sub {
							   $::lglobal{surpop}->destroy;
							   undef $::lglobal{surpop};
						   }
					   );
					   $surstrt->insert( 'end', '_' ) unless ( $surstrt->get );
					   $surend->insert( 'end', '_' ) unless ( $surend->get );
					   $::lglobal{surpop}->Icon( -image => $::icon );
				   }
				 }
			],
			[
			   Button   => 'Flood Fill Selection With...',
			   -command => sub {
				   $textwindow->addGlobStart;
				   $::lglobal{floodpop} =
					 ::flood();
				   $textwindow->addGlobEnd;
				 }
			],
			[ 'separator', '' ],
			[
			   Button   => 'Indent Selection 1',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::indent( $textwindow, 'in' );
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => 'Indent Selection -1',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::indent( $textwindow, 'out', $::operationinterrupt );
				   $textwindow->addGlobEnd;
				 }
			],
			[ 'separator', '' ],
			[
			   Button   => '~Align text on string...',
			   -command => \&::alignpopup
			],
			[ 'separator', '' ],
			[
			   Button   => 'Convert To Named/Numeric Entities',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::tonamed($textwindow);
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => 'Convert From Named/Numeric Entities',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::fromnamed($textwindow);
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => 'Convert Fractions',
			   -command => sub {
				   my @ranges = $textwindow->tagRanges('sel');
				   $textwindow->addGlobStart;
				   if (@ranges) {
					   while (@ranges) {
						   my $end   = pop @ranges;
						   my $start = pop @ranges;
						   ::fracconv( $textwindow, $start, $end );
					   }
				   } else {
					   ::fracconv( $textwindow, '1.0', 'end' );
				   }
				   $textwindow->addGlobEnd;
				 }
			],
			[ 'separator', '' ],
			[
			   'command', 'Highlight double quotes in selection',
			   -command     => [ \&::hilite, '"' ],
			   -accelerator => 'Ctrl+Shift+"'
			],
			[
			   'command', 'Highlight single quotes in selection',
			   -command     => [ \&::hilite, '\'' ],
			   -accelerator => 'Ctrl+\''
			],
			[
			   'command', 'Highlight arbitrary characters in selection...',
			   -command     => \&::hilitepopup,
			   -accelerator => 'Ctrl+Alt+h'
			],
			[
			   'command',
			   'Remove Highlights',
			   -command => sub {    # FIXME: sub search_rm_hilites
				   $textwindow->tagRemove( 'highlight', '1.0', 'end' );
				   $textwindow->tagRemove( 'quotemark', '1.0', 'end' );
			   },
			   -accelerator => 'Ctrl+0'
			],
			[
			   Cascade    => 'Bookmarks',
			   -tearoff   => 0,
			   -menuitems => &::menu_bookmarks
			],
			[
			   Cascade    => 'External',
			   -tearoff   => 0,
			   -menuitems => &::menu_external
			],
			[
			   Cascade    => 'Page Markers',
			   -tearoff   => 0,
			   -menuitems => [
							   [
								  'command',
								  '~Guess Page Markers...',
								  -command => \&::file_guess_page_marks
							   ],
							   [
								  'command',
								  'Set Page ~Markers...',
								  -command => \&::file_mark_pages
							   ],
							   [
								  'command',
								  '~Adjust Page Markers',
								  -command => \&::viewpagenums
							   ],
			   ]
			],
			[ Button => '~Greek Transliteration', -command => \&::greekpopup ],
			[ Button => '~UTF Character entry',   -command => \&::utford ],
			[ Button => '~UTF Character Search',  -command => \&::uchar ],
		]
	);
	my $source = $menubar->cascade(
		-label     => '~Source Cleanup',
		-tearoff   => 1,
		-menuitems => [
			[
			   'command',
			   'View Project Comments',
			   -command => sub{::viewprojectcomments()}
			],
			[
			   'command',
			   'View Project Discussion',
			   -command => sub {::viewprojectdiscussion()}
			],
			[ 'separator', '' ],
			[
			   'command',
			   'Find next /*..*/ block',
			   -command => [ \&::nextblock, 'default', 'forward' ]
			],
			[
			   'command',
			   'Find previous /*..*/ block',
			   -command => [ \&::nextblock, 'default', 'reverse' ]
			],
			[
			   'command',
			   'Find next /#..#/ block',
			   -command => [ \&::nextblock, 'block', 'forward' ]
			],
			[
			   'command',
			   'Find previous /#..#/ block',
			   -command => [ \&::nextblock, 'block', 'reverse' ]
			],
			[
			   'command',
			   'Find next /$..$/ block',
			   -command => [ \&::nextblock, 'stet', 'forward' ]
			],
			[
			   'command',
			   'Find previous /$..$/ block',
			   -command => [ \&::nextblock, 'stet', 'reverse' ]
			],
			[
			   'command',
			   'Find next /p..p/ block',
			   -command => [ \&::nextblock, 'poetry', 'forward' ]
			],
			[
			   'command',
			   'Find previous /p..p/ block',
			   -command => [ \&::nextblock, 'poetry', 'reverse' ]
			],
			[
			   'command',
			   'Find next indented block',
			   -command => [ \&::nextblock, 'indent', 'forward' ]
			],
			[
			   'command',
			   'Find previous indented block',
			   -command => [ \&::nextblock, 'indent', 'reverse' ]
			],
			[ 'separator', '' ],
			[
			   'command',
			   'Find ~Orphaned Brackets...',
			   -command => \&::orphanedbrackets
			],
			[
			   'command',
			   'Find Orphaned Markup...',
			   -command => \&::orphanedmarkup
			],
			[
			   'command',
			   'Find Proofer Comments',
			   -command => \&::find_proofer_comment
			],
			[
			   'command',
			   'Find Asterisks w/o slash',
			   -command => \&::find_asterisks
			],
			[
			   'command',
			   'Find Transliterations...',
			   -command => \&::find_transliterations
			],
			[ 'separator', '' ],
			[
			   Button   => 'Remove End-of-line Spaces',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::endofline();
				   $textwindow->addGlobEnd;
				 }
			],
			[ Button => 'Run Fi~xup...', -command => \&::fixpopup ],
			[ Button => 'Find Greek...', -command => \&::findandextractgreek ],
			[
			   Button   => 'Fix ~Page Separators',
			   -command => \&::separatorpopup
			],
			[
			   Button   => 'Remove Blank Lines Before Page Separators',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::delblanklines();
				   $textwindow->addGlobEnd;
				 }
			],
			[ Button => '~Sidenote Fixup...', -command => \&::sidenotes ],
			[ Button => '~Footnote Fixup...', -command => \&::footnotepop ],
			[
			   Button   => 'Reformat Poetry ~Line Numbers',
			   -command => \&::poetrynumbers
			],
		]
	);
	my $sourcechecks = $menubar->cascade(
		-label     => 'Source ~Checks',
		-tearoff   => 1,
		-menuitems => [
			[
			   Button   => 'Run ~Word Frequency Routine...',
			   -command => sub { ::wordfrequency() }
			],
			[ 'command', '~Stealth Scannos...', -command => \&::stealthscanno ],
			[ 'separator', '' ],
			[ Button => 'Run ~Gutcheck...',    -command => \&::gutcheck ],
			[ Button => 'Gutcheck options...', -command => \&::gutopts ],
			[ Button => 'Run ~Jeebies...',     -command => \&::jeebiespop_up ],
			[ 'command', 'Spell ~Check...', -command => \&::spellchecker ],
		]
	);
	my $txtcleanup = $menubar->cascade(
		-label     => 'Te~xt Version(s)',
		-tearoff   => 1,
		-menuitems => [
			[
			   Button   => "Convert Italics",
			   -command => sub {
				   ::text_convert_italic( $textwindow, $::italic_char );
				 }
			],
			[
			   Button => "Convert Bold",
			   -command =>
				 sub { ::text_convert_bold( $textwindow, $::bold_char ) }
			],
			[
			   Button   => 'Convert <tb> to asterisk break',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::text_convert_tb($textwindow);
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => 'All of the above',
			   -command => sub {
				   ::text_convert_italic( $textwindow, $::italic_char );
				   ::text_convert_bold( $textwindow, $::bold_char );
				   $textwindow->addGlobStart;
				   ::text_convert_tb($textwindow);
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => '~Add a Thought Break',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::text_thought_break($textwindow);
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => 'Small caps to all caps',
			   -command => \&::text_convert_smallcaps
			],
			[
			   Button   => 'Remove small caps markup',
			   -command => \&::text_remove_smallcaps_markup
			],
			[
			   Button   => "Options...",
			   -command => sub { ::text_convert_options($top) }
			],
			[ 'separator', '' ],
			[ Button => 'ASCII ~Boxes...', -command => \&::asciipopup ],
			[
			   Button   => 'ASCII Table Special Effects...',
			   -command => \&::tablefx
			],
			[
			   Button   => '~Rewrap Selection',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::selectrewrap( $textwindow, $::lglobal{seepagenums},
									$::scannos_highlighted, $::rwhyphenspace );
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => '~Block Rewrap Selection',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::blockrewrap();
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => 'Interrupt Rewrap',
			   -command => sub { $::operationinterrupt = 1 }
			],
			[
			   Button   => 'Clean Up Rewrap ~Markers',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::cleanup();
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => 'pptxt...',
			   -command => sub {
				   ::errorcheckpop_up( $textwindow, $top, 'pptxt' );
				   unlink 'null' if ( -e 'null' );
			   },
			],
			
			[ 'separator', '' ],
			[
			   Button   => 'Convert Windows CP 1252 characters to Unicode',
			   -command => \&::cp1252toUni
			],
		]
	);
	my $htmlversion = $menubar->cascade(
		-label     => '~HTML Version',
		-tearoff   => 1,
		-menuitems => [
			[
			   Button   => '~HTML Fixup',
			   -command => sub { ::htmlpopup( $textwindow, $top ) }
			],
			[
			   Button   => 'HTML Auto ~Index (List)',
			   -command => sub { ::autoindex($textwindow) }
			],
			[
			   Cascade    => 'HTML to Epub',
			   -tearoff   => 0,
			   -menuitems => [
				   [
					  Button   => 'EpubMaker Online',
					  -command => sub {
						  ::runner( $::globalbrowserstart,
									 "http://epubmaker.pglaf.org/" );
						}
				   ],
				   [
					  Button   => 'EpubMaker',
					  -command => sub { ::epubmaker('epub') }
				   ],
			   ],
			],
			[
			   Button => 'Link Check',
			   -command =>
				 sub { ::errorcheckpop_up( $textwindow, $top, 'Link Check' ) }
			],
			[
			   Button => 'HTML Tidy',
			   -command =>
				 sub { ::errorcheckpop_up( $textwindow, $top, 'HTML Tidy' ) }
			],
			[
			   Button   => 'W3C Validate',
			   -command => sub {
				   if ($::w3cremote) {
					   ::errorcheckpop_up( $textwindow, $top,
											'W3C Validate Remote' );
				   } else {
					   ::errorcheckpop_up( $textwindow, $top, 'W3C Validate' );
				   }
				   unlink 'null' if ( -e 'null' );
				 }
			],
			[
			   Button   => 'W3C Validate CSS',
			   -command => sub {
				   ::errorcheckpop_up( $textwindow, $top, 'W3C Validate CSS' )
					 ;    #validatecssrun('');
				   unlink 'null' if ( -e 'null' );
				 }
			],
			[
			   Button   => 'pphtml',
			   -command => sub {
				   ::errorcheckpop_up( $textwindow, $top, 'pphtml' );
				   unlink 'null' if ( -e 'null' );
				 }
			],
			[
			   Button   => 'Image Check',
			   -command => sub {
				   ::errorcheckpop_up( $textwindow, $top, 'Image Check' );
				   unlink 'null' if ( -e 'null' );
				 }
			],
			[
			   Button   => 'Epub Friendly',
			   -command => sub {
				   ::errorcheckpop_up( $textwindow, $top, 'Epub Friendly' );
				   unlink 'null' if ( -e 'null' );
				 }
			],
			[
			   Button   => 'Check All',
			   -command => sub {
				   ::errorcheckpop_up( $textwindow, $top, 'Check All' );
				   unlink 'null' if ( -e 'null' );
				 }
			],
		]
	);
	my $singlesource = $menubar->cascade(
		-label     => 'Sin~gle Source',
		-tearoff   => 1,
		-menuitems => [
			[
			   Cascade    => 'PGTEI Tools',
			   -tearoff   => 0,
			   -menuitems => [
				   [
					  Button   => 'W3C Validate PGTEI',
					  -command => sub {
						  ::errorcheckpop_up( $textwindow, $top,
											   'W3C Validate' );
						}
				   ],
				   [
					  Button   => 'Gnutenberg Press Online',
					  -command => sub {
						  ::runner(
								$::globalbrowserstart,
								"http://pgtei.pglaf.org/marcello/0.4/tei-online"
						  );
						}
				   ],
				   [
					  Button   => 'Gnutenberg Press (HTML only)',
					  -command => sub { ::gnutenberg('html') }
				   ],
				   [
					  Button   => 'Gnutenberg Press (Text only)',
					  -command => sub { ::gnutenberg('txt') }
				   ],
			   ]
			],
			[
			   Cascade    => 'RST Tools',
			   -tearoff   => 0,
			   -menuitems => [
				   [
					  Button   => 'dp2rst Conversion',
					  -command => sub {
						  ::runner( $::globalbrowserstart,
									 "http://www.pgdp.net/wiki/Dp2rst" );
						}
				   ],
				   [
					  Button   => 'EpubMaker (all formats)',
					  -command => sub { ::epubmaker() }
				   ],
				   [
					  Button   => 'EpubMaker (HTML only)',
					  -command => sub { ::epubmaker('html') }
				   ],
				   [
					  Button   => 'EpubMaker Online',
					  -command => sub {
						  ::runner( $::globalbrowserstart,
									 "http://epubmaker.pglaf.org/" );
						}
				   ],
			   ],
			]
		]
	);
	::unicodemenu();
	$menubar->Cascade(
					   -label     => '~Preferences',
					   -tearoff   => 1,
					   -menuitems => menu_preferences
	);
	$menubar->Cascade(
		-label     => '~Help',
		-tearoff   => 1,
		-menuitems => [
			[ Button => '~About', -command => sub { ::about_pop_up($top) } ],
			[ Button => '~Versions', -command => [ \&::showversion ] ],
			[
			   Button   => '~Manual',
			   -command => sub {        # FIXME: sub this out.
				   ::runner( $::globalbrowserstart,
							 "http://www.pgdp.net/wiki/PPTools/Guiguts" );
				 }
			],
			[
			   Button   => '~PP Process Checklist',
			   -command => sub {                      # FIXME: sub this out.
				   ::runner(
						 $::globalbrowserstart,
						 "http://www.pgdp.net/wiki/Guiguts_PP_Process_Checklist"
				   );
				 }
			],

			# FIXME: Disable update check until it works
			[
			   Button   => 'Check For ~Updates',
			   -command => sub { ::checkforupdates(0) }
			],
			[ Button => '~Hot keys',              -command => \&::hotkeyshelp ],
			[ Button => '~Operations History',      -command => \&::opspop_up ],
			[ Button => '~Regex Quick Reference', -command => \&::regexref ],
		]
	);
}

#another attempt at menus
sub menubuildtwo {
	my $menubar    = $::menubar;
	my $textwindow = $::textwindow;
	my $top        = $::top;
	my $file = $menubar->cascade(
		-label     => '~File',
		-tearoff   => 1,
		-menuitems => [
			[
			   'command', '~Open',
			   -command => sub { ::file_open($textwindow) }
			],
			[
			   'command',
			   '~Save',
			   -accelerator => 'Ctrl+s',
			   -command     => sub { ::savefile() }
			],
			[
			   'command', 'Save ~As',
			   -command => sub { ::file_saveas($textwindow) }
			],
			[ 'separator', '' ],
			map ( [
					Button   => "$::recentfile[$_]",
					-command => [ \&::openfile, $::recentfile[$_] ]
				  ],
				  ( 0 .. scalar(@::recentfile) - 1 ) ),
			[ 'separator', '' ],
			[
			   'command',
			   '~Include File',
			   -command => sub { ::file_include($textwindow) }
			],
			[
			   Cascade    => '~Export',
			   -tearoff   => 0,
			   -menuitems => [
							   [
								  'command',
								  'Export As Prep Text Files',
								  -command => sub { ::file_export_preptext('separatefiles') }
							   ],
							   [
								  'command',
								  'Export with Page Separators',
								  -command => sub { ::file_export_preptext('onefile') }
							   ],
							   [
								  'command',
								  'Export with Page Markup',
								  -command => sub { ::file_export_pagemarkup(); }
							   ],
			   ]
			],
			[
			   Cascade    => 'Im~port',
			   -tearoff   => 0,
			   -menuitems => [
			[
			   'command',
			   'Import Prep Text Files',
			   -command => sub { ::file_import_preptext( $textwindow, $top ) }
			],
							   [
								  'command',
								  'Import with Page Markup',
								  -command => sub { ::file_import_markup(); }
							   ],
			   ]
			],
			[ 'separator', '' ],

			# include cascading page marker section
			[
			   Cascade    => 'Page Markers',
			   -tearoff   => 0,
			   -menuitems => [
							   [
								  'command',
								  '~Guess Page Markers...',
								  -command => \&::file_guess_page_marks
							   ],
							   [
								  'command',
								  'Set Page ~Markers...',
								  -command => \&::file_mark_pages
							   ],
							   [
								  'command',
								  '~Adjust Page Markers',
								  -command => \&::viewpagenums
							   ],
			   ]
			],
			[ 'separator', '' ],
			[
			   'command',
			   'View Project Comments',
			   -command => sub{viewprojectcomments()}
			],
			[
			   'command',
			   'View Project Discussion',
			   -command => sub {viewprojectdiscussion()}
			],

			# end of copy
			[ 'separator', '' ],
			[ 'command', 'Debug', -command => sub { ::debug_dump() } ],
			[
			   'command', '~Close',
			   -command => sub { ::file_close($textwindow) }
			],
			[ 'command', 'E~xit', -command => sub { ::_exit() } ],
		]
	);
	my $edit = $menubar->cascade(
		-label     => '~Edit',
		-tearoff   => 1,
		-menuitems => [
			[
			   'command', 'Undo',
			   -command     => sub { $textwindow->undo },
			   -accelerator => 'Ctrl+z'
			],
			[
			   'command', 'Redo',
			   -command     => sub { $textwindow->redo },
			   -accelerator => 'Ctrl+y'
			],
			[ 'separator', '' ],
			[
			   'command', 'Cut',
			   -command     => sub { ::cut() },
			   -accelerator => 'Ctrl+x'
			],
			[ 'separator', '' ],
			[
			   'command', 'Copy',
			   -command     => sub { ::textcopy() },
			   -accelerator => 'Ctrl+c'
			],
			[
			   'command', 'Paste',
			   -command     => sub { ::paste() },
			   -accelerator => 'Ctrl+v'
			],
			[
			   'command',
			   'Col Paste',
			   -command => sub {    # FIXME: sub edit_column_paste
				   $textwindow->addGlobStart;
				   $textwindow->clipboardColumnPaste;
				   $textwindow->addGlobEnd;
			   },
			   -accelerator => 'Ctrl+`'
			],
			[ 'separator', '' ],
			[
			   'command',
			   'Select All',
			   -command => sub {
				   $textwindow->selectAll;
			   },
			   -accelerator => 'Ctrl+/'
			],
			[
			   'command',
			   'Unselect All',
			   -command => sub {
				   $textwindow->unselectAll;
			   },
			   -accelerator => 'Ctrl+\\'
			],
		]
	);
	my $search = $menubar->cascade(
		-label     => 'Search & ~Replace',
		-tearoff   => 1,
		-menuitems => [
			[ 'command', 'Search & ~Replace...', -command => \&::searchpopup ],
			[ 'command', '~Stealth Scannos...', -command => \&::stealthscanno ],
			[ 'separator', '' ],
			[
			   'command',
			   'Goto ~Line...',
			   -command => sub {
				   ::gotoline();
				   ::update_indicators();
				 }
			],
			[
			   'command',
			   'Goto ~Page...',
			   -command => sub {
				   ::gotopage();
				   ::update_indicators();
				 }
			],
			[ 'separator', '' ],
			[
			   'command',
			   'Find Proofer Comments',
			   -command => \&::find_proofer_comment
			],
			[
			   'command',
			   'Find ~Orphaned Brackets...',
			   -command => \&::orphanedbrackets
			],
			[
			   'command',
			   'Find Orphaned Markup...',
			   -command => \&::orphanedmarkup
			],
			[ 'separator', '' ],
			[
			   'command',
			   'Find next /*..*/ block',
			   -command => [ \&::nextblock, 'default', 'forward' ]
			],
			[
			   'command',
			   'Find previous /*..*/ block',
			   -command => [ \&::nextblock, 'default', 'reverse' ]
			],
			[
			   'command',
			   'Find next /#..#/ block',
			   -command => [ \&::nextblock, 'block', 'forward' ]
			],
			[
			   'command',
			   'Find previous /#..#/ block',
			   -command => [ \&::nextblock, 'block', 'reverse' ]
			],
			[
			   'command',
			   'Find next /$..$/ block',
			   -command => [ \&::nextblock, 'stet', 'forward' ]
			],
			[
			   'command',
			   'Find previous /$..$/ block',
			   -command => [ \&::nextblock, 'stet', 'reverse' ]
			],
			[
			   'command',
			   'Find next /p..p/ block',
			   -command => [ \&::nextblock, 'poetry', 'forward' ]
			],
			[
			   'command',
			   'Find previous /p..p/ block',
			   -command => [ \&::nextblock, 'poetry', 'reverse' ]
			],
			[
			   'command',
			   'Find next indented block',
			   -command => [ \&::nextblock, 'indent', 'forward' ]
			],
			[
			   'command',
			   'Find previous indented block',
			   -command => [ \&::nextblock, 'indent', 'reverse' ]
			],
		]
	);
	my $bookmarks = $menubar->cascade(
									   -label     => '~Bookmark',
									   -tearoff   => 1,
									   -menuitems => menu_bookmarks,
	);
	my $selection = $menubar->cascade(
		-label     => '~Selection',
		-tearoff   => 1,
		-menuitems => [
			[
			   Button   => '~lowercase Selection',
			   -command => sub {
				   ::case( $textwindow, 'lc' );
				 }
			],
			[
			   Button   => '~Sentence case Selection',
			   -command => sub { ::case( $textwindow, 'sc' ); }
			],
			[
			   Button   => '~Title Case Selection',
			   -command => sub { ::case( $textwindow, 'tc' ); }
			],
			[
			   Button   => '~UPPERCASE Selection',
			   -command => sub { ::case( $textwindow, 'uc' ); }
			],
			[ 'separator', '' ],
			[
			   Button   => 'Surround Selection With...',
			   -command => sub {
				   if ( defined( $::lglobal{surpop} ) ) {
					   $::lglobal{surpop}->deiconify;
					   $::lglobal{surpop}->raise;
					   $::lglobal{surpop}->focus;
				   } else {
					   $::lglobal{surpop} = $top->Toplevel;
					   $::lglobal{surpop}->title('Surround text with:');
					   my $f =
						 $::lglobal{surpop}
						 ->Frame->pack( -side => 'top', -anchor => 'n' );
					   $f->Label( -text =>
"Surround the selection with?\n\\n will be replaced with a newline.",
						 )->pack(
								  -side   => 'top',
								  -pady   => 5,
								  -padx   => 2,
								  -anchor => 'n'
						 );
					   my $f1 =
						 $::lglobal{surpop}
						 ->Frame->pack( -side => 'top', -anchor => 'n' );
					   my $surstrt =
						 $f1->Entry(
									 -width      => 8,
									 -background => $::bkgcolor,
									 -font       => $::lglobal{font},
									 -relief     => 'sunken',
						 )->pack(
								  -side   => 'left',
								  -pady   => 5,
								  -padx   => 2,
								  -anchor => 'n'
						 );
					   my $surend =
						 $f1->Entry(
									 -width      => 8,
									 -background => $::bkgcolor,
									 -font       => $::lglobal{font},
									 -relief     => 'sunken',
						 )->pack(
								  -side   => 'left',
								  -pady   => 5,
								  -padx   => 2,
								  -anchor => 'n'
						 );
					   my $f2 =
						 $::lglobal{surpop}
						 ->Frame->pack( -side => 'top', -anchor => 'n' );
					   my $gobut = $f2->Button(
						   -activebackground => $::activecolor,
						   -command          => sub {
							   ::surroundit( $surstrt->get, $surend->get,
											 $textwindow );
						   },
						   -text  => 'OK',
						   -width => 16
						 )->pack(
								  -side   => 'top',
								  -pady   => 5,
								  -padx   => 2,
								  -anchor => 'n'
						 );
					   $::lglobal{surpop}->protocol(
						   'WM_DELETE_WINDOW' => sub {
							   $::lglobal{surpop}->destroy;
							   undef $::lglobal{surpop};
						   }
					   );
					   $surstrt->insert( 'end', '_' ) unless ( $surstrt->get );
					   $surend->insert( 'end', '_' ) unless ( $surend->get );
					   $::lglobal{surpop}->Icon( -image => $::icon );
				   }
				 }
			],
			[
			   Button   => 'Flood Fill Selection With...',
			   -command => sub {
				   $textwindow->addGlobStart;
				   $::lglobal{floodpop} =
					 ::flood();
				   $textwindow->addGlobEnd;
				 }
			],
			[ 'separator', '' ],
			[
			   Button   => 'Indent Selection  1',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::indent( $textwindow, 'in' );
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => 'Indent Selection -1',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::indent( $textwindow, 'out', $::operationinterrupt );
				   $textwindow->addGlobEnd;
				 }
			],
			[ 'separator', '' ],
			[
			   Button   => '~Rewrap Selection',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::selectrewrap( $textwindow, $::lglobal{seepagenums},
									$::scannos_highlighted, $::rwhyphenspace );
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => '~Block Rewrap Selection',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::blockrewrap();
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => 'Interrupt Rewrap',
			   -command => sub { $::operationinterrupt = 1 }
			],
			[ 'separator', '' ],
			[
			   Button   => '~Align text on string...',
			   -command => \&::alignpopup
			],
			[ 'separator', '' ],
			[
			   Button   => 'Convert To Named/Numeric Entities',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::tonamed($textwindow);
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => 'Convert From Named/Numeric Entities',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::fromnamed($textwindow);
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => 'Convert Fractions',
			   -command => sub {
				   my @ranges = $textwindow->tagRanges('sel');
				   $textwindow->addGlobStart;
				   if (@ranges) {
					   while (@ranges) {
						   my $end   = pop @ranges;
						   my $start = pop @ranges;
						   ::fracconv( $textwindow, $start, $end );
					   }
				   } else {
					   ::fracconv( $textwindow, '1.0', 'end' );
				   }
				   $textwindow->addGlobEnd;
				 }
			],

			# highlighting moved here from search and replace
			[ 'separator', '' ],
			[
			   'command', 'Highlight double quotes in selection',
			   -command     => [ \&::hilite, '"' ],
			   -accelerator => 'Ctrl+Shift+"'
			],
			[
			   'command', 'Highlight single quotes in selection',
			   -command     => [ \&::hilite, '\'' ],
			   -accelerator => 'Ctrl+\''
			],
			[
			   'command', 'Highlight arbitrary characters in selection...',
			   -command     => \&::hilitepopup,
			   -accelerator => 'Ctrl+Alt+h'
			],
			[
			   'command',
			   'Remove Highlights',
			   -command => sub {    # FIXME: sub search_rm_hilites
				   $textwindow->tagRemove( 'highlight', '1.0', 'end' );
				   $textwindow->tagRemove( 'quotemark', '1.0', 'end' );
			   },
			   -accelerator => 'Ctrl+0'
			],

			# end of moved section
		]
	);
	my $fixup = $menubar->cascade(
		-label     => 'Fi~xup',
		-tearoff   => 1,
		-menuitems => [
			[
			   Button   => 'Remove End-of-line Spaces',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::endofline();
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => 'Remove Blank Lines Before Page Separators',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::delblanklines();
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => 'Convert Windows CP 1252 characters to Unicode',
			   -command => \&::cp1252toUni
			],
			[ Button => 'Fix sidenotes',      -command => \&::sidenotes ],
			[ Button => 'Run Fi~xup...',      -command => \&::fixpopup ],
			[ Button => '~Footnote Fixup...', -command => \&::footnotepop ],
			[ 'separator', '' ],
			[
			   Button   => 'Fix ~Page Separators...',
			   -command => \&::separatorpopup
			],
			[ 'separator', '' ],
			[
			   'command',
			   'Find Asterisks w/o slash',
			   -command => \&::find_asterisks
			],
			[
			   'command',
			   'Find Transliterations...',
			   -command => \&::find_transliterations
			],
			[ Button => 'Find Greek...', -command => \&::findandextractgreek ],
			[ Button => '~Greek Transliteration', -command => \&::greekpopup ],
			[ 'separator', '' ],
			[
			   Button   => 'Reformat Poetry ~Line Numbers',
			   -command => \&::poetrynumbers
			],
			[ 'separator', '' ],
			[
			   Button   => 'Run ~Word Frequency Routine...',
			   -command => sub { ::wordfrequency() }
			],
			[
			   Button => 'Spell in multiple languages',
			   -command =>
				 sub { ::spellmultiplelanguages( $textwindow, $top ) }
			],
			[ 'command',   'Spell ~Check...', -command => \&::spellchecker ],
			[ 'separator', '' ],
			[ Button => 'Run ~Jeebies...',     -command => \&::jeebiespop_up ],
			[ Button => 'Run ~Gutcheck...',    -command => \&::gutcheck ],
			[ Button => 'Gutcheck options...', -command => \&::gutopts ],
			[
			   Button   => 'pptxt...',
			   -command => sub {
				   ::errorcheckpop_up( $textwindow, $top, 'pptxt' );
				   unlink 'null' if ( -e 'null' );
			   },
			],
			[ 'separator', '' ],
			[
			   Button   => '~HTML Fixup...',
			   -command => sub {
				   ::htmlpopup( $textwindow, $top );
				 }
			],
			[
			   Button   => 'View in Browser',
			   -command => sub {
				   ::runner( ::cmdinterp($::defaultfilehandler) );
			   },
			],
			[
			   Button   => 'HTML Check All',
			   -command => sub {
				   ::errorcheckpop_up( $textwindow, $top, 'Check All' );
				   unlink 'null' if ( -e 'null' );
				 }
			],
			[ 'separator', '' ],
			[
			   Button   => 'HTML Auto ~Index (List)',
			   -command => sub { ::autoindex($textwindow) }
			],
			[
			   Cascade    => 'HTML to Epub',
			   -tearoff   => 0,
			   -menuitems => [
				   [
					  Button   => 'EpubMaker Online',
					  -command => sub {
						  ::runner(
"$::globalbrowserstart http://epubmaker.pglaf.org/" );
						}
				   ],
				   [
					  Button   => 'EpubMaker',
					  -command => sub { ::epubmaker('epub') }
				   ],
			   ],
			],
			[
			   Cascade    => 'PGTEI Tools',
			   -tearoff   => 0,
			   -menuitems => [
				   [
					  Button   => 'W3C Validate PGTEI',
					  -command => sub {
						  ::errorcheckpop_up( $textwindow, $top,
											   'W3C Validate' );
						}
				   ],
				   [
					  Button   => 'Gnutenberg Press (HTML only)',
					  -command => sub { ::gnutenberg('html') }
				   ],
				   [
					  Button   => 'Gnutenberg Press (Text only)',
					  -command => sub { ::gnutenberg('txt') }
				   ],
				   [
					  Button   => 'Gnutenberg Press Online',
					  -command => sub {
						  ::runner(
								$::globalbrowserstart,
								"http://pgtei.pglaf.org/marcello/0.4/tei-online"
						  );
						}
				   ],
			   ],
			],
			[
			   Cascade    => 'RST Tools',
			   -tearoff   => 0,
			   -menuitems => [
				   [
					  Button   => 'EpubMaker Online',
					  -command => sub {
						  ::runner( $::globalbrowserstart,
									 "http://epubmaker.pglaf.org/" );
						}
				   ],
				   [
					  Button   => 'EpubMaker (all formats)',
					  -command => sub { ::epubmaker() }
				   ],
				   [
					  Button   => 'EpubMaker (HTML only)',
					  -command => sub { ::epubmaker('html') }
				   ],
				   [
					  Button   => 'dp2rst Conversion',
					  -command => sub {
						  ::runner( $::globalbrowserstart,
									 "http://www.pgdp.net/wiki/Dp2rst" );
						}
				   ],
			   ]
			],
		]
	);
	my $text = $menubar->cascade(
		-label     => "Text",
		-tearoff   => 1,
		-menuitems => [
			[
			   Button   => "Convert Italics",
			   -command => sub {
				   ::text_convert_italic( $textwindow, $::italic_char );
				 }
			],
			[
			   Button => "Convert Bold",
			   -command =>
				 sub { ::text_convert_bold( $textwindow, $::bold_char ) }
			],
			[
			   Button   => 'Convert <tb> to asterisk break',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::text_convert_tb($textwindow);
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => 'All of the above',
			   -command => sub {
				   ::text_convert_italic( $textwindow, $::italic_char );
				   ::text_convert_bold( $textwindow, $::bold_char );
				   $textwindow->addGlobStart;
				   ::text_convert_tb($textwindow);
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => "Options...",
			   -command => sub { ::text_convert_options($top) }
			],
			[ 'separator', '' ],
			[
			   Button   => 'Small caps to all caps',
			   -command => \&::text_convert_smallcaps
			],
			[
			   Button   => 'Remove small caps markup',
			   -command => \&::text_remove_smallcaps_markup
			],
			[ 'separator', '' ],
			[
			   Button   => '~Add a Thought Break',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::text_thought_break($textwindow);
				   $textwindow->addGlobEnd;
				 }
			],
			[
			   Button   => 'ASCII Table Special Effects...',
			   -command => \&::tablefx
			],
			[ Button => 'ASCII ~Boxes...', -command => \&::asciipopup ],
			[ 'separator', '' ],
			[
			   Button   => 'Clean Up Rewrap ~Markers',
			   -command => sub {
				   $textwindow->addGlobStart;
				   ::cleanup();
				   $textwindow->addGlobEnd;
				 }
			],
		]
	);
	my $external = $menubar->cascade(
									  -label     => 'External',
									  -tearoff   => 1,
									  -menuitems => &menu_external,
	);
	::unicodemenu();
	$menubar->Cascade(
					   -label     => 'Options',
					   -tearoff   => 1,
					   -menuitems => &::menu_preferences
	);
	$menubar->Cascade(
		-label     => '~Help',
		-tearoff   => 1,
		-menuitems => [
			[
			   Button   => '~Manual',
			   -command => sub {        # FIXME: sub this out.
				   ::runner( $::globalbrowserstart,
							  "http://www.pgdp.net/wiki/PPTools/Guiguts" );
				 }
			],
			[
			   Button   => '~PP Process Checklist',
			   -command => sub {                      # FIXME: sub this out.
				   ::runner(
						 $::globalbrowserstart,
						 "http://www.pgdp.net/wiki/Guiguts_PP_Process_Checklist"
				   );
				 }
			],
			[ Button => '~Latin 1 Chart',         -command => \&::latinpopup ],
			[ Button => '~Regex Quick Reference', -command => \&::regexref ],
			[ Button => '~Hot keys',              -command => \&::hotkeyshelp ],
			[ 'separator', '' ],
			[ Button => '~UTF Character entry',  -command => \&::utford ],
			[ Button => '~UTF Character Search', -command => \&::uchar ],
			[ 'separator', '' ],
			[ Button => '~About', -command => sub { ::about_pop_up($top) } ],
			[ Button => '~Versions', -command => [ \&::showversion ] ],

			# FIXME: Disable update check until it works
			[
			   Button   => 'Check For ~Updates',
			   -command => sub { ::checkforupdates(0) }
			],
			[ 'separator', '' ],
			[ Button => '~Operations History', -command => \&::opspop_up ],
		]
	);
}

# Menus are not easily modifiable in place. Easier to just destroy and
## rebuild every time it is modified
sub menurebuild {
	for ( 0 .. 12 ) {
		$::menubar->delete('last');
	}
	menubuild();
	return;
}

sub unicodemenu {

	# FIXME: We'll leave this alone for now.
	if ( $Tk::VERSION =~ m{804} ) {
		my %utfsorthash;
		for ( keys %{ $::lglobal{utfblocks} } ) {
			$utfsorthash{ $::lglobal{utfblocks}{$_}->[0] } = $_;
		}
		if ( $::lglobal{utfrangesort} ) {
			$::menubar->Cascade(
				qw/-label ~Unicode -tearoff 1 -menuitems/ => [
					[
					   Radiobutton => 'Sort by Name',
					   -variable   => \$::lglobal{utfrangesort},
					   -command    => \&menurebuild,
					   -value      => 0,
					],
					[
					   Cascade  => 'More',
					   -tearoff => 0,
					   -menuitems =>
						 [ # FIXME: sub this and generalize for all occurences in menu code.
						   map ( [
								  Button   => "$utfsorthash{$_}",
								  -command => [
									   \&::utfpopup,
									   $utfsorthash{$_},
									   $::lglobal{utfblocks}{ $utfsorthash{$_} }
										 [0],
									   $::lglobal{utfblocks}{ $utfsorthash{$_} }
										 [1]
								  ],
								  -accelerator =>
									$::lglobal{utfblocks}{ $utfsorthash{$_} }[0]
									. ' - '
									. $::lglobal{utfblocks}{ $utfsorthash{$_} }
									[1]
							   ],
							   ( sort ( keys %utfsorthash ) )[ 34 .. 67 ] ),
						 ]
					],
					map ( [
							Button   => "$utfsorthash{$_}",
							-command => [
								   \&::utfpopup,
								   $utfsorthash{$_},
								   $::lglobal{utfblocks}{ $utfsorthash{$_} }[0],
								   $::lglobal{utfblocks}{ $utfsorthash{$_} }[1]
							],
							-accelerator =>
							  $::lglobal{utfblocks}{ $utfsorthash{$_} }[0]
							  . ' - '
							  . $::lglobal{utfblocks}{ $utfsorthash{$_} }[1]
						  ],
						  ( sort ( keys %utfsorthash ) )[ 0 .. 33 ] ),
				],
			);
		} else {
			$::menubar->Cascade(
				qw/-label ~Unicode -tearoff 1 -menuitems/ => [
					[
					   Radiobutton => 'Sort by Range',
					   -variable   => \$::lglobal{utfrangesort},
					   -command    => \&menurebuild,
					   -value      => 1,
					],
					[
					   Cascade  => 'More',
					   -tearoff => 0,
					   -menuitems =>
						 [ # FIXME: sub this and generalize for all occurences in menu code.
						   map ( [
								   Button   => "$_",
								   -command => [
												 \&::utfpopup,
												 $_,
												 $::lglobal{utfblocks}{$_}[0],
												 $::lglobal{utfblocks}{$_}[1]
								   ],
								   -accelerator => $::lglobal{utfblocks}{$_}[0]
									 . ' - '
									 . $::lglobal{utfblocks}{$_}[1]
								 ],
								 ( sort ( keys %{ $::lglobal{utfblocks} } ) )
								   [ 34 .. 67 ] ),
						 ]
					],
					map ( [
							 Button   => "$_",
							 -command => [
										   \&::utfpopup,
										   $_,
										   $::lglobal{utfblocks}{$_}[0],
										   $::lglobal{utfblocks}{$_}[1]
							 ],
							 -accelerator => $::lglobal{utfblocks}{$_}[0]
							   . ' - '
							   . $::lglobal{utfblocks}{$_}[1]
						  ],
						  ( sort ( keys %{ $::lglobal{utfblocks} } ) )
							[ 1 .. 33 ] ),
				],
			);
		}
	}
}
1;
