From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 3/7] [v2] arm64: dts: add QorIQ LS1046A SoC support
Date: Thu, 8 Sep 2016 14:13:26 +0100
Message-ID: <20160908131326.GE26570@leverpostej>
References: <1473069695-33092-1-git-send-email-shh.xie@gmail.com>
 <1473069695-33092-4-git-send-email-shh.xie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1473069695-33092-4-git-send-email-shh.xie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shh.xie@gmail.com
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will.deacon@arm.com, shawnguo@kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de, Mingkai Hu <Mingkai.Hu@nxp.com>, Horia Geant? <horia.geanta@nxp.com>, Mihai Bantea <mihai.bantea@nxp.com>, Chenhui Zhao <chenhui.zhao@nxp.com>, Gong Qianyu <Qianyu.Gong@nxp.com>, Minghuan Lian <Minghuan.Lian@nxp.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Shaohui Xie <Shaohui.Xie@nxp.com>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 05, 2016 at 06:01:31PM +0800, shh.xie@gmail.com wrote:
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a72";
> +			reg = <0x0>;
> +			clocks = <&clockgen 1 0>;
> +			next-level-cache = <&l2>;
> +			cpu-idle-states = <&CPU_PH20>;
> +		};

[...]

> +	};
> +
> +	idle-states {
> +		entry-method = "arm,psci";
> +
> +		CPU_PH20: cpu-ph20 {
> +			compatible = "arm,idle-state";
> +			idle-state-name = "PH20";
> +			arm,psci-suspend-param = <0x00010000>;
> +			entry-latency-us = <1000>;
> +			exit-latency-us = <1000>;
> +			min-residency-us = <3000>;
> +		};
> +	};

There's no PSCI node in this file, and none from am included file, so
this doesn't look right.

> +	pmu {
> +		compatible = "arm,armv8-pmuv3";
> +		interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity = <&cpu0>,
> +				     <&cpu1>,
> +				     <&cpu2>,
> +				     <&cpu3>;
> +	};

The compatible string should be "arm,cortex-a72-pmu".

Thanks,
Mark.
