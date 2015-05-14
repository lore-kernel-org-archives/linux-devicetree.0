From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH 5/5] arm64: Add DT support for Juno r1 board.
Date: Thu, 14 May 2015 15:14:40 +0100
Message-ID: <20150514141440.GT2345@e106497-lin.cambridge.arm.com>
References: <1431537092-19597-1-git-send-email-Liviu.Dudau@arm.com>
 <1431537092-19597-6-git-send-email-Liviu.Dudau@arm.com>
 <1431612451.2881.54.camel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431612451.2881.54.camel@linaro.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: "Jon Medhurst (Tixy)" <tixy@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <Marc.Zyngier@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Sudeep Holla <Sudeep.Holla@arm.com>, devicetree <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 14, 2015 at 03:07:31PM +0100, Jon Medhurst (Tixy) wrote:
> On Wed, 2015-05-13 at 18:11 +0100, Liviu Dudau wrote:
> > This board is based on Juno r0 with updated Cortex A5x revisions
> > and board errata fixes. It also contains coherent ThinLinks ports
> > on the expansion slot that allow for an AXI master on the daughter
> > card to participate in a coherency domain.
> >=20
> > Support for SoC PCIe host bridge will be added as a separate series=
=2E
> >=20
> > Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> > ---
> >  arch/arm64/boot/dts/arm/Makefile    |   2 +-
> >  arch/arm64/boot/dts/arm/juno-r1.dts | 123 ++++++++++++++++++++++++=
++++++++++++
> >  2 files changed, 124 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm64/boot/dts/arm/juno-r1.dts
> >=20
> > diff --git a/arch/arm64/boot/dts/arm/Makefile b/arch/arm64/boot/dts=
/arm/Makefile
> > index 301a0da..c5c98b9 100644
> > --- a/arch/arm64/boot/dts/arm/Makefile
> > +++ b/arch/arm64/boot/dts/arm/Makefile
> > @@ -1,5 +1,5 @@
> >  dtb-$(CONFIG_ARCH_VEXPRESS) +=3D foundation-v8.dtb
> > -dtb-$(CONFIG_ARCH_VEXPRESS) +=3D juno.dtb
> > +dtb-$(CONFIG_ARCH_VEXPRESS) +=3D juno.dtb juno-r1.dtb
> >  dtb-$(CONFIG_ARCH_VEXPRESS) +=3D rtsm_ve-aemv8a.dtb
> > =20
> >  always		:=3D $(dtb-y)
> > diff --git a/arch/arm64/boot/dts/arm/juno-r1.dts b/arch/arm64/boot/=
dts/arm/juno-r1.dts
> > new file mode 100644
> > index 0000000..f6bc073
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/arm/juno-r1.dts
> > @@ -0,0 +1,123 @@
> > +/*
> > + * ARM Ltd. Juno Platform
> > + *
> > + * Copyright (c) 2015 ARM Ltd.
> > + *
> > + * This file is licensed under a dual GPLv2 or BSD license.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +/ {
> > +	model =3D "ARM Juno development board (r1)";
> > +	compatible =3D "arm,juno", "arm,vexpress";
>=20
> Is there scope for adding "arm,juno-r1" to the front of that list?
> Reason I ask, is that I can't help but think [1] that userside code
> (like Android) which wants to select device-specific configuration,
> should use something like the devices compatible string rather than w=
hat
> they currently propose [2].

Sure, I can do that for the next revision of the patch.

Best regards,
Liviu

> =20
> [1] https://lists.linaro.org/pipermail/linaro-android/2015-April/0027=
43.html
> [2] https://lists.linaro.org/pipermail/linaro-android/2015-April/0027=
42.html
>=20
> --=20
> Tixy
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
