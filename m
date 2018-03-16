From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH] ARM: dts: imx7d-sdb: add gpio key support
Date: Fri, 16 Mar 2018 10:28:01 +0000
Message-ID: <AM3PR04MB306ED8D196C18858B5B368480D70@AM3PR04MB306.eurprd04.prod.outlook.com>
References: <1521190471-25242-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521190471-25242-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Anson Huang [mailto:Anson.Huang@nxp.com]
> Sent: Friday, March 16, 2018 4:55 PM
> To: shawnguo@kernel.org; kernel@pengutronix.de; Fabio Estevam
> <fabio.estevam@nxp.com>; robh+dt@kernel.org; mark.rutland@arm.com;
> linux@armlinux.org.uk
> Cc: dl-linux-imx <linux-imx@nxp.com>; linux-arm-kernel@lists.infradead.or=
g;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH] ARM: dts: imx7d-sdb: add gpio key support
>=20
> Add support for imx7d-sdb board's gpio keys:
>=20
> S1(FUNC1): KEY_VOLUMEUP
> S3(FUNC2): KEY_VOLUMEDOWN
>=20

Acked-by: Dong Aisheng <aisheng.dong@nxp.com>

Regards
Dong Aisheng

> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  arch/arm/boot/dts/imx7d-sdb.dts | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-
> sdb.dts index 7f241af..e47b5b2 100644
> --- a/arch/arm/boot/dts/imx7d-sdb.dts
> +++ b/arch/arm/boot/dts/imx7d-sdb.dts
> @@ -52,6 +52,24 @@
>  		reg =3D <0x80000000 0x80000000>;
>  	};
>=20
> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_gpio_keys>;
> +
> +		volume-up {
> +			label =3D "Volume Up";
> +			gpios =3D <&gpio5 11 GPIO_ACTIVE_LOW>;
> +			linux,code =3D <KEY_VOLUMEUP>;
> +		};
> +
> +		volume-down {
> +			label =3D "Volume Down";
> +			gpios =3D <&gpio5 10 GPIO_ACTIVE_LOW>;
> +			linux,code =3D <KEY_VOLUMEDOWN>;
> +		};
> +	};
> +
>  	spi4 {
>  		compatible =3D "spi-gpio";
>  		pinctrl-names =3D "default";
> @@ -519,6 +537,12 @@
>  			>;
>  		};
>=20
> +		pinctrl_gpio_keys: gpio_keysgrp {
> +			fsl,pins =3D <
> +				MX7D_PAD_SD2_RESET_B__GPIO5_IO11
> 	0x59
> +				MX7D_PAD_SD2_WP__GPIO5_IO10
> 	0x59
> +			>;
> +		};
>=20
>  		pinctrl_hog: hoggrp {
>  			fsl,pins =3D <
> --
> 2.7.4
