From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: mt8173: correct cpu type of cpu2 and
 cpu3 to cortex-a72
Date: Tue, 16 Apr 2019 10:10:55 +0200
Message-ID: <faf684e7-e4a0-32be-185e-f9b3b2c7a88b@gmail.com>
References: <20190225065112.3400-1-seiya.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190225065112.3400-1-seiya.wang@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Seiya Wang <seiya.wang@mediatek.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 25/02/2019 07:51, Seiya Wang wrote:
> The cpu type of cpu2 and cpu3 should be cortex-a72, not cortex-a57.
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

applied to v5.1-next/dts64

Sorry for the late answer.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 44374c506a1c..99675c51577a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -178,12 +178,12 @@
>  
>  		cpu2: cpu@100 {
>  			device_type = "cpu";
> -			compatible = "arm,cortex-a57";
> +			compatible = "arm,cortex-a72";
>  			reg = <0x100>;
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SLEEP_0>;
>  			#cooling-cells = <2>;
> -			clocks = <&infracfg CLK_INFRA_CA57SEL>,
> +			clocks = <&infracfg CLK_INFRA_CA72SEL>,
>  				 <&apmixedsys CLK_APMIXED_MAINPLL>;
>  			clock-names = "cpu", "intermediate";
>  			operating-points-v2 = <&cluster1_opp>;
> @@ -191,12 +191,12 @@
>  
>  		cpu3: cpu@101 {
>  			device_type = "cpu";
> -			compatible = "arm,cortex-a57";
> +			compatible = "arm,cortex-a72";
>  			reg = <0x101>;
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SLEEP_0>;
>  			#cooling-cells = <2>;
> -			clocks = <&infracfg CLK_INFRA_CA57SEL>,
> +			clocks = <&infracfg CLK_INFRA_CA72SEL>,
>  				 <&apmixedsys CLK_APMIXED_MAINPLL>;
>  			clock-names = "cpu", "intermediate";
>  			operating-points-v2 = <&cluster1_opp>;
> 
