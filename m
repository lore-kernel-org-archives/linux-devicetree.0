From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v3 4/4] arm: dts: rockchip: add reset node for the exist
 saradc SoCs
Date: Wed, 27 Jul 2016 07:52:56 -0700
Message-ID: <5798CAC8.6030403@roeck-us.net>
References: <1469629447-544-1-git-send-email-wxt@rock-chips.com>
 <1469629447-544-4-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1469629447-544-4-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, john-HooS5bfzL4hWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/27/2016 07:24 AM, Caesar Wang wrote:
> SARADC controller needs to be reset before programming it, otherwise
> it will not function properly.
>
> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

> ---
>
> Changes in v3: None
> Changes in v2: None
>
>   arch/arm/boot/dts/rk3066a.dtsi | 2 ++
>   arch/arm/boot/dts/rk3288.dtsi  | 2 ++
>   arch/arm/boot/dts/rk3xxx.dtsi  | 2 ++
>   3 files changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/rk3066a.dtsi b/arch/arm/boot/dts/rk3066a.dtsi
> index c0ba86c..0d0dae3 100644
> --- a/arch/arm/boot/dts/rk3066a.dtsi
> +++ b/arch/arm/boot/dts/rk3066a.dtsi
> @@ -197,6 +197,8 @@
>   		clock-names = "saradc", "apb_pclk";
>   		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
>   		#io-channel-cells = <1>;
> +		resets = <&cru SRST_SARADC>;
> +		reset-names = "saradc-apb";
>   		status = "disabled";
>   	};
>
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index cd33f01..91c4b3c 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -279,6 +279,8 @@
>   		#io-channel-cells = <1>;
>   		clocks = <&cru SCLK_SARADC>, <&cru PCLK_SARADC>;
>   		clock-names = "saradc", "apb_pclk";
> +		resets = <&cru SRST_SARADC>;
> +		reset-names = "saradc-apb";
>   		status = "disabled";
>   	};
>
> diff --git a/arch/arm/boot/dts/rk3xxx.dtsi b/arch/arm/boot/dts/rk3xxx.dtsi
> index 99bbcc2..e2cd683 100644
> --- a/arch/arm/boot/dts/rk3xxx.dtsi
> +++ b/arch/arm/boot/dts/rk3xxx.dtsi
> @@ -399,6 +399,8 @@
>   		#io-channel-cells = <1>;
>   		clocks = <&cru SCLK_SARADC>, <&cru PCLK_SARADC>;
>   		clock-names = "saradc", "apb_pclk";
> +		resets = <&cru SRST_SARADC>;
> +		reset-names = "saradc-apb";
>   		status = "disabled";
>   	};
>
>
