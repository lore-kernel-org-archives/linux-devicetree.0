Return-Path: <SRS0=nxYe=TV=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH v6 1/7] dt-bindings: usb: hd3ss3220 device tree binding
 document
Date: Tue, 21 May 2019 08:03:29 +0000
Message-ID: 
 <OSAPR01MB30899C8C3E0F316FF37DAE3AD8070@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
 <1557922152-16449-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1557922152-16449-2-git-send-email-biju.das@bp.renesas.com>
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
> Add device tree binding document for TI HD3SS3220 Type-C DRP port
> controller driver.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> V5-->V6
>   * No change.
> V4-->V5
>   * No Change.
> V3-->V4
>   * No Change.
> V2-->V3
>   * Added Rob's Reviewed by tag.
> V1-->V2
>   * Added connector node.
>   * updated the example with connector node.
> ---
>  .../devicetree/bindings/usb/ti,hd3ss3220.txt       | 37 ++++++++++++++++=
++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.tx=
t
>=20
> diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> new file mode 100644
> index 0000000..7f41400
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> @@ -0,0 +1,37 @@
> +TI HD3SS3220 TypeC DRP Port Controller.
> +
> +Required properties:
> + - compatible: Must be "ti,hd3ss3220".
> + - reg: I2C slave address, must be 0x47 or 0x67 based on ADDR pin.
> + - interrupts: <a b> where a is the interrupt number and b represents an
> +   encoding of the sense and level information for the interrupt.
> +
> +Required sub-node:
> + - connector : The "usb-c-connector" attached to the hd3ss3220 chip. The

s/connector :/connector:/

> +   bindings of the connector node are specified in:
> +
> +	Documentation/devicetree/bindings/connector/usb-connector.txt
> +
> +Example:
> +hd3ss3220@47 {
> +	compatible =3D "ti,hd3ss3220";
> +	reg =3D <0x47>;
> +	interrupt-parent =3D <&gpio6>;
> +	interrupts =3D <3 IRQ_TYPE_LEVEL_LOW>;
> +
> +	usb_con: connector {
> +		compatible =3D "usb-c-connector";
> +		label =3D "USB-C";
> +		data-role =3D "dual";
> +	};
> +
> +	port {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		hd3ss3220_ep: endpoint@0 {
> +			reg =3D <0>;
> +			remote-endpoint =3D <&usb3peri_role_switch>;
> +		};
> +	};

According to the connector/usb-connector.txt, should the connector node
have ports, port@1 and an endpoint nodes like below?

	usb_con: connector {
		compatible =3D "usb-c-connector";
		label =3D "USB-C";
		data-role =3D "dual";

		ports {
			#address-cells =3D <1>;
			#size-cells =3D <0>;

			port@1 {
				reg =3D <1>;
				hd3ss3220_ep: endpoint {
					remote-endpoint =3D <&usb3peri_role_switch>;
				};
			};
		};
	};

Best regards,
Yoshihiro Shimoda
