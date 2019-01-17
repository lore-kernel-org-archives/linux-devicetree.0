From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: sdm845: Add CPU capacity values
Date: Thu, 17 Jan 2019 15:38:10 +0530
Message-ID: <5230df91-5d46-2d12-c31a-ca19934c521c@codeaurora.org>
References: <20190116234039.12935-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116234039.12935-1-mka@chromium.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org



On 1/17/2019 5:10 AM, Matthias Kaehlcke wrote:
> Specify the relative CPU capacity of all SDM845 AP cores.
> 
> The values were provided by Qualcomm engineers.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>

> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index d9be5bba62c45..e01949fd44075 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -99,6 +99,7 @@
>   			compatible = "qcom,kryo385";
>   			reg = <0x0 0x0>;
>   			enable-method = "psci";
> +			capacity-dmips-mhz = <607>;
>   			qcom,freq-domain = <&cpufreq_hw 0>;
>   			next-level-cache = <&L2_0>;
>   			L2_0: l2-cache {
> @@ -115,6 +116,7 @@
>   			compatible = "qcom,kryo385";
>   			reg = <0x0 0x100>;
>   			enable-method = "psci";
> +			capacity-dmips-mhz = <607>;
>   			qcom,freq-domain = <&cpufreq_hw 0>;
>   			next-level-cache = <&L2_100>;
>   			L2_100: l2-cache {
> @@ -128,6 +130,7 @@
>   			compatible = "qcom,kryo385";
>   			reg = <0x0 0x200>;
>   			enable-method = "psci";
> +			capacity-dmips-mhz = <607>;
>   			qcom,freq-domain = <&cpufreq_hw 0>;
>   			next-level-cache = <&L2_200>;
>   			L2_200: l2-cache {
> @@ -141,6 +144,7 @@
>   			compatible = "qcom,kryo385";
>   			reg = <0x0 0x300>;
>   			enable-method = "psci";
> +			capacity-dmips-mhz = <607>;
>   			qcom,freq-domain = <&cpufreq_hw 0>;
>   			next-level-cache = <&L2_300>;
>   			L2_300: l2-cache {
> @@ -154,6 +158,7 @@
>   			compatible = "qcom,kryo385";
>   			reg = <0x0 0x400>;
>   			enable-method = "psci";
> +			capacity-dmips-mhz = <1024>;
>   			qcom,freq-domain = <&cpufreq_hw 1>;
>   			next-level-cache = <&L2_400>;
>   			L2_400: l2-cache {
> @@ -167,6 +172,7 @@
>   			compatible = "qcom,kryo385";
>   			reg = <0x0 0x500>;
>   			enable-method = "psci";
> +			capacity-dmips-mhz = <1024>;
>   			qcom,freq-domain = <&cpufreq_hw 1>;
>   			next-level-cache = <&L2_500>;
>   			L2_500: l2-cache {
> @@ -180,6 +186,7 @@
>   			compatible = "qcom,kryo385";
>   			reg = <0x0 0x600>;
>   			enable-method = "psci";
> +			capacity-dmips-mhz = <1024>;
>   			qcom,freq-domain = <&cpufreq_hw 1>;
>   			next-level-cache = <&L2_600>;
>   			L2_600: l2-cache {
> @@ -193,6 +200,7 @@
>   			compatible = "qcom,kryo385";
>   			reg = <0x0 0x700>;
>   			enable-method = "psci";
> +			capacity-dmips-mhz = <1024>;
>   			qcom,freq-domain = <&cpufreq_hw 1>;
>   			next-level-cache = <&L2_700>;
>   			L2_700: l2-cache {
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
