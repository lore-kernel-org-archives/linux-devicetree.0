From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v6 11/12] lib/vsprintf: Add %pfw conversion specifier
 for printing fwnode names
Date: Tue, 10 Sep 2019 03:21:26 -0700
Message-ID: <ef57a3fc72b548b7daf9257aacc596d57004199d.camel@perches.com>
References: <20190910084707.18380-1-sakari.ailus@linux.intel.com>
         <20190910084707.18380-12-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190910084707.18380-12-sakari.ailus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On Tue, 2019-09-10 at 11:47 +0300, Sakari Ailus wrote:
> Add support for %pfw conversion specifier (with "f" and "P" modifiers) to
> support printing full path of the node, including its name ("f") and only
> the node's name ("P") in the printk family of functions. The two flags
> have equivalent functionality to existing %pOF with the same two modifiers
> ("f" and "P") on OF based systems. The ability to do the same on ACPI
> based systems is added by this patch.

checkpatch comment below:
   A. 
> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
[]
> @@ -418,6 +418,30 @@ Examples::
>  
>  Passed by reference.
>  
> +Fwnode handles
> +--------------
> +
> +::
> +
> +	%pfw[fP]
> +
> +For printing information on fwnode handles. The default is to print the full
> +node name, including the path. The modifiers are functionally equivalent to
> +%pOF above.
> +
> +	- f - full name of the node, including the path
> +	- P - the name of the node including an address (if there is one)
> +
> +Examples (ACPI)::
> +
> +	%pfwf	\_SB.PCI0.CIO2.port@1.endpoint@0	- Full node name
> +	%pfwP	endpoint@0				- Node name
> +
> +Examples (OF)::
> +
> +	%pfwf	/ocp@68000000/i2c@48072000/camera@10/port/endpoint - Full name
> +	%pfwP	endpoint				- Node name
[]
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -5988,14 +5988,17 @@ sub process {
>  		        for (my $count = $linenr; $count <= $lc; $count++) {
>  				my $specifier;
>  				my $extension;
> +				my $qualifier;
>  				my $bad_specifier = "";
>  				my $fmt = get_quoted_string($lines[$count - 1], raw_line($count, 0));
>  				$fmt =~ s/%%//g;
>  
> -				while ($fmt =~ /(\%[\*\d\.]*p(\w))/g) {
> +				while ($fmt =~ /(\%[\*\d\.]*p(\w)(\w?))/g) {

This is not generic enough to allow all possible qualifiers
to be captured.

This should be something like:

			while ($fmt =~ /(\%[\*\d\.]*p(\w)(\w*))/g) {
	
>  					$specifier = $1;
>  					$extension = $2;
> -					if ($extension !~ /[SsBKRraEhMmIiUDdgVCbGNOxt]/) {
> +					$qualifier = $3;
> +					if ($extension !~ /[SsBKRraEhMmIiUDdgVCbGNOxtf]/ ||
> +					    ($extension eq "f" && $qualifier ne "w")) {


And this should likely test
					    (defined $qualifier &&
					     $extension eq 'f' && $qualifier =~ /^w/))

>  						$bad_specifier = $specifier;
>  						last;
>  					}

And here the 'f' isn't really a bad $specifier,
it does not have the correct 'w' $extension.

The valid extensions may change in the future and
this code isn't particularly manageable, so I
think the $specifier/$extension pair should likely
have some additional testing after validating
the $specifier.
