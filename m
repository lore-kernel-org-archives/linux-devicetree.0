From: Horia Geanta <horia.geanta@nxp.com>
Subject: Re: [PATCH] arm64: dts: imx8mq: Add CAAM node
Date: Fri, 6 Sep 2019 10:36:54 +0000
Message-ID: <VI1PR0402MB3485E83188A0972A2DA74C5D98BA0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <20190830210139.7028-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, Shawn Guo <shawnguo@kernel.org>
Cc: Cory Tusar <cory.tusar@zii.aero>, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Iuliana Prodan <iuliana.prodan@nxp.com>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 8/31/2019 12:01 AM, Andrey Smirnov wrote:=0A=
> Add node for CAAM - Cryptographic Acceleration and Assurance Module.=0A=
> =0A=
> Signed-off-by: Horia Geant=E3 <horia.geanta@nxp.com>=0A=
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>=0A=
> Cc: Cory Tusar <cory.tusar@zii.aero>=0A=
> Cc: Chris Healy <cphealy@gmail.com>=0A=
> Cc: Lucas Stach <l.stach@pengutronix.de>=0A=
> Cc: Herbert Xu <herbert@gondor.apana.org.au>=0A=
> Cc: Shawn Guo <shawnguo@kernel.org>=0A=
> Cc: Iuliana Prodan <iuliana.prodan@nxp.com>=0A=
> Cc: linux-crypto@vger.kernel.org=0A=
> Cc: linux-kernel@vger.kernel.org=0A=
> ---=0A=
> =0A=
> Shawn:=0A=
> =0A=
> Just a bit of a context: as per this thread=0A=
> https://lore.kernel.org/linux-crypto/20190830131547.GA27480@gondor.apana.=
org.au/=0A=
> I am hoping I can get and Ack from you for this patch, so it can go=0A=
> via cryptodev tree.=0A=
> =0A=
Could we please get an Ack in time for v5.4?=0A=
=0A=
Thanks,=0A=
Horia=0A=
=0A=
> Thanks,=0A=
> Andrey Smirnov=0A=
> =0A=
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 30 +++++++++++++++++++++++=
=0A=
>  1 file changed, 30 insertions(+)=0A=
> =0A=
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mq.dtsi=0A=
> index d09b808eff87..752d5a61878c 100644=0A=
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi=0A=
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi=0A=
> @@ -728,6 +728,36 @@=0A=
>  				status =3D "disabled";=0A=
>  			};=0A=
>  =0A=
> +			crypto: crypto@30900000 {=0A=
> +				compatible =3D "fsl,sec-v4.0";=0A=
> +				#address-cells =3D <1>;=0A=
> +				#size-cells =3D <1>;=0A=
> +				reg =3D <0x30900000 0x40000>;=0A=
> +				ranges =3D <0 0x30900000 0x40000>;=0A=
> +				interrupts =3D <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;=0A=
> +				clocks =3D <&clk IMX8MQ_CLK_AHB>,=0A=
> +					 <&clk IMX8MQ_CLK_IPG_ROOT>;=0A=
> +				clock-names =3D "aclk", "ipg";=0A=
> +=0A=
> +				sec_jr0: jr@1000 {=0A=
> +					compatible =3D "fsl,sec-v4.0-job-ring";=0A=
> +					reg =3D <0x1000 0x1000>;=0A=
> +					interrupts =3D <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;=0A=
> +				};=0A=
> +=0A=
> +				sec_jr1: jr@2000 {=0A=
> +					compatible =3D "fsl,sec-v4.0-job-ring";=0A=
> +					reg =3D <0x2000 0x1000>;=0A=
> +					interrupts =3D <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;=0A=
> +				};=0A=
> +=0A=
> +				sec_jr2: jr@3000 {=0A=
> +					compatible =3D "fsl,sec-v4.0-job-ring";=0A=
> +					reg =3D <0x3000 0x1000>;=0A=
> +					interrupts =3D <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;=0A=
> +				};=0A=
> +			};=0A=
> +=0A=
>  			i2c1: i2c@30a20000 {=0A=
>  				compatible =3D "fsl,imx8mq-i2c", "fsl,imx21-i2c";=0A=
>  				reg =3D <0x30a20000 0x10000>;=0A=
> =0A=
=0A=
