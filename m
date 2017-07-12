From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx: add CX9020 Embedded PC device tree
Date: Wed, 12 Jul 2017 16:42:39 +0200
Message-ID: <20170712144239.GC2557@lunn.ch>
References: <20170712090408.12212-1-linux-kernel-dev@beckhoff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170712090408.12212-1-linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Patrick =?iso-8859-1?Q?Br=FCnn?= <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 12, 2017 at 11:04:08AM +0200, linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org wrote:
> From: Patrick Brünn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
> 
> The CX9020 differs from i.MX53 Quick Start Board by:
> - use uart2 instead of uart1
> - DVI-D connector instead of VGA
> - no audio
> - CCAT FPGA connected to emi
> - enable rtc
> 
> Signed-off-by: Patrick Brünn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile         |   1 +
>  arch/arm/boot/dts/imx53-cx9020.dts | 377 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 378 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx53-cx9020.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 9c5e1d944d1c..ea60698f9783 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -340,6 +340,7 @@ dtb-$(CONFIG_SOC_IMX53) += \
>  	imx53-ard.dtb \
>  	imx53-m53evk.dtb \
>  	imx53-mba53.dtb \
> +	imx53-cx9020.dtb \
>  	imx53-qsb.dtb \
>  	imx53-qsrb.dtb \
>  	imx53-smd.dtb \

Hi Patrick

It appears this list is in alphabetic order...

   Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
