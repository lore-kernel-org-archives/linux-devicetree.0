From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC][PATCH 3/4] arm64: dts: hikey: Add hikey support for
 syscon-reboot-mode
Date: Tue, 9 Aug 2016 21:34:24 -0700
Message-ID: <20160810043424.GH26240@tuxbot>
References: <1470697426-16426-1-git-send-email-john.stultz@linaro.org>
 <1470697426-16426-3-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470697426-16426-3-git-send-email-john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon 08 Aug 16:03 PDT 2016, John Stultz wrote:

[..]
> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
[..]
>  	memory@0 {
>  		device_type = "memory";
>  		reg = <0x00000000 0x00000000 0x00000000 0x05e00000>,
> -		      <0x00000000 0x05f00000 0x00000000 0x00eff000>,
> +		      <0x00000000 0x05f00000 0x00000000 0x00001000>,
> +		      <0x00000000 0x05f02000 0x00000000 0x00efd000>,
>  		      <0x00000000 0x06e00000 0x00000000 0x0060f000>,
>  		      <0x00000000 0x07410000 0x00000000 0x36bf0000>;
>  	};

As I said when talked about this, I don't think you should punch holes
in the /memory node, but rather add these regions as no-map in a
/reserved-memory node. But that's a unrelated matter.

>  
> +	reboot-mode-syscon@5f01000 {
> +		compatible = "syscon", "simple-mfd";
> +		reg = <0x0 0x05f01000 0x0 0x00001000>;
> +
> +		reboot-mode@0 {

Drop the @0

Other than that:
Acked-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> +			compatible = "syscon-reboot-mode";
> +			offset = <0x0>;
> +
> +			mode-normal	= <0x77665501>;
> +			mode-bootloader	= <0x77665500>;
> +			mode-recovery	= <0x77665502>;
> +		};
> +	};
> +
>  	soc {
>  		spi0: spi@f7106000 {
>  			status = "ok";

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
