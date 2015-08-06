From: Anson Huang <Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6sx: correct property name for wakeup
 source
Date: Thu, 6 Aug 2015 16:00:46 +0800
Message-ID: <20150806080042.GA31138@shlinux1.ap.freescale.net>
References: <1438783075-15133-1-git-send-email-b20788@freescale.com>
 <20150806074134.GA9847@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150806074134.GA9847@tiger>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 06, 2015 at 03:41:34PM +0800, Shawn Guo wrote:
> On Wed, Aug 05, 2015 at 09:57:55PM +0800, Anson Huang wrote:
> > Commit(def56bb input: snvs_pwrkey: use "wakeup-source"
> > as deivce tree property name) replaces the property name
> > of "wakeup" with "wakeup-source", update this change
> > in i.MX6SX dtsi accordingly.
> > 
> > Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> For arch/arm/ patches, please remember to copy linux-arm-kernel.
> 
> Applied, thanks.
> 

Got it, will copy linux-arm-kernel next time, thanks.

Anson.

> > ---
> >  arch/arm/boot/dts/imx6sx.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
> > index e391d63..dc7eaae 100644
> > --- a/arch/arm/boot/dts/imx6sx.dtsi
> > +++ b/arch/arm/boot/dts/imx6sx.dtsi
> > @@ -686,7 +686,7 @@
> >  					regmap = <&snvs>;
> >  					interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> >  					linux,keycode = <KEY_POWER>;
> > -					wakeup;
> > +					wakeup-source;
> >  				};
> >  			};
> >  
> > -- 
> > 1.9.1
> > 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
