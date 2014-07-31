From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/5] arm64, thunder: Add initial dts for Cavium Thunder
 SoC
Date: Thu, 31 Jul 2014 10:53:36 +0100
Message-ID: <20140731095336.GB21850@leverpostej>
References: <1406732794-20920-1-git-send-email-rric@kernel.org>
 <1406732794-20920-3-git-send-email-rric@kernel.org>
 <20140730154626.GD20162@leverpostej>
 <CAFpQJXWKybVUxpHg8MVrVMjLj3swuxLGo_9r1tL+gZ4hxUHTzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAFpQJXWKybVUxpHg8MVrVMjLj3swuxLGo_9r1tL+gZ4hxUHTzQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ganapatrao Kulkarni <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Radha Mohan Chintakuntla <rchintakuntla-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 31, 2014 at 09:41:10AM +0100, Ganapatrao Kulkarni wrote:
>    On Wed, Jul 30, 2014 at 9:16 PM, Mark Rutland <[1]mark.rutland@arm=
=2Ecom>
>    wrote:
>=20
>      Hi,
>      On Wed, Jul 30, 2014 at 04:06:31PM +0100, Robert Richter wrote:
>      > From: Radha Mohan Chintakuntla <[2]rchintakuntla-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>      >
>      > Add initial device tree nodes for Cavium Thunder SoCs with sup=
port of
>      > 48 cores and gicv3. The dts file requires further changes, esp=
=2E for
>      > pci, gicv3-its and smmu. This changes will be added later toge=
ther
>      > with the device drivers.
>      >
>      > Signed-off-by: Radha Mohan Chintakuntla <[3]rchintakuntla@cavi=
um.com>
>      > Signed-off-by: Robert Richter <[4]rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>      > ---
>      > =C2=A0arch/arm64/boot/dts/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | =C2=A0 1 +
>      > =C2=A0arch/arm64/boot/dts/thunder-88xx.dts | 387
>      +++++++++++++++++++++++++++++++++++
>      > =C2=A02 files changed, 388 insertions(+)
>      > =C2=A0create mode 100644 arch/arm64/boot/dts/thunder-88xx.dts
>      >
>      > diff --git a/arch/arm64/boot/dts/Makefile
>      b/arch/arm64/boot/dts/Makefile
>      > index c52bdb051f66..f8001a62029c 100644
>      > --- a/arch/arm64/boot/dts/Makefile
>      > +++ b/arch/arm64/boot/dts/Makefile
>      > @@ -1,3 +1,4 @@
>      > +dtb-$(CONFIG_ARCH_THUNDER) +=3D thunder-88xx.dtb
>      > =C2=A0dtb-$(CONFIG_ARCH_VEXPRESS) +=3D rtsm_ve-aemv8a.dtb foun=
dation-v8.dtb
>      > =C2=A0dtb-$(CONFIG_ARCH_XGENE) +=3D apm-mustang.dtb
>      >
>      > diff --git a/arch/arm64/boot/dts/thunder-88xx.dts
>      b/arch/arm64/boot/dts/thunder-88xx.dts
>      > new file mode 100644
>      > index 000000000000..4cf20ac9138b
>      > --- /dev/null
>      > +++ b/arch/arm64/boot/dts/thunder-88xx.dts
>      > @@ -0,0 +1,387 @@
>      > +/*
>      > + * Cavium Thunder DTS file
>      > + *
>      > + * Copyright (C) 2013, Cavium Inc.
>      > + *
>      > + * This program is free software; you can redistribute it and=
/or
>      > + * modify it under the terms of the GNU General Public Licens=
e as
>      > + * published by the Free Software Foundation; either version =
2 of
>      > + * the License, or (at your option) any later version.
>      > + */
>      > +/dts-v1/;
>      > +
>      > +/* Reserving first 12MB of DDR for firmware */
>      > +/memreserve/ 0x00000000 0x00c00000;
>=20
>      What exactly is this memreserve intended to protect at runtime?
>      Yes, this 12 MB is reserved for ATF and UEFI boot and run-time s=
ervices.

If booted as an EFI application Linux will use the UEFI memory map.
Anything UEFI needs to have kept around will be marked as such, so
there's no need to memreserve that.

I was under the impression that the ARM Trusted Firmware didn't need
anything resident on the non-secure side, so I don't see why that needs
a memreserve -- Linux should not be able to address anything it has
resident.

>      The only item of runtime firmware I see in use below is PSCI on =
the
>      secure side.
>=20
>      How is the kernel booted on this platform? UEFI?
>=20
>    Boot sequence tried is ATF->UEFI->Linux=C2=A0 and ATF->UEFI->GRUB-=
>Linux=C2=A0

As I've just had it explained to me, in either of those cases we should
enter Linux via the EFI stub. So we should be using the UEFI memory map
regardless.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
