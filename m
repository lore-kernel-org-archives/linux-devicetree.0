From: Samuel Holland <samuel@sholland.org>
Subject: Re: [linux-sunxi] [PATCH 2/3] arm64: allwinner: a64: add CPU opp
 table
Date: Mon, 25 Sep 2017 12:38:47 -0500
Message-ID: <4e9af757-0881-cd79-2693-6b979db78ddb@sholland.org>
References: <20170923001531.14285-1-icenowy@aosc.io>
 <20170923001531.14285-3-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170923001531.14285-3-icenowy@aosc.io>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: icenowy@aosc.io, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

Hello,

On 09/22/17 19:15, Icenowy Zheng wrote:
> Add the operating table for the CPU (ARM cores) on Allwinner A64 SoC.
> 
> OPPs higher to 816MHz is temporarily dropped, to prevent overheat on
> boards with AXP803 support and undervoltage on boards without AXP803
> support.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index 20aba7b186aa..0532da4939eb 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -52,6 +52,23 @@
>   	#address-cells = <1>;
>   	#size-cells = <1>;
>   
> +	cpu0_opp_table: opp_table0 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-648000000 {
> +			opp-hz = /bits/ 64 <648000000>;
> +			opp-microvolt = <1040000>;
> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +		};
> +
> +		opp-816000000 {
> +			opp-hz = /bits/ 64 <816000000>;
> +			opp-microvolt = <1100000>;
> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +		};
> +	};
> +
>   	cpus {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
> @@ -61,6 +78,10 @@
>   			device_type = "cpu";
>   			reg = <0>;
>   			enable-method = "psci";
> +			clocks = <&ccu CLK_CPUX>;
CLK_CPUX is not currently exposed in the dt-bindings header, so this
doesn't compile.

> +			clock-names = "cpu";
> +			operating-points-v2 = <&cpu0_opp_table>;
> +			#cooling-cells = <2>;
>   		};
>   
>   		cpu1: cpu@1 {
> @@ -68,6 +89,7 @@
>   			device_type = "cpu";
>   			reg = <1>;
>   			enable-method = "psci";
> +			operating-points-v2 = <&cpu0_opp_table>;
>   		};
>   
>   		cpu2: cpu@2 {
> @@ -75,6 +97,7 @@
>   			device_type = "cpu";
>   			reg = <2>;
>   			enable-method = "psci";
> +			operating-points-v2 = <&cpu0_opp_table>;
>   		};
>   
>   		cpu3: cpu@3 {
> @@ -82,6 +105,7 @@
>   			device_type = "cpu";
>   			reg = <3>;
>   			enable-method = "psci";
> +			operating-points-v2 = <&cpu0_opp_table>;
>   		};
>   	};
>   
> 

Thanks,
Samuel
