From: Pankaj Bansal <pankaj.bansal@nxp.com>
Subject: RE: [PATCH 2/2] ARM64: dts: Remove unused properties from FSL QSPI
 nodes
Date: Fri, 9 Aug 2019 06:18:47 +0000
Message-ID: <VI1PR0401MB2496C44034AB6DB5F5379904F1D60@VI1PR0401MB2496.eurprd04.prod.outlook.com>
References: <20190320143800.3555-1-frieder.schrempf@kontron.de>
 <20190320143800.3555-2-frieder.schrempf@kontron.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190320143800.3555-2-frieder.schrempf@kontron.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Schrempf Frieder <frieder.schrempf@kontron.de>, Shawn Guo <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>, Varun Sethi <V.Sethi@nxp.com>, Ashish Kumar <ashish.kumar@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Shawn/Leo,

Removing the "big-endian" property has caused problems in our UEFI firmware=
.
In UEFI, we use the device tree to detect and use the qspi controller and f=
lashes attached to it.
We don't maintain a list of platforms like linux driver.

Can you please revert the endianness change from linux mainline ?

Regards,
Pankaj Bansal

> -----Original Message-----
> From: devicetree-owner@vger.kernel.org <devicetree-owner@vger.kernel.org>
> On Behalf Of Schrempf Frieder
> Sent: Wednesday, 20 March, 2019 08:08 PM
> To: Shawn Guo <shawnguo@kernel.org>; Leo Li <leoyang.li@nxp.com>
> Cc: Schrempf Frieder <frieder.schrempf@kontron.de>; Rob Herring
> <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>; linux-arm-
> kernel@lists.infradead.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: [PATCH 2/2] ARM64: dts: Remove unused properties from FSL QSPI
> nodes
>=20
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>=20
> After switching to the new FSL QSPI driver the properties 'fsl,qspi-has-s=
econd-
> chip' and 'big-endian' are not used anymore.
>=20
> The driver now uses the 'reg' property to determine the bus and the chips=
elect.
> The endianness is selected by the driver depending on which SoC is used.
>=20
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 1 -
> arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 2 --
>  2 files changed, 3 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
> b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
> index 6fd6116509cc..2fb8138c6bb0 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
> @@ -296,7 +296,6 @@
>  			interrupts =3D <0 99 0x4>;
>  			clock-names =3D "qspi_en", "qspi";
>  			clocks =3D <&clockgen 4 0>, <&clockgen 4 0>;
> -			big-endian;
>  			status =3D "disabled";
>  		};
>=20
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> index cb7185014d3a..b0ef08b090dd 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> @@ -215,8 +215,6 @@
>  			interrupts =3D <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
>  			clock-names =3D "qspi_en", "qspi";
>  			clocks =3D <&clockgen 4 1>, <&clockgen 4 1>;
> -			big-endian;
> -			fsl,qspi-has-second-chip;
>  			status =3D "disabled";
>  		};
>=20
> --
> 2.17.1
