Return-Path: <gpkulkarni@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20140730154626.GD20162@leverpostej>
References: <1406732794-20920-1-git-send-email-rric@kernel.org>
	<1406732794-20920-3-git-send-email-rric@kernel.org>
	<20140730154626.GD20162@leverpostej>
Date: Thu, 31 Jul 2014 14:11:10 +0530
Message-ID: <CAFpQJXWKybVUxpHg8MVrVMjLj3swuxLGo_9r1tL+gZ4hxUHTzQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64, thunder: Add initial dts for Cavium Thunder SoC
From: Ganapatrao Kulkarni <gpkulkarni@gmail.com>
Content-Type: multipart/alternative; boundary=047d7bd74e3608f51304ff793cf9
To: Mark Rutland <mark.rutland@arm.com>
Cc: Robert Richter <rric@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Robert Richter <rrichter@cavium.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Radha Mohan Chintakuntla <rchintakuntla@cavium.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-ID: <devicetree@vger.kernel.org>

--047d7bd74e3608f51304ff793cf9
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 30, 2014 at 9:16 PM, Mark Rutland <mark.rutland@arm.com> wrote:

> Hi,
>
> On Wed, Jul 30, 2014 at 04:06:31PM +0100, Robert Richter wrote:
> > From: Radha Mohan Chintakuntla <rchintakuntla@cavium.com>
> >
> > Add initial device tree nodes for Cavium Thunder SoCs with support of
> > 48 cores and gicv3. The dts file requires further changes, esp. for
> > pci, gicv3-its and smmu. This changes will be added later together
> > with the device drivers.
> >
> > Signed-off-by: Radha Mohan Chintakuntla <rchintakuntla@cavium.com>
> > Signed-off-by: Robert Richter <rrichter@cavium.com>
> > ---
> >  arch/arm64/boot/dts/Makefile         |   1 +
> >  arch/arm64/boot/dts/thunder-88xx.dts | 387
> +++++++++++++++++++++++++++++++++++
> >  2 files changed, 388 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/thunder-88xx.dts
> >
> > diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
> > index c52bdb051f66..f8001a62029c 100644
> > --- a/arch/arm64/boot/dts/Makefile
> > +++ b/arch/arm64/boot/dts/Makefile
> > @@ -1,3 +1,4 @@
> > +dtb-$(CONFIG_ARCH_THUNDER) += thunder-88xx.dtb
> >  dtb-$(CONFIG_ARCH_VEXPRESS) += rtsm_ve-aemv8a.dtb foundation-v8.dtb
> >  dtb-$(CONFIG_ARCH_XGENE) += apm-mustang.dtb
> >
> > diff --git a/arch/arm64/boot/dts/thunder-88xx.dts
> b/arch/arm64/boot/dts/thunder-88xx.dts
> > new file mode 100644
> > index 000000000000..4cf20ac9138b
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/thunder-88xx.dts
> > @@ -0,0 +1,387 @@
> > +/*
> > + * Cavium Thunder DTS file
> > + *
> > + * Copyright (C) 2013, Cavium Inc.
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License as
> > + * published by the Free Software Foundation; either version 2 of
> > + * the License, or (at your option) any later version.
> > + */
> > +/dts-v1/;
> > +
> > +/* Reserving first 12MB of DDR for firmware */
> > +/memreserve/ 0x00000000 0x00c00000;
>
> What exactly is this memreserve intended to protect at runtime?
> Yes, this 12 MB is reserved for ATF and UEFI boot and run-time services.
>


> The only item of runtime firmware I see in use below is PSCI on the
> secure side.
>
> How is the kernel booted on this platform? UEFI?
>
Boot sequence tried is ATF->UEFI->Linux  and ATF->UEFI->GRUB->Linux


> > +/ {
> > +     model = "Cavium ThunderX CN88XX Family";
> > +     compatible = "cavium,thunder-88xx";
>
> Please don't use wildcards in compatible strings. Give this an absolute
> name, and override as necessary.
>
> > +     interrupt-parent = <&gic0>;
> > +     #address-cells = <2>;
> > +     #size-cells = <2>;
> > +
> > +     aliases {
> > +             serial0 = &uaa0;
> > +             serial1 = &uaa1;
> > +     };
> > +
> > +     psci {
> > +             compatible = "arm,psci-0.2";
> > +             method = "smc";
> > +     };
>
> Nice!
>
> > +
> > +     cpus {
> > +             #address-cells = <2>;
> > +             #size-cells = <0>;
> > +
> > +             cpu@000 {
> > +                     device_type = "cpu";
> > +                     compatible = "cavium,thunder", "arm,armv8";
> > +                     reg = <0x0 0x000>;
> > +                     enable-method = "psci";
> > +             };
>
> Just to check: both the SoC and CPU are called thunder?
>
> [...]
>
> > +
> > +     memory@00000000 {
> > +             device_type = "memory";
> > +             reg = <0x0 0x00000000 0x0 0x80000000>;
> > +     };
> > +
> > +     gic0: interrupt-controller@801000000000 {
>
> To make this easier to read, please place a comma between 32-bit
> portions of the unit address (e.g. here have 8010,00000000).
>
> > +             compatible = "arm,gic-v3";
> > +             #interrupt-cells = <3>;
> > +             #address-cells = <2>;
> > +             #size-cells = <2>;
> > +             ranges;
>
> This has no children, so why have ranges, #address-cells, and
> #size-cells?
>
> > +             interrupt-controller;
> > +             reg = <0x8010 0x00000000 0x0 0x010000>, /* GICD */
> > +                   <0x8010 0x80000000 0x0 0x200000>; /* GICR */
> > +             interrupts = <1 9 0xf04>;
> > +     };
> > +
> > +     timer {
> > +             compatible = "arm,armv8-timer";
> > +             interrupts = <1 13 0xff01>,
> > +                          <1 14 0xff01>,
> > +                          <1 11 0xff01>,
> > +                          <1 10 0xff01>;
> > +     };
> > +
> > +     soc {
> > +             compatible = "simple-bus";
> > +             #address-cells = <2>;
> > +             #size-cells = <2>;
> > +             ranges;
> > +
> > +             clocks {
> > +                     #address-cells = <2>;
> > +                     #size-cells = <2>;
> > +                     ranges;
> > +
> > +                     refclk50mhz: refclk50mhz {
> > +                             compatible = "fixed-clock";
> > +                             #clock-cells = <0>;
> > +                             clock-frequency = <50000000>;
> > +                             clock-output-names = "refclk50mhz";
> > +                     };
> > +             };
>
> Please get rid of the clocks node and just put the clocks here.
>
> > +
> > +             uaa0: serial@87e024000000 {
> > +                     compatible = "arm,pl011", "arm,primecell";
> > +                     reg = <0x87e0 0x24000000 0x0 0x1000>;
> > +                     interrupts = <1 21 4>;
> > +                     clocks = <&refclk50mhz>;
> > +                     clock-names = "apb_pclk";
>
> Is this actually the apb_pclk, or is the the uartclk? I assume it's the
> latter.
>
> > +             };
> > +
> > +             uaa1: serial@87e025000000 {
> > +                     compatible = "arm,pl011", "arm,primecell";
> > +                     reg = <0x87e0 0x25000000 0x0 0x1000>;
> > +                     interrupts = <1 22 4>;
> > +                     clocks = <&refclk50mhz>;
> > +                     clock-names = "apb_pclk";
>
> Similarly?
>
> Thanks,
> Mark.
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

thanks
Ganapat

--047d7bd74e3608f51304ff793cf9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, Jul 30, 2014 at 9:16 PM, Mark Rutland <span dir=3D"ltr">&lt=
;<a href=3D"mailto:mark.rutland@arm.com" target=3D"_blank">mark.rutland@arm=
.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<div><div class=3D"h5"><br>
On Wed, Jul 30, 2014 at 04:06:31PM +0100, Robert Richter wrote:<br>
&gt; From: Radha Mohan Chintakuntla &lt;<a href=3D"mailto:rchintakuntla@cav=
ium.com">rchintakuntla@cavium.com</a>&gt;<br>
&gt;<br>
&gt; Add initial device tree nodes for Cavium Thunder SoCs with support of<=
br>
&gt; 48 cores and gicv3. The dts file requires further changes, esp. for<br=
>
&gt; pci, gicv3-its and smmu. This changes will be added later together<br>
&gt; with the device drivers.<br>
&gt;<br>
&gt; Signed-off-by: Radha Mohan Chintakuntla &lt;<a href=3D"mailto:rchintak=
untla@cavium.com">rchintakuntla@cavium.com</a>&gt;<br>
&gt; Signed-off-by: Robert Richter &lt;<a href=3D"mailto:rrichter@cavium.co=
m">rrichter@cavium.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0arch/arm64/boot/dts/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 1 +<br>
&gt; =C2=A0arch/arm64/boot/dts/thunder-88xx.dts | 387 +++++++++++++++++++++=
++++++++++++++<br>
&gt; =C2=A02 files changed, 388 insertions(+)<br>
&gt; =C2=A0create mode 100644 arch/arm64/boot/dts/thunder-88xx.dts<br>
&gt;<br>
&gt; diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefi=
le<br>
&gt; index c52bdb051f66..f8001a62029c 100644<br>
&gt; --- a/arch/arm64/boot/dts/Makefile<br>
&gt; +++ b/arch/arm64/boot/dts/Makefile<br>
&gt; @@ -1,3 +1,4 @@<br>
&gt; +dtb-$(CONFIG_ARCH_THUNDER) +=3D thunder-88xx.dtb<br>
&gt; =C2=A0dtb-$(CONFIG_ARCH_VEXPRESS) +=3D rtsm_ve-aemv8a.dtb foundation-v=
8.dtb<br>
&gt; =C2=A0dtb-$(CONFIG_ARCH_XGENE) +=3D apm-mustang.dtb<br>
&gt;<br>
&gt; diff --git a/arch/arm64/boot/dts/thunder-88xx.dts b/arch/arm64/boot/dt=
s/thunder-88xx.dts<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..4cf20ac9138b<br>
&gt; --- /dev/null<br>
&gt; +++ b/arch/arm64/boot/dts/thunder-88xx.dts<br>
&gt; @@ -0,0 +1,387 @@<br>
&gt; +/*<br>
&gt; + * Cavium Thunder DTS file<br>
&gt; + *<br>
&gt; + * Copyright (C) 2013, Cavium Inc.<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or<br>
&gt; + * modify it under the terms of the GNU General Public License as<br>
&gt; + * published by the Free Software Foundation; either version 2 of<br>
&gt; + * the License, or (at your option) any later version.<br>
&gt; + */<br>
&gt; +/dts-v1/;<br>
&gt; +<br>
&gt; +/* Reserving first 12MB of DDR for firmware */<br>
&gt; +/memreserve/ 0x00000000 0x00c00000;<br>
<br>
</div></div>What exactly is this memreserve intended to protect at runtime?=
<br>
Yes, this 12 MB is reserved for ATF and UEFI boot and run-time services.<br=
></blockquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">

The only item of runtime firmware I see in use below is PSCI on the<br>
secure side.<br>
<br>
How is the kernel booted on this platform? UEFI?<br></blockquote><div>Boot =
sequence tried is ATF-&gt;UEFI-&gt;Linux=C2=A0 and ATF-&gt;UEFI-&gt;GRUB-&g=
t;Linux=C2=A0 <br><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">

<div class=3D""><br>
&gt; +/ {<br>
&gt; + =C2=A0 =C2=A0 model =3D &quot;Cavium ThunderX CN88XX Family&quot;;<b=
r>
&gt; + =C2=A0 =C2=A0 compatible =3D &quot;cavium,thunder-88xx&quot;;<br>
<br>
</div>Please don&#39;t use wildcards in compatible strings. Give this an ab=
solute<br>
name, and override as necessary.<br>
<div class=3D""><br>
&gt; + =C2=A0 =C2=A0 interrupt-parent =3D &lt;&amp;gic0&gt;;<br>
&gt; + =C2=A0 =C2=A0 #address-cells =3D &lt;2&gt;;<br>
&gt; + =C2=A0 =C2=A0 #size-cells =3D &lt;2&gt;;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 aliases {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 serial0 =3D &amp;uaa0;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 serial1 =3D &amp;uaa1;<br>
&gt; + =C2=A0 =C2=A0 };<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 psci {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;arm,p=
sci-0.2&quot;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 method =3D &quot;smc&quot;=
;<br>
&gt; + =C2=A0 =C2=A0 };<br>
<br>
</div>Nice!<br>
<div class=3D""><br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 cpus {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #address-cells =3D &lt;2&g=
t;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-cells =3D &lt;0&gt;;=
<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu@000 {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 device_type =3D &quot;cpu&quot;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 compatible =3D &quot;cavium,thunder&quot;, &quot;arm,armv8&quot;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 reg =3D &lt;0x0 0x000&gt;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 enable-method =3D &quot;psci&quot;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
<br>
</div>Just to check: both the SoC and CPU are called thunder?<br>
<br>
[...]<br>
<div class=3D""><br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 memory@00000000 {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 device_type =3D &quot;memo=
ry&quot;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x0 0x00000000=
 0x0 0x80000000&gt;;<br>
&gt; + =C2=A0 =C2=A0 };<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 gic0: interrupt-controller@801000000000 {<br>
<br>
</div>To make this easier to read, please place a comma between 32-bit<br>
portions of the unit address (e.g. here have 8010,00000000).<br>
<div class=3D""><br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;arm,g=
ic-v3&quot;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #interrupt-cells =3D &lt;3=
&gt;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #address-cells =3D &lt;2&g=
t;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-cells =3D &lt;2&gt;;=
<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ranges;<br>
<br>
</div>This has no children, so why have ranges, #address-cells, and<br>
#size-cells?<br>
<div><div class=3D"h5"><br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupt-controller;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x8010 0x00000=
000 0x0 0x010000&gt;, /* GICD */<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;0=
x8010 0x80000000 0x0 0x200000&gt;; /* GICR */<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupts =3D &lt;1 9 0xf=
04&gt;;<br>
&gt; + =C2=A0 =C2=A0 };<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 timer {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;arm,a=
rmv8-timer&quot;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupts =3D &lt;1 13 0x=
ff01&gt;,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&lt;1 14 0xff01&gt;,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&lt;1 11 0xff01&gt;,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&lt;1 10 0xff01&gt;;<br>
&gt; + =C2=A0 =C2=A0 };<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 soc {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;simpl=
e-bus&quot;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #address-cells =3D &lt;2&g=
t;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-cells =3D &lt;2&gt;;=
<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ranges;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clocks {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 #address-cells =3D &lt;2&gt;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 #size-cells =3D &lt;2&gt;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ranges;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 refclk50mhz: refclk50mhz {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;fixed-clock&quot;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #clock-cells =3D &lt;0&gt;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock-frequency =3D &lt;50000000&gt;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock-output-names =3D &quot;refclk50mhz&qu=
ot;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 };<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
<br>
</div></div>Please get rid of the clocks node and just put the clocks here.=
<br>
<div class=3D""><br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uaa0: serial@87e024000000 =
{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 compatible =3D &quot;arm,pl011&quot;, &quot;arm,primecell&quot;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 reg =3D &lt;0x87e0 0x24000000 0x0 0x1000&gt;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 interrupts =3D &lt;1 21 4&gt;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 clocks =3D &lt;&amp;refclk50mhz&gt;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 clock-names =3D &quot;apb_pclk&quot;;<br>
<br>
</div>Is this actually the apb_pclk, or is the the uartclk? I assume it&#39=
;s the<br>
latter.<br>
<div class=3D""><br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uaa1: serial@87e025000000 =
{<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 compatible =3D &quot;arm,pl011&quot;, &quot;arm,primecell&quot;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 reg =3D &lt;0x87e0 0x25000000 0x0 0x1000&gt;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 interrupts =3D &lt;1 22 4&gt;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 clocks =3D &lt;&amp;refclk50mhz&gt;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 clock-names =3D &quot;apb_pclk&quot;;<br>
<br>
</div>Similarly?<br>
<br>
Thanks,<br>
Mark.<br>
<div class=3D""><div class=3D"h5"><br>
_______________________________________________<br>
linux-arm-kernel mailing list<br>
<a href=3D"mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kernel@li=
sts.infradead.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kernel" ta=
rget=3D"_blank">http://lists.infradead.org/mailman/listinfo/linux-arm-kerne=
l</a><br>
</div></div></blockquote></div><br></div><div class=3D"gmail_extra">thanks<=
br></div><div class=3D"gmail_extra">Ganapat<br><br></div></div>

--047d7bd74e3608f51304ff793cf9--
