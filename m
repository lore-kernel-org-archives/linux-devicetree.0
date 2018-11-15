Return-Path: <SRS0=9lQL=N2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1410110.outbound.protection.outlook.com ([40.107.141.110]:28379
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726664AbeKOVGR (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 15 Nov 2018 16:06:17 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 2/2] arm64: dts: renesas: r8a774a1: Replace clock magic
 numbers
Date: Thu, 15 Nov 2018 10:58:49 +0000
Message-ID: <TY1PR01MB1770CD6F6BF7529AE3480407C0DC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1541604267-4652-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1541604267-4652-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdWqZNN8FMjpqZ2skjJvnzC+Ek4dMZKaFgg=E1=b-qam7w@mail.gmail.com>
 <20181113144621.rztsmoeqbuphtbxv@verge.net.au>
In-Reply-To: <20181113144621.rztsmoeqbuphtbxv@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Thank you Geert for spotting the issue, thank you Simon for fixing.

Cheers,
Fab

> From: Simon Horman <horms@verge.net.au>
> Sent: 13 November 2018 14:46
> Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a774a1: Replace clock mag=
ic numbers
>
> On Tue, Nov 13, 2018 at 09:53:55AM +0100, Geert Uytterhoeven wrote:
> > On Wed, Nov 7, 2018 at 4:24 PM Fabrizio Castro
> > <fabrizio.castro@bp.renesas.com> wrote:
> > > Now that include/dt-bindings/clock/r8a774a1-cpg-mssr.h is in Linus'
> > > master branch we can replace clock related magic numbers with the
> > > corresponding labels.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > > --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> >
> > > @@ -87,7 +87,7 @@
> > >                         power-domains =3D <&sysc R8A774A1_PD_CA53_CPU=
0>;
> > >                         next-level-cache =3D <&L2_CA53>;
> > >                         enable-method =3D "psci";
> > > -                       clocks =3D<&cpg CPG_CORE 1>;
> > > +                       clocks =3D<&cpg CPG_CORE R8A774A1_CLK_Z2>;
> >
> > There are a few pre-existing whitespace issues in the CPU nodes' clocks
> > properties.
>
> Thanks I have fixed that when applying this patch for v4.21.
> The result is as follows:
>
> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Subject: [PATCH] arm64: dts: renesas: r8a774a1: Replace clock magic numbe=
rs
>
> Now that include/dt-bindings/clock/r8a774a1-cpg-mssr.h is in Linus'
> master branch we can replace clock related magic numbers with the
> corresponding labels.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> [simon: corrected whitespace]
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 38 +++++++++++++++----------=
------
>  1 file changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/=
dts/renesas/r8a774a1.dtsi
> index d549755a4025..20745a8528c5 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> @@ -7,7 +7,7 @@
>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> -#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +#include <dt-bindings/clock/r8a774a1-cpg-mssr.h>
>  #include <dt-bindings/power/r8a774a1-sysc.h>
>
>  / {
> @@ -67,7 +67,7 @@
>  power-domains =3D <&sysc R8A774A1_PD_CA57_CPU0>;
>  next-level-cache =3D <&L2_CA57>;
>  enable-method =3D "psci";
> -clocks =3D <&cpg CPG_CORE 0>;
> +clocks =3D <&cpg CPG_CORE R8A774A1_CLK_Z>;
>  };
>
>  a57_1: cpu@1 {
> @@ -77,7 +77,7 @@
>  power-domains =3D <&sysc R8A774A1_PD_CA57_CPU1>;
>  next-level-cache =3D <&L2_CA57>;
>  enable-method =3D "psci";
> -clocks =3D <&cpg CPG_CORE 0>;
> +clocks =3D <&cpg CPG_CORE R8A774A1_CLK_Z>;
>  };
>
>  a53_0: cpu@100 {
> @@ -87,7 +87,7 @@
>  power-domains =3D <&sysc R8A774A1_PD_CA53_CPU0>;
>  next-level-cache =3D <&L2_CA53>;
>  enable-method =3D "psci";
> -clocks =3D<&cpg CPG_CORE 1>;
> +clocks =3D <&cpg CPG_CORE R8A774A1_CLK_Z2>;
>  };
>
>  a53_1: cpu@101 {
> @@ -97,7 +97,7 @@
>  power-domains =3D <&sysc R8A774A1_PD_CA53_CPU1>;
>  next-level-cache =3D <&L2_CA53>;
>  enable-method =3D "psci";
> -clocks =3D<&cpg CPG_CORE 1>;
> +clocks =3D <&cpg CPG_CORE R8A774A1_CLK_Z2>;
>  };
>
>  a53_2: cpu@102 {
> @@ -107,7 +107,7 @@
>  power-domains =3D <&sysc R8A774A1_PD_CA53_CPU2>;
>  next-level-cache =3D <&L2_CA53>;
>  enable-method =3D "psci";
> -clocks =3D<&cpg CPG_CORE 1>;
> +clocks =3D <&cpg CPG_CORE R8A774A1_CLK_Z2>;
>  };
>
>  a53_3: cpu@103 {
> @@ -117,7 +117,7 @@
>  power-domains =3D <&sysc R8A774A1_PD_CA53_CPU3>;
>  next-level-cache =3D <&L2_CA53>;
>  enable-method =3D "psci";
> -clocks =3D<&cpg CPG_CORE 1>;
> +clocks =3D <&cpg CPG_CORE R8A774A1_CLK_Z2>;
>  };
>
>  L2_CA57: cache-controller-0 {
> @@ -515,7 +515,7 @@
>  reg =3D <0 0xe6540000 0 0x60>;
>  interrupts =3D <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
>  clocks =3D <&cpg CPG_MOD 520>,
> - <&cpg CPG_CORE 19>,
> + <&cpg CPG_CORE R8A774A1_CLK_S3D1>,
>   <&scif_clk>;
>  clock-names =3D "fck", "brg_int", "scif_clk";
>  dmas =3D <&dmac1 0x31>, <&dmac1 0x30>,
> @@ -533,7 +533,7 @@
>  reg =3D <0 0xe6550000 0 0x60>;
>  interrupts =3D <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
>  clocks =3D <&cpg CPG_MOD 519>,
> - <&cpg CPG_CORE 19>,
> + <&cpg CPG_CORE R8A774A1_CLK_S3D1>,
>   <&scif_clk>;
>  clock-names =3D "fck", "brg_int", "scif_clk";
>  dmas =3D <&dmac1 0x33>, <&dmac1 0x32>,
> @@ -551,7 +551,7 @@
>  reg =3D <0 0xe6560000 0 0x60>;
>  interrupts =3D <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
>  clocks =3D <&cpg CPG_MOD 518>,
> - <&cpg CPG_CORE 19>,
> + <&cpg CPG_CORE R8A774A1_CLK_S3D1>,
>   <&scif_clk>;
>  clock-names =3D "fck", "brg_int", "scif_clk";
>  dmas =3D <&dmac1 0x35>, <&dmac1 0x34>,
> @@ -569,7 +569,7 @@
>  reg =3D <0 0xe66a0000 0 0x60>;
>  interrupts =3D <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
>  clocks =3D <&cpg CPG_MOD 517>,
> - <&cpg CPG_CORE 19>,
> + <&cpg CPG_CORE R8A774A1_CLK_S3D1>,
>   <&scif_clk>;
>  clock-names =3D "fck", "brg_int", "scif_clk";
>  dmas =3D <&dmac0 0x37>, <&dmac0 0x36>;
> @@ -586,7 +586,7 @@
>  reg =3D <0 0xe66b0000 0 0x60>;
>  interrupts =3D <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
>  clocks =3D <&cpg CPG_MOD 516>,
> - <&cpg CPG_CORE 19>,
> + <&cpg CPG_CORE R8A774A1_CLK_S3D1>,
>   <&scif_clk>;
>  clock-names =3D "fck", "brg_int", "scif_clk";
>  dmas =3D <&dmac0 0x39>, <&dmac0 0x38>;
> @@ -974,7 +974,7 @@
>  reg =3D <0 0xe6e60000 0 0x40>;
>  interrupts =3D <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
>  clocks =3D <&cpg CPG_MOD 207>,
> - <&cpg CPG_CORE 19>,
> + <&cpg CPG_CORE R8A774A1_CLK_S3D1>,
>   <&scif_clk>;
>  clock-names =3D "fck", "brg_int", "scif_clk";
>  dmas =3D <&dmac1 0x51>, <&dmac1 0x50>,
> @@ -991,7 +991,7 @@
>  reg =3D <0 0xe6e68000 0 0x40>;
>  interrupts =3D <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
>  clocks =3D <&cpg CPG_MOD 206>,
> - <&cpg CPG_CORE 19>,
> + <&cpg CPG_CORE R8A774A1_CLK_S3D1>,
>   <&scif_clk>;
>  clock-names =3D "fck", "brg_int", "scif_clk";
>  dmas =3D <&dmac1 0x53>, <&dmac1 0x52>,
> @@ -1008,7 +1008,7 @@
>  reg =3D <0 0xe6e88000 0 0x40>;
>  interrupts =3D <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
>  clocks =3D <&cpg CPG_MOD 310>,
> - <&cpg CPG_CORE 19>,
> + <&cpg CPG_CORE R8A774A1_CLK_S3D1>,
>   <&scif_clk>;
>  clock-names =3D "fck", "brg_int", "scif_clk";
>  power-domains =3D <&sysc R8A774A1_PD_ALWAYS_ON>;
> @@ -1022,7 +1022,7 @@
>  reg =3D <0 0xe6c50000 0 0x40>;
>  interrupts =3D <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
>  clocks =3D <&cpg CPG_MOD 204>,
> - <&cpg CPG_CORE 19>,
> + <&cpg CPG_CORE R8A774A1_CLK_S3D1>,
>   <&scif_clk>;
>  clock-names =3D "fck", "brg_int", "scif_clk";
>  dmas =3D <&dmac0 0x57>, <&dmac0 0x56>;
> @@ -1038,7 +1038,7 @@
>  reg =3D <0 0xe6c40000 0 0x40>;
>  interrupts =3D <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
>  clocks =3D <&cpg CPG_MOD 203>,
> - <&cpg CPG_CORE 19>,
> + <&cpg CPG_CORE R8A774A1_CLK_S3D1>,
>   <&scif_clk>;
>  clock-names =3D "fck", "brg_int", "scif_clk";
>  dmas =3D <&dmac0 0x59>, <&dmac0 0x58>;
> @@ -1054,7 +1054,7 @@
>  reg =3D <0 0xe6f30000 0 0x40>;
>  interrupts =3D <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
>  clocks =3D <&cpg CPG_MOD 202>,
> - <&cpg CPG_CORE 19>,
> + <&cpg CPG_CORE R8A774A1_CLK_S3D1>,
>   <&scif_clk>;
>  clock-names =3D "fck", "brg_int", "scif_clk";
>  dmas =3D <&dmac1 0x5b>, <&dmac1 0x5a>,
> @@ -1420,7 +1420,7 @@
>   <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
>   <&audio_clk_a>, <&audio_clk_b>,
>   <&audio_clk_c>,
> - <&cpg CPG_CORE 10>;
> + <&cpg CPG_CORE R8A774A1_CLK_S0D4>;
>  clock-names =3D "ssi-all",
>        "ssi.9", "ssi.8", "ssi.7", "ssi.6",
>        "ssi.5", "ssi.4", "ssi.3", "ssi.2",
> --
> 2.11.0




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
