From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: dts: add Gateworks Ventana support
Date: Wed, 23 Oct 2013 16:23:26 +0800
Message-ID: <20131023082324.GO2839@S2101-09.ap.freescale.net>
References: <1382503888-3962-1-git-send-email-tharvey@gateworks.com>
 <1382503888-3962-3-git-send-email-tharvey@gateworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1382503888-3962-3-git-send-email-tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 22, 2013 at 09:51:26PM -0700, Tim Harvey wrote:
> The Gateworks Ventana product family consists of several baseboard designs
> based on the Freescale i.MX6 family of processors.  Each baseboard has a
> different set of possible features.
> 
> Signed-off-by: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
> ---

<snip>

> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 3043e6c..2b7084c 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -131,10 +131,19 @@ dtb-$(CONFIG_ARCH_MXC) += \
>  	imx53-mba53.dtb \
>  	imx53-qsb.dtb \
>  	imx53-smd.dtb \
> +	imx6dl-gw54xx.dtb \
> +	imx6dl-gw53xx.dtb \
> +	imx6dl-gw52xx.dtb \
> +	imx6dl-gw51xx.dtb \

Sorted it like 51xx, 52xx, 53xx, 54xx, and applied the patch.  Thanks.

Shawn

>  	imx6dl-sabreauto.dtb \
>  	imx6dl-sabresd.dtb \
>  	imx6dl-wandboard.dtb \
>  	imx6q-arm2.dtb \
> +	imx6q-gw5400-a.dtb \
> +	imx6q-gw54xx.dtb \
> +	imx6q-gw53xx.dtb \
> +	imx6q-gw52xx.dtb \
> +	imx6q-gw51xx.dtb \
>  	imx6q-phytec-pbab01.dtb \
>  	imx6q-sabreauto.dtb \
>  	imx6q-sabrelite.dtb \

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
