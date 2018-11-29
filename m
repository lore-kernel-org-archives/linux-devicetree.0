From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] ARM: dts: qcom: Add SoC-specific string for
 sdhci-msm-v4 nodes
Date: Wed, 28 Nov 2018 16:03:08 -0800
Message-ID: <20181129000308.GF24969@minitux>
References: <20181105210921.253707-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181105210921.253707-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 05 Nov 13:09 PST 2018, Douglas Anderson wrote:

> As per upstream discussion [1], we should have an SoC-specific
> compatible string for Qualcomm's SDHCI nodes.  Let's add it.
> 
> [1] https://lkml.kernel.org/r/20181105203657.GA32282@bogus
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> 
>  arch/arm/boot/dts/qcom-apq8084.dtsi | 4 ++--
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
> index 0e1e98707e3f..899f28533ed7 100644
> --- a/arch/arm/boot/dts/qcom-apq8084.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
> @@ -412,7 +412,7 @@
>  		};
>  
>  		sdhci@f9824900 {
> -			compatible = "qcom,sdhci-msm-v4";
> +			compatible = "qcom,apq8084-sdhci", "qcom,sdhci-msm-v4";
>  			reg = <0xf9824900 0x11c>, <0xf9824000 0x800>;
>  			reg-names = "hc_mem", "core_mem";
>  			interrupts = <0 123 0>, <0 138 0>;
> @@ -425,7 +425,7 @@
>  		};
>  
>  		sdhci@f98a4900 {
> -			compatible = "qcom,sdhci-msm-v4";
> +			compatible = "qcom,apq8084-sdhci", "qcom,sdhci-msm-v4";
>  			reg = <0xf98a4900 0x11c>, <0xf98a4000 0x800>;
>  			reg-names = "hc_mem", "core_mem";
>  			interrupts = <0 125 0>, <0 221 0>;
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index aba159d5a95a..891990c0d0b4 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -602,7 +602,7 @@
>  		};
>  
>  		sdhci@f9824900 {
> -			compatible = "qcom,sdhci-msm-v4";
> +			compatible = "qcom,msm8974-sdhci", "qcom,sdhci-msm-v4";
>  			reg = <0xf9824900 0x11c>, <0xf9824000 0x800>;
>  			reg-names = "hc_mem", "core_mem";
>  			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
> @@ -616,7 +616,7 @@
>  		};
>  
>  		sdhci@f9864900 {
> -			compatible = "qcom,sdhci-msm-v4";
> +			compatible = "qcom,msm8974-sdhci", "qcom,sdhci-msm-v4";
>  			reg = <0xf9864900 0x11c>, <0xf9864000 0x800>;
>  			reg-names = "hc_mem", "core_mem";
>  			interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
> @@ -630,7 +630,7 @@
>  		};
>  
>  		sdhci@f98a4900 {
> -			compatible = "qcom,sdhci-msm-v4";
> +			compatible = "qcom,msm8974-sdhci", "qcom,sdhci-msm-v4";
>  			reg = <0xf98a4900 0x11c>, <0xf98a4000 0x800>;
>  			reg-names = "hc_mem", "core_mem";
>  			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
> -- 
> 2.19.1.930.g4563a0d9d0-goog
> 
