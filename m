From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: msm8998: Add SDCC2
Date: Thu, 15 Nov 2018 10:26:56 -0800
Message-ID: <20181115182656.GJ10915@tuxbook-pro>
References: <1542302291-6864-1-git-send-email-jhugo@codeaurora.org>
 <1542302291-6864-3-git-send-email-jhugo@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1542302291-6864-3-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu 15 Nov 09:18 PST 2018, Jeffrey Hugo wrote:

> SDCC2 is typically used as the controller for an external SD card slot.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index a948d4b..09deee0 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -53,7 +53,7 @@
>  	};
>  
>  	clocks {
> -		xo {
> +		xo: xo {
>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
>  			clock-frequency = <19200000>;
> @@ -605,6 +605,23 @@
>  			#mbox-cells = <1>;
>  		};
>  
> +		sdhc2: sdhci@c0a4900 {
> +			compatible = "qcom,sdhci-msm-v4";
> +			reg = <0xc0a4900 0x314>, <0xc0a4000 0x800>;
> +			reg-names = "hc_mem", "core_mem";
> +
> +			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq", "pwr_irq";
> +
> +			clock-names = "iface", "core", "xo";
> +			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
> +				 <&gcc GCC_SDCC2_APPS_CLK>,
> +				 <&xo>;
> +			bus-width = <4>;
> +			status = "disabled";
> +		};
> +
>  		blsp2_uart1: serial@c1b0000 {
>  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
>  			reg = <0xc1b0000 0x1000>;
> -- 
> Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
