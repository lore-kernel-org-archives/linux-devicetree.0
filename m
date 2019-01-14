From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v2 8/9] arm64: dts: sdm845: wireup the thermal trip
 points to cpufreq
Date: Mon, 14 Jan 2019 14:01:01 -0800
Message-ID: <20190114220101.GN261387@google.com>
References: <cover.1547458732.git.amit.kucheria@linaro.org>
 <7f94696460848a6bcfe5aee5ffda7fe556240736.1547458732.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7f94696460848a6bcfe5aee5ffda7fe556240736.1547458732.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, viresh.kumar@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, tdas@codeaurora.org, swboyd@chromium.org, dianders@chromium.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 14, 2019 at 03:51:10PM +0530, Amit Kucheria wrote:
> Since all cpus in the big and little clusters, respectively, are in the
> same frequency domain, use all of them for mitigation in the
> cooling-map. We end up with two cooling devices - one each for the big
> and little clusters.
> 
> At the lower trip points we restrict ourselves to throttling only a few
> OPPs. At higher trip temperatures, allow ourselves to be throttled to
> any extent.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 177 ++++++++++++++++++++++++---
>  1 file changed, 161 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index fb7da678b116..7973e88bdf94 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>
> ...
>
> @@ -1719,18 +1728,35 @@
>  			thermal-sensors = <&tsens0 1>;
>  
>  			trips {
> -				cpu_alert0: trip0 {
> +				cpu0_alert0: trip-point@0 {

Thanks for adapting the trip point names and labels in anticipation of
further additions!

Seems you aren't overly convinced about the 'target/threshold'
terminology used by some other arm64 platforms ;-)

>  					temperature = <95000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};

I realized that we still have the potential problem of a name change
in the trip point node name if a 'threshold' node for IPA is added,
since this node will have a lower temperature than 95°. If this is
something to be concerned about it might be worth to add that extra
trip point already to avoid headaches or funky trip point enumeration,
even if we know that the value might not be the final one.

(I'm aware that we are also changing the node names and labels right
now, it seems less problematic at this point since the SDM845 thermal
zones are a fairly recent addition)

> -				cpu_crit0: trip1 {
> +				cpu0_crit: cpu_crit@0 {

nit: does the @0 add any value here? IIUC there can be only one
critical trip point, hence there will never be a cpu_crit@1 or
higher.

>  					temperature = <110000>;
>  					hysteresis = <1000>;
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu0_alert0>;
> +					cooling-device = <&CPU0 THERMAL_NO_LIMIT 4>,
> +							 <&CPU1 THERMAL_NO_LIMIT 4>,
> +							 <&CPU2 THERMAL_NO_LIMIT 4>,
> +							 <&CPU3 THERMAL_NO_LIMIT 4>;
> +				};

Out of curiosity: how did you determing the max cooling state of 4?

Cheers

Matthias
