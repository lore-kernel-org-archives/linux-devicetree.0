From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: vf-colibri: define stdout-path property
Date: Wed, 5 Aug 2015 19:59:50 +0800
Message-ID: <20150805115950.GJ12927@tiger>
References: <1436971817-28523-1-git-send-email-stefan@agner.ch>
 <0af90d47043467591155c16f621cc1da@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0af90d47043467591155c16f621cc1da-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 30, 2015 at 06:43:29PM +0200, Stefan Agner wrote:
> Hi Shawn,
> 
> Did you notice this change? Just asking since you applied some other
> changes already...

Just applied.  Sorry for the delay.

Shawn

> 
> --
> Stefan
> 
> On 2015-07-15 16:50, Stefan Agner wrote:
> > Define Vybrid's UART0, connected to the Colibri pinout UART_A, as
> > standard output.
> > 
> > Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/vf-colibri-eval-v3.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
> > b/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
> > index 77e1a45..2ce6fe5 100644
> > --- a/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
> > +++ b/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
> > @@ -9,7 +9,7 @@
> >  
> >  / {
> >  	chosen {
> > -		bootargs = "console=ttyLP0,115200";
> > +		stdout-path = "serial0:115200n8";
> >  	};
> >  
> >  	clk16m: clk16m {
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
