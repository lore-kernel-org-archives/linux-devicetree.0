Return-Path: <SRS0=m4HG=NG=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 1/7] dt-bindings: phy: rcar-gen2: Add r8a77470 support
Date: Fri, 26 Oct 2018 09:44:06 +0000
Message-ID: 
 <TYXPR01MB17754D0A189EE6FD8DBA203CC0F00@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1540475819-47950-1-git-send-email-biju.das@bp.renesas.com>
 <1540475819-47950-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1540475819-47950-2-git-send-email-biju.das@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

> Subject: [PATCH 1/7] dt-bindings: phy: rcar-gen2: Add r8a77470 support
>
> Add USB PHY support for r8a77470 SoC. Renesas RZ/G1C (R8A77470)
> USB PHY is similar to the R-Car Gen2 family, but has the below
> features compared to other RZ/G1 and R-Car Gen2/3 SoCs
>
> It has a shared pll reset for usbphy0/usbphy1 and this register
> reside in usbphy0 block
>
> Each USB2.0 host needs to deassert the pll reset of usbphy0 block.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
>  .../devicetree/bindings/phy/rcar-gen2-phy.txt      | 64 ++++++++++++++++=
+++---
>  1 file changed, 55 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt b/Do=
cumentation/devicetree/bindings/phy/rcar-gen2-phy.txt
> index eeb9e18..0a59971 100644
> --- a/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
> @@ -6,6 +6,7 @@ This file provides information on what the device node fo=
r the R-Car generation
>  Required properties:
>  - compatible: "renesas,usb-phy-r8a7743" if the device is a part of R8A77=
43 SoC.
>        "renesas,usb-phy-r8a7745" if the device is a part of R8A7745 SoC.
> +      "renesas,usb-phy-r8a77470" if the device is a part of R8A77470 SoC=
.
>        "renesas,usb-phy-r8a7790" if the device is a part of R8A7790 SoC.
>        "renesas,usb-phy-r8a7791" if the device is a part of R8A7791 SoC.
>        "renesas,usb-phy-r8a7794" if the device is a part of R8A7794 SoC.
> @@ -23,13 +24,23 @@ Required properties:
>  - clocks: clock phandle and specifier pair.
>  - clock-names: string, clock input name, must be "usbhs".
>
> +Optional properties (r8a77470 SoC Only):
> +To use a USB channel as USB 2.0 Host, the device tree node should set be=
low
> +optional properties. This is because USB2.0 Host needs to deassert pll r=
eset,
> +apart from initializing interrupt enable, OVC detection timer and suspen=
d/
> +resume timer register.
> +
> +- reg: offset and length of the partial USB2.0 Host register block.
> +- clocks: clock phandle and specifier pair for usb2.0 host.
> +- clk-names: string, clock input name, must be "usb20_host".
> +
>  The USB PHY device tree node should have the subnodes corresponding to t=
he USB
>  channels. These subnodes must contain the following properties:
>  - reg: the USB controller selector; see the table below for the values.
>  - #phy-cells: see phy-bindings.txt in the same directory, must be <1>.
>
>  The phandle's argument in the PHY specifier is the USB controller select=
or for
> -the USB channel; see the selector meanings below:
> +the USB channel other than r8a77470 SoC; see the selector meanings below=
:
>
>  +-----------+---------------+---------------+
>  |\ Selector |               |               |
> @@ -40,22 +51,57 @@ the USB channel; see the selector meanings below:
>  | 2         | PCI EHCI/OHCI | xHCI          |
>  +-----------+---------------+---------------+
>
> +For r8a77470 SoC see the selector meaning below:
> +
> ++-----------+---------------+---------------+
> +|\ Selector |               |               |
> ++ --------- +       0       |       1       |
> +| Channel  \|               |               |
> ++-----------+---------------+---------------+
> +| 0         | EHCI/OHCI     | HS-USB        |
> ++-----------+---------------+---------------+
> +
>  Example (Lager board):
>
> -usb-phy@e6590100 {
> -compatible =3D "renesas,usb-phy-r8a7790", "renesas,rcar-gen2-usb-phy";
> +usbphy: usb-phy@e6590100 {
> +compatible =3D "renesas,usb-phy-r8a7790",
> +             "renesas,rcar-gen2-usb-phy";
>  reg =3D <0 0xe6590100 0 0x100>;
>  #address-cells =3D <1>;
>  #size-cells =3D <0>;
> -clocks =3D <&mstp7_clks R8A7790_CLK_HSUSB>;
> +clocks =3D <&cpg CPG_MOD 704>;
>  clock-names =3D "usbhs";
> +power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
> +resets =3D <&cpg 704>;
> +status =3D "disabled";
>
> -usb-channel@0 {
> -reg =3D <0>;
> -#phy-cells =3D <1>;
> +usb0: usb-channel@0 {
> +        reg =3D <0>;
> +        #phy-cells =3D <1>;
> +};
> +usb2: usb-channel@2 {
> +        reg =3D <2>;
> +        #phy-cells =3D <1>;
>  };
> -usb-channel@2 {
> -reg =3D <2>;
> +};
> +
> +Example (iWave RZ/G1C SBC):
> +
> +usbphy0: usb-phy0@e6590100 {
> +compatible =3D "renesas,usb-phy-r8a77470",
> +     "renesas,rcar-gen2-usb-phy";
> +reg =3D <0 0xe6590100 0 0x100>,
> +      <0 0xee080200 0 0x118>;
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
>  #phy-cells =3D <1>;
>  };
>  };
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
