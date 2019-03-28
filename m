Return-Path: <SRS0=Ft2S=R7=linux.intel.com=sakari.ailus@kernel.org>
Date: Thu, 28 Mar 2019 13:48:45 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v2 6/6] lib/vsprintf: Add %pfw conversion specifier for
 printing fwnode names
Message-ID: <20190328114845.giusyarjibvg5ru7@kekkonen.localdomain>
References: <20190326124106.27694-1-sakari.ailus@linux.intel.com>
 <20190326124106.27694-7-sakari.ailus@linux.intel.com>
 <c08956873f4dfd7dc8bd918bf59443de9c2c7b33.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c08956873f4dfd7dc8bd918bf59443de9c2c7b33.camel@perches.com>
To: Joe Perches <joe@perches.com>
Cc: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Joe,

Thanks for the review.

On Tue, Mar 26, 2019 at 01:18:09PM -0700, Joe Perches wrote:
> On Tue, 2019-03-26 at 14:41 +0200, Sakari Ailus wrote:
> > Add support for %pfw conversion specifier (with "f" and "P" modifiers) to
> > support printing full path of the node, including its name ("f") and only
> > the node's name ("P") in the printk family of functions. The two flags
> > have equivalent functionality to existing %pOF with the same two modifiers
> > ("f" and "P") on OF based systems. The ability to do the same on ACPI
> > based systems is added by this patch.
> []
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > @@ -5977,7 +5977,8 @@ sub process {
> >  				while ($fmt =~ /(\%[\*\d\.]*p(\w))/g) {
> >  					$specifier = $1;
> >  					$extension = $2;
> > -					if ($extension !~ /[SsBKRraEhMmIiUDdgVCbGNOx]/) {
> > +					if ($extension !~ /[SsBKRraEhMmIiUDdgVCbGNOxf]/ ||
> > +					    $extension =~ /f[^w]/) {
> >  						$bad_specifier = $specifier;
> >  						last;
> >  					}
> 
> You also need to remove the bit about using %pF or %pf below this
> 
> 					if ($bad_specifier =~ /p[Ff]/) {
> 						$ext_type = "Deprecated";
> 						$use = " - use %pS instead";
> 						$use =~ s/pS/ps/ if ($bad_specifier =~ /pf/);
> 					}

I actually intended to leave this --- it points to anyone accidentally
trying to use %pf to what it needs to be replaced with. But the Deprecated
should be replaced with Invalid (i.e. remove that assignment).

How about that?

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
