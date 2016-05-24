From: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Subject: a few simple questions about device tree content in the kernel
Date: Tue, 24 May 2016 04:09:58 -0400 (EDT)
Message-ID: <alpine.LFD.2.20.1605240344210.28949@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


  first, a question about some code in drivers/of/base.c:

  void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
  {
        struct property *pp;

        of_aliases = of_find_node_by_path("/aliases");
        of_chosen = of_find_node_by_path("/chosen");
        if (of_chosen == NULL)
                of_chosen = of_find_node_by_path("/chosen@0");

        if (of_chosen) {
                /* linux,stdout-path and /aliases/stdout are for legacy compatibility */
                const char *name = of_get_property(of_chosen, "stdout-path", NULL);
                if (!name)
                        name = of_get_property(of_chosen, "linux,stdout-path", NULL);
                if (IS_ENABLED(CONFIG_PPC) && !name)
                        name = of_get_property(of_aliases, "stdout", NULL);
                if (name)
                        of_stdout = of_find_node_opts_by_path(name, &of_stdout_options);
        }
	... snip ...

  i can see up there that, first, "/chosen@0" is clearly an equivalent
name (for backward compatibility?) for the "chosen" node, but if i
scan the current kernel source tree, it seems absolutely no one is
using it:

$ grep -r "chosen@0" *
arch/powerpc/boot/oflib.c:		chosen = of_finddevice("/chosen@0");
arch/microblaze/kernel/prom.c:				strcmp(uname, "chosen@0") == 0)) {
drivers/of/base.c:		of_chosen = of_find_node_by_path("/chosen@0");
drivers/of/fdt.c:		offset = fdt_path_offset(fdt, "/chosen@0");
drivers/of/fdt.c:	    (strcmp(uname, "chosen") != 0 && strcmp(uname, "chosen@0") != 0))
$

if this is a deprecated name for that node, now would seem to be a
good time to toss it before someone gets a chance to resurrect it.

  next (and in the same vein), the kernel code in
drivers/cpufreq/cpufreq-dt.c accepts the older style property name
"cpu0-supply":

  /* Try "cpu0" for older DTs */
  if (!cpu) {
          pp = of_find_property(np, "cpu0-supply", NULL);
          if (pp) {
                  name = "cpu0";
                  goto node_put;
          }
  }

  pp = of_find_property(np, "cpu-supply", NULL);
  if (pp) {
          name = "cpu";
          goto node_put;
  }

strangely(?), the *only* architecture that still uses the older name
in .dts and .dtsi files is ARM, where that property name is used quite
extensively. is there something about ARM that seems to want to hang
onto that older property name? just curious.

  finally (for now), is there any reason to use numeric phandles
rather than labels? i ask since someone responsible for putting
together DTS files for a group of us handed us perfectly working
iles, but they make use of numeric phandles:

                i2c@3000 {
                        device_type = "i2c";
                        compatible = "fsl-i2c";
                        reg = <0x3000 0x100>;
                        interrupts = <0xe 0x8>;
                        interrupt-parent = <700>;
                        dfsrr;
                };

                ... snip ...

                pic@700 {
                        linux,phandle = <700>;

is there any reason to use (in this case) the phandle of "700", rather
than just adding a label to the pic@700 node and using that label? i'm
not sure why someone would *prefer* to use numeric phandles.

  that's it for now, thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
