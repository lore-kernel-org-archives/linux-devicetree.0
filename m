From: maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: Re: [PATCH v1 3/3] ARM: dts: imx6qdl-apalis: Use enable-gpios
 property for backlight
Date: Sat, 17 Sep 2016 10:15:32 +0530
Message-ID: <20160917044532.GA5729@Sanchayan-Arch.localdomain>
References: <9d2c17aa2e00e6ff4349a53de8247860d2382607.1473833908.git.maitysanchayan@gmail.com>
 <dff8d58c4021719184af2c83773e86f175ad910e.1473833908.git.maitysanchayan@gmail.com>
 <1474033134.3103.27.camel@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1474033134.3103.27.camel-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Cc: "shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "stefan-XLVq0VzYD2Y@public.gmane.org" <stefan-XLVq0VzYD2Y@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Marcel,

On 16-09-16 13:38:54, Marcel Ziswiler wrote:
> On Wed, 2016-09-14 at 12:05 +0530, Sanchayan Maity wrote:
> > Use enable-gpios property of PWM backlight driver for backlight
> > control. While at it also fix the use of brightness levels required
> > by EDT displays which require inverted PWM's.
> 
> That part I am missing below. Did you forget to include it?

No, actually I missed fixing the commit message. Currently PWM polarity
inversion is not supported and while checking, I kept the brightness
levels as is currently but did not change the commit message.

Will send a v2 and fix this.

Regards,
Sanchayan.

> 
> > Signed-off-by: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/imx6qdl-apalis.dtsi | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/imx6qdl-apalis.dtsi
> > b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
> > index 8c67dd8..9100bde 100644
> > --- a/arch/arm/boot/dts/imx6qdl-apalis.dtsi
> > +++ b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
> > @@ -49,7 +49,10 @@
> >  
> >  	backlight: backlight {
> >  		compatible = "pwm-backlight";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_gpio_bl_on>;
> >  		pwms = <&pwm4 0 5000000>;
> > +		enable-gpios = <&gpio3 13 GPIO_ACTIVE_HIGH>;
> >  		status = "disabled";
> >  	};
> >  
> > @@ -614,6 +617,12 @@
> >  		>;
> >  	};
> >  
> > +	pinctrl_gpio_bl_on: gpioblon {
> > +		fsl,pins = <
> > +			MX6QDL_PAD_EIM_DA13__GPIO3_IO13 0x1b0b0
> > +		>;
> > +	};
> > +
> >  	pinctrl_gpio_keys: gpio1io04grp {
> >  		fsl,pins = <
> >  			/* Power button */
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
