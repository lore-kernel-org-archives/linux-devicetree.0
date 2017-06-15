From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/4] of: Custom printk format specifier for device node
Date: Thu, 15 Jun 2017 14:50:05 -0700
Message-ID: <1497563405.14396.17.camel@perches.com>
References: <20170614203025.7581-1-robh@kernel.org>
         <20170614203025.7581-4-robh@kernel.org>
         <1497473808.18751.70.camel@perches.com>
         <20170615212616.2uakwphhphkdds4g@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170615212616.2uakwphhphkdds4g@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2017-06-15 at 16:26 -0500, Rob Herring wrote:
> On Wed, Jun 14, 2017 at 01:56:48PM -0700, Joe Perches wrote:
> > On Wed, 2017-06-14 at 15:30 -0500, Rob Herring wrote:
> > > From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
[]
> > > diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> > > []
> > > @@ -1470,6 +1471,123 @@ char *flags_string(char *buf, char *end, void *flags_ptr, const char *fmt)
> > >  	return format_flags(buf, end, flags, names);
> > >  }
> > >  
> > > +static noinline_for_stack
> > > +char *device_node_gen_full_name(const struct device_node *np, char *buf, char *end)
> > > +{
> > > +	int len, ret;
> > > +
> > > +	if (!np || !np->parent)
> > > +		return buf;
> > > +
> > > +	buf = device_node_gen_full_name(np->parent, buf, end);
> > 
> > This is recursive.  How many levels of parents could there be?
> > Perhaps there should be a recursion limit.
> 
> Okay, unlike unflattening code, we can easily calculate the depth and 
> then allocate an array on the stack. So this is what I've ended up 
> with:
> 
> static int device_node_calc_depth(const struct device_node *np)
> {
> 	int d;
> 
> 	for (d = 0; np; d++)
> 		np = np->parent;
> 
> 	return d;
> }
> 
> static noinline_for_stack
> char *device_node_gen_full_name(const struct device_node *np, char *buf, char *end)
> {
> 	int i;
> 	int depth = device_node_calc_depth(np);
> 	const struct device_node *nodes[depth];
> 	const struct printf_spec strspec = {
> 		.field_width = -1,
> 		.precision = -1,
> 	};

static const struct printf_spec strspec = { etc...
and please move strspec above *nodes

> 
> 	if (!depth)
> 		return buf;
> 	/* special case for root node */
> 	if (depth == 1)
> 		return string(buf, end, "/", strspec);
> 
> 	depth--;
> 	for (i = depth - 1; i >= 0; i--) {
> 		nodes[i] = np;
> 		np = np->parent;
> 	}
> 	for (i = 0; i < depth; i++) {
> 		buf = string(buf, end, "/", strspec);
> 		buf = string(buf, end, kbasename(nodes[i]->full_name), strspec);
> 	}
> 	return buf;
> }

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
