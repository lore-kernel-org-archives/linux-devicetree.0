From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: a few simple questions about device tree content in the kernel
Date: Tue, 24 May 2016 12:04:40 +0100
Message-ID: <20160524110439.GB25374@leverpostej>
References: <alpine.LFD.2.20.1605240344210.28949@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.20.1605240344210.28949-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 24, 2016 at 04:09:58AM -0400, Robert P. J. Day wrote:
> 
>   first, a question about some code in drivers/of/base.c:
> 
>   void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
>   {
>         struct property *pp;
> 
>         of_aliases = of_find_node_by_path("/aliases");
>         of_chosen = of_find_node_by_path("/chosen");
>         if (of_chosen == NULL)
>                 of_chosen = of_find_node_by_path("/chosen@0");
> 
>         if (of_chosen) {
>                 /* linux,stdout-path and /aliases/stdout are for legacy compatibility */
>                 const char *name = of_get_property(of_chosen, "stdout-path", NULL);
>                 if (!name)
>                         name = of_get_property(of_chosen, "linux,stdout-path", NULL);
>                 if (IS_ENABLED(CONFIG_PPC) && !name)
>                         name = of_get_property(of_aliases, "stdout", NULL);
>                 if (name)
>                         of_stdout = of_find_node_opts_by_path(name, &of_stdout_options);
>         }
> 	... snip ...
> 
>   i can see up there that, first, "/chosen@0" is clearly an equivalent
> name (for backward compatibility?) for the "chosen" node, but if i
> scan the current kernel source tree, it seems absolutely no one is
> using it:
> 
> $ grep -r "chosen@0" *
> arch/powerpc/boot/oflib.c:		chosen = of_finddevice("/chosen@0");
> arch/microblaze/kernel/prom.c:				strcmp(uname, "chosen@0") == 0)) {
> drivers/of/base.c:		of_chosen = of_find_node_by_path("/chosen@0");
> drivers/of/fdt.c:		offset = fdt_path_offset(fdt, "/chosen@0");
> drivers/of/fdt.c:	    (strcmp(uname, "chosen") != 0 && strcmp(uname, "chosen@0") != 0))
> $
> 
> if this is a deprecated name for that node, now would seem to be a
> good time to toss it before someone gets a chance to resurrect it.

There are existing DTBs which are not in the kernel source tree (e.g.
where provided by FW on PPC platforms), which we support.

Just because a construct does not exist in an in-tree dts does not mean
we can remove support for it.

>   next (and in the same vein), the kernel code in
> drivers/cpufreq/cpufreq-dt.c accepts the older style property name
> "cpu0-supply":
> 
>   /* Try "cpu0" for older DTs */
>   if (!cpu) {
>           pp = of_find_property(np, "cpu0-supply", NULL);
>           if (pp) {
>                   name = "cpu0";
>                   goto node_put;
>           }
>   }
> 
>   pp = of_find_property(np, "cpu-supply", NULL);
>   if (pp) {
>           name = "cpu";
>           goto node_put;
>   }
> 
> strangely(?), the *only* architecture that still uses the older name
> in .dts and .dtsi files is ARM, where that property name is used quite
> extensively. is there something about ARM that seems to want to hang
> onto that older property name? just curious.

I suspect it was developeed on ARM platforms first, and no-one has
modified the dts files. As above, even if we did we would have to retain
the support code.

>   finally (for now), is there any reason to use numeric phandles
> rather than labels? i ask since someone responsible for putting
> together DTS files for a group of us handed us perfectly working
> iles, but they make use of numeric phandles:
> 
>                 i2c@3000 {
>                         device_type = "i2c";
>                         compatible = "fsl-i2c";
>                         reg = <0x3000 0x100>;
>                         interrupts = <0xe 0x8>;
>                         interrupt-parent = <700>;
>                         dfsrr;
>                 };
> 
>                 ... snip ...
> 
>                 pic@700 {
>                         linux,phandle = <700>;
> 
> is there any reason to use (in this case) the phandle of "700", rather
> than just adding a label to the pic@700 node and using that label?

There is no reason to if writing a dts file. Note that there are caveats
for _decompiled_ DTBs below!

> i'm not sure why someone would *prefer* to use numeric phandles.

I would guess that these dts files have simply been decompiled at some
stage.

Compiling dts to dtb results in each label being allocated a phandle,
and all references to that label being replaced with that phandle. Note
that this is a lossy process: the label text is lost, and there is no
metadata associated with wach phandle reference.

When decompiling from dtb to dts, we do not have sufficient information
to identify all phandle references (as they are just cells without any
special metadata), so must retain the specific phandle values such that
when re-compiling we don't break things.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
