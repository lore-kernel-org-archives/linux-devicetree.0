From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: imx7s: enable cpuidle driver
Date: Mon, 3 Sep 2018 09:16:26 +0800
Message-ID: <20180903011625.GZ3850@dragon>
References: <1535518847-24417-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1535518847-24417-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Wed, Aug 29, 2018 at 01:00:46PM +0800, Anson Huang wrote:
> Enable cpuidle for i.MX7S/D using generic ARM cpuidle
> driver, below 2 idle states enabled:
> 
> 1. ARM WFI;
> 2. SoC WAIT mode.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  arch/arm/boot/dts/imx7d.dtsi |  1 +
>  arch/arm/boot/dts/imx7s.dtsi | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
> index 7cbc2ff..4d0d0f6 100644
> --- a/arch/arm/boot/dts/imx7d.dtsi
> +++ b/arch/arm/boot/dts/imx7d.dtsi
> @@ -20,6 +20,7 @@
>  			reg = <1>;
>  			clock-frequency = <996000000>;
>  			operating-points-v2 = <&cpu0_opp_table>;
> +			cpu-idle-states = <&CPU_SLEEP>;
>  		};
>  	};
>  
> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
> index 93884ce..cf5570b 100644
> --- a/arch/arm/boot/dts/imx7s.dtsi
> +++ b/arch/arm/boot/dts/imx7s.dtsi
> @@ -54,6 +54,19 @@
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> +		idle-states {
> +			entry-method = "psci";
> +
> +			CPU_SLEEP: WAIT {

I understand uppercase is allowed, but we conventionally use lowercase
for label and node name.  Can we do something like below?

	cpu_sleep_wait: cpu-sleep-wait {
		...
	}

Shawn

> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x0010000>;
> +				local-timer-stop;
> +				entry-latency-us = <100>;
> +				exit-latency-us = <50>;
> +				min-residency-us = <1000>;
> +			};
> +		};
> +
>  		cpu0: cpu@0 {
>  			compatible = "arm,cortex-a7";
>  			device_type = "cpu";
> @@ -61,6 +74,7 @@
>  			clock-frequency = <792000000>;
>  			clock-latency = <61036>; /* two CLK32 periods */
>  			clocks = <&clks IMX7D_CLK_ARM>;
> +			cpu-idle-states = <&CPU_SLEEP>;
>  		};
>  	};
>  
> -- 
> 2.7.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
