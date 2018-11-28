Return-Path: <SRS0=ggKL=OH=pengutronix.de=mkl@kernel.org>
References: <20181128093658.27990-1-qiangqing.zhang@nxp.com>
 <20181128093658.27990-4-qiangqing.zhang@nxp.com>
From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [PATCH V3 3/3] ARM: dts: imx6qdl-sabreauto: add flexcan support
Message-ID: <456ad490-21d2-5324-4b4c-52a0cbde062e@pengutronix.de>
Date: Wed, 28 Nov 2018 11:00:28 +0100
MIME-Version: 1.0
In-Reply-To: <20181128093658.27990-4-qiangqing.zhang@nxp.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="KjKAlwyV8QaFeMksXOAHYMfOCOffNksyl"
To: Joakim Zhang <qiangqing.zhang@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Cc: Aisheng DONG <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KjKAlwyV8QaFeMksXOAHYMfOCOffNksyl
Content-Type: multipart/mixed; boundary="Zito7c7nvJXeWrvUqZaxMRDwpc3vXSAW6";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Joakim Zhang <qiangqing.zhang@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Cc: Aisheng DONG <aisheng.dong@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Fabio Estevam <fabio.estevam@nxp.com>
Message-ID: <456ad490-21d2-5324-4b4c-52a0cbde062e@pengutronix.de>
Subject: Re: [PATCH V3 3/3] ARM: dts: imx6qdl-sabreauto: add flexcan support
References: <20181128093658.27990-1-qiangqing.zhang@nxp.com>
 <20181128093658.27990-4-qiangqing.zhang@nxp.com>
In-Reply-To: <20181128093658.27990-4-qiangqing.zhang@nxp.com>

--Zito7c7nvJXeWrvUqZaxMRDwpc3vXSAW6
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

On 11/28/18 10:39 AM, Joakim Zhang wrote:
> From: Aisheng Dong <aisheng.dong@nxp.com>
>=20
> The flexcan1 is pin conflict with fec. User would make flexcan1 enabled=

> with fec disabled to use CAN.
>=20
> Signed-off-by: Aisheng Dong <aisheng.dong@nxp.com>
> Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
> ---
> V1->V2:
> 	*using SPDX tag for new files and remove pinctrl-assert-gpios property=
=2E

There's a pinctrl-assert-gpios in the dtsi.

> V2->V3:
> 	*remove the new files due to a pile of DTS files for a single
> 	 development board with pin sharing among different devices not
> 	 maintained.
> ---
>  arch/arm/boot/dts/imx6qdl-sabreauto.dtsi | 47 ++++++++++++++++++++++++=

>  1 file changed, 47 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi b/arch/arm/boot/d=
ts/imx6qdl-sabreauto.dtsi
> index a10f0ad0bfb1..bd4fe0add59d 100644
> --- a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
> @@ -101,6 +101,25 @@
>  		enable-active-high;
>  	};
> =20
> +	reg_can_en: regulator-can-en {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "can-en";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&max7310_b 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_can_stby: regulator-can-stby {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "can-stby";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&max7310_b 5 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		vin-supply =3D <&reg_can_en>;
> +	};
> +
>  	sound-cs42888 {
>  		compatible =3D "fsl,imx6-sabreauto-cs42888",
>  			"fsl,imx-audio-cs42888";
> @@ -279,6 +298,20 @@
>  	status =3D "okay";
>  };
> =20
> +&can1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_flexcan1>;
> +	pinctrl-assert-gpios =3D <&max7310_b 3 GPIO_ACTIVE_HIGH>; /* TX */
        ^^^^^^^^^^^^^^^^^^^^

Marc

> +	xceiver-supply =3D <&reg_can_stby>;
> +	status =3D "disabled"; /* pin conflict with fec */ };
> +
> +&can2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_flexcan2>;
> +	xceiver-supply =3D <&reg_can_stby>;
> +	status =3D "okay";
> +};
> +
>  &gpmi {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_gpmi_nand>;
> @@ -494,6 +527,20 @@
>  			>;
>  		};
> =20
> +		pinctrl_flexcan1: flexcan1grp {
> +			fsl,pins =3D <
> +				MX6QDL_PAD_KEY_ROW2__FLEXCAN1_RX        0x17059
> +				MX6QDL_PAD_KEY_COL2__FLEXCAN1_TX	0x17059
> +			>;
> +		};
> +
> +		pinctrl_flexcan2: flexcan2grp {
> +			fsl,pins =3D <
> +				MX6QDL_PAD_KEY_COL4__FLEXCAN2_TX	0x17059
> +				MX6QDL_PAD_KEY_ROW4__FLEXCAN2_RX	0x17059
> +			>;
> +		};
> +
>  		pinctrl_gpio_keys: gpiokeysgrp {
>  			fsl,pins =3D <
>  				MX6QDL_PAD_SD2_CMD__GPIO1_IO11		0x1b0b0
>=20


--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--Zito7c7nvJXeWrvUqZaxMRDwpc3vXSAW6--

--KjKAlwyV8QaFeMksXOAHYMfOCOffNksyl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEENrCndlB/VnAEWuH5k9IU1zQoZfEFAlv+ZzwACgkQk9IU1zQo
ZfHwXQgAtVUnwixpA1TkOwTqHuPxOef5m6i/ObKPQBRZsfQBiQ0adfgzPs4b8kCo
VXKs8Uos2GmwKxjS3RZjvyXlXlvGRywBEGwms73gb2VWtckaWmdLJUfRSvnQyprH
vTs5TFKi50cbex1INbcXaWg1HKoDBoVfK0f1YLfsbJ7CZIs4F0AkWaITAsjx2EMu
uTcXukQ3BpUoKYYwe6B2c9yX1oiuBX1iOcnuOeCIt4P/f60dKPjdKQwR8fDiQnwT
EGR7NiMaHfO66dQHxr0fuUS7JcvvmTEOqwB3NN+rsKhHCiSoueDyF98EniPrL4qP
491mYELyxsvE16bGPij387QruBWyRw==
=Mku1
-----END PGP SIGNATURE-----

--KjKAlwyV8QaFeMksXOAHYMfOCOffNksyl--
