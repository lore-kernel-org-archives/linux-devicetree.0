From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3][v3] arm64: freescale: ls2080a: Split devicetree for
 code resuability
Date: Tue, 10 Jan 2017 14:25:17 +0800
Message-ID: <20170110062516.GZ20956@dragon>
References: <1483938896-2221-1-git-send-email-abhimanyu.saini@nxp.com>
 <1483938896-2221-3-git-send-email-abhimanyu.saini@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1483938896-2221-3-git-send-email-abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhimanyu Saini <abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, scott.wood-3arQi8VN3Tc@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Priyanka Jain <priyanka.jain-3arQi8VN3Tc@public.gmane.org>, Ashish Kumar <ashish.kumar-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 09, 2017 at 10:44:55AM +0530, Abhimanyu Saini wrote:
> LS2088A and LS2080A are similar SoCs with a few differences like
> ARM cores etc.
> 
> Reorganize the LS2080A device tree to move the common nodes to:
>         - fsl-ls208xa.dtsi
>         - fsl-ls208xa-rdb.dtsi
>         - fsl-ls208xa-qds.dtsi

These 3 new files are missing.

> 
> Signed-off-by: Priyanka Jain <priyanka.jain-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Ashish Kumar <ashish.kumar-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Abhimanyu Saini <abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>
> ---
> Changes for v3:
>         - rename dts/dtsi files
> 
>  arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dts | 154 +----
>  arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dts | 106 +---
>  arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi    | 715 +---------------------
>  3 files changed, 26 insertions(+), 949 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dts
> index 8bc1f8f..3cf4a5c 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dts
> @@ -1,8 +1,9 @@
>  /*
>   * Device Tree file for Freescale LS2080a QDS Board.
>   *
> - * Copyright (C) 2015, Freescale Semiconductor
> + * Copyright (C) 2015-17, Freescale Semiconductor
>   *
> + * Abhimanyu Saini <abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>
>   * Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>   *
>   * This file is dual-licensed: you can use it either under the terms

<snip>

> -&sata0 {
> -	status = "okay";
> -};
> -
> -&sata1 {
> -	status = "okay";
> -};
> -
> -&usb0 {
> -	status = "okay";
> -};
> -
> -&usb1 {
> -	status = "okay";
> -};
> +#include "fsl-ls208xa-qds.dtsi"

Can we put such includes just at the beginning of the file (after
licence section)?

> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dts
> index 2ff46ca..d5224fb 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dts
> @@ -62,108 +62,4 @@
>  	};
>  };
>  

<snip>

> -&usb0 {
> -	status = "okay";
> -};
> -
> -&usb1 {
> -	status = "okay";
> -};
> +#include "fsl-ls208xa-rdb.dtsi"

Ditto

> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> index e5935f2..35801f3 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> @@ -1,8 +1,9 @@
>  /*
>   * Device Tree Include file for Freescale Layerscape-2080A family SoC.
>   *
> - * Copyright (C) 2014-2015, Freescale Semiconductor
> + * Copyright (C) 2014-2017, Freescale Semiconductor
>   *
> + * Abhimanyu Saini <abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>
>   * Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>   *
>   * This file is dual-licensed: you can use it either under the terms
> @@ -149,697 +150,25 @@
>  		};
>  	};
>  
> -	memory@80000000 {
> -		device_type = "memory";
> -		reg = <0x00000000 0x80000000 0 0x80000000>;
> -		      /* DRAM space - 1, size : 2 GB DRAM */
> -	};

<snip>

> -	ddr1: memory-controller@1080000 {
> -		compatible = "fsl,qoriq-memory-controller";
> -		reg = <0x0 0x1080000 0x0 0x1000>;
> -		interrupts = <0 17 0x4>;
> -		little-endian;
> -	};
> +	#include "fsl-ls208xa.dtsi"

Ditto

Shawn

> +};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
