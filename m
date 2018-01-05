From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/7] ARM: dts: imx6ull: add additional pinfunc defines
 for i.MX 6ULL
Date: Fri, 5 Jan 2018 10:49:30 -0600
Message-ID: <20180105164930.qomk75eo7vzyglvn@rob-hp-laptop>
References: <20180102164223.15230-1-stefan@agner.ch>
 <20180102164223.15230-3-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180102164223.15230-3-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bai Ping <ping.bai-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 02, 2018 at 05:42:19PM +0100, Stefan Agner wrote:
> From: Bai Ping <ping.bai-3arQi8VN3Tc@public.gmane.org>
> 
> On i.MX 6ULL, the pin MUX and CTRL register of BOOT_MODEx and TAMPERx
> pins are available through IOMUXC_SNVS. Add additional pinfunc defines.
> 
> Signed-off-by: Bai Ping <ping.bai-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6ull-pinfunc-snvs.h | 29 +++++++++++++++++++++++++++++
>  arch/arm/boot/dts/imx6ull.dtsi           |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6ull-pinfunc-snvs.h
> 
> diff --git a/arch/arm/boot/dts/imx6ull-pinfunc-snvs.h b/arch/arm/boot/dts/imx6ull-pinfunc-snvs.h
> new file mode 100644
> index 000000000000..da3f412e4269
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6ull-pinfunc-snvs.h
> @@ -0,0 +1,29 @@
> +/*
> + * Copyright (C) 2016 Freescale Semiconductor, Inc.

It's 2018 now.

> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

Use SPDX. With that,

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
