From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv5 1/6] ARM: dts: Add SoC level device tree support for
 LS1021A
Date: Sun, 19 Oct 2014 09:37:02 +0800
Message-ID: <20141019013701.GC7869@tiger>
References: <1413192963-11153-1-git-send-email-jingchang.lu@freescale.com>
 <1413192963-11153-2-git-send-email-jingchang.lu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1413192963-11153-2-git-send-email-jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: arnd-r2nGTMty4D4@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Nikhil Badola <nikhil.badola-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Chenhui Zhao <chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Suresh Gupta <suresh.gupta-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Shaveta Leekha <shaveta-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Ruchika Gupta <ruchika.gupta-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Chao Fu <b44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 13, 2014 at 05:35:58PM +0800, Jingchang Lu wrote:
> +/ {
> +	compatible = "fsl,ls1021a";
> +	interrupt-parent = <&gic>;
> +
> +	aliases {
> +		serial0 = &lpuart0;
> +		serial1 = &lpuart1;
> +		serial2 = &lpuart2;
> +		serial3 = &lpuart3;
> +		serial4 = &lpuart4;
> +		serial5 = &lpuart5;
> +		sysclk = &sysclk;

What is this sysclk aliase used for?

> +		};

Bad indent.

> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@f00 {
> +			compatible = "arm,cortex-a7";
> +			device_type = "cpu";
> +			reg = <0xf00>;
> +		};
> +
> +		cpu@f01 {
> +			compatible = "arm,cortex-a7";
> +			device_type = "cpu";
> +			reg = <0xf01>;
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv7-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;

I like this indent style ...

> +	};
> +
> +	pmu {
> +		compatible = "arm,cortex-a7-pmu";
> +		interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;

... not this style.  Please fix such indents through the file.

> +	};

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
