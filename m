From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2] arm: dts: rockchip: fix vcc_host_5v regulator for usb3
 host
Date: Fri, 16 Aug 2019 14:24:06 +0200
Message-ID: <2932927.UJgUFA1Pmh@phil>
References: <20190815081252.27405-1-kever.yang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190815081252.27405-1-kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonas Karlman <jonas-uIzNG4q0ceqzQB+pC5nmwQ@public.gmane.org>, Katsuhiro Suzuki <katsuhiro-WKCMddiH/C4xsqv6Oivclw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tomohiro Mayama <parly-gh-HEvi76orzLt5vQOrPBq+1Q@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Kever, TL,

[added TL Lim for clarification]

Am Donnerstag, 15. August 2019, 10:12:52 CEST schrieb Kever Yang:
> According to rock64 schemetic V2 and V3, the VCC_HOST_5V output is
> controlled by USB_20_HOST_DRV, which is the same as VCC_HOST1_5V.

The v1 schematics I have do reference the GPIO0_A0 as controlling this
supply, so the big question would be how to handle the different versions.

Because adding this would probably break v1 boards in this function.

@TL: where v1 boards also sold or were they only used during development?
If this were the case, we could just apply the patch, not caring about
v1 boards, but if v1 boards were also sold to customers there would be
more of a problem.

Thanks
Heiko


> 
> Signed-off-by: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> 
> Changes in v2:
> - remove enable-active-high property
> 
>  arch/arm64/boot/dts/rockchip/rk3328-rock64.dts | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
> index 7cfd5ca6cc85..62936b432f9a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
> @@ -34,10 +34,9 @@
>  
>  	vcc_host_5v: vcc-host-5v-regulator {
>  		compatible = "regulator-fixed";
> -		enable-active-high;
> -		gpio = <&gpio0 RK_PA0 GPIO_ACTIVE_HIGH>;
> +		gpio = <&gpio0 RK_PA2 GPIO_ACTIVE_LOW>;
>  		pinctrl-names = "default";
> -		pinctrl-0 = <&usb30_host_drv>;
> +		pinctrl-0 = <&usb20_host_drv>;
>  		regulator-name = "vcc_host_5v";
>  		regulator-always-on;
>  		regulator-boot-on;
> @@ -320,12 +319,6 @@
>  			rockchip,pins = <0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
>  		};
>  	};
> -
> -	usb3 {
> -		usb30_host_drv: usb30-host-drv {
> -			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
> -		};
> -	};
>  };
>  
>  &sdmmc {
> 
