Return-Path: <SRS0=H+X4=UZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:59513 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbfFZFyL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 26 Jun 2019 01:54:11 -0400
Date: Wed, 26 Jun 2019 07:54:09 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH] ARM: imx25: provide a fixed regulator for usb phys
Message-ID: <20190626055409.jjiwptyths6p6jty@pengutronix.de>
References: <20190625100412.11815-1-u.kleine-koenig@pengutronix.de>
 <VI1PR04MB5327E09DB0DFEB7E868DB59D8BE20@VI1PR04MB5327.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI1PR04MB5327E09DB0DFEB7E868DB59D8BE20@VI1PR04MB5327.eurprd04.prod.outlook.com>
Sender: devicetree-owner@vger.kernel.org
To: Peter Chen <peter.chen@nxp.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

On 19-06-26 02:40, Peter Chen wrote:
>  
> > Subject: [PATCH] ARM: imx25: provide a fixed regulator for usb phys
> > 
> > The usb phys are internal to the SoC and so it their 5V supply. With this regulator
> > added explicitly the following (harmless) boot messages go away:
> > 
> > 	usb_phy_generic usbphy:usb-phy@0: usbphy:usb-phy@0 supply vcc not
> > found, using dummy regulator
> > 	usb_phy_generic usbphy:usb-phy@1: usbphy:usb-phy@1 supply vcc not
> > found, using dummy regulator
> > 
> 
> To eliminate the warning message, I suggest doing below changes, as vcc
> supply is not mandatory.
> 
> diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generic.c
> index a53b89be5324..01a5ff1a0515 100644
> --- a/drivers/usb/phy/phy-generic.c
> +++ b/drivers/usb/phy/phy-generic.c
> @@ -275,7 +275,7 @@ int usb_phy_gen_create_phy(struct device *dev, struct usb_phy_generic *nop,
>                 }   
>         }   
>  
> -       nop->vcc = devm_regulator_get(dev, "vcc");
> +       nop->vcc = devm_regulator_get_optional(dev, "vcc");

Is the regulator optional? IMHO this shouldn't be the fix. I think the
right fix is Uwe's approach.

Regards,
  Marco

>         if (IS_ERR(nop->vcc)) {
>                 dev_dbg(dev, "Error getting vcc regulator: %ld\n",
>                                         PTR_ERR(nop->vcc));
> 
> Peter
> 
> > Signed-off-by: Uwe Kleine-K�nig <u.kleine-koenig@pengutronix.de>
> > ---
> > Hello,
> > 
> > note I'm an USB noob, so please consider carefully before applying :-) I also put the
> > regulator near the usbphy node instead of in alphabetic order. Not sure what is
> > sensible/usual here, too.
> > 
> > Best regards
> > Uwe
> > 
> >  arch/arm/boot/dts/imx25.dtsi | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/imx25.dtsi b/arch/arm/boot/dts/imx25.dtsi
> > --- a/arch/arm/boot/dts/imx25.dtsi
> > +++ b/arch/arm/boot/dts/imx25.dtsi
> > @@ -614,6 +614,11 @@
> >  		};
> >  	};
> > 
> > +	reg_usb: regulator_usbphy {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "usb-phy supply";
> > +	};
> > +
> >  	usbphy {
> >  		compatible = "simple-bus";
> >  		#address-cells = <1>;
> > @@ -623,12 +630,14 @@
> >  			reg = <0>;
> >  			compatible = "usb-nop-xceiv";
> >  			#phy-cells = <0>;
> > +			vcc-supply = <&reg_usb>;
> >  		};
> > 
> >  		usbphy1: usb-phy@1 {
> >  			reg = <1>;
> >  			compatible = "usb-nop-xceiv";
> >  			#phy-cells = <0>;
> > +			vcc-supply = <&reg_usb>;
> >  		};
> >  	};
> >  };
> > --
> > 2.20.1
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
