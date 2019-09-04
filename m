From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 10/11] lib/vsprintf: Add %pfw conversion specifier for
 printing fwnode names
Date: Wed, 4 Sep 2019 18:17:59 +0300
Message-ID: <20190904151759.GS2680@smile.fi.intel.com>
References: <20190902083240.20367-1-sakari.ailus@linux.intel.com>
 <20190902083240.20367-11-sakari.ailus@linux.intel.com>
 <20190903130607.cf2qv3s3evobbd5g@pathway.suse.cz>
 <20190904150413.GU5475@paasikivi.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190904150413.GU5475@paasikivi.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, rafael@kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 04, 2019 at 06:04:13PM +0300, Sakari Ailus wrote:
> On Tue, Sep 03, 2019 at 03:06:07PM +0200, Petr Mladek wrote:
> > On Mon 2019-09-02 11:32:39, Sakari Ailus wrote:
> > > Add support for %pfw conversion specifier (with "f" and "P" modifiers) to
> > > support printing full path of the node, including its name ("f") and only
> > > the node's name ("P") in the printk family of functions. The two flags
> > > have equivalent functionality to existing %pOF with the same two modifiers
> > > ("f" and "P") on OF based systems. The ability to do the same on ACPI
> > > based systems is added by this patch.

> > > --- a/scripts/checkpatch.pl
> > > +++ b/scripts/checkpatch.pl
> > > @@ -5995,7 +5995,8 @@ sub process {
> > >  				while ($fmt =~ /(\%[\*\d\.]*p(\w))/g) {
> > >  					$specifier = $1;
> > >  					$extension = $2;
> > > -					if ($extension !~ /[SsBKRraEhMmIiUDdgVCbGNOxt]/) {
> > > +					if ($extension !~ /[SsBKRraEhMmIiUDdgVCbGNOxtf]/ ||
> > > +					    $extension =~ /^f[^w]/) {
> > 
> > This does not work. $extension seems to have only one character.
> 
> Good catch. \w indeed matches a single letter; I'll change that to \w+ and
> change the other uses accordingly.

It's weird. \w stands for word matching. How can it match one letter only?

-- 
With Best Regards,
Andy Shevchenko
