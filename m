Return-Path: <SRS0=QEaW=U2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr80055.outbound.protection.outlook.com ([40.107.8.55]:35779
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726658AbfF0DPy (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 26 Jun 2019 23:15:54 -0400
From: Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH] ARM: imx25: provide a fixed regulator for usb phys
Date: Thu, 27 Jun 2019 03:15:10 +0000
Message-ID: <VI1PR04MB53270E979BA9817D47A7AFC88BFD0@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20190625100412.11815-1-u.kleine-koenig@pengutronix.de>
 <VI1PR04MB5327E09DB0DFEB7E868DB59D8BE20@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <20190626055409.jjiwptyths6p6jty@pengutronix.de>
In-Reply-To: <20190626055409.jjiwptyths6p6jty@pengutronix.de>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>, "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>
Cc: =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

=20
> On 19-06-26 02:40, Peter Chen wrote:
> >
> > > Subject: [PATCH] ARM: imx25: provide a fixed regulator for usb phys
> > >
> > > The usb phys are internal to the SoC and so it their 5V supply. With
> > > this regulator added explicitly the following (harmless) boot message=
s go away:
> > >
> > > 	usb_phy_generic usbphy:usb-phy@0: usbphy:usb-phy@0 supply vcc not
> > > found, using dummy regulator
> > > 	usb_phy_generic usbphy:usb-phy@1: usbphy:usb-phy@1 supply vcc not
> > > found, using dummy regulator
> > >
> >
> > To eliminate the warning message, I suggest doing below changes, as
> > vcc supply is not mandatory.
> >
> > diff --git a/drivers/usb/phy/phy-generic.c
> > b/drivers/usb/phy/phy-generic.c index a53b89be5324..01a5ff1a0515
> > 100644
> > --- a/drivers/usb/phy/phy-generic.c
> > +++ b/drivers/usb/phy/phy-generic.c
> > @@ -275,7 +275,7 @@ int usb_phy_gen_create_phy(struct device *dev, stru=
ct
> usb_phy_generic *nop,
> >                 }
> >         }
> >
> > -       nop->vcc =3D devm_regulator_get(dev, "vcc");
> > +       nop->vcc =3D devm_regulator_get_optional(dev, "vcc");
>=20
> Is the regulator optional? IMHO this shouldn't be the fix. I think the ri=
ght fix is Uwe's
> approach.
>=20

Add Felipe.

Some USB PHY's power are from the core system's power (eg, DDR), and some a=
re
fixed at the board and no switch for it. So, it is transparent for software=
 at some cases.

Peter

> Regards,
>   Marco
>=20
> >         if (IS_ERR(nop->vcc)) {
> >                 dev_dbg(dev, "Error getting vcc regulator: %ld\n",
> >                                         PTR_ERR(nop->vcc));
> >
> > Peter
> >
> > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > ---
> > > Hello,
> > >
> > > note I'm an USB noob, so please consider carefully before applying
> > > :-) I also put the regulator near the usbphy node instead of in
> > > alphabetic order. Not sure what is sensible/usual here, too.
> > >
> > > Best regards
> > > Uwe
> > >
> > >  arch/arm/boot/dts/imx25.dtsi | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/imx25.dtsi
> > > b/arch/arm/boot/dts/imx25.dtsi
> > > --- a/arch/arm/boot/dts/imx25.dtsi
> > > +++ b/arch/arm/boot/dts/imx25.dtsi
> > > @@ -614,6 +614,11 @@
> > >  		};
> > >  	};
> > >
> > > +	reg_usb: regulator_usbphy {
> > > +		compatible =3D "regulator-fixed";
> > > +		regulator-name =3D "usb-phy supply";
> > > +	};
> > > +
> > >  	usbphy {
> > >  		compatible =3D "simple-bus";
> > >  		#address-cells =3D <1>;
> > > @@ -623,12 +630,14 @@
> > >  			reg =3D <0>;
> > >  			compatible =3D "usb-nop-xceiv";
> > >  			#phy-cells =3D <0>;
> > > +			vcc-supply =3D <&reg_usb>;
> > >  		};
> > >
> > >  		usbphy1: usb-phy@1 {
> > >  			reg =3D <1>;
> > >  			compatible =3D "usb-nop-xceiv";
> > >  			#phy-cells =3D <0>;
> > > +			vcc-supply =3D <&reg_usb>;
> > >  		};
> > >  	};
> > >  };
> > > --
> > > 2.20.1
> >
>=20
> --
> Pengutronix e.K.                           |                             =
|
> Industrial Linux Solutions                 |
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.pe=
ngutro
> nix.de%2F&amp;data=3D02%7C01%7Cpeter.chen%40nxp.com%7Cd1a839827b3a49
> 0624f508d6f9fab73f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63
> 6971252538657445&amp;sdata=3DkfTeGJ99AfS74BqdRAOLVJm52jIFIdNmZXXYPX
> SzAcA%3D&amp;reserved=3D0  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|
