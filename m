From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] ARM: dts: msm8974: Add nodes for blsp1_uart1 serial port
Date: Thu, 14 Jul 2016 07:51:54 -0700
Message-ID: <20160714145154.GP23833@tuxbot>
References: <20160713073426.32555-1-bshah@kde.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160713073426.32555-1-bshah@kde.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bhushan Shah <bshah@kde.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Stephen Boyd <stephen.boyd@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed 13 Jul 00:34 PDT 2016, Bhushan Shah wrote:

> This serial port is used by LG Nexus 5 (codenammed hammerhead).
> 
> Cc: Andy Gross <andy.gross@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Cc: David Brown <david.brown@linaro.org>
> Cc: Stephen Boyd <stephen.boyd@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Bhushan Shah <bshah@kde.org>
> ---
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 6f16426..dc2ce00 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -422,6 +422,15 @@
>  			reg = <0xfc428000 0x4000>;
>  		};
>  
> +		blsp1_uart1: serial@f991d000 {
> +			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
> +			reg = <0xf991d000 0x1000>;
> +			interrupts = <0 107 0x0>;
> +			clocks = <&gcc GCC_BLSP1_UART1_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
> +			clock-names = "core", "iface";
> +			status = "disabled";
> +		};
> +
>  		blsp1_uart2: serial@f991e000 {
>  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
>  			reg = <0xf991e000 0x1000>;
> -- 
> 2.9.0
> 
