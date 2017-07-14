From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] fdt: Allow stacked overlays phandle references
Date: Fri, 14 Jul 2017 14:56:37 +0300
Message-ID: <1500033397.19864.32.camel@hp800z>
References: <1499894659-25775-1-git-send-email-pantelis.antoniou@konsulko.com>
         <1499894659-25775-2-git-send-email-pantelis.antoniou@konsulko.com>
         <20170714102258.GE17539@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170714102258.GE17539-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi David,

On Fri, 2017-07-14 at 20:22 +1000, David Gibson wrote:
> On Thu, Jul 13, 2017 at 12:24:18AM +0300, Pantelis Antoniou wrote:
> > This patch enables an overlay to refer to a previous overlay's
> > labels by performing a merge of symbol information at application
> > time.
> > 
> > In a nutshell it allows an overlay to refer to a symbol that a previous
> > overlay has defined. It requires both the base and all the overlays
> > to be compiled with the -@ command line switch so that symbol
> > information is included.
> > 
> > base.dts
> > --------
> > 
> > 	/dts-v1/;
> > 	/ {
> > 		foo: foonode {
> > 			foo-property;
> > 		};
> > 	};
> > 
> > 	$ dtc -@ -I dts -O dtb -o base.dtb base.dts
> > 
> > bar.dts
> > -------
> > 
> > 	/dts-v1/;
> > 	/plugin/;
> > 	/ {
> > 		fragment@1 {
> > 			target = <&foo>;
> > 			__overlay__ {
> > 				overlay-1-property;
> > 				bar: barnode {
> > 					bar-property;
> > 				};
> > 			};
> > 		};
> > 	};
> > 
> > 	$ dtc -@ -I dts -O dtb -o bar.dtb bar.dts
> > 
> > baz.dts
> > -------
> > 
> > 	/dts-v1/;
> > 	/plugin/;
> > 	/ {
> > 		fragment@1 {
> > 			target = <&bar>;
> > 			__overlay__ {
> > 				overlay-2-property;
> > 				baz: baznode {
> > 					baz-property;
> > 				};
> > 			};
> > 		};
> > 	};
> > 
> > 	$ dtc -@ -I dts -O dtb -o baz.dtb baz.dts
> > 
> > Applying the overlays:
> > 
> > 	$ fdtoverlay -i base.dtb -o target.dtb bar.dtb baz.dtb
> > 
> > Dumping:
> > 
> > 	$ fdtdump target.dtb
> > 	/ {
> >             foonode {
> >                 overlay-1-property;
> >                 foo-property;
> >                 linux,phandle = <0x00000001>;
> >                 phandle = <0x00000001>;
> >                 barnode {
> >                     overlay-2-property;
> >                     phandle = <0x00000002>;
> >                     linux,phandle = <0x00000002>;
> >                     bar-property;
> >                     baznode {
> >                         phandle = <0x00000003>;
> >                         linux,phandle = <0x00000003>;
> >                         baz-property;
> >                     };
> >                 };
> >             };
> >             __symbols__ {
> >                 baz = "/foonode/barnode/baznode";
> >                 bar = "/foonode/barnode";
> >                 foo = "/foonode";
> >             };
> > 	};
> > 
> > Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > ---
> >  .gitignore           |   1 +
> >  libfdt/fdt_overlay.c | 131 ++++++++++++++++++++++++++++++++++++++++++++++++++-
> >  2 files changed, 131 insertions(+), 1 deletion(-)
> > 
> > diff --git a/.gitignore b/.gitignore
> > index 545b899..f333c28 100644
> > --- a/.gitignore
> > +++ b/.gitignore
> > @@ -15,3 +15,4 @@ lex.yy.c
> >  /fdtput
> >  /patches
> >  /.pc
> > +/fdtoverlay
> > diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> > index ceb9687..fb17ef2 100644
> > --- a/libfdt/fdt_overlay.c
> > +++ b/libfdt/fdt_overlay.c
> > @@ -590,7 +590,7 @@ static int overlay_apply_node(void *fdt, int target,
> >   *
> >   * overlay_merge() merges an overlay into its base device tree.
> >   *
> > - * This is the final step in the device tree overlay application
> > + * This is the next to last step in the device tree overlay application
> >   * process, when all the phandles have been adjusted and resolved and
> >   * you just have to merge overlay into the base device tree.
> >   *
> > @@ -630,6 +630,131 @@ static int overlay_merge(void *fdt, void *fdto)
> >  	return 0;
> >  }
> >  
> > +/**
> > + * overlay_symbol_update - Update the symbols of base tree after a merge
> > + * @fdt: Base Device Tree blob
> > + * @fdto: Device tree overlay blob
> > + *
> > + * overlay_symbol_update() updates the symbols of the base tree with the
> > + * symbols of the applied overlay
> > + *
> > + * This is the last step in the device tree overlay application
> > + * process, allowing the reference of overlay symbols by subsequent
> > + * overlay operations.
> > + *
> > + * returns:
> > + *      0 on success
> > + *      Negative error code on failure
> > + */
> > +static int overlay_symbol_update(void *fdt, void *fdto)
> > +{
> > +	int root_sym, ov_sym, prop, path_len, fragment, target;
> > +	int len, frag_name_len, ret, rel_path_len;
> > +	const char *s;
> > +	const char *path;
> > +	const char *name;
> > +	const char *frag_name;
> > +	const char *rel_path;
> > +	char *buf;
> > +	void *p;
> > +
> > +	root_sym = fdt_subnode_offset(fdt, 0, "__symbols__");
> > +	ov_sym = fdt_subnode_offset(fdto, 0, "__symbols__");
> > +
> > +	/* if neither exist we can't update symbols, but that's OK */
> > +	if (root_sym < 0 || ov_sym < 0)
> > +		return 0;
> 
> This isn't correct.  If ov_sym isn't there, then indeed there is
> nothing to do, but if root_sym is not there, you should create it.
> 

OK, although in practice there is almost no chance that a valid tree
blob will contain no symbols.

> > +
> > +	/* iterate over each overlay symbol */
> > +	fdt_for_each_property_offset(prop, fdto, ov_sym) {
> > +
> 
> Stray blank line.
> 
> > +		path = fdt_getprop_by_offset(fdto, prop, &name, &path_len);
> > +		if (!path)
> > +			return path_len;
> > +
> > +		/* skip autogenerated properties */
> 
> Comment isn't correct.  *Everything* in __symbols__ will typically be
> autogenerated.  'name' probably is a special case, but I'm a bit
> surprised it's there anyway, I though we only generated that for
> really old dtb versions.
> 

The comment is valid; there are auto generated properties and name is
one of them. Overlays should work even on really old dtb versions.

> > +		if (!strcmp(name, "name"))
> > +			continue;
> > +
> > +		/* format: /<fragment-name>/__overlay__/<relative-subnode-path> */
> > +
> > +		if (*path != '/')
> > +			return -FDT_ERR_BADVALUE;
> > +
> > +		/* get fragment name first */
> > +		s = strchr(path + 1, '/');
> > +		if (!s)
> > +			return -FDT_ERR_BADVALUE;
> > +
> > +		frag_name = path + 1;
> > +		frag_name_len = s - path - 1;
> > +
> > +		/* verify format */
> > +		len = strlen("/__overlay__/");
> > +		if (strncmp(s, "/__overlay__/", len))
> > +			return -FDT_ERR_NOTFOUND;
> 
> This isn't correct, you're assuming the property is nul terminated
> (which it should be, but you can't count on).  Instead you should
> compare path_len versus the length of /__overlay__/, then you can just
> memcmp() to see if the right thing is there.
> 

OK, but could only happen on really badly formatted (even maliciously
so) properties.
 
> > +
> > +		rel_path = s + len;
> > +		rel_path_len = strlen(rel_path);
> 
> Again, this should be determined from path_len, not using strlen.
> That said, it might be worth doing a memchr() to make sure there
> aren't stray \0s in the path.
> 

OK

> > +
> > +		/* find the fragment index in which the symbol lies */
> > +		fdt_for_each_subnode(fragment, fdto, 0) {
> > +
> > +			s = fdt_get_name(fdto, fragment, &len);
> > +			if (!s)
> > +				continue;
> > +
> > +			/* name must match */
> > +			if (len == frag_name_len && !memcmp(s, frag_name, len))
> > +				break;
> > +		}
> > +
> > +		/* not found? */
> > +		if (fragment < 0)
> > +			return -FDT_ERR_NOTFOUND;
> 
> The entire loop above can be replaced with an
> fdt_subnode_offset_namelen().
> 

OK

> > +
> > +		/* an __overlay__ subnode must exist */
> > +		ret = fdt_subnode_offset(fdto, fragment, "__overlay__");
> > +		if (ret < 0)
> > +			return ret;
> 
> NOTFOUND is probably not the error code you want in this context.
> 

OK

> > +
> > +		/* get the target of the fragment */
> > +		ret = overlay_get_target(fdt, fdto, fragment);
> > +		if (ret < 0)
> > +			return ret;
> 
> An error here should probably be translated to FDT_ERR_INTERNAL, since
> we've already verified the targets of each fragment can be resolved
> earlier in the application process.
> 

OK

> > +		target = ret;
> > +
> > +		len = fdt_get_path_len(fdt, target);
> > +
> > +		ret = fdt_setprop_alloc(fdt, root_sym, name,
> > +				len + (len > 1) + rel_path_len + 1, &p);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		/* again in case setprop_alloc changed it */
> > +		ret = overlay_get_target(fdt, fdto, fragment);
> > +		if (ret < 0)
> > +			return ret;
> > +		target = ret;
> > +
> > +		buf = p;
> > +		if (len > 1) { /* target is not root */
> > +			ret = fdt_get_path(fdt, target, buf, len + 1);
> > +			if (ret < 0)
> > +				return ret;
> > +
> > +		} else
> > +			len--;
> > +
> > +		buf[len] = '/';
> > +		memcpy(buf + len + 1, rel_path, rel_path_len);
> > +		buf[len + 1 + rel_path_len] = '\0';
> 
> You know (or rather, you can and should verify) that the rel_path is
> \0 terminated, so you can copy the \0 in the same memcpy() rather than
> adding it extra.
> 

OK

> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  int fdt_overlay_apply(void *fdt, void *fdto)
> >  {
> >  	uint32_t delta = fdt_get_max_phandle(fdt);
> > @@ -654,6 +779,10 @@ int fdt_overlay_apply(void *fdt, void *fdto)
> >  	if (ret)
> >  		goto err;
> >  
> > +	ret = overlay_symbol_update(fdt, fdto);
> > +	if (ret)
> > +		goto err;
> > +
> >  	/*
> >  	 * The overlay has been damaged, erase its magic.
> >  	 */
> 

Regards

-- Pantelis
