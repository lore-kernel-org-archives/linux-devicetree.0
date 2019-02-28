From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V7 1/2] arm64: dts: freescale: imx8qxp: add cpu opp table
Date: Thu, 28 Feb 2019 11:18:34 +0800
Message-ID: <20190228031832.GH26041@dragon>
References: <1551157967-30925-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1551157967-30925-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 26, 2019 at 05:17:31AM +0000, Anson Huang wrote:
> Add i.MX8QXP CPU opp table to support cpufreq.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Prefix 'arm64: dts: imx8qxp: ' would already be clear enough.  I dropped
'freescale' from there and applied patch.

> ---
> No changes since V6.
> ---
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> index 4c3dd95..41bf0ce 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> @@ -34,6 +34,9 @@
>  			reg = <0x0 0x0>;
>  			enable-method = "psci";
>  			next-level-cache = <&A35_L2>;
> +			clocks = <&clk IMX_A35_CLK>;
> +			operating-points-v2 = <&a35_0_opp_table>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		A35_1: cpu@1 {
> @@ -42,6 +45,9 @@
>  			reg = <0x0 0x1>;
>  			enable-method = "psci";
>  			next-level-cache = <&A35_L2>;
> +			clocks = <&clk IMX_A35_CLK>;
> +			operating-points-v2 = <&a35_0_opp_table>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		A35_2: cpu@2 {
> @@ -50,6 +56,9 @@
>  			reg = <0x0 0x2>;
>  			enable-method = "psci";
>  			next-level-cache = <&A35_L2>;
> +			clocks = <&clk IMX_A35_CLK>;
> +			operating-points-v2 = <&a35_0_opp_table>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		A35_3: cpu@3 {
> @@ -58,6 +67,9 @@
>  			reg = <0x0 0x3>;
>  			enable-method = "psci";
>  			next-level-cache = <&A35_L2>;
> +			clocks = <&clk IMX_A35_CLK>;
> +			operating-points-v2 = <&a35_0_opp_table>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		A35_L2: l2-cache0 {
> @@ -65,6 +77,24 @@
>  		};
>  	};
>  
> +	a35_0_opp_table: opp-table {

What does the '0' in the label mean?

Shawn

> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-900000000 {
> +			opp-hz = /bits/ 64 <900000000>;
> +			opp-microvolt = <1000000>;
> +			clock-latency-ns = <150000>;
> +		};
> +
> +		opp-1200000000 {
> +			opp-hz = /bits/ 64 <1200000000>;
> +			opp-microvolt = <1100000>;
> +			clock-latency-ns = <150000>;
> +			opp-suspend;
> +		};
> +	};
> +
>  	gic: interrupt-controller@51a00000 {
>  		compatible = "arm,gic-v3";
>  		reg = <0x0 0x51a00000 0 0x10000>, /* GIC Dist */
> -- 
> 2.7.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
