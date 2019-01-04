From: Jolly Shah <jolly.shah@xilinx.com>
Subject: [PATCH v2 0/4] dt-bindings: Firmware node binding for ZynqMP core
Date: Fri, 4 Jan 2019 13:56:18 -0800
Message-ID: <1546638982-12954-1-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: michal.simek@xilinx.com, rajanv@xilinx.com, nava.manne@xilinx.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jolly Shah <jollys@xilinx.com>
List-Id: devicetree@vger.kernel.org

Base firmware node and clock child node binding are part of mainline kernel. This patchset adds documentation to describe rest of the firmware child node bindings. 
Complete firmware DT node example is shown below for ease of understanding:

firmware {
	zynqmp_firmware: zynqmp-firmware {
		compatible = "xlnx,zynqmp-firmware";
		method = "smc";
		#power-domain-cells = <1>;
		#reset-cells = <1>;

		zynqmp_clk: clock-controller {
			#clock-cells = <1>;
			compatible = "xlnx,zynqmp-clk";
			clocks = <&pss_ref_clk>, <&video_clk>, <&pss_alt_ref_clk>, <&aux_ref_clk>, <&gt_crx_ref_clk>;
			clock-names = "pss_ref_clk", "video_clk", "pss_alt_ref_clk","aux_ref_clk", "gt_crx_ref_clk";
		};

		zynqmp_power: zynqmp-power {
			compatible = "xlnx,zynqmp-power";
			interrupts = <0 35 4>;
		};
		
		pinctrl0: pinctrl@ff180000 {
			compatible = "xlnx,zynqmp-pinctrl";

			pinctrl_uart1_default: uart1-default {
				mux {
					groups = "uart0_4_grp";
					function = "uart0";
				};
	
				conf {
					groups = "uart0_4_grp";
					slew-rate = <SLEW_RATE_SLOW>;
					io-standard = <IO_STANDARD_LVCMOS18>;
				};
	
				conf-rx {
					pins = "MIO18";
					bias-high-impedance;
				};
	
				conf-tx {
					pins = "MIO19";
					bias-disable;
					schmitt-cmos = <PIN_INPUT_TYPE_CMOS>;
				};
			};
		};
	};
};
Nava kishore Manne (1):
  dt-bindings: reset: Add bindings for ZynqMP reset driver

Rajan Vaja (3):
  dt-bindings: power: Add ZynqMP power domain bindings
  dt-bindings: soc: Add ZynqMP PM bindings
  dt-bindings: pinctrl: Add ZynqMP pin controller bindings

 .../bindings/pinctrl/xlnx,zynqmp-pinctrl.txt       | 275 +++++++++++++++++++++
 .../bindings/power/reset/xlnx,zynqmp-power.txt     |  25 ++
 .../bindings/power/xlnx,zynqmp-genpd.txt           |  34 +++
 .../bindings/reset/xlnx,zynqmp-reset.txt           | 148 +++++++++++
 include/dt-bindings/power/xlnx-zynqmp-power.h      |  39 +++
 5 files changed, 521 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.txt
 create mode 100644 Documentation/devicetree/bindings/power/xlnx,zynqmp-genpd.txt
 create mode 100644 Documentation/devicetree/bindings/reset/xlnx,zynqmp-reset.txt
 create mode 100644 include/dt-bindings/power/xlnx-zynqmp-power.h

-- 
2.7.4
