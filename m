From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v4 10/11] lib/vsprintf: Add %pfw conversion specifier for
 printing fwnode names
Date: Wed, 4 Sep 2019 18:04:13 +0300
Message-ID: <20190904150413.GU5475@paasikivi.fi.intel.com>
References: <20190902083240.20367-1-sakari.ailus@linux.intel.com>
 <20190902083240.20367-11-sakari.ailus@linux.intel.com>
 <20190903130607.cf2qv3s3evobbd5g@pathway.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190903130607.cf2qv3s3evobbd5g@pathway.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>
Cc: rafael@kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Petr,

On Tue, Sep 03, 2019 at 03:06:07PM +0200, Petr Mladek wrote:
> On Mon 2019-09-02 11:32:39, Sakari Ailus wrote:
> > Add support for %pfw conversion specifier (with "f" and "P" modifiers) to
> > support printing full path of the node, including its name ("f") and only
> > the node's name ("P") in the printk family of functions. The two flags
> > have equivalent functionality to existing %pOF with the same two modifiers
> > ("f" and "P") on OF based systems. The ability to do the same on ACPI
> > based systems is added by this patch.
> > diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> > index 922a29eb70e6c..abba210f67567 100644
> > --- a/Documentation/core-api/printk-formats.rst
> > +++ b/Documentation/core-api/printk-formats.rst
> > @@ -418,6 +418,30 @@ Examples::
> >  
> >  Passed by reference.
> >  
> > +Fwnode handles
> > +--------------
> > +
> > +::
> > +
> > +	%pfw[fP]
> > +
> > +For printing information on fwnode handles. The default is to print the full
> > +node name, including the path. The modifiers are functionally equivalent to
> > +%pOF above.
> > +
> > +	- f - full name of the node, including the path
> > +	- P - the name of the node including an address (if there is one)
> > +
> > +Examples (ACPI):
> 
> s/:/::/ for the .rst formar.

Fixed both.

> 
> > +
> > +	%pfwf	\_SB.PCI0.CIO2.port@1.endpoint@0	- Full node name
> > +	%pfwP	endpoint@0				- Node name
> > +
> > +Examples (OF):
> 
> Same here.
> 
> > +
> > +	%pfwf	/ocp@68000000/i2c@48072000/camera@10/port/endpoint - Full name
> > +	%pfwP	endpoint				- Node name
> > +
> >  Time and date (struct rtc_time)
> >  -------------------------------
> >  
> > diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> > index 4ad9332d54ba6..b9b4c835db063 100644
> > --- a/lib/vsprintf.c
> > +++ b/lib/vsprintf.c
> > @@ -1981,6 +1981,36 @@ char *device_node_string(char *buf, char *end, struct device_node *dn,
> >  	return widen_string(buf, buf - buf_start, end, spec);
> >  }
> >  
> > +static noinline_for_stack
> > +char *fwnode_string(char *buf, char *end, struct fwnode_handle *fwnode,
> > +		    struct printf_spec spec, const char *fmt)
> > +{
> > +	struct printf_spec str_spec = spec;
> > +	char *buf_start = buf;
> > +
> > +	str_spec.field_width = -1;
> > +
> > +	if (*fmt != 'w')
> > +		return error_string(buf, end, "(%pfw?)", spec);

This should have been:

		return error_string(buf, end, "(%pf?)", spec);

I'll address that for v6.

> 
> This means that only "%pfw" will dereference the pointer by
> fwnode_full_name_string() or fwnode_get_name(). All the other
> eventual misuses of the obsolete %pf format will result in this
> error message.
> 
> OK, it is hard to imagine using "%pf" to get symbol name and always add
> 'w' suffix. Therefore it looks that reusing the obsolete %pf format
> modifier is pretty safe after all.
> 
> 
> > +	if (check_pointer(&buf, end, fwnode, spec))
> > +		return buf;
> > +
> > +	fmt++;
> > +
> > +	switch (*fmt) {
> > +	case 'f':	/* full_name */
> > +	default:
> 
> Using default: in the middle of switch might cause a lot of confusion.
> Please, make it the last label.

Fixed.

> 
> 
> > +		buf = fwnode_full_name_string(fwnode, buf, end);
> > +		break;
> > +	case 'P':	/* name */
> > +		buf = string(buf, end, fwnode_get_name(fwnode), str_spec);
> > +		break;
> > +	}
> > +
> > +	return widen_string(buf, buf - buf_start, end, spec);
> > +}
> > +
> >  /*
> >   * Show a '%p' thing.  A kernel extension is that the '%p' is followed
> >   * by an extra set of alphanumeric characters that are extended format
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index a60c241112cd4..8df50911ff4e9 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -5995,7 +5995,8 @@ sub process {
> >  				while ($fmt =~ /(\%[\*\d\.]*p(\w))/g) {
> >  					$specifier = $1;
> >  					$extension = $2;
> > -					if ($extension !~ /[SsBKRraEhMmIiUDdgVCbGNOxt]/) {
> > +					if ($extension !~ /[SsBKRraEhMmIiUDdgVCbGNOxtf]/ ||
> > +					    $extension =~ /^f[^w]/) {
> 
> This does not work. $extension seems to have only one character.

Good catch. \w indeed matches a single letter; I'll change that to \w+ and
change the other uses accordingly.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
