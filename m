From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3 v7] ARC: hsdk: initial port for HSDK board
Date: Sun, 9 Jul 2017 19:41:21 -0500
Message-ID: <20170710004121.m5sp3wlovh7e6wzq@rob-hp-laptop>
References: <20170703165109.31535-1-Eugeniy.Paltsev@synopsys.com>
 <20170703165109.31535-4-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170703165109.31535-4-Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 03, 2017 at 07:51:09PM +0300, Eugeniy Paltsev wrote:
> From: Alexey Brodkin <abrodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> 
> This initial port adds support of ARC HS Development Kit board with some
> basic features such serial port, USB, SD/MMC and Ethernet.
> 
> Essentially we run Linux kernel on all 4 cores (i.e. utilize SMP) and
> heavily use IO Coherency for speeding-up DMA-aware peripherals.
> 
> Note as opposed to other ARC boards we link Linux kernel to
> 0x9000_0000 intentionally because cores 1 and 3 configured with DCCM
> situated at our more usual link base 0x8000_0000. We still can use
> memory region starting at 0x8000_0000 as we reallocate DCCM in our
> platform code.
> 
> Note that PAE remapping for DMA clients does not work due to an RTL bug,
> so CREG_PAE register must be programmed to all zeroes, otherwise it will
> cause problems with DMA to/from peripherals even if PAE40 is not used.
> 
> Signed-off-by: Alexey Brodkin <abrodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> ---
> Changes v6 -> v7:
>  * DTS: get rid of skeleton.dts, move cpus nodes to hsdk.dts
>  * DTS: style fixes
>  * Enable loadable modules, module unloading and NFS client as defaults
>  * Get rid of ARC_PLAT_HSDK board config option
> 
>  Documentation/devicetree/bindings/arc/hsdk.txt |   7 +
>  arch/arc/Makefile                              |   1 +
>  arch/arc/boot/dts/hsdk.dts                     | 189 +++++++++++++++++++++++++
>  arch/arc/configs/hsdk_defconfig                |  78 ++++++++++
>  arch/arc/kernel/devtree.c                      |   5 +-
>  arch/arc/plat-hsdk/Makefile                    |   9 ++
>  arch/arc/plat-hsdk/platform.c                  |  79 +++++++++++
>  7 files changed, 366 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arc/hsdk.txt
>  create mode 100644 arch/arc/boot/dts/hsdk.dts
>  create mode 100644 arch/arc/configs/hsdk_defconfig
>  create mode 100644 arch/arc/plat-hsdk/Makefile
>  create mode 100644 arch/arc/plat-hsdk/platform.c
> 
> diff --git a/Documentation/devicetree/bindings/arc/hsdk.txt b/Documentation/devicetree/bindings/arc/hsdk.txt
> new file mode 100644
> index 0000000..be50654
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arc/hsdk.txt
> @@ -0,0 +1,7 @@
> +Synopsys DesignWare ARC HS Development Kit Device Tree Bindings
> +---------------------------------------------------------------------------
> +
> +ARC HSDK Board with quad-core ARC HS38x4 in silicon.
> +
> +Required root node properties:
> +    - compatible = "snps,hsdk";
> diff --git a/arch/arc/Makefile b/arch/arc/Makefile
> index 44ef35d..e67397e 100644
> --- a/arch/arc/Makefile
> +++ b/arch/arc/Makefile
> @@ -111,6 +111,7 @@ core-$(CONFIG_ARC_PLAT_SIM)	+= arch/arc/plat-sim/
>  core-$(CONFIG_ARC_PLAT_TB10X)	+= arch/arc/plat-tb10x/
>  core-$(CONFIG_ARC_PLAT_AXS10X)	+= arch/arc/plat-axs10x/
>  core-$(CONFIG_ARC_PLAT_EZNPS)	+= arch/arc/plat-eznps/
> +core-y				+= arch/arc/plat-hsdk/
>  
>  ifdef CONFIG_ARC_PLAT_EZNPS
>  KBUILD_CPPFLAGS += -I$(srctree)/arch/arc/plat-eznps/include
> diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
> new file mode 100644
> index 0000000..33872f1
> --- /dev/null
> +++ b/arch/arc/boot/dts/hsdk.dts
> @@ -0,0 +1,189 @@
> +/*
> + * Copyright (C) 2017 Synopsys, Inc. (www.synopsys.com)
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +/*
> + * Device Tree for ARC HS Development Kit
> + */
> +/dts-v1/;
> +
> +#include <dt-bindings/net/ti-dp83867.h>
> +
> +/ {
> +	model = "snps,hsdk";
> +	compatible = "snps,hsdk";
> +
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	chosen {
> +		bootargs = "earlycon=uart8250,mmio32,0xf0005000,115200n8 console=ttyS0,115200n8 debug print-fatal-signals=1";
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			device_type = "cpu";
> +			compatible = "snps,archs38";
> +			reg = <0>;
> +			clocks = <&core_clk>;
> +		};
> +
> +		cpu@1 {
> +			device_type = "cpu";
> +			compatible = "snps,archs38";
> +			reg = <1>;
> +			clocks = <&core_clk>;
> +		};
> +
> +		cpu@2 {
> +			device_type = "cpu";
> +			compatible = "snps,archs38";
> +			reg = <2>;
> +			clocks = <&core_clk>;
> +		};
> +
> +		cpu@3 {
> +			device_type = "cpu";
> +			compatible = "snps,archs38";
> +			reg = <3>;
> +			clocks = <&core_clk>;
> +		};
> +

Move all the below to root level and out of the cpus node.

> +		core_intc: archs-intc@cpu {

cpu-interrupt-controller

> +			compatible = "snps,archs-intc";
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +		};
> +
> +		idu_intc: idu-interrupt-controller {
> +			compatible = "snps,archs-idu-intc";
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +			interrupt-parent = <&core_intc>;
> +		};
> +
> +		arcpct0: pct {
> +			compatible = "snps,archs-pct";
> +		};
> +
> +		/* TIMER0 with interrupt for clockevent */
> +		timer0 {

s/timer0/timer/

> +			compatible = "snps,arc-timer";
> +			interrupts = <16>;
> +			interrupt-parent = <&core_intc>;
> +			clocks = <&core_clk>;
> +		};
> +
> +		/* 64-bit Global Free Running Counter */
> +		gfrc {
> +			compatible = "snps,archs-timer-gfrc";
> +			clocks = <&core_clk>;
> +		};
> +	};
> +
> +	core_clk: core-clk {
> +		#clock-cells = <0>;
> +		compatible = "fixed-clock";
> +		clock-frequency = <1000000000>;
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		interrupt-parent = <&idu_intc>;
> +
> +		ranges = <0x00000000 0xf0000000 0x10000000>;
> +
> +		serial: dw-apb-uart@5000 {

serial@5000

> +			compatible = "snps,dw-apb-uart";
> +			reg = <0x5000 0x100>;
> +			clock-frequency = <33330000>;
> +			interrupts = <6>;
> +			baud = <115200>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +		};
> +
> +		gmacclk: gmacclk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <400000000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		mmcclk_ciu: mmcclk-ciu {
> +			compatible = "fixed-clock";
> +			clock-frequency = <100000000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		mmcclk_biu: mmcclk-biu {
> +			compatible = "fixed-clock";
> +			clock-frequency = <400000000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		ethernet@8000 {
> +			#interrupt-cells = <1>;
> +			compatible = "snps,dwmac";
> +			reg = <0x8000 0x2000>;
> +			interrupts = <10>;
> +			interrupt-names = "macirq";
> +			phy-mode = "rgmii";
> +			snps,pbl = <32>;
> +			clocks = <&gmacclk>;
> +			clock-names = "stmmaceth";
> +			phy-handle = <&phy0>;
> +
> +			mdio {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				compatible = "snps,dwmac-mdio";
> +				phy0: ethernet-phy@0 {
> +					reg = <0>;
> +					ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> +					ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> +					ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +				};
> +			};
> +		};
> +
> +		ohci@60000 {
> +			compatible = "generic-ohci";

Still, these need to be more specific.

> +			reg = <0x60000 0x100>;
> +			interrupts = <15>;
> +		};
> +
> +		ehci@40000 {
> +			compatible = "generic-ehci";
> +			reg = <0x40000 0x100>;
> +			interrupts = <15>;
> +		};
> +
> +		mmc@a000 {
> +			compatible = "altr,socfpga-dw-mshc";
> +			reg = <0xa000 0x400>;
> +			num-slots = <1>;
> +			fifo-depth = <16>;
> +			card-detect-delay = <200>;
> +			clocks = <&mmcclk_biu>, <&mmcclk_ciu>;
> +			clock-names = "biu", "ciu";
> +			interrupts = <12>;
> +			bus-width = <4>;
> +		};
> +	};
> +
> +	memory@80000000 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		device_type = "memory";
> +		reg = <0x80000000 0x40000000>;  /* 1 GiB */
> +	};
> +};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
