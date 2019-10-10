From: Leo Li <leoyang.li@nxp.com>
Subject: RE: [PATCH v2] arm64: dts: ls1028a: fix a compatible issue
Date: Thu, 10 Oct 2019 22:31:16 +0000
Message-ID: <VE1PR04MB6687C0E8739C82D1DAFC71D58F940@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20191010083334.7037-1-andy.tang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191010083334.7037-1-andy.tang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Tang <andy.tang@nxp.com>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Yuantian Tang <andy.tang@nxp.com>
> Sent: Thursday, October 10, 2019 3:34 AM
> To: shawnguo@kernel.org
> Cc: Leo Li <leoyang.li@nxp.com>; robh+dt@kernel.org;
> mark.rutland@arm.com; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Andy Tang
> <andy.tang@nxp.com>
> Subject: [PATCH v2] arm64: dts: ls1028a: fix a compatible issue
>=20
> The I2C multiplexer used on ls1028aqds is PCA9547, not PCA9847.
> If the wrong compatible was used, this chip will not be able to be probed
> correctly and hence fail to work.
>=20
> Signed-off-by: Yuantian Tang <andy.tang@nxp.com>

Acked-by: Li Yang <leoyang.li@nxp.com>

> ---
> v2:
> 	- refine the description
>  arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> index 5e14e5a19744..f5da9e8b0d9d 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> @@ -107,7 +107,7 @@
>  	status =3D "okay";
>=20
>  	i2c-mux@77 {
> -		compatible =3D "nxp,pca9847";
> +		compatible =3D "nxp,pca9547";
>  		reg =3D <0x77>;
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
> --
> 2.17.1
