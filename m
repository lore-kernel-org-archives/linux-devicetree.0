From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ls1028a: Fix CPU idle fail.
Date: Thu, 23 May 2019 16:51:04 +0800
Message-ID: <20190523085104.GP9261@dragon>
References: <20190517045753.3709-1-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190517045753.3709-1-ran.wang_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ran Wang <ran.wang_1@nxp.com>, Bhaskar Upadhaya <bhaskar.upadhaya@nxp.com>
Cc: Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, May 17, 2019 at 12:57:53PM +0800, Ran Wang wrote:
> PSCI spec define 1st parameter's bit 16 of function CPU_SUSPEND to
> indicate CPU State Type: 0 for standby, 1 for power down. In this
> case, we want to select standby for CPU idle feature. But current
> setting wrongly select power down and cause CPU SUSPEND fail every
> time. Need this fix.
> 
> Fixes: 8897f3255c9c ("arm64: dts: Add support for NXP LS1028A SoC")
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>

Leo, Bhaskar,

Do you guys agree with it?

Shawn

> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi |   18 +++++++++---------
>  1 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> index b045812..bf7f845 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> @@ -28,7 +28,7 @@
>  			enable-method = "psci";
>  			clocks = <&clockgen 1 0>;
>  			next-level-cache = <&l2>;
> -			cpu-idle-states = <&CPU_PH20>;
> +			cpu-idle-states = <&CPU_PW20>;
>  		};
>  
>  		cpu1: cpu@1 {
> @@ -38,7 +38,7 @@
>  			enable-method = "psci";
>  			clocks = <&clockgen 1 0>;
>  			next-level-cache = <&l2>;
> -			cpu-idle-states = <&CPU_PH20>;
> +			cpu-idle-states = <&CPU_PW20>;
>  		};
>  
>  		l2: l2-cache {
> @@ -53,13 +53,13 @@
>  		 */
>  		entry-method = "arm,psci";
>  
> -		CPU_PH20: cpu-ph20 {
> -			compatible = "arm,idle-state";
> -			idle-state-name = "PH20";
> -			arm,psci-suspend-param = <0x00010000>;
> -			entry-latency-us = <1000>;
> -			exit-latency-us = <1000>;
> -			min-residency-us = <3000>;
> +		CPU_PW20: cpu-pw20 {
> +			  compatible = "arm,idle-state";
> +			  idle-state-name = "PW20";
> +			  arm,psci-suspend-param = <0x0>;
> +			  entry-latency-us = <2000>;
> +			  exit-latency-us = <2000>;
> +			  min-residency-us = <6000>;
>  		};
>  	};
>  
> -- 
> 1.7.1
> 
