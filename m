From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: at91: sama5d2: use sama5d2 compatible
 string for SMC
Date: Tue, 11 Jul 2017 10:25:56 +0100
Message-ID: <20170711092556.mukp4umf4r4etqvt@dell>
References: <20170711074015.30440-1-ludovic.desroches@microchip.com>
 <20170711074015.30440-4-ludovic.desroches@microchip.com>
 <029b80a8-2d3f-11b4-d4df-55f5fc48c8e7@microchip.com>
 <20170711075829.5rzdrjgao6efiuj2@rfolt0960.corp.atmel.com>
 <20170711080853.uxdmxocq5nhrp7vq@rfolt0960.corp.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170711080853.uxdmxocq5nhrp7vq-fC2aZbRiGnsAAwgTK2POJVCF2YAvjlIb@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 11 Jul 2017, Ludovic Desroches wrote:

> On Tue, Jul 11, 2017 at 09:58:29AM +0200, Ludovic Desroches wrote:
> > On Tue, Jul 11, 2017 at 09:52:58AM +0200, Nicolas Ferre wrote:
> > > On 11/07/2017 at 09:40, Ludovic Desroches wrote:
> > > > A new compatible string has been introduced for sama5d2 SMC to allow to
> > > > manage the registers mapping change.
> > > > 
> > > > Signed-off-by: Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> > > > ---
> > > >  arch/arm/boot/dts/sama5d2.dtsi | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
> > > > index 4fcd5bb219e3..60e69aeacbdb 100644
> > > > --- a/arch/arm/boot/dts/sama5d2.dtsi
> > > > +++ b/arch/arm/boot/dts/sama5d2.dtsi
> > > > @@ -1048,7 +1048,7 @@
> > > >  			};
> > > >  
> > > >  			hsmc: hsmc@f8014000 {
> > > > -				compatible = "atmel,sama5d3-smc", "syscon", "simple-mfd";
> > > > +				compatible = "atmel,sama5d2-smc", "syscon", "simple-mfd";
> > > 
> > > You'd better use something like:
> > >  compatible = "atmel,sama5d2-smc", "atmel,sama5d3-smc", "syscon", "simple-mfd";
> > 
> > But it's not true, during data interface setup, we will write values in
> > the wrong place if we fallback on "atmel,sama5d3-smc".
> > 
> > Regards
> > 
> > Ludovic
> > 
> > > 
> > > So that this patch is independent from the rest of the series and
> > > we can avoid to having to synchronize with mfd or mtd/nand for this part.
> 
> If Lee and Boris agree, maybe the series can go through AT91.

That's fine, but if the series goes though another tree, I will
require a pull-request.

I am also happy to carry though the MFD tree (and will of course send
out a PR to the other affected Maintainers).

> > > Regards,
> > > 
> > > >  				reg = <0xf8014000 0x1000>;
> > > >  				interrupts = <17 IRQ_TYPE_LEVEL_HIGH 6>;
> > > >  				clocks = <&hsmc_clk>;
> > > > 
> > > 
> > > 

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
