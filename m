Return-Path: <SRS0=nxYe=TV=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH v6 2/7] dt-bindings: usb: renesas_usb3: Document usb role
 switch support
Date: Tue, 21 May 2019 08:27:23 +0000
Message-ID: 
 <OSAPR01MB308934C379A9759841E58043D8070@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
 <1557922152-16449-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1557922152-16449-3-git-send-email-biju.das@bp.renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Felipe Balbi <balbi@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Biju-san,

Thank you for the patch!

> From: Biju Das, Sent: Wednesday, May 15, 2019 9:09 PM
>=20
> Update the DT bindings documentation to support usb role switch
> for USB Type-C connector using USB role switch class framework.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  V5-->V6
>   * Updated description
>   * Added usb-role-switch-property
>  V4-->V5
>   * No Change
>  V3-->V4
>   * No Change
>  V2-->V3
>   * Added optional renesas,usb-role-switch property.
>  V1-->V2
>   * Added usb-role-switch-property
>   * Updated the example with usb-role-switch property.
> ---
>  .../devicetree/bindings/usb/renesas_usb3.txt       | 26 ++++++++++++++++=
++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> index 35039e7..ea6c63c 100644
> --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> @@ -22,6 +22,11 @@ Required properties:
>  Optional properties:
>    - phys: phandle + phy specifier pair
>    - phy-names: must be "usb"
> +  - usb-role-switch: support role switch. see usb/generic.txt
> +
> +Sub-nodes:
> +The port would be added as a subnode if the "usb-role-switch" property i=
s used.
> +	see graph.txt

I think we should describe which type of a subnode is needed.
I made an example below. This is based on the usb-connector.txt.
---
Sub-nodes:
- any connector to the data bus of this controller should be modeled using =
the OF graph
  bindings specified in bindings/graph.txt.
---

>  Example of R-Car H3 ES1.x:
>  	usb3_peri0: usb@ee020000 {
> @@ -39,3 +44,24 @@ Example of R-Car H3 ES1.x:
>  		interrupts =3D <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks =3D <&cpg CPG_MOD 327>;
>  	};
> +
> +Example of RZ/G2E:
> +	usb3_peri0: usb@ee020000 {
> +		compatible =3D "renesas,r8a774c0-usb3-peri",
> +			     "renesas,rcar-gen3-usb3-peri";
> +		reg =3D <0 0xee020000 0 0x400>;
> +		interrupts =3D <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks =3D <&cpg CPG_MOD 328>;
> +		companion =3D <&xhci0>;
> +		usb-role-switch;
> +
> +		port {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			usb3peri_role_switch: endpoint@0 {
> +				reg =3D <0>;

I'm not sure, but I don't think this endpoint@0 and reg =3D <0> are needed.
In other words, can we use have following node?
			usb3peri_role_switch: endpoint {
				remote-endpoint =3D <&hd3ss3220_ep>;
			};

Best regards,
Yoshihiro Shimoda
