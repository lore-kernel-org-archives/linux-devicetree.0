From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: ts-4800: Add LCD support
Date: Tue, 22 Dec 2015 20:24:35 +0800
Message-ID: <20151222122435.GE26290@tiger>
References: <1450458033-30471-1-git-send-email-damien.riegel@savoirfairelinux.com>
 <20151221133519.GC18410@tiger>
 <20151221184057.GE12696@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151221184057.GE12696@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 21, 2015 at 01:40:59PM -0500, Damien Riegel wrote:
> > > @@ -30,6 +30,60 @@
> > >  			clock-frequency = <24576000>;
> > >  		};
> > >  	};
> > > +
> > > +	regulators {
> > > +		compatible = "simple-bus";
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > > +
> > > +		backlight_reg: regulator@0 {
> > > +			compatible = "regulator-fixed";
> > > +			reg = <0>;
> > > +			pinctrl-names = "default";
> > > +			pinctrl-0 = <&pinctrl_enable_lcd>;
> > > +			regulator-name = "enable_lcd_reg";
> > > +			regulator-min-microvolt = <3300000>;
> > > +			regulator-max-microvolt = <3300000>;
> > > +			gpio = <&gpio4 9 GPIO_ACTIVE_HIGH>;
> > > +			enable-active-high;
> > > +		};
> > > +	};
> > 
> > DT maintainers dislike this fake simple-bus container.  Let's put the
> > regulator directly under root like below.
> > 
> >         backlight_reg: regulator-backlight {
> >                 compatible = "regulator-fixed";
> >                 pinctrl-names = "default";
> >                 pinctrl-0 = <&pinctrl_enable_lcd>;
> >                 regulator-name = "enable_lcd_reg";
> >                 regulator-min-microvolt = <3300000>;
> >                 regulator-max-microvolt = <3300000>;
> >                 gpio = <&gpio4 9 GPIO_ACTIVE_HIGH>;
> >                 enable-active-high;
> >         };
> > 
> > I fixed it up and applied both patches.
> 
> Thank you. I am using the imx51-*.dts as examples, maybe they should be
> updated to be consistent with the newer device tree style? I'm willing
> to do that but I don't want to make changes on dts files that I can't
> test.

Leave them there for now.

> 
> Sidenote: your Signed-off-by is missing on these two patches.

Oops.  Thanks.  Fixed now.

Shawn


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
