From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/5] arm64, thunder: Add initial dts for Cavium Thunder
 SoC
Date: Thu, 31 Jul 2014 12:33:01 +0100
Message-ID: <20140731113301.GE22994@leverpostej>
References: <1406732794-20920-1-git-send-email-rric@kernel.org>
 <1406732794-20920-3-git-send-email-rric@kernel.org>
 <20140730154626.GD20162@leverpostej>
 <CAFpQJXWKybVUxpHg8MVrVMjLj3swuxLGo_9r1tL+gZ4hxUHTzQ@mail.gmail.com>
 <20140731095336.GB21850@leverpostej>
 <CAFpQJXUtP=v7FSLd3_OU7FG3w=pKYy2ihTQULA_DPEacsSu0Og@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAFpQJXUtP=v7FSLd3_OU7FG3w=pKYy2ihTQULA_DPEacsSu0Og-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ganapatrao Kulkarni <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Radha Mohan Chintakuntla <rchintakuntla-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Please send plain text rather than HTML email; this is becoming painful
to reply to.

On Thu, Jul 31, 2014 at 12:12:33PM +0100, Ganapatrao Kulkarni wrote:
>    On Thu, Jul 31, 2014 at 3:23 PM, Mark Rutland <[1]mark.rutland@arm=
=2Ecom>
>    wrote:
>=20
>      On Thu, Jul 31, 2014 at 09:41:10AM +0100, Ganapatrao Kulkarni wr=
ote:
>      > =C2=A0 =C2=A0On Wed, Jul 30, 2014 at 9:16 PM, Mark Rutland
>      <[1][2]mark.rutland-5wv7dgnIgG8@public.gmane.org>
>      > =C2=A0 =C2=A0wrote:
>      >
>      > =C2=A0 =C2=A0 =C2=A0Hi,
>      > =C2=A0 =C2=A0 =C2=A0On Wed, Jul 30, 2014 at 04:06:31PM +0100, =
Robert Richter wrote:
>      > =C2=A0 =C2=A0 =C2=A0> From: Radha Mohan Chintakuntla <[2][3]rc=
hintakuntla-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>      > =C2=A0 =C2=A0 =C2=A0>
>      > =C2=A0 =C2=A0 =C2=A0> Add initial device tree nodes for Cavium=
 Thunder SoCs with
>      support of
>      > =C2=A0 =C2=A0 =C2=A0> 48 cores and gicv3. The dts file require=
s further changes, esp.
>      for
>      > =C2=A0 =C2=A0 =C2=A0> pci, gicv3-its and smmu. This changes wi=
ll be added later
>      together
>      > =C2=A0 =C2=A0 =C2=A0> with the device drivers.
>      > =C2=A0 =C2=A0 =C2=A0>
>      > =C2=A0 =C2=A0 =C2=A0> Signed-off-by: Radha Mohan Chintakuntla
>      <[3][4]rchintakuntla-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>      > =C2=A0 =C2=A0 =C2=A0> Signed-off-by: Robert Richter <[4][5]rri=
chter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>      > =C2=A0 =C2=A0 =C2=A0> ---
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0arch/arm64/boot/dts/Makefile =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 1 +
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0arch/arm64/boot/dts/thunder-88xx.d=
ts | 387
>      > =C2=A0 =C2=A0 =C2=A0+++++++++++++++++++++++++++++++++++
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A02 files changed, 388 insertions(+)
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0create mode 100644 arch/arm64/boot=
/dts/thunder-88xx.dts
>      > =C2=A0 =C2=A0 =C2=A0>
>      > =C2=A0 =C2=A0 =C2=A0> diff --git a/arch/arm64/boot/dts/Makefil=
e
>      > =C2=A0 =C2=A0 =C2=A0b/arch/arm64/boot/dts/Makefile
>      > =C2=A0 =C2=A0 =C2=A0> index c52bdb051f66..f8001a62029c 100644
>      > =C2=A0 =C2=A0 =C2=A0> --- a/arch/arm64/boot/dts/Makefile
>      > =C2=A0 =C2=A0 =C2=A0> +++ b/arch/arm64/boot/dts/Makefile
>      > =C2=A0 =C2=A0 =C2=A0> @@ -1,3 +1,4 @@
>      > =C2=A0 =C2=A0 =C2=A0> +dtb-$(CONFIG_ARCH_THUNDER) +=3D thunder=
-88xx.dtb
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0dtb-$(CONFIG_ARCH_VEXPRESS) +=3D r=
tsm_ve-aemv8a.dtb
>      foundation-v8.dtb
>      > =C2=A0 =C2=A0 =C2=A0> =C2=A0dtb-$(CONFIG_ARCH_XGENE) +=3D apm-=
mustang.dtb
>      > =C2=A0 =C2=A0 =C2=A0>
>      > =C2=A0 =C2=A0 =C2=A0> diff --git a/arch/arm64/boot/dts/thunder=
-88xx.dts
>      > =C2=A0 =C2=A0 =C2=A0b/arch/arm64/boot/dts/thunder-88xx.dts
>      > =C2=A0 =C2=A0 =C2=A0> new file mode 100644
>      > =C2=A0 =C2=A0 =C2=A0> index 000000000000..4cf20ac9138b
>      > =C2=A0 =C2=A0 =C2=A0> --- /dev/null
>      > =C2=A0 =C2=A0 =C2=A0> +++ b/arch/arm64/boot/dts/thunder-88xx.d=
ts
>      > =C2=A0 =C2=A0 =C2=A0> @@ -0,0 +1,387 @@
>      > =C2=A0 =C2=A0 =C2=A0> +/*
>      > =C2=A0 =C2=A0 =C2=A0> + * Cavium Thunder DTS file
>      > =C2=A0 =C2=A0 =C2=A0> + *
>      > =C2=A0 =C2=A0 =C2=A0> + * Copyright (C) 2013, Cavium Inc.
>      > =C2=A0 =C2=A0 =C2=A0> + *
>      > =C2=A0 =C2=A0 =C2=A0> + * This program is free software; you c=
an redistribute it
>      and/or
>      > =C2=A0 =C2=A0 =C2=A0> + * modify it under the terms of the GNU=
 General Public License
>      as
>      > =C2=A0 =C2=A0 =C2=A0> + * published by the Free Software Found=
ation; either version 2
>      of
>      > =C2=A0 =C2=A0 =C2=A0> + * the License, or (at your option) any=
 later version.
>      > =C2=A0 =C2=A0 =C2=A0> + */
>      > =C2=A0 =C2=A0 =C2=A0> +/dts-v1/;
>      > =C2=A0 =C2=A0 =C2=A0> +
>      > =C2=A0 =C2=A0 =C2=A0> +/* Reserving first 12MB of DDR for firm=
ware */
>      > =C2=A0 =C2=A0 =C2=A0> +/memreserve/ 0x00000000 0x00c00000;
>      >
>      > =C2=A0 =C2=A0 =C2=A0What exactly is this memreserve intended t=
o protect at runtime?
>      > =C2=A0 =C2=A0 =C2=A0Yes, this 12 MB is reserved for ATF and UE=
=46I boot and run-time
>      services.
>=20
>      If booted as an EFI application Linux will use the UEFI memory m=
ap.
>      Anything UEFI needs to have kept around will be marked as such, =
so
>      there's no need to memreserve that.
>=20
>    We are loading ATF and UEFI from flash(which is not XIP) within 12=
MB of
>    DDR.
>    =C2=A0I dont see UEFI stub freeing RAM address where UEFI=C2=A0 im=
age is loaded.

Therefore we don't need the memreserve, then?

>      I was under the impression that the ARM Trusted Firmware didn't =
need
>      anything resident on the non-secure side, so I don't see why tha=
t needs
>      a memreserve -- Linux should not be able to address anything it =
has
>      resident.
>=20
>    We mark RAM used by ATF as secure-RAM, however we don't support
>    secure/non-secure address aliasing.
>    i.e, a DRAM address that can be referenced from both a secure PA a=
nd a
>    non-secure PA is not allowed.

What exactly do you mean by "not allowed"?

If Linux maps that memory, what happens?

What if Linux tried to read or write to it?

If Linux should not map that memory, it should not be described in the
memory map to begin with.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
