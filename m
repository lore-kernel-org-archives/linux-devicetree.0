From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 08/11] ARM: dts: Prepare Actions Semi S500 and LeMaker
 Guitar
Date: Wed, 15 Feb 2017 17:07:43 +0000
Message-ID: <20170215170742.GH31733@leverpostej>
References: <20170215165528.10052-1-afaerber@suse.de>
 <20170215165528.10052-9-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170215165528.10052-9-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, contact-CO9UH4nLugWa1hIE42aguQ@public.gmane.org, mp-cs-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org, info-Ty1hIZOCd2XuufBYgWm87A@public.gmane.org, support-8Vy/tIz7429AfugRpC6u6w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nd-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 15, 2017 at 05:55:25PM +0100, Andreas Färber wrote:
> +	arm-pmu {
> +		compatible = "arm,cortex-a9-pmu";
> +		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +		             <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> +		             <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +		             <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +        };

Please add an interrupt-affinity property, as described in
Documentation/devicetree/bindings/arm/pmu.txt

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
