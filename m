Return-Path: <SRS0=m4HG=NG=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 5/7] ARM: dts: r8a77470: Add USB2.0 Host (EHCI/OHCI)
 device nodes
Date: Fri, 26 Oct 2018 09:45:38 +0000
Message-ID: 
 <TYXPR01MB1775DB87F5C7E2426EE5A223C0F00@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1540475819-47950-1-git-send-email-biju.das@bp.renesas.com>
 <1540475819-47950-6-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1540475819-47950-6-git-send-email-biju.das@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>
List-ID: <devicetree@vger.kernel.org>

> Subject: [PATCH 5/7] ARM: dts: r8a77470: Add USB2.0 Host (EHCI/OHCI) devi=
ce nodes
>
> Define the r8a77470 generic part of the USB2.0 Host Controller device
> nodes (ehci[01]/ohci[01]).
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
> This patch is tested against renesas devel.
> ---
>  arch/arm/boot/dts/r8a77470.dtsi | 50 +++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470=
.dtsi
> index 7d20c3b..935b82b 100644
> --- a/arch/arm/boot/dts/r8a77470.dtsi
> +++ b/arch/arm/boot/dts/r8a77470.dtsi
> @@ -528,6 +528,56 @@
>  status =3D "disabled";
>  };
>
> +ohci0: usb@ee080000 {
> +compatible =3D "generic-ohci";
> +reg =3D <0 0xee080000 0 0x100>;
> +interrupts =3D <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> +clocks =3D <&cpg CPG_MOD 703>;
> +phys =3D <&usb0 0>;
> +phy-names =3D "usb";
> +power-domains =3D <&sysc R8A77470_PD_ALWAYS_ON>;
> +resets =3D <&cpg 703>;
> +status =3D "disabled";
> +};
> +
> +ohci1: usb@ee0c0000 {
> +compatible =3D "generic-ohci";
> +reg =3D <0 0xee0c0000 0 0x100>;
> +interrupts =3D <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
> +clocks =3D <&cpg CPG_MOD 705>;
> +phys =3D <&usb1 0>, <&usb0 1>;
> +phy-names =3D "usb";
> +power-domains =3D <&sysc R8A77470_PD_ALWAYS_ON>;
> +resets =3D <&cpg 705>;
> +status =3D "disabled";
> +};
> +
> +ehci0: usb@ee080100 {
> +compatible =3D "generic-ehci";
> +reg =3D <0 0xee080100 0 0x100>;
> +interrupts =3D <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> +clocks =3D <&cpg CPG_MOD 703>;
> +phys =3D <&usb0 0>;
> +phy-names =3D "usb";
> +companion =3D <&ohci0>;
> +power-domains =3D <&sysc R8A77470_PD_ALWAYS_ON>;
> +resets =3D <&cpg 703>;
> +status =3D "disabled";
> +};
> +
> +ehci1: usb@ee0c0100 {
> +compatible =3D "generic-ehci";
> +reg =3D <0 0xee0c0100 0 0x100>;
> +interrupts =3D <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
> +clocks =3D <&cpg CPG_MOD 705>;
> +phys =3D <&usb1 0>, <&usb0 1>;
> +phy-names =3D "usb";
> +companion =3D <&ohci1>;
> +power-domains =3D <&sysc R8A77470_PD_ALWAYS_ON>;
> +resets =3D <&cpg 705>;
> +status =3D "disabled";
> +};
> +
>  sdhi0: sd@ee100000 {
>  compatible =3D "renesas,sdhi-r8a77470",
>       "renesas,rcar-gen2-sdhi";
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
