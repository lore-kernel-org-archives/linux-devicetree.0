From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 11/11] ARM64: dts: Prepare Actions Semi S900 and
 Bubblegum-96
Date: Wed, 15 Feb 2017 17:12:32 +0000
Message-ID: <20170215171232.GI31733@leverpostej>
References: <20170215165528.10052-1-afaerber@suse.de>
 <20170215165528.10052-12-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170215165528.10052-12-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, contact-CO9UH4nLugWa1hIE42aguQ@public.gmane.org, mp-cs-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org, info-Ty1hIZOCd2XuufBYgWm87A@public.gmane.org, support-8Vy/tIz7429AfugRpC6u6w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nd-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Feb 15, 2017 at 05:55:28PM +0100, Andreas Färber wrote:
> +#include "s900.dtsi"
> +
> +/ {
> +	compatible = "ucrobotics,bubblegum-96", "acts,s900";
> +	model = "Bubblegum-96";
> +
> +	aliases {
> +		serial5 = &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial5:115200n8";
> +	};
> +};

I didn't spot a memory node here or in the dtsi. Does the FW/bootloader
create one?

> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +	};

Why have this empty node?

> +
> +	psci {
> +		compatible = "arm,psci-0.2";
> +		method = "smc";
> +	};
> +
> +	arm-pmu {
> +		compatible = "arm,cortex-a53-pmu";
> +		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +		             <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> +		             <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +		             <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +	};

Please ad an interrupt-affinity property, as described in
Documentation/devicetree/bindings/arm/pmu.txt.

> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13
> +			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14
> +			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11
> +			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10
> +			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		gic: interrupt-controller@e00f1000 {
> +			compatible = "arm,gic-400";
> +			reg = <0x0 0xe00f1000 0x0 0x1000>,
> +			      <0x0 0xe00f2000 0x0 0x1000>,
> +			      <0x0 0xe00f4000 0x0 0x2000>,
> +			      <0x0 0xe00f6000 0x0 0x2000>;

I believe that the second entry should be 0x2000 in length.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
