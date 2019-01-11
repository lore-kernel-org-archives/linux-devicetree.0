From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v1 7/7] arm64: dts: sdm845: wireup the thermal trip
 points to cpufreq
Date: Thu, 10 Jan 2019 16:30:14 -0800
Message-ID: <20190111003014.GB261387@google.com>
References: <cover.1547078153.git.amit.kucheria@linaro.org>
 <6c5b26e65be18222587724e066fc2e39b9f60397.1547078153.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6c5b26e65be18222587724e066fc2e39b9f60397.1547078153.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, viresh.kumar@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, tdas@codeaurora.org, swboyd@chromium.org, dianders@chromium.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 10, 2019 at 05:30:56AM +0530, Amit Kucheria wrote:
> Since the big and little cpus are in the same frequency domain, use all
> of them for mitigation in the cooling-map. At the lower trip points we
> restrict ourselves to throttling only a few OPPs. At higher trip
> temperatures, allow ourselves to be throttled to any extent.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 145 +++++++++++++++++++++++++++
>  1 file changed, 145 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 29e823b0caf4..cd6402a9aa64 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/reset/qcom,sdm845-aoss.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +#include <dt-bindings/thermal/thermal.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -99,6 +100,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x0>;
>  			enable-method = "psci";
> +			#cooling-cells = <2>;
>  			next-level-cache = <&L2_0>;
>  			L2_0: l2-cache {
>  				compatible = "cache";
> @@ -114,6 +116,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x100>;
>  			enable-method = "psci";
> +			#cooling-cells = <2>;
>  			next-level-cache = <&L2_100>;
>  			L2_100: l2-cache {
>  				compatible = "cache";
> @@ -126,6 +129,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x200>;
>  			enable-method = "psci";
> +			#cooling-cells = <2>;
>  			next-level-cache = <&L2_200>;
>  			L2_200: l2-cache {
>  				compatible = "cache";
> @@ -138,6 +142,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x300>;
>  			enable-method = "psci";
> +			#cooling-cells = <2>;
>  			next-level-cache = <&L2_300>;
>  			L2_300: l2-cache {
>  				compatible = "cache";
> @@ -150,6 +155,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x400>;
>  			enable-method = "psci";
> +			#cooling-cells = <2>;
>  			next-level-cache = <&L2_400>;
>  			L2_400: l2-cache {
>  				compatible = "cache";
> @@ -162,6 +168,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x500>;
>  			enable-method = "psci";
> +			#cooling-cells = <2>;
>  			next-level-cache = <&L2_500>;
>  			L2_500: l2-cache {
>  				compatible = "cache";
> @@ -174,6 +181,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x600>;
>  			enable-method = "psci";
> +			#cooling-cells = <2>;
>  			next-level-cache = <&L2_600>;
>  			L2_600: l2-cache {
>  				compatible = "cache";
> @@ -186,6 +194,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x700>;
>  			enable-method = "psci";
> +			#cooling-cells = <2>;
>  			next-level-cache = <&L2_700>;
>  			L2_700: l2-cache {
>  				compatible = "cache";
> @@ -1703,6 +1712,23 @@
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_alert0>;
> +					cooling-device = <&CPU0 THERMAL_NO_LIMIT 4>,
> +							 <&CPU1 THERMAL_NO_LIMIT 4>,
> +							 <&CPU2 THERMAL_NO_LIMIT 4>,
> +							 <&CPU3 THERMAL_NO_LIMIT 4>;
> +				};
> +				map1 {
> +					trip = <&cpu_crit0>;
> +					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};

Slightly off-topic, buy maybe not so much since we are just starting
to use the trip points:

Currently we use the naming scheme 'cpu_<type>N' for trip points. I
anticipate that we're going to add more passive trip points soon, to
keep the 'power_allocator' thermal governor happy, which expects a
'switch_on' and a 'desired_temperature' trip point. With the current
naming scheme this could become a bit messy. I suggest to change it to
'cpuN_<type>[X]', which would allow for something like 'cpuN_alert0'
and 'cpuN_alert1'.

If you think the change makes sense you can consider to do it within
this series, I can also send a separate patch once it has landed.

You could also consider to add the additional trip point in this
series if you agree that it will be needed.

This is not necessarily a call for action, just thinking loudly about
a closely related topic ;-)

Cheers

Matthias
