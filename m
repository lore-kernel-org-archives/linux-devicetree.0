From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 13/14] arm64: dts: qcom: qcs404: Add DVFS support
Date: Thu, 11 Jul 2019 08:29:09 -0700
Message-ID: <20190711152909.GO7234@tuxbook-pro>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
 <20190625164733.11091-14-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190625164733.11091-14-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: sboyd@kernel.org, david.brown@linaro.org, jassisinghbrar@gmail.com, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de, sibis@codeaurora.org, enric.balletbo@collabora.com, jagan@amarulasolutions.com, olof@lixom.net, vkoul@kernel.org, niklas.cassel@linaro.org, georgi.djakov@linaro.org, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
List-Id: devicetree@vger.kernel.org

On Tue 25 Jun 09:47 PDT 2019, Jorge Ramirez-Ortiz wrote:

> Support dynamic voltage and frequency scaling on qcs404.
> 
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

I agree with Niklas on the possibility of squashing this with the opp
table. But unless you respin this

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index 9569686dbc41..4b4ce0b5df76 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -34,6 +34,9 @@
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SLEEP_0>;
>  			next-level-cache = <&L2_0>;
> +			clocks = <&apcs_glb>;
> +			operating-points-v2 = <&cpu_opp_table>;
> +			cpu-supply = <&pms405_s3>;
>  		};
>  
>  		CPU1: cpu@101 {
> @@ -43,6 +46,9 @@
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SLEEP_0>;
>  			next-level-cache = <&L2_0>;
> +			clocks = <&apcs_glb>;
> +			operating-points-v2 = <&cpu_opp_table>;
> +			cpu-supply = <&pms405_s3>;
>  		};
>  
>  		CPU2: cpu@102 {
> @@ -52,6 +58,9 @@
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SLEEP_0>;
>  			next-level-cache = <&L2_0>;
> +			clocks = <&apcs_glb>;
> +			operating-points-v2 = <&cpu_opp_table>;
> +			cpu-supply = <&pms405_s3>;
>  		};
>  
>  		CPU3: cpu@103 {
> @@ -61,6 +70,9 @@
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SLEEP_0>;
>  			next-level-cache = <&L2_0>;
> +			clocks = <&apcs_glb>;
> +			operating-points-v2 = <&cpu_opp_table>;
> +			cpu-supply = <&pms405_s3>;
>  		};
>  
>  		L2_0: l2-cache {
> -- 
> 2.21.0
> 
