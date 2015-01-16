From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 3/5] arm64: dts: Add support for Spreadtrum SC9836 SoC
 in dts and Makefile
Date: Fri, 16 Jan 2015 14:09:26 +0000
Message-ID: <20150116140926.GB22569@leverpostej>
References: <1421402411-3479-1-git-send-email-chunyan.zhang@spreadtrum.com>
 <1421402411-3479-4-git-send-email-chunyan.zhang@spreadtrum.com>
 <20150116103558.GD21809@leverpostej>
 <CA+H2tpGPKc8Gu=s+d4PnO=Wp_Uv=o338hxj_1opPRkZ3KZH+rw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CA+H2tpGPKc8Gu=s+d4PnO=Wp_Uv=o338hxj_1opPRkZ3KZH+rw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Orson Zhai <orsonzhai-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, marc.zyngier-5wv7dgnIgG8@public.gmane.org
Cc: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org" <gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "jslaby-AlSwsSmVLrQ@public.gmane.org" <jslaby-AlSwsSmVLrQ@public.gmane.org>, "jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org" <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org" <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "florian.vaussard-p8DiymsW2f8@public.gmane.org" <florian.vaussard-p8DiymsW2f8@public.gmane.org>, "andrew-g2DYL2Zd6BY@public.gmane.org" <andrew-g2DYL2Zd6BY@public.gmane.org>, "rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org" <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, "hytszk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <hytszk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 16, 2015 at 12:49:20PM +0000, Orson Zhai wrote:
> Hi, Mark,
> 
> On Fri, Jan 16, 2015 at 6:35 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> > On Fri, Jan 16, 2015 at 10:00:09AM +0000, Chunyan Zhang wrote:
> >> From: Zhizhou Zhang <zhizhou.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> >>
> >> Adds the device tree support for Spreadtrum SC9836 SoC which is based on
> >> Sharkl64 platform.
> >>
> >> Sharkl64 platform contains the common nodes of Spreadtrum's arm64-based SoCs.
> >>
> >> Signed-off-by: Zhizhou Zhang <zhizhou.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> >> Signed-off-by: Orson Zhai <orson.zhai-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> >> Signed-off-by: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> >> ---
> >>  arch/arm64/boot/dts/Makefile                  |    1 +
> >>  arch/arm64/boot/dts/sprd/Makefile             |    5 ++
> >>  arch/arm64/boot/dts/sprd/sc9836-openphone.dts |   49 +++++++++++++++++
> >>  arch/arm64/boot/dts/sprd/sc9836.dtsi          |   73 +++++++++++++++++++++++++
> >>  arch/arm64/boot/dts/sprd/sharkl64.dtsi        |   67 +++++++++++++++++++++++
> >>  5 files changed, 195 insertions(+)
> >>  create mode 100644 arch/arm64/boot/dts/sprd/Makefile
> >>  create mode 100644 arch/arm64/boot/dts/sprd/sc9836-openphone.dts
> >>  create mode 100644 arch/arm64/boot/dts/sprd/sc9836.dtsi
> >>  create mode 100644 arch/arm64/boot/dts/sprd/sharkl64.dtsi
> >
> > [...]
> >
> >> +     cpus {
> >> +             #address-cells = <2>;
> >> +             #size-cells = <0>;
> >> +
> >> +             cpu@0 {
> >> +                     device_type = "cpu";
> >> +                     compatible = "arm,cortex-a53", "arm,armv8";
> >> +                     reg = <0x0 0x0>;
> >> +                     enable-method = "psci";
> >> +             };
> >> +
> >> +             cpu@1 {
> >> +                     device_type = "cpu";
> >> +                     compatible = "arm,cortex-a53", "arm,armv8";
> >> +                     reg = <0x0 0x1>;
> >> +                     enable-method = "psci";
> >> +             };
> >> +
> >> +             cpu@2 {
> >> +                     device_type = "cpu";
> >> +                     compatible = "arm,cortex-a53", "arm,armv8";
> >> +                     reg = <0x0 0x2>;
> >> +                     enable-method = "psci";
> >> +             };
> >> +
> >> +             cpu@3 {
> >> +                     device_type = "cpu";
> >> +                     compatible = "arm,cortex-a53", "arm,armv8";
> >> +                     reg = <0x0 0x3>;
> >> +                     enable-method = "psci";
> >> +             };
> >> +     };
> >
> > Just to check, all CPUs may be hotplugged off and on, yes?
> >
> 
> Yes, I have tested with them successfully by looking into
> `/proc/interrupts` and `top` except CPU0.

Ok.

> > Including CPU0?
> >
> 
>  It returns "status busy" after I type the command below.

Is this while other CPUs are active, or after you've hotplugged out all
other CPUs? The latter is expected, but the former is not.

Are you able to hotplug CPU0 out and back in while other CPUs are
active

> > How is your implementation tested?
> >
> I build kernel image with 3.19-rc1 + this patchset and run into console.
> I use `echo 0 > /sys/devices/system/cpu[0-3]/online`
> 
> BTW, I run these on a real phone of sc9836 not fast-model as before.
> 
> > You boot CPUs at EL2?
> >
> 
> Yes, I have confirmed this when working around the BUG() in
> arch_counter_get_cntpct() introduced from 3.19.

Ah, good to hear.

> 
> >> +
> >> +     gic: interrupt-controller@12001000 {
> >> +             compatible = "arm,gic-400";
> >> +             #interrupt-cells = <3>;
> >> +             interrupt-controller;
> >> +             reg = <0 0x12001000 0 0x1000>,
> >> +                   <0 0x12002000 0 0x2000>,
> >> +                   <0 0x12004000 0 0x2000>,
> >> +                   <0 0x12006000 0 0x2000>;
> >> +     };
> >
> > You're missing the maintenance interrupt here.
> >
> 
> Do you mean to declare SGI like this ?
> 
> " interrupts = <1 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)> "

Something like that, yes. However the maintenance interrupt is wired up
in your system.

> 
> > [...]
> >
> >> diff --git a/arch/arm64/boot/dts/sprd/sharkl64.dtsi b/arch/arm64/boot/dts/sprd/sharkl64.dtsi
> >> new file mode 100644
> >> index 0000000..b08989d
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/sprd/sharkl64.dtsi
> >> @@ -0,0 +1,67 @@
> >> +/*
> >> + * Spreadtrum Sharkl64 platform DTS file
> >> + *
> >> + * Copyright (C) 2014, Spreadtrum Communications Inc.
> >> + *
> >> + * This file is licensed under a dual GPLv2 or X11 license.
> >> + */
> >> +
> >> +/ {
> >> +     interrupt-parent = <&gic>;
> >> +     #address-cells = <2>;
> >> +     #size-cells = <2>;
> >> +
> >> +     soc {
> >> +             compatible = "simple-bus";
> >> +             reg = <0x0 0x0 0x0 0x80000000>;
> >
> > What is this reg for? It's not required by simple-bus.
> >
> 
> It's added by me.
> I want to tell people the register range of what the bus covers, not
> for any drivers use.

My point is that it's not part of the binding, so shouldn't be there.

> for this example, It starts from address 0 to 0x80000000.
> Because Spreadtrum chip is very large with a lots of registers and matrix buses.

Ok.

> 
> > If you want to encode that this covers a particular portion of the
> > address space, do so with the ranges proeprty.
> 
> But I look up the ePAPER who says "The ranges property provides a
> means of defining a mapping or translation...".
> The bus here is flat-memory for all.

In this case you could have:

ranges = <0x0 0x0 0x0 0x0 0x0 0x80000000>;

Which would be a flat mapping for the range you care about.

> 
> >
> >> +             #address-cells = <2>;
> >> +             #size-cells = <2>;
> >> +             ranges;
> >> +
> >> +             ap_apb: apb@70000000 {
> >> +                     compatible = "simple-bus";
> >> +                     reg = <0x0 0x70000000 0x0 0x10000000>;

For this bus you could instead use addresses relative to the bus inside,
rather than absolute addresses, or you could have:

ranges = <0x0 0x70000000 0x0 0x70000000 0x0 0x10000000>;

> >
> > Likewise here.
> >
> 
> This initial patch is picked up from a very big dt file.
> There are several apb buses in this chip.

At the same level us the bus hierarchy?

> So I use apb@starting-address to separate them.
> But I remember another rule that the @address needs to equal  first
> address in property reg array.
> Do I have to delete @7000000 as well if i delete reg line?

Hmm. I'm not too keen on encoding a reg or unit-address here, because
the control interface of the bus isn't at that address. If we want to
add that later then the reg would be different in those cases. Given
there's no control interface here, there shouldn't be a reg or
unit-address.

Just ensure that the name before the unit-address is unique.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
