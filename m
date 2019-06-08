From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] arm64: dts: msm8996: fix PSCI entry-latency-us
Date: Fri, 7 Jun 2019 20:50:42 -0700
Message-ID: <20190608035042.GI24059@builder>
References: <20190604122931.22235-1-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190604122931.22235-1-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, amit.kucheria@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue 04 Jun 05:29 PDT 2019, Niklas Cassel wrote:

> The current entry-latency-us is too short.
> The proper way to convert between the device tree properties
> from the vendor tree to the upstream PSCI device tree properties is:
> 
> entry-latency-us = qcom,time-overhead - qcom,latency-us
> 
> which gives
> 
> entry-latency-us = 210 - 80 = 130
> 
> Fixes: f6aee7af59b6 ("arm64: dts: qcom: msm8996: Add PSCI cpuidle low power states")
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>

Thanks Niklas

Applied,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index b7cf2a17dcb5..e8c03b5c8990 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -174,7 +174,7 @@
>  				compatible = "arm,idle-state";
>  				idle-state-name = "standalone-power-collapse";
>  				arm,psci-suspend-param = <0x00000004>;
> -				entry-latency-us = <40>;
> +				entry-latency-us = <130>;
>  				exit-latency-us = <80>;
>  				min-residency-us = <300>;
>  			};
> -- 
> 2.21.0
> 
