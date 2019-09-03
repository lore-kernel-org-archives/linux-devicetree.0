From: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH v5 09/11] lib/vsprintf: OF nodes are first and foremost,
 struct device_nodes
Date: Tue, 3 Sep 2019 11:28:16 +0200
Message-ID: <20190903092816.qutqnjba7okcauim@pathway.suse.cz>
References: <20190902135732.23455-1-sakari.ailus@linux.intel.com>
 <20190902135732.23455-10-sakari.ailus@linux.intel.com>
 <20190903085233.oksjcwqwdxb53eig@pathway.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190903085233.oksjcwqwdxb53eig@pathway.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: rafael@kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue 2019-09-03 10:52:33, Petr Mladek wrote:
> On Mon 2019-09-02 16:57:30, Sakari Ailus wrote:
> > Factor out static kobject_string() function that simply calls
> > device_node_string(), and thus remove references to kobjects (as these are
> > struct device_node).
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  lib/vsprintf.c | 16 ++++------------
> >  1 file changed, 4 insertions(+), 12 deletions(-)
> > 
> > diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> > index a04a2167101ef..4ad9332d54ba6 100644
> > --- a/lib/vsprintf.c
> > +++ b/lib/vsprintf.c
> > @@ -1905,6 +1905,9 @@ char *device_node_string(char *buf, char *end, struct device_node *dn,
> >  	struct printf_spec str_spec = spec;
> >  	str_spec.field_width = -1;
> >  
> > +	if (fmt[0] != 'F')
> > +		return error_string(buf, end, "(%pO?)", spec);
> > +
> >  	if (!IS_ENABLED(CONFIG_OF))
> >  		return error_string(buf, end, "(%pOF?)", spec);
> >  
> > @@ -1978,17 +1981,6 @@ char *device_node_string(char *buf, char *end, struct device_node *dn,
> >  	return widen_string(buf, buf - buf_start, end, spec);
> >  }
> >  
> > -static char *kobject_string(char *buf, char *end, void *ptr,
> > -			    struct printf_spec spec, const char *fmt)
> > -{
> > -	switch (fmt[1]) {
> > -	case 'F':
> > -		return device_node_string(buf, end, ptr, spec, fmt + 1);
> > -	}
> > -
> > -	return error_string(buf, end, "(%pO?)", spec);
> > -}
> > -
> >  /*
> >   * Show a '%p' thing.  A kernel extension is that the '%p' is followed
> >   * by an extra set of alphanumeric characters that are extended format
> > @@ -2167,7 +2159,7 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
> >  	case 'G':
> >  		return flags_string(buf, end, ptr, spec, fmt);
> >  	case 'O':
> > -		return kobject_string(buf, end, ptr, spec, fmt);
> > +		return device_node_string(buf, end, ptr, spec, fmt + 1);
> 
> I know that this come from from kobject_string(). But please, modify
> it to follow the style used by other %p modifiers. I mean to pass
> "fmt" as is and then use:
> 
> 	if (fmt[1] != 'F')

Ah, I see that it would need more changes in device_node_string().
OK, let's leave the patch as is. I am sorry for the noise.

Best Regards,
Petr
