From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 08/14] ARM: dts: imx6ul: add kpp support
Date: Wed, 13 Jan 2016 10:40:36 +0100
Message-ID: <1452678036.3694.51.camel@pengutronix.de>
References: <1452619291-13625-1-git-send-email-LW@KARO-electronics.de>
	 <1452619291-13625-2-git-send-email-LW@KARO-electronics.de>
	 <1452619291-13625-3-git-send-email-LW@KARO-electronics.de>
	 <1452619291-13625-4-git-send-email-LW@KARO-electronics.de>
	 <1452619291-13625-5-git-send-email-LW@KARO-electronics.de>
	 <1452619291-13625-6-git-send-email-LW@KARO-electronics.de>
	 <1452619291-13625-7-git-send-email-LW@KARO-electronics.de>
	 <1452619291-13625-8-git-send-email-LW@KARO-electronics.de>
	 <1452619291-13625-9-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452619291-13625-9-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lothar =?ISO-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, den 12.01.2016, 18:21 +0100 schrieb Lothar Wa=C3=9Fmann:
> Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
> ---
>  arch/arm/boot/dts/imx6ul.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul=
=2Edtsi
> index 40ea5f0..a578b23 100644
> --- a/arch/arm/boot/dts/imx6ul.dtsi
> +++ b/arch/arm/boot/dts/imx6ul.dtsi
> @@ -373,6 +373,14 @@
>  				status =3D "disabled";
>  			};
> =20
> +			kpp: kpp@020b8000 {
> +				compatible =3D "fsl,imx6q-kpp", "fsl,imx21-kpp";

Please always add a new chip specific compatible here, even if the unit=
s
are fully working with the compatible of an older chip. This allows to
implement chip specific workarounds in the respective drivers without
changing the DT again if any bugs are found in the integration later on=
=2E

So the above should be:
compatible =3D "fsl,imx6ul-kpp", "fsl,imx6q-kpp", "fsl,imx21-kpp";

This comment applies to most of the patches in this series following
this one.

Regards,
Lucas

> +				reg =3D <0x020b8000 0x4000>;
> +				interrupts =3D <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks =3D <&clks IMX6UL_CLK_KPP>;
> +				status =3D "disabled";
> +			};
> +
>  			wdog1: wdog@020bc000 {
>  				compatible =3D "fsl,imx6ul-wdt", "fsl,imx21-wdt";
>  				reg =3D <0x020bc000 0x4000>;

--=20
Pengutronix e.K.             | Lucas Stach                 |
Industrial Linux Solutions   | http://www.pengutronix.de/  |
