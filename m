From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 5/5] dt-bindings: display: fill Documents for series of vop
Date: Tue, 11 Jul 2017 14:45:43 +0200
Message-ID: <7391489.lxuf2bMt0N@diego>
References: <1499776908-16811-1-git-send-email-mark.yao@rock-chips.com> <1499776958-17062-1-git-send-email-mark.yao@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1499776958-17062-1-git-send-email-mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

Am Dienstag, 11. Juli 2017, 20:42:38 CEST schrieb Mark Yao:
> Signed-off-by: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt | 4
> ++++ 1 file changed, 4 insertions(+)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
> b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt index
> 9eb3f0a..11fa3b0 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
> @@ -8,8 +8,12 @@ Required properties:
>  - compatible: value should be one of the following
>  		"rockchip,rk3036-vop";
>  		"rockchip,rk3288-vop";
> +		"rockchip,rk3368-vop";
> +		"rockchip,rk3366-vop";
>  		"rockchip,rk3399-vop-big";
>  		"rockchip,rk3399-vop-lit";
> +		"rockchip,rk322x-vop";

please don't use wildcards in devicetree compatibles. We've somehow
standardized on using rk3228 for both the rk3228 and rk3229 (which are
nearly the same soc with some speed adjustments)

So,
+		"rockchip,rk3228-vop";
please


Thanks
Heiko

> +		"rockchip,rk3328-vop";
> 
>  - interrupts: should contain a list of all VOP IP block interrupts in the
>  		 order: VSYNC, LCD_SYSTEM. The interrupt specifier


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
