From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: add ARM Mali GPU node for rk3399
Date: Sat, 01 Jul 2017 18:04:26 +0200
Message-ID: <6356522.W9n5LLYRuo@phil>
References: <1498913770-16519-1-git-send-email-jacob-chen@iotwrt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1498913770-16519-1-git-send-email-jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jacob,

Am Samstag, 1. Juli 2017, 20:56:08 CEST schrieb Jacob Chen:
> Add Mali GPU device tree node for the rk3399 SoC.
> Tested with rockchip-forwardports repo.
> 
> Signed-off-by: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> index 1cbd7a2..e795135 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -1443,6 +1443,18 @@
>  		status = "disabled";
>  	};
>  
> +	gpu: mali@ff9a0000 {
> +		compatible = "rockchip,rk3399-mali", "arm,mali-t860", "arm,mali-midgard";

this is missing a separate patch adding rockchip,rk3399-mali to 
	Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt

Also arm,mali-midgard is not part of the binding. I just saw that it slipped
into the example in the binding file and also the rk3288.dtsi - which should
be fixed. But the driver should bind against the arm,mali-t860 alone, not
the mali-midgard.


Heiko

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
