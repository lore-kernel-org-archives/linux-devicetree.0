From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 6/7] ARM: dts: mt8135: enable basic SMP bringup for
 mt8135
Date: Tue, 5 May 2015 13:37:07 +0800
Message-ID: <1430804227.15346.6.camel@mtksdaap41>
References: <1430466210-22963-1-git-send-email-yingjoe.chen@mediatek.com>
	 <1430466210-22963-7-git-send-email-yingjoe.chen@mediatek.com>
	 <20150504143105.GK4946@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150504143105.GK4946-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2015-05-04 at 16:31 +0200, Sascha Hauer wrote:
> On Fri, May 01, 2015 at 03:43:29PM +0800, Yingjoe Chen wrote:
> > Add arch timer node to enable arch-timer support. MT8135 firmware
> > doesn't correctly setup arch-timer frequency and CNTVOFF, add
> > properties to workaround this.
> > 
> > This also set cpu enable-method to enable SMP.
> > 
> > Signed-off-by: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/mt8135.dtsi | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/mt8135.dtsi b/arch/arm/boot/dts/mt8135.dtsi
> > index 612bd22..eb5e06f 100644
> > --- a/arch/arm/boot/dts/mt8135.dtsi
> > +++ b/arch/arm/boot/dts/mt8135.dtsi
> > @@ -46,6 +46,7 @@
> >  	cpus {
> >  		#address-cells = <1>;
> >  		#size-cells = <0>;
> > +		enable-method = "mediatek,mt81xx-tz-smp";
> >  
> >  		cpu0: cpu@0 {
> >  			device_type = "cpu";
> > @@ -103,6 +104,21 @@
> >  		};
> >  	};
> >  
> > +	timer {
> > +		compatible = "arm,armv7-timer";
> > +		interrupt-parent = <&gic>;
> > +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
> > +					  IRQ_TYPE_LEVEL_LOW)>,
> > +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) |
> > +					  IRQ_TYPE_LEVEL_LOW)>,
> > +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) |
> > +					  IRQ_TYPE_LEVEL_LOW)>,
> > +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) |
> > +					  IRQ_TYPE_LEVEL_LOW)>;
> > +		clock-frequency = <13000000>;
> > +		arm,cpu-registers-not-fw-configured;
> > +	};
> 
> This is the SoC dtsi file. What you say here is that all MT8135
> present and future firmwares on all boards do this wrong.
> Shouldn't you fix the firmware instead? Shouldn't this property be board
> specific?

Hi Sascha,

To fix this we'll have to change initial boot code. Since 8135 or 8127
already MP for some time now, I'm afraid we won't be able to do that, even
for new boards. I can put it in board dts, but this means we'll have to
duplicate this in all board dts.

Joe.C



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
