From: William Wu <william.wu@rock-chips.com>
Subject: [PATCH v5 5/5] usb: dwc3: rockchip: add devicetree bindings documentation
Date: Thu, 30 Jun 2016 19:16:40 +0800
Message-ID: <1467285400-25450-1-git-send-email-william.wu@rock-chips.com>
References: <1467285176-25222-1-git-send-email-william.wu@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467285176-25222-1-git-send-email-william.wu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, balbi@kernel.org, heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, briannorris@google.com, dianders@google.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, frank.wang@rock-chips.com, eddie.cai@rock-chips.com, John.Youn@synopsys.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, sergei.shtylyov@cogentembedded.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, William Wu <william.wu@rock-chips.com>
List-Id: devicetree@vger.kernel.org

This patch adds the devicetree documentation required for Rockchip
USB3.0 core wrapper consisting of USB3.0 IP from Synopsys.

It supports DRD mode, and could operate in device mode (SS, HS, FS)
and host mode (SS, HS, FS, LS).

Signed-off-by: William Wu <william.wu@rock-chips.com>
---
Changes in v5:
- rename clock-names, and remove unnecessary clocks (Heiko)

Changes in v4:
- modify commit log, and add phy documentation location (Sergei)

Changes in v3:
- add dwc3 address (balbi)

Changes in v2:
- add rockchip,dwc3.txt to Documentation/devicetree/bindings/ (balbi, Brian)

 .../devicetree/bindings/usb/rockchip,dwc3.txt      | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/rockchip,dwc3.txt

diff --git a/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt b/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt
new file mode 100644
index 0000000..9c85e19
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt
@@ -0,0 +1,40 @@
+Rockchip SuperSpeed DWC3 USB SoC controller
+
+Required properties:
+- compatible:	should contain "rockchip,rk3399-dwc3" for rk3399 SoC
+- clocks:	A list of phandle + clock-specifier pairs for the
+		clocks listed in clock-names
+- clock-names:	Should contain the following:
+  "ref_clk"	Controller reference clk, have to be 24 MHz
+  "suspend_clk"	Controller suspend clk, have to be 24 MHz or 32 KHz
+  "bus_clk_otg0"Master/Core clock, have to be >= 62.5 MHz for SS
+		operation and >= 60MHz for HS operation
+  "grf_clk"	Controller grf clk
+
+Required child node:
+A child node must exist to represent the core DWC3 IP block. The name of
+the node is not important. The content of the node is defined in dwc3.txt.
+
+Phy documentation is provided in the following places:
+Documentation/devicetree/bindings/phy/rockchip,dwc3-usb-phy.txt
+
+Example device nodes:
+
+	usbdrd3_0: usb@fe800000 {
+		compatible = "rockchip,rk3399-dwc3";
+		clocks = <&cru SCLK_USB3OTG0_REF>, <&cru SCLK_USB3OTG0_SUSPEND>,
+			 <&cru ACLK_USB3OTG0>, <&cru ACLK_USB3_GRF>;
+		clock-names = "ref_clk", "suspend_clk",
+			      "bus_clk_otg0", "grf_clk";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		status = "disabled";
+		usbdrd_dwc3_0: dwc3@fe800000 {
+			compatible = "snps,dwc3";
+			reg = <0x0 0xfe800000 0x0 0x100000>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+			dr_mode = "otg";
+			status = "disabled";
+		};
+	};
-- 
1.9.1
