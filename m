Return-Path: <SRS0=3xlC=NF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-os2jpn01on0115.outbound.protection.outlook.com ([104.47.92.115]:55888
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727356AbeJZAxQ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 25 Oct 2018 20:53:16 -0400
From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 2/2] ARM: dts: r8a77470: Add USB-DMAC device nodes
Date: Thu, 25 Oct 2018 16:19:40 +0000
Message-ID: <OSBPR01MB2103B4D20EAF9BA2CFE4FDABB8F70@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1540479218-4954-1-git-send-email-biju.das@bp.renesas.com>
 <1540479218-4954-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1540479218-4954-2-git-send-email-biju.das@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Vinod <vkoul@kernel.org>
List-ID: <devicetree@vger.kernel.org>

+ vinod koul

> -----Original Message-----
> From: Biju Das <biju.das@bp.renesas.com>
> Sent: 25 October 2018 15:54
> To: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>
> Cc: Biju Das <biju.das@bp.renesas.com>; Simon Horman
> <horms@verge.net.au>; Magnus Damm <magnus.damm@gmail.com>;
> linux-renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; Geert
> Uytterhoeven <geert+renesas@glider.be>; Chris Paterson
> <Chris.Paterson2@renesas.com>; Fabrizio Castro
> <fabrizio.castro@bp.renesas.com>
> Subject: [PATCH 2/2] ARM: dts: r8a77470: Add USB-DMAC device nodes
>
> This patch adds USB DMAC nodes.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> This patch depend upon the below patch.
>
> https://patchwork.kernel.org/patch/10655861/
> ---
>  arch/arm/boot/dts/r8a77470.dtsi | 56
> +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r8a77470.dtsi
> b/arch/arm/boot/dts/r8a77470.dtsi index 935b82b..eec71dd 100644
> --- a/arch/arm/boot/dts/r8a77470.dtsi
> +++ b/arch/arm/boot/dts/r8a77470.dtsi
> @@ -353,6 +353,62 @@
>  };
>  };
>
> +usb_dmac00: dma-controller@e65a0000 {
> +compatible =3D "renesas,r8a77470-usb-dmac",
> +     "renesas,usb-dmac";
> +reg =3D <0 0xe65a0000 0 0x100>;
> +interrupts =3D <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH
> +      GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> +interrupt-names =3D "ch0", "ch1";
> +clocks =3D <&cpg CPG_MOD 330>;
> +power-domains =3D <&sysc
> R8A77470_PD_ALWAYS_ON>;
> +resets =3D <&cpg 330>;
> +#dma-cells =3D <1>;
> +dma-channels =3D <2>;
> +};
> +
> +usb_dmac10: dma-controller@e65b0000 {
> +compatible =3D "renesas,r8a77470-usb-dmac",
> +     "renesas,usb-dmac";
> +reg =3D <0 0xe65b0000 0 0x100>;
> +interrupts =3D <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH
> +      GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +interrupt-names =3D "ch0", "ch1";
> +clocks =3D <&cpg CPG_MOD 331>;
> +power-domains =3D <&sysc
> R8A77470_PD_ALWAYS_ON>;
> +resets =3D <&cpg 331>;
> +#dma-cells =3D <1>;
> +dma-channels =3D <2>;
> +};
> +
> +usb_dmac01: dma-controller@e65a8000 {
> +compatible =3D "renesas,r8a77470-usb-dmac",
> +     "renesas,usb-dmac";
> +reg =3D <0 0xe65a8000 0 0x100>;
> +interrupts =3D <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH
> +      GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>;
> +interrupt-names =3D "ch0", "ch1";
> +clocks =3D <&cpg CPG_MOD 326>;
> +power-domains =3D <&sysc
> R8A77470_PD_ALWAYS_ON>;
> +resets =3D <&cpg 326>;
> +#dma-cells =3D <1>;
> +dma-channels =3D <2>;
> +};
> +
> +usb_dmac11: dma-controller@e65b8000 {
> +compatible =3D "renesas,r8a77470-usb-dmac",
> +     "renesas,usb-dmac";
> +reg =3D <0 0xe65b8000 0 0x100>;
> +interrupts =3D <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH
> +      GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>;
> +interrupt-names =3D "ch0", "ch1";
> +clocks =3D <&cpg CPG_MOD 327>;
> +power-domains =3D <&sysc
> R8A77470_PD_ALWAYS_ON>;
> +resets =3D <&cpg 327>;
> +#dma-cells =3D <1>;
> +dma-channels =3D <2>;
> +};
> +
>  dmac0: dma-controller@e6700000 {
>  compatible =3D "renesas,dmac-r8a77470",
>       "renesas,rcar-dmac";
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
