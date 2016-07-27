From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v3 2/4] arm64: dts: rockchip: add the saradc for rk3399
Date: Wed, 27 Jul 2016 07:50:52 -0700
Message-ID: <5798CA4C.9030400@roeck-us.net>
References: <1469629447-544-1-git-send-email-wxt@rock-chips.com>
 <1469629447-544-2-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1469629447-544-2-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, john-HooS5bfzL4hWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/27/2016 07:24 AM, Caesar Wang wrote:
> This patch adds saradc needed information on rk3399 SoCs.
>
> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Reviewed-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

> ---
>
> Changes in v3: None
> Changes in v2: None
>
>   arch/arm64/boot/dts/rockchip/rk3399.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> index 4c84229..b81f84b 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -299,6 +299,18 @@
>   		};
>   	};
>
> +	saradc: saradc@ff100000 {
> +		compatible = "rockchip,rk3399-saradc";
> +		reg = <0x0 0xff100000 0x0 0x100>;
> +		interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> +		#io-channel-cells = <1>;
> +		clocks = <&cru SCLK_SARADC>, <&cru PCLK_SARADC>;
> +		clock-names = "saradc", "apb_pclk";
> +		resets = <&cru SRST_P_SARADC>;
> +		reset-names = "saradc-apb";
> +		status = "disabled";
> +	};
> +
>   	i2c1: i2c@ff110000 {
>   		compatible = "rockchip,rk3399-i2c";
>   		reg = <0x0 0xff110000 0x0 0x1000>;
>
