From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: dts: imx28-tx28: fix interrupt flags and use
 interrupts-extended property
Date: Wed, 18 Oct 2017 08:40:59 +0200
Message-ID: <20171018084059.022d8116@karo-electronics.de>
References: <1507719939-27250-1-git-send-email-LW@KARO-electronics.de>
        <1507719939-27250-4-git-send-email-LW@KARO-electronics.de>
        <20171016071726.gyzvalxzk4o3jsuz@pengutronix.de>
        <20171016105632.709e653c@karo-electronics.de>
        <20171018021331.GC18810@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171018021331.GC18810@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, 18 Oct 2017 10:13:32 +0800 Shawn Guo wrote:
> On Mon, Oct 16, 2017 at 10:56:32AM +0200, Lothar Waßmann wrote:
> > Hi,
> > 
> > On Mon, 16 Oct 2017 09:17:26 +0200 Uwe Kleine-König wrote:
> > > Hello,
> > > 
> > > On Wed, Oct 11, 2017 at 01:05:38PM +0200, Lothar Waßmann wrote:
> > > > diff --git a/arch/arm/boot/dts/imx28-tx28.dts b/arch/arm/boot/dts/imx28-tx28.dts
> > > > index 211e67d..3c852f7 100644
> > > > --- a/arch/arm/boot/dts/imx28-tx28.dts
> > > > +++ b/arch/arm/boot/dts/imx28-tx28.dts
> > > > @@ -328,8 +328,7 @@
> > > >  		reg = <0x20>;
> > > >  		pinctrl-names = "default";
> > > >  		pinctrl-0 = <&tx28_pca9554_pins>;
> > > > -		interrupt-parent = <&gpio3>;
> > > > -		interrupts = <28 0>;
> > > > +		interrupts-extended = <&gpio3 28 IRQ_TYPE_NONE>;
> > > >  		gpio-controller;
> > > >  		#gpio-cells = <2>;
> > > >  		interrupt-controller;
> > > 
> > > While interrupts-extended looks nice,
> > > Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> > > has:
> > > 
> > > 	"interrupts-extended" should only be used when a device has
> > > 	multiple interrupt parents.
> > > 
> > > If this is still true, this patch is wrong.
> > >
> > Thanks for the hint. It really helps to read the documentation
> > sometimes, rahter than relying on existing code only...
> > 
> > A quick check shows, that more than 100 of the 130 uses of
> > interrupts-extended are wrong. :(
> 
> So should I drop all interrupts-extended patches from you?
>
Yes, please. Since this patch, and the corresponding patch for tx53
also fixed the interrupt flags, I will send new patches to only fix
the interrupt flags.


Lothar Waßmann
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
