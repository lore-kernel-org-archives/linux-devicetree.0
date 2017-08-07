From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: at91: sama5d2: use sama5d2 compatible
 string for SMC
Date: Mon, 7 Aug 2017 23:28:13 +0200
Message-ID: <20170807212813.hj5pfmlh4wl2mh47@piout.net>
References: <20170718132220.25018-1-ludovic.desroches@microchip.com>
 <20170718132220.25018-4-ludovic.desroches@microchip.com>
 <20170807154100.hvl5ua3vdqttghfj@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170807154100.hvl5ua3vdqttghfj@dell>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lee,

On 07/08/2017 at 16:41:00 +0100, Lee Jones wrote:
> On Tue, 18 Jul 2017, Ludovic Desroches wrote:
> 
> > A new compatible string has been introduced for sama5d2 SMC to allow to
> > manage the registers mapping change.
> > 
> > Signed-off-by: Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/sama5d2.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Applied, thanks.
> 

I've already applied that one and sent it to arm-soc as a fix for 4.13
(I think we agreed on that).

> > diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
> > index cc06da394366..3e6e2dbc2595 100644
> > --- a/arch/arm/boot/dts/sama5d2.dtsi
> > +++ b/arch/arm/boot/dts/sama5d2.dtsi
> > @@ -1048,7 +1048,7 @@
> >  			};
> >  
> >  			hsmc: hsmc@f8014000 {
> > -				compatible = "atmel,sama5d3-smc", "syscon", "simple-mfd";
> > +				compatible = "atmel,sama5d2-smc", "syscon", "simple-mfd";
> >  				reg = <0xf8014000 0x1000>;
> >  				interrupts = <5 IRQ_TYPE_LEVEL_HIGH 6>;
> >  				clocks = <&hsmc_clk>;
> 
> -- 
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org │ Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
