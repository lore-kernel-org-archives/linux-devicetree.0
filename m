From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 0/9] dt-bindings: Firmware node binding for ZynqMP core
Date: Tue, 4 Dec 2018 16:06:12 -0600
Message-ID: <20181204220612.GA640@bogus>
References: <1542412619-387-1-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1542412619-387-1-git-send-email-jollys@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jolly Shah <jolly.shah@xilinx.com>
Cc: mark.rutland@arm.com, michal.simek@xilinx.com, rajanv@xilinx.com, nava.manne@xilinx.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jolly Shah <jollys@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 16, 2018 at 03:56:50PM -0800, Jolly Shah wrote:
> Base firmware node and clock child node binding are part of mainline kernel. This patchset adds documentation to describe rest of the firmware child node bindings. 
> Complete firmware DT node example is shown below for ease of understanding:

Shouldn't there be a fpga mgr node too? Called pcap IIRC.

> 
> firmware {
> 	zynqmp_firmware: zynqmp-firmware {
> 		compatible = "xlnx,zynqmp-firmware";
> 		method = "smc";
> 		#power-domain-cells = <1>;
> 		#reset-cells = <1>;
> 
> 		zynqmp_clk: clock-controller {
> 			#clock-cells = <1>;
> 			compatible = "xlnx,zynqmp-clk";
> 			clocks = <&pss_ref_clk>, <&video_clk>, <&pss_alt_ref_clk>, <&aux_ref_clk>, <&gt_crx_ref_clk>;
> 			clock-names = "pss_ref_clk", "video_clk", "pss_alt_ref_clk","aux_ref_clk", "gt_crx_ref_clk";
> 		};
> 
> 		zynqmp_power: zynqmp-power {
> 			compatible = "xlnx,zynqmp-power";
> 			interrupts = <0 35 4>;
> 		};
> 
> 		nvmem_firmware {
> 			compatible = "xlnx,zynqmp-nvmem-fw";
> 			#address-cells = <1>;
> 			#size-cells = <1>;
> 
> 			/* Data cells */
> 			soc_revision: soc_revision {
> 				reg = <0x0 0x4>;
> 			};
> 		};
> 
> 		afi0: afi0 {
> 			compatible = "xlnx,afi-fpga";
> 			config-afi = <0 2>, <1 1>, <2 1>;
> 		};
> 
> 		qspi: spi@ff0f0000 {

Why is this under firmware node?

> 			compatible = "xlnx,zynqmp-qspi-1.0";
> 			clock-names = "ref_clk", "pclk";
> 			clocks = <&misc_clk &misc_clk>;
> 			interrupts = <0 15 4>;
> 			interrupt-parent = <&gic>;
> 			num-cs = <1>;
> 			reg = <0x0 0xff0f0000 0x1000>,<0x0 0xc0000000 0x8000000>;
> 		};
> 
> 		serdes: zynqmp_phy@fd400000 {

And this?

> 			compatible = "xlnx,zynqmp-psgtr";
> 			status = "okay";
> 			reg = <0x0 0xfd400000 0x0 0x40000>, <0x0 0xfd3d0000 0x0 0x1000>,
> 				<0x0 0xff5e0000 0x0 0x1000>;
> 			reg-names = "serdes", "siou", "lpd";
> 
> 			lane0: lane@0 {
> 				#phy-cells = <4>;
> 			};
> 			lane1: lane@1 {
> 				#phy-cells = <4>;
> 			};
> 			lane2: lane@2 {
> 				#phy-cells = <4>;
> 			};
> 			lane3: lane@3 {
> 				#phy-cells = <4>;
> 			};
> 		};
> 
> 		pinctrl_uart1_default: uart1-default {

This goes under a pinctrl node.

> 			mux {
> 				groups = "uart0_4_grp";
> 				function = "uart0";
> 			};
> 
> 			conf {
> 				groups = "uart0_4_grp";
> 				slew-rate = <SLEW_RATE_SLOW>;
> 				io-standard = <IO_STANDARD_LVCMOS18>;
> 			};
> 
> 			conf-rx {
> 				pins = "MIO18";
> 				bias-high-impedance;
> 			};
> 
> 			conf-tx {
> 				pins = "MIO19";
> 				bias-disable;
> 				schmitt-cmos = <PIN_INPUT_TYPE_CMOS>;
> 			};
> 		};
> 		zynqmp-r5-remoteproc@0 {

Wrong unit-address and this doesn't belong here.

> 			compatible = "xlnx,zynqmp-r5-remoteproc-1.0";

'remoteproc' is what the h/w block is called?

> 			reg = <0x0 0xFFE00000 0x0 0x10000>,
> 				<0x0 0xFFE20000 0x0 0x10000>,
> 				<0x0 0xff340000 0x0 0x100>;
> 			reg-names = "tcm_a", "tcm_b", "ipi";
> 			dma-ranges;
> 			core_conf = "split0";
> 			memory-region = <&rproc_0_fw_reserved>,
> 					<&rproc_0_dma_reserved>;
> 			tcm-pnode-id = <0xf>, <0x10>;
> 			rpu-pnode-id = <0x7>;
> 			interrupt-parent = <&gic>;
> 			interrupts = <0 29 4>;
> 		};
> 	};
> };
