From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 08/11] ARM: dts: Prepare Actions Semi S500 and LeMaker
 Guitar
Date: Wed, 15 Feb 2017 17:36:11 +0000
Message-ID: <20170215173610.GJ31733@leverpostej>
References: <20170215165528.10052-1-afaerber@suse.de>
 <20170215165528.10052-9-afaerber@suse.de>
 <20170215170742.GH31733@leverpostej>
 <9dbb7749-a58b-9e18-33c9-fd004a713ed1@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9dbb7749-a58b-9e18-33c9-fd004a713ed1-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mp-cs-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org, info-Ty1hIZOCd2XuufBYgWm87A@public.gmane.org, support-8Vy/tIz7429AfugRpC6u6w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nd-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 15, 2017 at 06:28:31PM +0100, Andreas Färber wrote:
> Hi Mark,
> 
> Am 15.02.2017 um 18:07 schrieb Mark Rutland:
> > On Wed, Feb 15, 2017 at 05:55:25PM +0100, Andreas Färber wrote:
> >> +	arm-pmu {
> >> +		compatible = "arm,cortex-a9-pmu";
> >> +		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> >> +		             <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> >> +		             <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> >> +		             <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> >> +        };
> > 
> > Please add an interrupt-affinity property, as described in
> > Documentation/devicetree/bindings/arm/pmu.txt
> 
> That's not in the vendor tree... My guess is it would be like this then?
> 
> diff --git a/arch/arm/boot/dts/s500.dtsi b/arch/arm/boot/dts/s500.dtsi
> index ee93984..959c6e3 100644
> --- a/arch/arm/boot/dts/s500.dtsi
> +++ b/arch/arm/boot/dts/s500.dtsi
> @@ -82,7 +82,8 @@
>                              <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
>                              <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
>                              <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> -        };
> +               interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
> +       };

Assuming that's how they're wired up, yes.

You should be able to test this by using perf record in per-cpu mode,
on an application with its affintiy fixed to a particular CPU, and
verifying that overflow interrupts are recevied on the same CPU.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
