From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v6 11/12] lib/vsprintf: Add %pfw conversion specifier for
 printing fwnode names
Date: Wed, 18 Sep 2019 16:11:07 +0300
Message-ID: <20190918131107.GR5781@paasikivi.fi.intel.com>
References: <20190910084707.18380-1-sakari.ailus@linux.intel.com>
 <20190910084707.18380-12-sakari.ailus@linux.intel.com>
 <ef57a3fc72b548b7daf9257aacc596d57004199d.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ef57a3fc72b548b7daf9257aacc596d57004199d.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: devicetree@vger.kernel.org

Hi Joe,

On Tue, Sep 10, 2019 at 03:21:26AM -0700, Joe Perches wrote:
> > @@ -5988,14 +5988,17 @@ sub process {
> >  		        for (my $count = $linenr; $count <= $lc; $count++) {
> >  				my $specifier;
> >  				my $extension;
> > +				my $qualifier;
> >  				my $bad_specifier = "";
> >  				my $fmt = get_quoted_string($lines[$count - 1], raw_line($count, 0));
> >  				$fmt =~ s/%%//g;
> >  
> > -				while ($fmt =~ /(\%[\*\d\.]*p(\w))/g) {
> > +				while ($fmt =~ /(\%[\*\d\.]*p(\w)(\w?))/g) {
> 
> This is not generic enough to allow all possible qualifiers
> to be captured.
> 
> This should be something like:
> 
> 			while ($fmt =~ /(\%[\*\d\.]*p(\w)(\w*))/g) {
> 	
> >  					$specifier = $1;
> >  					$extension = $2;
> > -					if ($extension !~ /[SsBKRraEhMmIiUDdgVCbGNOxt]/) {
> > +					$qualifier = $3;
> > +					if ($extension !~ /[SsBKRraEhMmIiUDdgVCbGNOxtf]/ ||
> > +					    ($extension eq "f" && $qualifier ne "w")) {
> 
> 
> And this should likely test
> 					    (defined $qualifier &&
> 					     $extension eq 'f' && $qualifier =~ /^w/))
> 
> >  						$bad_specifier = $specifier;
> >  						last;
> >  					}
> 
> And here the 'f' isn't really a bad $specifier,
> it does not have the correct 'w' $extension.
> 
> The valid extensions may change in the future and
> this code isn't particularly manageable, so I
> think the $specifier/$extension pair should likely
> have some additional testing after validating
> the $specifier.

There are certainly possibilities of having qualifiers that aren't
supported but extensions are also allowed to be followed by any other
characters, so this is a bit grey area.

I'll make the qualifier one or more letters for v7 as you suggested.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
