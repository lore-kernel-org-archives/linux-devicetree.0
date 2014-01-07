From: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: vf610: use the interrupt macros
Date: Tue, 7 Jan 2014 15:52:19 +0800
Message-ID: <20140107075217.GA27279@shlinux2.ap.freescale.net>
References: <1387952367-6321-1-git-send-email-b32955@freescale.com>
 <20140106060429.GC27227@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140106060429.GC27227-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 06, 2014 at 02:04:33PM +0800, Shawn Guo wrote:
> On Wed, Dec 25, 2013 at 02:19:27PM +0800, Huang Shijie wrote:
> > This patch uses the IRQ_TYPE_LEVEL_HIGH/IRQ_TYPE_NONE to replace
> > the hardcode.
> > 
> > Signed-off-by: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/vf610.dtsi |   37 +++++++++++++++++++------------------
> >  1 files changed, 19 insertions(+), 18 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/vf610.dtsi b/arch/arm/boot/dts/vf610.dtsi
> > index ef8a0ee..cd5bb86 100644
> > --- a/arch/arm/boot/dts/vf610.dtsi
> > +++ b/arch/arm/boot/dts/vf610.dtsi
> > @@ -10,6 +10,7 @@
> >  #include "skeleton.dtsi"
> >  #include "vf610-pingrp.h"
> >  #include <dt-bindings/clock/vf610-clock.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> >  
> >  / {
> >  	aliases {
> > @@ -90,7 +91,7 @@
> >  			uart0: serial@40027000 {
> >  				compatible = "fsl,vf610-lpuart";
> >  				reg = <0x40027000 0x1000>;
> > -				interrupts = <0 61 0x00>;
> 
> Why is it so special having a 0x00 IRQ trigger type?  Or is it just a
> typo?  While we are at it, we should probably fix it if it's a typo.
hi Jingchang:
  i think it is a typo.

do you any idea about it?

thanks
Huang Shijie	
> 
> Shawn
> 
> > +				interrupts = <0 61 IRQ_TYPE_NONE>;
> >  				clocks = <&clks VF610_CLK_UART0>;
> >  				clock-names = "ipg";
> >  				status = "disabled";
> > @@ -99,7 +100,7 @@
> >  			uart1: serial@40028000 {
> >  				compatible = "fsl,vf610-lpuart";
> >  				reg = <0x40028000 0x1000>;
> > -				interrupts = <0 62 0x04>;
> > +				interrupts = <0 62 IRQ_TYPE_LEVEL_HIGH>;
> >  				clocks = <&clks VF610_CLK_UART1>;
> >  				clock-names = "ipg";
> >  				status = "disabled";

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
