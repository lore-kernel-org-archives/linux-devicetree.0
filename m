Return-Path: <SRS0=k9qO=HO=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH v2 1/2] arm64: dts: renesas: Add Renesas R8A77990 SoC
 support
Date: Wed, 25 Apr 2018 02:47:41 +0000
Message-ID: <OSBPR01MB22938B6E2585810AEBCD9341D88F0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1524227297-24955-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1524227297-24955-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdUx8CGoC=kMbAVUDO807g9BJ80w-TFdZ2vJZ9d0B6rbdA@mail.gmail.com>
 <20180424083633.ypkamflp3v6zlsz7@verge.net.au>
In-Reply-To: <20180424083633.ypkamflp3v6zlsz7@verge.net.au>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS  <devicetree@vger.kernel.org>, Linux-Renesas" <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
List-ID: <devicetree@vger.kernel.org>

Hi, Simon-san,

> From: Simon Horman, Sent: Tuesday, April 24, 2018 5:37 PM
>=20
> On Tue, Apr 24, 2018 at 10:26:37AM +0200, Geert Uytterhoeven wrote:
> > Hi Shimoda-san,
> >
> > On Fri, Apr 20, 2018 at 2:28 PM, Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > This patch adds basic support for the Renesas R-Car E3 (R8A77990) SoC=
:
> > >   - PSCI
> > >   - CPU (single)
> > >   - Cache controller
> > >   - Main clocks and controller
> > >   - Interrupt controller
> > >   - Timer
> > >   - PMU
> > >   - Reset controller
> > >   - Product register
> > >   - System controller
> > >   - UART for console
> > >
> > > Inspried by a patch by Takeshi Kihara in the BSP.
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
> > Thanks for you patch!
>=20
> Thanks for your review.
>=20
> As I've already applied this patch I'd like to ask Shimoda-san
> to send incremental patches to address the issues you raise below.

I got it. I'll send incremental patches.

Best regards,
Yoshihiro Shimoda

> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > > @@ -0,0 +1,127 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * Device Tree Source for the r8a77990 SoC
> > > + *
> > > + * Copyright (C) 2018 Renesas Electronics Corp.
> > > + */
> > > +
> > > +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> > > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +
> > > +/ {
> > > +       compatible =3D "renesas,r8a77990";
> > > +       #address-cells =3D <2>;
> > > +       #size-cells =3D <2>;
> > > +
> > > +       cpus {
> >
> > > +               L2_CA53: cache-controller@0 {
> > > +                       compatible =3D "cache";
> > > +                       reg =3D <0>;
> >
> > Please no unit-addresses and reg properties for cache controllers.
> >
> > > +                       power-domains =3D <&sysc 21>;
> > > +                       cache-unified;
> > > +                       cache-level =3D <2>;
> > > +               };
> > > +       };
> >
> > > +       psci {
> > > +               compatible =3D "arm,psci-0.2";
> >
> > "arm,psci-1.0", "arm,psci-0.2"?
> >
> > > +               method =3D "smc";
> > > +       };
> > > +
> > > +       soc: soc {
> >
> > > +               rst: reset-controller@e6160000 {
> > > +                       compatible =3D "renesas,r8a77990-rst";
> > > +                       reg =3D <0 0xe6160000 0 0x0200>;
> > > +               };
> > > +
> > > +               sysc: system-controller@e6180000 {
> > > +                       compatible =3D "renesas,r8a77990-sysc";
> > > +                       reg =3D <0 0xe6180000 0 0x0400>;
> > > +                       #power-domain-cells =3D <1>;
> > > +               };
> > > +
> > > +               scif2: serial@e6e88000 {
> > > +                       compatible =3D "renesas,scif-r8a77990",
> > > +                                    "renesas,rcar-gen3-scif", "renes=
as,scif";
> > > +                       reg =3D <0 0xe6e88000 0 64>;
> > > +                       interrupts =3D <GIC_SPI 164 IRQ_TYPE_LEVEL_HI=
GH>;
> > > +                       clocks =3D <&cpg CPG_MOD 310>;
> > > +                       clock-names =3D "fck";
> >
> > I assume you plan to add the other clocks later? That's fine for me.
> >
> > > +                       power-domains =3D <&sysc 32>;
> > > +                       resets =3D <&cpg 310>;
> > > +                       status =3D "disabled";
> > > +               };
> >
> > Gr{oetje,eeting}s,
> >
> >                         Geert
> >
> > --
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org
> >
> > In personal conversations with technical people, I call myself a hacker=
. But
> > when I'm talking to journalists I just say "programmer" or something li=
ke that.
> >                                 -- Linus Torvalds
> >
