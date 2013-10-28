From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: imx6q-arm2: enable USB OTG
Date: Mon, 28 Oct 2013 16:04:16 +0800
Message-ID: <20131028080415.GD31499@shlinux1.ap.freescale.net>
References: <1382940302-12931-1-git-send-email-peter.chen@freescale.com>
 <20131028082005.GG2839@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131028082005.GG2839-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 28, 2013 at 04:20:07PM +0800, Shawn Guo wrote:
> On Mon, Oct 28, 2013 at 02:05:02PM +0800, Peter Chen wrote:
> > Enable USB OTG controller at imx6q-arm2 board
> > 
> > Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/imx6q-arm2.dts |   17 +++++++++++++++++
> >  1 files changed, 17 insertions(+), 0 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/imx6q-arm2.dts b/arch/arm/boot/dts/imx6q-arm2.dts
> > index edf1bd9..8f125b1 100644
> > --- a/arch/arm/boot/dts/imx6q-arm2.dts
> > +++ b/arch/arm/boot/dts/imx6q-arm2.dts
> > @@ -31,6 +31,15 @@
> >  			regulator-max-microvolt = <3300000>;
> >  			regulator-always-on;
> >  		};
> > +
> > +		reg_usb_otg_vbus: usb_otg_vbus {
> > +			compatible = "regulator-fixed";
> > +			regulator-name = "usb_otg_vbus";
> > +			regulator-min-microvolt = <5000000>;
> > +			regulator-max-microvolt = <5000000>;
> > +			gpio = <&gpio3 22 0>;
> > +			enable-active-high;
> > +		};
> >  	};
> >  
> >  	leds {
> > @@ -79,6 +88,14 @@
> >  	status = "okay";
> >  };
> >  
> > +&usbotg { /* USB OTG */
> 
> The comment is not useful.  I just dropped it and applied the patch.

Oh, my careless, thanks.
> 
> Shawn
> 
> > +	vbus-supply = <&reg_usb_otg_vbus>;
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_usbotg_1>;
> > +	disable-over-current;
> > +	status = "okay";
> > +};
> > +
> >  &usdhc3 {
> >  	cd-gpios = <&gpio6 11 0>;
> >  	wp-gpios = <&gpio6 14 0>;
> > -- 
> > 1.7.1
> > 
> > 

-- 

Best Regards,
Peter Chen

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
