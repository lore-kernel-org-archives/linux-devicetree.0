From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx: add DH2228FV DAC to Gateworks Ventana
 boards with SPI
Date: Wed, 10 May 2017 09:04:36 +0800
Message-ID: <20170510010435.GA5833@dragon>
References: <1493823894-2107-1-git-send-email-tharvey@gateworks.com>
 <20170505015653.GT18578@dragon>
 <CAJ+vNU2hkrT-evWKGHauENOHp2jGjdbNpLaZx2nH=cARk5KFBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAJ+vNU2hkrT-evWKGHauENOHp2jGjdbNpLaZx2nH=cARk5KFBA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 04, 2017 at 09:29:27PM -0700, Tim Harvey wrote:
> On Thu, May 4, 2017 at 6:56 PM, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Wed, May 03, 2017 at 08:04:54AM -0700, Tim Harvey wrote:
> >> Signed-off-by: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
> >> ---
> >>  arch/arm/boot/dts/imx6qdl-gw52xx.dtsi | 6 ++++++
> >>  arch/arm/boot/dts/imx6qdl-gw54xx.dtsi | 6 ++++++
> >>  arch/arm/boot/dts/imx6qdl-gw560x.dtsi | 6 ++++++
> >>  3 files changed, 18 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi b/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
> >> index 91991d6..b5c1a8f 100644
> >> --- a/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
> >> +++ b/arch/arm/boot/dts/imx6qdl-gw52xx.dtsi
> >> @@ -143,6 +143,12 @@
> >>       pinctrl-names = "default";
> >>       pinctrl-0 = <&pinctrl_ecspi3>;
> >>       status = "okay";
> >> +
> >> +     spidev0: spidev@0 {
> >> +             compatible = "rohm,dh2228fv";
> >
> > I do not see this is a documented compatible.
> >
> > Shawn
> >
> 
> Shawn,
> 
> No, it doesn't seem to be documented in
> Documentation/devicetree/bindings, but it is in the spidev driver:
> https://lxr.missinglinkelectronics.com/linux/drivers/spi/spidev.c#L697

Can you please add a patch documenting the compatible?

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
