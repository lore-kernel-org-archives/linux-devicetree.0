From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/3] arm: dts: Add nodes in smdkv310 device tree source
	file
Date: Fri, 15 Jul 2011 12:57:44 -0600
Message-ID: <20110715185744.GF2833@ponder.secretlab.ca>
References: <1310730128-4243-1-git-send-email-thomas.abraham@linaro.org>
	<1310730128-4243-3-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1310730128-4243-3-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 15, 2011 at 05:12:07PM +0530, Thomas Abraham wrote:
> From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> 
> 
> Include device tree nodes for watchdog timer and sdhci instance 0 and 1.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos4-smdkv310.dts |   55 ++++++++++++++++++++++++++++++-
>  1 files changed, 53 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4-smdkv310.dts b/arch/arm/boot/dts/exynos4-smdkv310.dts
> index dd6c80a..7f27d95 100644
> --- a/arch/arm/boot/dts/exynos4-smdkv310.dts
> +++ b/arch/arm/boot/dts/exynos4-smdkv310.dts
> @@ -1,11 +1,62 @@
> +/*
> + * Samsung's Exynos4210 based smdkv310 board device tree source.
> + *
> + * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com
> + * Copyright (c) 2010-2011 Linaro Ltd.
> + *		www.linaro.org
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
>  /dts-v1/;
>  /include/ "skeleton.dtsi"
>  
>  / {
>  	model = "Samsung Exynos4 SMDKV310 eval board";
> -	compatible = "samsung,smdkv310", "samsung,s5pv310";
> +	compatible = "samsung,smdkv310", "samsung,exynos4210";
>  
>  	memory {
> -		reg = <0x40000000 0x08000000>;
> +		reg = <0x40000000 0x80000000>;
> +	};
> +
> +	chosen {
> +		bootargs = "root=/dev/mmcblk0p1 rootfstype=ext3 rootwait console=ttySAC1,115200";
> +	};
> +
> +	soc {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		interrupt-parent = <&intc>;
> +		compatible = "simple-bus";
> +		ranges;
> +
> +		intc:interrupt-controller@10501000 {
> +			compatible = "samsung,exynos4-gic","arm,cortex-a9-gic";
> +			#interrupt-cells = <1>;
> +			interrupt-controller;
> +			reg = <0x10501000 0x1000>, <0x10500100 0x100>;
> +			irq-start = <61>;
> +		};
> +
> +		watchdog@10060000 {
> +			compatible = "samsung,s3c2410-wdt";

Need documentation.

> +			reg = <0x10060000 0x400>;
> +			interrupts = <552>;
> +		};
> +
> +		sdhci@12530000 {
> +			compatible = "samsung,s3c-sdhci";
> +			reg = <0x12530000 0x1000>;
> +			interrupts = <362>;
> +		};
> +
> +		sdhci@12510000 {
> +			compatible = "samsung,s3c-sdhci";
> +			reg = <0x12510000 0x1000>;
> +			interrupts = <360>;
> +		};
>  	};
>  };
> -- 
> 1.7.1
> 
