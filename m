From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: imx6qdl-sabreauto.dtsi: add max7310 support
Date: Fri, 13 Mar 2015 10:40:43 +0800
Message-ID: <20150313024041.GA24143@shlinux2>
References: <1425893288-1517-1-git-send-email-peter.chen@freescale.com>
 <1425893288-1517-2-git-send-email-peter.chen@freescale.com>
 <20150311014606.GY20455@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150311014606.GY20455@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 11, 2015 at 09:46:09AM +0800, Shawn Guo wrote:
> On Mon, Mar 09, 2015 at 05:28:06PM +0800, Peter Chen wrote:
> > max7310 is an i2c interface gpio expander
> > 
> > Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/imx6qdl-sabreauto.dtsi | 43 ++++++++++++++++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
> > index 009abd6..51acfec 100644
> > --- a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
> > +++ b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
> > @@ -28,6 +28,13 @@
> >  		};
> >  	};
> >  
> > +	max7310_reset: max7310-reset {
> > +		compatible = "gpio-reset";
> 
> The mainline kernel doesn't seem to have a gpio-reset driver/binding
> yet.
> 

Yeah, the driver still handles reset by itself instead of DT.
Even without reset operation, my max7310 chip works ok.
Would you accept that I delete this reset operation
and send v2?

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
