From: PETER CHEN <peter.chen@nxp.com>
Subject: RE: [PATCH] ARM: dts: imx: Add dummy PHYs for HSIC-only USB
 controllers
Date: Thu, 22 Nov 2018 06:48:09 +0000
Message-ID: <VI1PR04MB5327E5CE977E59E03B1B6C4C8BDB0@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <1539848729-27646-1-git-send-email-frieder.schrempf@kontron.de>
 <20181031073112.GL10386@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181031073112.GL10386@tiger>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

=20
>=20
> On Thu, Oct 18, 2018 at 09:45:04AM +0200, Frieder Schrempf wrote:
> > Some SOCs in the i.MX6 family have a USB host controller that is only
> > capable of the HSIC interface and has no on-board PHY.
> >
> > To be able to use these controllers, we need to add "usb-nop-xceiv"
> > dummy PHYs.
> >
> > Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>=20
> @Peter, looks good to you?
>=20
> Shawn
>=20
> > ---
> >  arch/arm/boot/dts/imx6qdl.dtsi | 14 ++++++++++++++
> > arch/arm/boot/dts/imx6sl.dtsi  |  7 +++++++
> > arch/arm/boot/dts/imx6sx.dtsi  |  6 ++++++
> >  3 files changed, 27 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/imx6qdl.dtsi
> > b/arch/arm/boot/dts/imx6qdl.dtsi index 61d2d26..d3404d1 100644
> > --- a/arch/arm/boot/dts/imx6qdl.dtsi
> > +++ b/arch/arm/boot/dts/imx6qdl.dtsi
> > @@ -139,6 +139,16 @@
> >  		interrupts =3D <0 94 IRQ_TYPE_LEVEL_HIGH>;
> >  	};
> >
> > +	usbphynop1: usbphynop1 {
> > +		compatible =3D "usb-nop-xceiv";
> > +		#phy-cells =3D <0>;
> > +	};
> > +

Why #phy-cells property is needed? Others are ok for me.

Peter

> > +	usbphynop2: usbphynop2 {
> > +		compatible =3D "usb-nop-xceiv";
> > +		#phy-cells =3D <0>;
> > +	};
> > +
> >  	soc {
> >  		#address-cells =3D <1>;
> >  		#size-cells =3D <1>;
> > @@ -981,6 +991,8 @@
> >  				reg =3D <0x02184400 0x200>;
> >  				interrupts =3D <0 41 IRQ_TYPE_LEVEL_HIGH>;
> >  				clocks =3D <&clks IMX6QDL_CLK_USBOH3>;
> > +				fsl,usbphy =3D <&usbphynop1>;
> > +				phy_type =3D "hsic";
> >  				fsl,usbmisc =3D <&usbmisc 2>;
> >  				dr_mode =3D "host";
> >  				ahb-burst-config =3D <0x0>;
> > @@ -994,6 +1006,8 @@
> >  				reg =3D <0x02184600 0x200>;
> >  				interrupts =3D <0 42 IRQ_TYPE_LEVEL_HIGH>;
> >  				clocks =3D <&clks IMX6QDL_CLK_USBOH3>;
> > +				fsl,usbphy =3D <&usbphynop2>;
> > +				phy_type =3D "hsic";
> >  				fsl,usbmisc =3D <&usbmisc 3>;
> >  				dr_mode =3D "host";
> >  				ahb-burst-config =3D <0x0>;
> > diff --git a/arch/arm/boot/dts/imx6sl.dtsi
> > b/arch/arm/boot/dts/imx6sl.dtsi index 7a4f5da..81edcdc 100644
> > --- a/arch/arm/boot/dts/imx6sl.dtsi
> > +++ b/arch/arm/boot/dts/imx6sl.dtsi
> > @@ -110,6 +110,11 @@
> >  		interrupts =3D <0 94 IRQ_TYPE_LEVEL_HIGH>;
> >  	};
> >
> > +	usbphynop1: usbphynop1 {
> > +		compatible =3D "usb-nop-xceiv";
> > +		#phy-cells =3D <0>;
> > +	};
> > +
> >  	soc {
> >  		#address-cells =3D <1>;
> >  		#size-cells =3D <1>;
> > @@ -815,6 +820,8 @@
> >  				reg =3D <0x02184400 0x200>;
> >  				interrupts =3D <0 40 IRQ_TYPE_LEVEL_HIGH>;
> >  				clocks =3D <&clks IMX6SL_CLK_USBOH3>;
> > +				fsl,usbphy =3D <&usbphynop1>;
> > +				phy_type =3D "hsic";
> >  				fsl,usbmisc =3D <&usbmisc 2>;
> >  				dr_mode =3D "host";
> >  				ahb-burst-config =3D <0x0>;
> > diff --git a/arch/arm/boot/dts/imx6sx.dtsi
> > b/arch/arm/boot/dts/imx6sx.dtsi index 844caa3..07ed417 100644
> > --- a/arch/arm/boot/dts/imx6sx.dtsi
> > +++ b/arch/arm/boot/dts/imx6sx.dtsi
> > @@ -159,6 +159,11 @@
> >  		interrupts =3D <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> >  	};
> >
> > +	usbphynop1: usbphynop1 {
> > +		compatible =3D "usb-nop-xceiv";
> > +		#phy-cells =3D <0>;
> > +	};
> > +
> >  	soc {
> >  		#address-cells =3D <1>;
> >  		#size-cells =3D <1>;
> > @@ -877,6 +882,7 @@
> >  				reg =3D <0x02184400 0x200>;
> >  				interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> >  				clocks =3D <&clks IMX6SX_CLK_USBOH3>;
> > +				fsl,usbphy =3D <&usbphynop1>;
> >  				fsl,usbmisc =3D <&usbmisc 2>;
> >  				phy_type =3D "hsic";
> >  				fsl,anatop =3D <&anatop>;
> > --
> > 2.7.4
> >
