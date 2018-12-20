From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH] arm64: dts: sdm845: Add cpufreq device node
Date: Thu, 20 Dec 2018 11:50:55 -0800
Message-ID: <20181220195055.GB261387@google.com>
References: <1545333530-30151-1-git-send-email-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1545333530-30151-1-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Taniya Das <tdas@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, david.brown@linaro.org, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org, amit.kucheria@linaro.org
List-Id: devicetree@vger.kernel.org

Hi Taniya,

On Fri, Dec 21, 2018 at 12:48:50AM +0530, Taniya Das wrote:
> This change adds the cpufreq node as per the bindings example for SDM845.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 23a253b..5db4fcc 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -99,6 +99,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x0>;
>  			enable-method = "psci";
> +			qcom,freq-domain = <&cpufreq_hw 0>;
>  			next-level-cache = <&L2_0>;
>  			L2_0: l2-cache {
>  				compatible = "cache";
> @@ -114,6 +115,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x100>;
>  			enable-method = "psci";
> +			qcom,freq-domain = <&cpufreq_hw 0>;
>  			next-level-cache = <&L2_100>;
>  			L2_100: l2-cache {
>  				compatible = "cache";
> @@ -126,6 +128,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x200>;
>  			enable-method = "psci";
> +			qcom,freq-domain = <&cpufreq_hw 0>;
>  			next-level-cache = <&L2_200>;
>  			L2_200: l2-cache {
>  				compatible = "cache";
> @@ -138,6 +141,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x300>;
>  			enable-method = "psci";
> +			qcom,freq-domain = <&cpufreq_hw 0>;
>  			next-level-cache = <&L2_300>;
>  			L2_300: l2-cache {
>  				compatible = "cache";
> @@ -150,6 +154,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x400>;
>  			enable-method = "psci";
> +			qcom,freq-domain = <&cpufreq_hw 1>;
>  			next-level-cache = <&L2_400>;
>  			L2_400: l2-cache {
>  				compatible = "cache";
> @@ -162,6 +167,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x500>;
>  			enable-method = "psci";
> +			qcom,freq-domain = <&cpufreq_hw 1>;
>  			next-level-cache = <&L2_500>;
>  			L2_500: l2-cache {
>  				compatible = "cache";
> @@ -174,6 +180,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x600>;
>  			enable-method = "psci";
> +			qcom,freq-domain = <&cpufreq_hw 1>;
>  			next-level-cache = <&L2_600>;
>  			L2_600: l2-cache {
>  				compatible = "cache";
> @@ -186,6 +193,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x700>;
>  			enable-method = "psci";
> +			qcom,freq-domain = <&cpufreq_hw 1>;
>  			next-level-cache = <&L2_700>;
>  			L2_700: l2-cache {
>  				compatible = "cache";
> @@ -341,6 +349,17 @@
>  			#power-domain-cells = <1>;
>  		};
> 
> +		cpufreq_hw: cpufreq@17d43000 {
> +			compatible = "qcom,cpufreq-hw";
> +			reg = <0x17d43000 0x1400>, <0x17d45800 0x1400>;
> +			reg-names = "freq-domain0", "freq-domain1";
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
> +			clock-names = "xo", "alternate";
> +
> +			#freq-domain-cells = <1>;
> +		};
> +
>  		qfprom@784000 {
>  			compatible = "qcom,qfprom";
>  			reg = <0x784000 0x8ff>;

My understanding is that the entries in the SDM845 DT are sorted by
address. The address of the cpufreq node is 0x17d43000, hence it
should be the last entry of the 'soc' node, after 'timer@17c90000'.

Tested-by: Matthias Kaehlcke <mka@chromium.org>
