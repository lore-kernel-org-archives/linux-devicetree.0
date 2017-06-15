From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] of: Custom printk format specifier for device node
Date: Thu, 15 Jun 2017 16:26:16 -0500
Message-ID: <20170615212616.2uakwphhphkdds4g@rob-hp-laptop>
References: <20170614203025.7581-1-robh@kernel.org>
 <20170614203025.7581-4-robh@kernel.org>
 <1497473808.18751.70.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1497473808.18751.70.camel-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 14, 2017 at 01:56:48PM -0700, Joe Perches wrote:
> On Wed, 2017-06-14 at 15:30 -0500, Rob Herring wrote:
> > From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> 
> I think the commit subject is wrong.
> It adds an "of" specific bit to vsprintf.c.
> The subject should be
> 'vsprintf:  Add %p extension "%pO" for device tree'
> 
> > 90% of the usage of device node's full_name is printing it out
> > in a kernel message. Preparing for the eventual delayed allocation
> > introduce a custom printk format specifier that is both more
> > compact and more pleasant to the eye.
> > 
> > For instance typical use is:
> > 	pr_info("Frobbing node %s\n", node->full_name);
> > 
> > Which can be written now as:
> > 	pr_info("Frobbing node %pOF\n", node);
> 
> Somehow I think this example is poor as node->full_name
> is a pretty obvious to read use.  %pOF requires you to
> look up or know what the output is going to be.
> 
> > More fine-grained control of formatting includes printing the name,
> > flag, path-spec name, reference count and others, explained in the
> > documentation entry.
> > 
> > Originally written by Pantelis, but pretty much rewrote the core
> > function using existing string/number functions. The 2 passes were
> > unnecessary and have been removed. Also, updated the checkpatch.pl
> > check.
> 
> Some comments about the code.
> 
> > diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> > []
> > @@ -1470,6 +1471,123 @@ char *flags_string(char *buf, char *end, void *flags_ptr, const char *fmt)
> >  	return format_flags(buf, end, flags, names);
> >  }
> >  
> > +static noinline_for_stack
> > +char *device_node_gen_full_name(const struct device_node *np, char *buf, char *end)
> > +{
> > +	int len, ret;
> > +
> > +	if (!np || !np->parent)
> > +		return buf;
> > +
> > +	buf = device_node_gen_full_name(np->parent, buf, end);
> 
> This is recursive.  How many levels of parents could there be?
> Perhaps there should be a recursion limit.

Okay, unlike unflattening code, we can easily calculate the depth and 
then allocate an array on the stack. So this is what I've ended up 
with:

static int device_node_calc_depth(const struct device_node *np)
{
	int d;

	for (d = 0; np; d++)
		np = np->parent;

	return d;
}

static noinline_for_stack
char *device_node_gen_full_name(const struct device_node *np, char *buf, char *end)
{
	int i;
	int depth = device_node_calc_depth(np);
	const struct device_node *nodes[depth];
	const struct printf_spec strspec = {
		.field_width = -1,
		.precision = -1,
	};

	if (!depth)
		return buf;
	/* special case for root node */
	if (depth == 1)
		return string(buf, end, "/", strspec);

	depth--;
	for (i = depth - 1; i >= 0; i--) {
		nodes[i] = np;
		np = np->parent;
	}
	for (i = 0; i < depth; i++) {
		buf = string(buf, end, "/", strspec);
		buf = string(buf, end, kbasename(nodes[i]->full_name), strspec);
	}
	return buf;
}


> > +	/* simple case without anything any more format specifiers */
> > +	if (fmt[1] == '\0' || strcspn(fmt + 1,"fnpPFcCr") > 0)
> > +		fmt = "Ff";
> > +
> > +	for (fmtp = fmt + 1, pass = false; strspn(fmtp,"fnpPFcCr"); fmtp++, pass = true) {
> 
> why not
> 	while (isalpha(*++fmt))
> like ip6 or isalnum like FORMAT_TYPE_PTR uses?

This case is more complicated with the field separators. If we have 
something like %pOFfxyz where xyz are not valid format specifiers, we'd 
end up with extra field separators.

I did simplify things a bit and got rid of fmtp and just use fmt 
instead.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
