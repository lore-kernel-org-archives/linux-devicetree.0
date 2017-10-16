From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: interrupts-extended only allowed with different parents? [Was: Re:
 [PATCH 3/4] ARM: dts: imx28-tx28: fix interrupt flags and use
 interrupts-extended property]
Date: Mon, 16 Oct 2017 11:03:56 +0200
Message-ID: <20171016090356.yvg5omwl4i75viiw@pengutronix.de>
References: <1507719939-27250-1-git-send-email-LW@KARO-electronics.de>
 <1507719939-27250-4-git-send-email-LW@KARO-electronics.de>
 <20171016071726.gyzvalxzk4o3jsuz@pengutronix.de>
 <20171016105632.709e653c@karo-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171016105632.709e653c-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 16, 2017 at 10:56:32AM +0200, Lothar Waßmann wrote:
> Hi,
> 
> On Mon, 16 Oct 2017 09:17:26 +0200 Uwe Kleine-König wrote:
> > Hello,
> > 
> > On Wed, Oct 11, 2017 at 01:05:38PM +0200, Lothar Waßmann wrote:
> > > diff --git a/arch/arm/boot/dts/imx28-tx28.dts b/arch/arm/boot/dts/imx28-tx28.dts
> > > index 211e67d..3c852f7 100644
> > > --- a/arch/arm/boot/dts/imx28-tx28.dts
> > > +++ b/arch/arm/boot/dts/imx28-tx28.dts
> > > @@ -328,8 +328,7 @@
> > >  		reg = <0x20>;
> > >  		pinctrl-names = "default";
> > >  		pinctrl-0 = <&tx28_pca9554_pins>;
> > > -		interrupt-parent = <&gpio3>;
> > > -		interrupts = <28 0>;
> > > +		interrupts-extended = <&gpio3 28 IRQ_TYPE_NONE>;
> > >  		gpio-controller;
> > >  		#gpio-cells = <2>;
> > >  		interrupt-controller;
> > 
> > While interrupts-extended looks nice,
> > Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> > has:
> > 
> > 	"interrupts-extended" should only be used when a device has
> > 	multiple interrupt parents.
> > 
> > If this is still true, this patch is wrong.
> >
> Thanks for the hint. It really helps to read the documentation
> sometimes, rahter than relying on existing code only...
> 
> A quick check shows, that more than 100 of the 130 uses of
> interrupts-extended are wrong. :(

That's why I honestly consider that these documentation bits are stale.
I adapted the Subject to maybe catch the attention of the devicetree
guys.

(BTW: The current wording is likely imprecise. I'd expect that it really
should mean "Use interrupt-parent + interrupts if possible", but the
following still fulfills the documented condition:

	interrupts-extended = <&gpio3 28 IRQ_TYPE_NONE &gpio3 29 IRQ_TYPE_NONE>

while it can be expressed without interrupts-extended.)

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
