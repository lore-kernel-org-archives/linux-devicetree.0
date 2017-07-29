From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v1 1/2] arm64: dts: rockchip: add rk3328 i2s nodes
Date: Sat, 29 Jul 2017 23:09:41 +0200
Message-ID: <12755546.8f2g0BVaYa@phil>
References: <1501143365-76104-1-git-send-email-sugar.zhang@rock-chips.com> <1501143365-76104-2-git-send-email-sugar.zhang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501143365-76104-2-git-send-email-sugar.zhang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sugar Zhang <sugar.zhang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Liang Chen <cl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 27. Juli 2017, 16:16:03 CEST schrieb Sugar Zhang:
> This patch add the i2s dt nodes for rk3328.
> 
> Signed-off-by: Sugar Zhang <sugar.zhang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> 
>  arch/arm64/boot/dts/rockchip/rk3328.dtsi | 33 ++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> index 0be96ce..f1a284b 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> @@ -156,6 +156,39 @@
>  		clock-output-names = "xin24m";
>  	};
>  
> +	i2s0: i2s@ff000000 {
> +		compatible = "rockchip,rk3328-i2s", "rockchip,rk3066-i2s";

It looks like the rockchip,rk3328-i2s compatible is missing in the binding
documentation (Documentation/devicetree/bindings/sound/rockchip-i2s.txt)

Send a patch adding it first please.


Heiko

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
