From: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v6 5/5] usb: dwc3: rockchip: add devicetree bindings documentation
Date: Thu,  7 Jul 2016 10:58:44 +0800
Message-ID: <1467860324-15341-1-git-send-email-william.wu@rock-chips.com>
References: <1467860066-15142-1-git-send-email-william.wu@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467860066-15142-1-git-send-email-william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds the devicetree documentation required for Rockchip
USB3.0 core wrapper consisting of USB3.0 IP from Synopsys.

It supports DRD mode, and could operate in device mode (SS, HS, FS)
and host mode (SS, HS, FS, LS).

Signed-off-by: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
Changes in v6:
- rename bus_clk, and add usbdrd3_1 node as an example (Heiko)

Changes in v5:
- rename clock-names, and remove unnecessary clocks (Heiko)

Changes in v4:
- modify commit log, and add phy documentation location (Sergei)

Changes in v3:
- add dwc3 address (balbi)

Changes in v2:
- add rockchip,dwc3.txt to Documentation/devicetree/bindings/ (balbi, Brian)

 .../devicetree/bindings/usb/rockchip,dwc3.txt      | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/rockchip,dwc3.txt

diff --git a/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt b/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt
new file mode 100644
index 0000000..0536a93
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt
@@ -0,0 +1,59 @@
+Rockchip SuperSpeed DWC3 USB SoC controller
+
+Required properties:
+- compatible:	should contain "rockchip,rk3399-dwc3" for rk3399 SoC
+- clocks:	A list of phandle + clock-specifier pairs for the
+		clocks listed in clock-names
+- clock-names:	Should contain the following:
+  "ref_clk"	Controller reference clk, have to be 24 MHz
+  "suspend_clk"	Controller suspend clk, have to be 24 MHz or 32 KHz
+  "bus_clk"	Master/Core clock, have to be >= 62.5 MHz for SS
+		operation and >= 30MHz for HS operation
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
+			      "bus_clk", "grf_clk";
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
+
+	usbdrd3_1: usb@fe900000 {
+		compatible = "rockchip,rk3399-dwc3";
+		clocks = <&cru SCLK_USB3OTG1_REF>, <&cru SCLK_USB3OTG1_SUSPEND>,
+			 <&cru ACLK_USB3OTG1>, <&cru ACLK_USB3_GRF>;
+		clock-names = "ref_clk", "suspend_clk",
+			      "bus_clk", "grf_clk";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		status = "disabled";
+		usbdrd_dwc3_1: dwc3@fe900000 {
+			compatible = "snps,dwc3";
+			reg = <0x0 0xfe900000 0x0 0x100000>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			dr_mode = "otg";
+			status = "disabled";
+		};
+	};
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
