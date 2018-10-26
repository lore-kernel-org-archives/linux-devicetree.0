Return-Path: <SRS0=m4HG=NG=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 3/7] ARM: dts: r8a77470: Add USB PHY DT support
Date: Fri, 26 Oct 2018 09:44:50 +0000
Message-ID: 
 <TYXPR01MB1775516A8FD23862D28DDED8C0F00@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1540475819-47950-1-git-send-email-biju.das@bp.renesas.com>
 <1540475819-47950-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1540475819-47950-4-git-send-email-biju.das@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>
List-ID: <devicetree@vger.kernel.org>

> Subject: [PATCH 3/7] ARM: dts: r8a77470: Add USB PHY DT support
>
> Define the r8a77470 generic part of the USB PHY device node.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
> This patch is tested against renesas-devel
> ---
>  arch/arm/boot/dts/r8a77470.dtsi | 38 +++++++++++++++++++++++++++++++++++=
+++
>  1 file changed, 38 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470=
.dtsi
> index 6ac7f46..7d20c3b 100644
> --- a/arch/arm/boot/dts/r8a77470.dtsi
> +++ b/arch/arm/boot/dts/r8a77470.dtsi
> @@ -315,6 +315,44 @@
>  status =3D "disabled";
>  };
>
> +usbphy0: usb-phy@e6590100 {
> +compatible =3D "renesas,usb-phy-r8a77470",
> +     "renesas,rcar-gen2-usb-phy";
> +reg =3D <0 0xe6590100 0 0x100>,
> +<0 0xee080200 0 0x118>;
> +#address-cells =3D <1>;
> +#size-cells =3D <0>;
> +clocks =3D <&cpg CPG_MOD 704>, <&cpg CPG_MOD 703>;
> +clock-names =3D "usbhs", "usb20_host";
> +power-domains =3D <&sysc R8A77470_PD_ALWAYS_ON>;
> +resets =3D <&cpg 704>, <&cpg 703>;
> +status =3D "disabled";
> +
> +usb0: usb-channel@0 {
> +reg =3D <0>;
> +#phy-cells =3D <1>;
> +};
> +};
> +
> +usbphy1: usb-phy@e6598100 {
> +compatible =3D "renesas,usb-phy-r8a77470",
> +     "renesas,rcar-gen2-usb-phy";
> +reg =3D <0 0xe6598100 0 0x100>,
> +      <0 0xee0c0200 0 0x118>;
> +#address-cells =3D <1>;
> +#size-cells =3D <0>;
> +clocks =3D <&cpg CPG_MOD 706>, <&cpg CPG_MOD 705>;
> +clock-names =3D "usbhs", "usb20_host";
> +status =3D "disabled";
> +resets =3D <&cpg 706>, <&cpg 705>;
> +power-domains =3D <&sysc R8A77470_PD_ALWAYS_ON>;
> +
> +usb1: usb-channel@0 {
> +reg =3D <0>;
> +#phy-cells =3D <1>;
> +};
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
