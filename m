From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8183: Enable CPU idle-states
Date: Fri, 21 Jun 2019 18:14:11 +0200
Message-ID: <b6ea04f4-76aa-10c3-759f-aefb45e492de@gmail.com>
References: <1559118303-31875-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559118303-31875-1-git-send-email-jamesjj.liao@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: James Liao <jamesjj.liao@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 29/05/2019 10:25, James Liao wrote:
> Enable mcdi-cpu and mcdi-cluster on MT8183 CPUs.
> 
> Signed-off-by: James Liao <jamesjj.liao@mediatek.com>

Would you mind to rebase and resend?

Regards,
Matthias

> ---
> This patch bases on v5.1-rc1 and [1], adds idle-states for MT8183 CPUs.
> 
> [1] https://patchwork.kernel.org/patch/10962375/
> 
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 08274bf..ef4b054 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -56,6 +56,7 @@
>  			compatible = "arm,cortex-a53";
>  			reg = <0x000>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&MCDI_CPU &MCDI_CLUSTER>;
>  		};
>  
>  		cpu1: cpu@1 {
> @@ -63,6 +64,7 @@
>  			compatible = "arm,cortex-a53";
>  			reg = <0x001>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&MCDI_CPU &MCDI_CLUSTER>;
>  		};
>  
>  		cpu2: cpu@2 {
> @@ -70,6 +72,7 @@
>  			compatible = "arm,cortex-a53";
>  			reg = <0x002>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&MCDI_CPU &MCDI_CLUSTER>;
>  		};
>  
>  		cpu3: cpu@3 {
> @@ -77,6 +80,7 @@
>  			compatible = "arm,cortex-a53";
>  			reg = <0x003>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&MCDI_CPU &MCDI_CLUSTER>;
>  		};
>  
>  		cpu4: cpu@100 {
> @@ -84,6 +88,7 @@
>  			compatible = "arm,cortex-a73";
>  			reg = <0x100>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&MCDI_CPU &MCDI_CLUSTER>;
>  		};
>  
>  		cpu5: cpu@101 {
> @@ -91,6 +96,7 @@
>  			compatible = "arm,cortex-a73";
>  			reg = <0x101>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&MCDI_CPU &MCDI_CLUSTER>;
>  		};
>  
>  		cpu6: cpu@102 {
> @@ -98,6 +104,7 @@
>  			compatible = "arm,cortex-a73";
>  			reg = <0x102>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&MCDI_CPU &MCDI_CLUSTER>;
>  		};
>  
>  		cpu7: cpu@103 {
> @@ -105,6 +112,29 @@
>  			compatible = "arm,cortex-a73";
>  			reg = <0x103>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&MCDI_CPU &MCDI_CLUSTER>;
> +		};
> +
> +		idle-states {
> +			entry-method = "arm,psci";
> +
> +			MCDI_CPU: mcdi-cpu {
> +				compatible = "arm,idle-state";
> +				local-timer-stop;
> +				arm,psci-suspend-param = <0x00010001>;
> +				entry-latency-us = <200>;
> +				exit-latency-us = <200>;
> +				min-residency-us = <800>;
> +			};
> +
> +			MCDI_CLUSTER: mcdi-cluster {
> +				compatible = "arm,idle-state";
> +				local-timer-stop;
> +				arm,psci-suspend-param = <0x01010001>;
> +				entry-latency-us = <250>;
> +				exit-latency-us = <400>;
> +				min-residency-us = <1300>;
> +			};
>  		};
>  	};
>  
> 
