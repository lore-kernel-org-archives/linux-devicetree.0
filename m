From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 02/12] ARM: dts: apq8064: add support to gsbi1 uart
Date: Tue, 29 Mar 2016 07:29:46 -0700
Message-ID: <20160329142946.GG8929@tuxbot>
References: <1458762366-9233-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1458762429-9397-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1458762429-9397-1-git-send-email-srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed 23 Mar 12:47 PDT 2016, Srinivas Kandagatla wrote:

> This patch adds support to gsbi1 uart and its pinctrls nodes.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/qcom-apq8064-pins.dtsi | 14 ++++++++++++++
>  arch/arm/boot/dts/qcom-apq8064.dtsi      | 10 ++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064-pins.dtsi b/arch/arm/boot/dts/qcom-apq8064-pins.dtsi
> index b57c59d..8bb5e5f 100644
> --- a/arch/arm/boot/dts/qcom-apq8064-pins.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8064-pins.dtsi
> @@ -39,6 +39,20 @@
>  		};
>  	};
>  
> +	gsbi1_uart_2pins: gsbi1_uart_2pins {
> +		mux {
> +			pins = "gpio18", "gpio19";
> +			function = "gsbi1";
> +		};
> +	};
> +
> +	gsbi1_uart_4pins: gsbi1_uart_4pins {
> +		mux {
> +			pins = "gpio18", "gpio19", "gpio20", "gpio21";
> +			function = "gsbi1";
> +		};
> +	};
> +

No-one consumes this nodes.

>  	i2c2_pins: i2c2 {
>  		mux {
>  			pins = "gpio24", "gpio25";
> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
> index c6ff8fc..81b4290 100644
> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> @@ -225,6 +225,16 @@
>  
>  			syscon-tcsr = <&tcsr>;
>  
> +			gsbi1_serial: serial@12450000 {

Are you going to reference this node? Otherwise it should not have a
label.

> +				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
> +				reg = <0x12450000 0x100>,
> +				      <0x12400000 0x03>;
> +				interrupts = <0 193 0x0>;
> +				clocks = <&gcc GSBI1_UART_CLK>, <&gcc GSBI1_H_CLK>;
> +				clock-names = "core", "iface";
> +				status = "disabled";
> +			};
> +

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
