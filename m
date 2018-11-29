From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add SoC-specific string for
 sdhci-msm-v4 nodes
Date: Wed, 28 Nov 2018 16:03:22 -0800
Message-ID: <20181129000322.GG24969@minitux>
References: <20181105210921.253707-1-dianders@chromium.org>
 <20181105210921.253707-2-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181105210921.253707-2-dianders@chromium.org>
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
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 ++--
>  arch/arm64/boot/dts/qcom/msm8992.dtsi | 2 +-
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index d302d8d639a1..0a7335526063 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -587,7 +587,7 @@
>                  };
>  
>  		sdhc_1: sdhci@7824000 {
> -			compatible = "qcom,sdhci-msm-v4";
> +			compatible = "qcom,msm8916-sdhci", "qcom,sdhci-msm-v4";
>  			reg = <0x07824900 0x11c>, <0x07824000 0x800>;
>  			reg-names = "hc_mem", "core_mem";
>  
> @@ -604,7 +604,7 @@
>  		};
>  
>  		sdhc_2: sdhci@7864000 {
> -			compatible = "qcom,sdhci-msm-v4";
> +			compatible = "qcom,msm8916-sdhci", "qcom,sdhci-msm-v4";
>  			reg = <0x07864900 0x11c>, <0x07864000 0x800>;
>  			reg-names = "hc_mem", "core_mem";
>  
> diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
> index cf5cacdd624d..09d0234cfd99 100644
> --- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
> @@ -203,7 +203,7 @@
>  		};
>  
>  		sdhci1: mmc@f9824900 {
> -			compatible = "qcom,sdhci-msm-v4";
> +			compatible = "qcom,msm8992-sdhci", "qcom,sdhci-msm-v4";
>  			reg = <0xf9824900 0x1a0>, <0xf9824000 0x800>;
>  			reg-names = "hc_mem", "core_mem";
>  
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index b29fe80d7288..5e19f87df020 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -535,7 +535,7 @@
>  
>  		sdhc2: sdhci@74a4900 {
>  			 status = "disabled";
> -			 compatible = "qcom,sdhci-msm-v4";
> +			 compatible = "qcom,msm8996-sdhci", "qcom,sdhci-msm-v4";
>  			 reg = <0x74a4900 0x314>, <0x74a4000 0x800>;
>  			 reg-names = "hc_mem", "core_mem";
>  
> -- 
> 2.19.1.930.g4563a0d9d0-goog
> 
