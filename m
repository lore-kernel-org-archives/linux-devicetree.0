From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Build dtbs for Rockchip boards
Date: Fri, 25 Jul 2014 00:33:24 +0200
Message-ID: <7536612.LCojB7a6aY@diego>
References: <1406240270-13278-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406240270-13278-1-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 24. Juli 2014, 15:17:50 schrieb Doug Anderson:
> This allows the "make dtbs" target to work.
> 
> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

I'll add it to my rk3288-branch


Thanks
Heiko

> ---
> This is built upon (ARM: dts: add rk3288 evaluation board) at
> <https://patchwork.kernel.org/patch/4579541/>, which won't actually
> build without the bindings that just landed in today's clk-next.
> 
>  arch/arm/boot/dts/Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 82f498b..026f61d 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -341,6 +341,11 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>  	qcom-apq8084-mtp.dtb \
>  	qcom-msm8660-surf.dtb \
>  	qcom-msm8960-cdp.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += \
> +	rk3066a-bqcurie2.dtb \
> +	rk3188-radxarock.dtb \
> +	rk3288-evb-act8846.dtb \
> +	rk3288-evb-rk808.dtb
>  dtb-$(CONFIG_ARCH_S3C24XX) += s3c2416-smdk2416.dtb
>  dtb-$(CONFIG_ARCH_S3C64XX) += s3c6410-mini6410.dtb \
>  	s3c6410-smdk6410.dtb

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
