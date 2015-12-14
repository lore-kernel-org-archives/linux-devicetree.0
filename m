From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: dts: rockchip: add eFuse node for rk3066a SoCs
Date: Mon, 14 Dec 2015 09:57:02 +0000
Message-ID: <566E926E.7090903@linaro.org>
References: <1447227272-1728-1-git-send-email-wxt@rock-chips.com> <1447227272-1728-4-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447227272-1728-4-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Heiko,

Can you take the DT patches in this series via your tree.

I picked up nvmem patches from this series.

thanks,
srini

On 11/11/15 07:34, Caesar Wang wrote:
> This patch add the eFuse dt node for rk3066a SoCs.
>
> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>
>   arch/arm/boot/dts/rk3066a.dtsi | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm/boot/dts/rk3066a.dtsi b/arch/arm/boot/dts/rk3066a.dtsi
> index 946f187..f61bb8a 100644
> --- a/arch/arm/boot/dts/rk3066a.dtsi
> +++ b/arch/arm/boot/dts/rk3066a.dtsi
> @@ -153,6 +153,19 @@
>   		clock-names = "timer", "pclk";
>   	};
>
> +	efuse: efuse@20010000 {
> +		compatible = "rockchip,rockchip-efuse";
> +		reg = <0x20010000 0x4000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		clocks = <&cru PCLK_EFUSE>;
> +		clock-names = "pclk_efuse";
> +
> +		cpu_leakage: cpu_leakage {
> +			reg = <0x17 0x1>;
> +		};
> +	};
> +
>   	timer@20038000 {
>   		compatible = "snps,dw-apb-timer-osc";
>   		reg = <0x20038000 0x100>;
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
