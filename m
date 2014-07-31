Return-Path: <gpkulkarni@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20140731095336.GB21850@leverpostej>
References: <1406732794-20920-1-git-send-email-rric@kernel.org>
	<1406732794-20920-3-git-send-email-rric@kernel.org>
	<20140730154626.GD20162@leverpostej>
	<CAFpQJXWKybVUxpHg8MVrVMjLj3swuxLGo_9r1tL+gZ4hxUHTzQ@mail.gmail.com>
	<20140731095336.GB21850@leverpostej>
Date: Thu, 31 Jul 2014 16:42:33 +0530
Message-ID: <CAFpQJXUtP=v7FSLd3_OU7FG3w=pKYy2ihTQULA_DPEacsSu0Og@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64, thunder: Add initial dts for Cavium Thunder SoC
From: Ganapatrao Kulkarni <gpkulkarni@gmail.com>
Content-Type: multipart/alternative; boundary=047d7b10d2216d766604ff7b59c7
To: Mark Rutland <mark.rutland@arm.com>
Cc: Robert Richter <rric@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Robert Richter <rrichter@cavium.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Radha Mohan Chintakuntla <rchintakuntla@cavium.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-ID: <devicetree@vger.kernel.org>

--047d7b10d2216d766604ff7b59c7
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 31, 2014 at 3:23 PM, Mark Rutland <mark.rutland@arm.com> wrote:

> On Thu, Jul 31, 2014 at 09:41:10AM +0100, Ganapatrao Kulkarni wrote:
> >    On Wed, Jul 30, 2014 at 9:16 PM, Mark Rutland <[1]
> mark.rutland@arm.com>
> >    wrote:
> >
> >      Hi,
> >      On Wed, Jul 30, 2014 at 04:06:31PM +0100, Robert Richter wrote:
> >      > From: Radha Mohan Chintakuntla <[2]rchintakuntla@cavium.com>
> >      >
> >      > Add initial device tree nodes for Cavium Thunder SoCs with
> support of
> >      > 48 cores and gicv3. The dts file requires further changes, esp.
> for
> >      > pci, gicv3-its and smmu. This changes will be added later together
> >      > with the device drivers.
> >      >
> >      > Signed-off-by: Radha Mohan Chintakuntla <[3]
> rchintakuntla@cavium.com>
> >      > Signed-off-by: Robert Richter <[4]rrichter@cavium.com>
> >      > ---
> >      >  arch/arm64/boot/dts/Makefile         |   1 +
> >      >  arch/arm64/boot/dts/thunder-88xx.dts | 387
> >      +++++++++++++++++++++++++++++++++++
> >      >  2 files changed, 388 insertions(+)
> >      >  create mode 100644 arch/arm64/boot/dts/thunder-88xx.dts
> >      >
> >      > diff --git a/arch/arm64/boot/dts/Makefile
> >      b/arch/arm64/boot/dts/Makefile
> >      > index c52bdb051f66..f8001a62029c 100644
> >      > --- a/arch/arm64/boot/dts/Makefile
> >      > +++ b/arch/arm64/boot/dts/Makefile
> >      > @@ -1,3 +1,4 @@
> >      > +dtb-$(CONFIG_ARCH_THUNDER) += thunder-88xx.dtb
> >      >  dtb-$(CONFIG_ARCH_VEXPRESS) += rtsm_ve-aemv8a.dtb
> foundation-v8.dtb
> >      >  dtb-$(CONFIG_ARCH_XGENE) += apm-mustang.dtb
> >      >
> >      > diff --git a/arch/arm64/boot/dts/thunder-88xx.dts
> >      b/arch/arm64/boot/dts/thunder-88xx.dts
> >      > new file mode 100644
> >      > index 000000000000..4cf20ac9138b
> >      > --- /dev/null
> >      > +++ b/arch/arm64/boot/dts/thunder-88xx.dts
> >      > @@ -0,0 +1,387 @@
> >      > +/*
> >      > + * Cavium Thunder DTS file
> >      > + *
> >      > + * Copyright (C) 2013, Cavium Inc.
> >      > + *
> >      > + * This program is free software; you can redistribute it and/or
> >      > + * modify it under the terms of the GNU General Public License as
> >      > + * published by the Free Software Foundation; either version 2 of
> >      > + * the License, or (at your option) any later version.
> >      > + */
> >      > +/dts-v1/;
> >      > +
> >      > +/* Reserving first 12MB of DDR for firmware */
> >      > +/memreserve/ 0x00000000 0x00c00000;
> >
> >      What exactly is this memreserve intended to protect at runtime?
> >      Yes, this 12 MB is reserved for ATF and UEFI boot and run-time
> services.
>
> If booted as an EFI application Linux will use the UEFI memory map.
> Anything UEFI needs to have kept around will be marked as such, so
> there's no need to memreserve that.
>
> We are loading ATF and UEFI from flash(which is not XIP) within 12MB of
DDR.
 I dont see UEFI stub freeing RAM address where UEFI  image is loaded.



> I was under the impression that the ARM Trusted Firmware didn't need
> anything resident on the non-secure side, so I don't see why that needs
> a memreserve -- Linux should not be able to address anything it has
> resident.
>
We mark RAM used by ATF as secure-RAM, however we don't support
secure/non-secure address aliasing.
i.e, a DRAM address that can be referenced from both a secure PA and a
non-secure PA is not allowed.



>
> >      The only item of runtime firmware I see in use below is PSCI on the
> >      secure side.
> >
> >      How is the kernel booted on this platform? UEFI?
> >
> >    Boot sequence tried is ATF->UEFI->Linux  and ATF->UEFI->GRUB->Linux
>
> As I've just had it explained to me, in either of those cases we should
> enter Linux via the EFI stub. So we should be using the UEFI memory map
> regardless.
>
> Thanks,
> Mark.
>

--047d7b10d2216d766604ff7b59c7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Thu, Jul 31, 2014 at 3:23 PM, Mark Rutland <span dir=3D"ltr">&lt=
;<a href=3D"mailto:mark.rutland@arm.com" target=3D"_blank">mark.rutland@arm=
.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jul 31, 2014 at 0=
9:41:10AM +0100, Ganapatrao Kulkarni wrote:<br>
&gt; =C2=A0 =C2=A0On Wed, Jul 30, 2014 at 9:16 PM, Mark Rutland &lt;[1]<a h=
ref=3D"mailto:mark.rutland@arm.com">mark.rutland@arm.com</a>&gt;<br>
<div class=3D"">&gt; =C2=A0 =C2=A0wrote:<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0Hi,<br>
&gt; =C2=A0 =C2=A0 =C2=A0On Wed, Jul 30, 2014 at 04:06:31PM +0100, Robert R=
ichter wrote:<br>
</div>&gt; =C2=A0 =C2=A0 =C2=A0&gt; From: Radha Mohan Chintakuntla &lt;[2]<=
a href=3D"mailto:rchintakuntla@cavium.com">rchintakuntla@cavium.com</a>&gt;=
<br>
<div class=3D"">&gt; =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; Add initial device tree nodes for Cavium Thun=
der SoCs with support of<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; 48 cores and gicv3. The dts file requires fur=
ther changes, esp. for<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; pci, gicv3-its and smmu. This changes will be=
 added later together<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; with the device drivers.<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt;<br>
</div>&gt; =C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Radha Mohan Chintakuntla=
 &lt;[3]<a href=3D"mailto:rchintakuntla@cavium.com">rchintakuntla@cavium.co=
m</a>&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Robert Richter &lt;[4]<a href=
=3D"mailto:rrichter@cavium.com">rrichter@cavium.com</a>&gt;<br>
<div><div class=3D"h5">&gt; =C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0arch/arm64/boot/dts/Makefile =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A0 1 +<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0arch/arm64/boot/dts/thunder-88xx.dts | =
387<br>
&gt; =C2=A0 =C2=A0 =C2=A0+++++++++++++++++++++++++++++++++++<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; =C2=A02 files changed, 388 insertions(+)<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0create mode 100644 arch/arm64/boot/dts/=
thunder-88xx.dts<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; diff --git a/arch/arm64/boot/dts/Makefile<br>
&gt; =C2=A0 =C2=A0 =C2=A0b/arch/arm64/boot/dts/Makefile<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; index c52bdb051f66..f8001a62029c 100644<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; --- a/arch/arm64/boot/dts/Makefile<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; +++ b/arch/arm64/boot/dts/Makefile<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; @@ -1,3 +1,4 @@<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; +dtb-$(CONFIG_ARCH_THUNDER) +=3D thunder-88xx=
.dtb<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0dtb-$(CONFIG_ARCH_VEXPRESS) +=3D rtsm_v=
e-aemv8a.dtb foundation-v8.dtb<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0dtb-$(CONFIG_ARCH_XGENE) +=3D apm-musta=
ng.dtb<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; diff --git a/arch/arm64/boot/dts/thunder-88xx=
.dts<br>
&gt; =C2=A0 =C2=A0 =C2=A0b/arch/arm64/boot/dts/thunder-88xx.dts<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; new file mode 100644<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; index 000000000000..4cf20ac9138b<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; --- /dev/null<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; +++ b/arch/arm64/boot/dts/thunder-88xx.dts<br=
>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; @@ -0,0 +1,387 @@<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; +/*<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; + * Cavium Thunder DTS file<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; + *<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; + * Copyright (C) 2013, Cavium Inc.<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; + *<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; + * This program is free software; you can re=
distribute it and/or<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; + * modify it under the terms of the GNU Gene=
ral Public License as<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; + * published by the Free Software Foundation=
; either version 2 of<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; + * the License, or (at your option) any late=
r version.<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; + */<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; +/dts-v1/;<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; +/* Reserving first 12MB of DDR for firmware =
*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0&gt; +/memreserve/ 0x00000000 0x00c00000;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0What exactly is this memreserve intended to protec=
t at runtime?<br>
&gt; =C2=A0 =C2=A0 =C2=A0Yes, this 12 MB is reserved for ATF and UEFI boot =
and run-time services.<br>
<br>
</div></div>If booted as an EFI application Linux will use the UEFI memory =
map.<br>
Anything UEFI needs to have kept around will be marked as such, so<br>
there&#39;s no need to memreserve that.<br>
<br></blockquote><div>We are loading ATF and UEFI from flash(which is not X=
IP) within 12MB of DDR.<br>=C2=A0I dont see UEFI stub freeing RAM address w=
here UEFI=C2=A0 image is loaded.<br></div><div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">

I was under the impression that the ARM Trusted Firmware didn&#39;t need<br=
>
anything resident on the non-secure side, so I don&#39;t see why that needs=
<br>
a memreserve -- Linux should not be able to address anything it has<br>
resident.<br></blockquote><div>We mark RAM used by ATF as secure-RAM, howev=
er we don&#39;t support secure/non-secure address aliasing.<br>i.e, a DRAM =
address that can be referenced from both a secure PA and a non-secure PA is=
 not allowed.<br>
</div><div><br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<div class=3D""><br>
&gt; =C2=A0 =C2=A0 =C2=A0The only item of runtime firmware I see in use bel=
ow is PSCI on the<br>
&gt; =C2=A0 =C2=A0 =C2=A0secure side.<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0How is the kernel booted on this platform? UEFI?<b=
r>
&gt;<br>
&gt; =C2=A0 =C2=A0Boot sequence tried is ATF-&gt;UEFI-&gt;Linux=C2=A0 and A=
TF-&gt;UEFI-&gt;GRUB-&gt;Linux=C2=A0<br>
<br>
</div>As I&#39;ve just had it explained to me, in either of those cases we =
should<br>
enter Linux via the EFI stub. So we should be using the UEFI memory map<br>
regardless.<br>
<br>
Thanks,<br>
Mark.<br>
</blockquote></div><br></div></div>

--047d7b10d2216d766604ff7b59c7--
