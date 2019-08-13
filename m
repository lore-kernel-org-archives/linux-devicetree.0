From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 06/15] arm64: dts: msm8916: thermal: Fixup HW ids for cpu
 sensors
Date: Tue, 13 Aug 2019 15:25:57 +0200
Message-ID: <9dc8c3ba-bf96-967d-730a-243a903dd1e6@linaro.org>
References: <cover.1564091601.git.amit.kucheria@linaro.org>
 <5d86bfcdfd118294122e2182f3328fe823bc985d.1564091601.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5d86bfcdfd118294122e2182f3328fe823bc985d.1564091601.git.amit.kucheria@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, Andy Gross <agross@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 26/07/2019 00:18, Amit Kucheria wrote:
> msm8916 uses sensors 0, 1, 2, 4 and 5. Sensor 3 is NOT used. Fixup the
> device tree so that the correct sensor ID is used and as a result we can
> actually check the temperature for the cpu2_3 sensor.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>

This change matches the documentation available in the Qcom website.

Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 5ea9fb8f2f87..8686e101905c 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -179,7 +179,7 @@
>  			polling-delay-passive = <250>;
>  			polling-delay = <1000>;
>  
> -			thermal-sensors = <&tsens 4>;
> +			thermal-sensors = <&tsens 5>;
>  
>  			trips {
>  				cpu0_1_alert0: trip-point@0 {
> @@ -209,7 +209,7 @@
>  			polling-delay-passive = <250>;
>  			polling-delay = <1000>;
>  
> -			thermal-sensors = <&tsens 3>;
> +			thermal-sensors = <&tsens 4>;
>  
>  			trips {
>  				cpu2_3_alert0: trip-point@0 {
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
