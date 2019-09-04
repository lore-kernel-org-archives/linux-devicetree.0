From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v4 10/11] lib/vsprintf: Add %pfw conversion specifier
 for printing fwnode names
Date: Wed, 04 Sep 2019 08:37:08 -0700
Message-ID: <78ccab5e0f07b3acaade1dec1ca3241938ab298f.camel@perches.com>
References: <20190902083240.20367-1-sakari.ailus@linux.intel.com>
         <20190902083240.20367-11-sakari.ailus@linux.intel.com>
         <20190903130607.cf2qv3s3evobbd5g@pathway.suse.cz>
         <20190904150413.GU5475@paasikivi.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190904150413.GU5475@paasikivi.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Petr Mladek <pmladek@suse.com>
Cc: rafael@kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 2019-09-04 at 18:04 +0300, Sakari Ailus wrote:
> On Tue, Sep 03, 2019 at 03:06:07PM +0200, Petr Mladek wrote:
> > On Mon 2019-09-02 11:32:39, Sakari Ailus wrote:
[]
> > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
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

If you want to make changes to checkpatch, please
send patches to the checkpatch maintainers.

Don't break other parsing of $2/#extension.

If you really need to know whatever follows the specific
extension letter use another capture group.

			while ($fmt =~  /(\%[\*\d\.]*p(\w)(\w*))/g) {
				$specifier = $1;
				$extension = $2;
				$qualifier = $3;

etc...

Then verify $qualifier or $3 is not undef if necessary
