Return-Path: <SRS0=m4HG=NG=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 1/2] ARM: dts: r8a77470: Add CMT SoC specific support
Date: Fri, 26 Oct 2018 09:48:33 +0000
Message-ID: 
 <TYXPR01MB17755F6C9C4785DDC0592808C0F00@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1540543709-35959-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1540543709-35959-1-git-send-email-biju.das@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>
List-ID: <devicetree@vger.kernel.org>

> Subject: [PATCH 1/2] ARM: dts: r8a77470: Add CMT SoC specific support
>
> Add CMT[01] support to r8a77470 SoC DT.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
> This patch is tested against renesas-dev
> ---
>  arch/arm/boot/dts/r8a77470.dtsi | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470=
.dtsi
> index 74ca5d3..e40f5a9 100644
> --- a/arch/arm/boot/dts/r8a77470.dtsi
> +++ b/arch/arm/boot/dts/r8a77470.dtsi
> @@ -710,6 +710,38 @@
>  compatible =3D "renesas,prr";
>  reg =3D <0 0xff000044 0 4>;
>  };
> +
> +cmt0: timer@ffca0000 {
> +compatible =3D "renesas,r8a77470-cmt0",
> +     "renesas,rcar-gen2-cmt0";
> +reg =3D <0 0xffca0000 0 0x1004>;
> +interrupts =3D <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
> +clocks =3D <&cpg CPG_MOD 124>;
> +clock-names =3D "fck";
> +power-domains =3D <&sysc R8A77470_PD_ALWAYS_ON>;
> +resets =3D <&cpg 124>;
> +status =3D "disabled";
> +};
> +
> +cmt1: timer@e6130000 {
> +compatible =3D "renesas,r8a77470-cmt1",
> +     "renesas,rcar-gen2-cmt1";
> +reg =3D <0 0xe6130000 0 0x1004>;
> +interrupts =3D <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
> +clocks =3D <&cpg CPG_MOD 329>;
> +clock-names =3D "fck";
> +power-domains =3D <&sysc R8A77470_PD_ALWAYS_ON>;
> +resets =3D <&cpg 329>;
> +status =3D "disabled";
> +};
>  };
>
>  timer {
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
