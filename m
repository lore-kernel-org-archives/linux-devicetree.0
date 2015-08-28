From: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [RFC PATCH 5/5] Documentation: dt-bindings: phy: add YAML TI PHY binding
Date: Fri, 28 Aug 2015 01:23:53 -0400
Message-ID: <1440739433-6799-6-git-send-email-mporter@konsulko.com>
References: <1440739433-6799-1-git-send-email-mporter@konsulko.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440739433-6799-1-git-send-email-mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Convert the ti-phy.txt binding to standard YAML DT binding
format. This binding references the YAML generic PHY binding.

Signed-off-by: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/phy/ti-phy.yaml | 166 ++++++++++++++++++++++
 1 file changed, 166 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/ti-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/ti-phy.yaml b/Documentation/devicetree/bindings/phy/ti-phy.yaml
new file mode 100644
index 0000000..ec93501
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/ti-phy.yaml
@@ -0,0 +1,166 @@
+%YAML 1.2
+---
+id: omap-control-phy
+
+title: OMAP Control PHY
+
+compatible:
+  - name: "ti,control-phy-otghs"
+    description: if it has otghs_control mailbox register as on OMAP4.
+  - name: "ti,control-phy-usb2"
+    description: if it has Power down bit in control_dev_conf register
+                 e.g. USB2_PHY on OMAP5.
+  - name: "ti,control-phy-pipe3"
+    description: if it has DPLL and individual Rx & Tx power control
+                 e.g. USB3 PHY and SATA PHY on OMAP5.
+  - name: "ti,control-phy-pcie"
+    description: for pcie to support external clock for pcie and to
+                 set PCS delay value. e.g. PCIE PHY in DRA7x
+  - name: "ti,control-phy-usb2-dra7"
+    description: if it has power down register like USB2 PHY on DRA7
+                 DRA7 platform.
+  - name: "ti,control-phy-usb2-am437"
+    description: if it has power down register like USB2 PHY on AM437
+                 platform.
+required:
+  - name: "reg"
+    description: register ranges as listed in the reg-names property
+  - name: "reg-names"
+    description: >
+                 "otghs_control" for control-phy-otghs "power",
+                 "pcie_pcs" and "control_sma" for control-phy-pcie
+                 "power" for all other types
+
+example:
+  - dts: |
+      omap_control_usb: omap-control-usb@4a002300 {
+              compatible = "ti,control-phy-otghs";
+              reg = <0x4a00233c 0x4>;
+              reg-names = "otghs_control";
+      };
+...
+
+---
+id: omap-usb2-phy
+
+title: OMAP USB2 PHY
+
+compatible:
+  - name: "ti,omap-usb2"
+
+required:
+  - name: "reg"
+    description: >
+                 Address and length of the register set for the device.
+  - name: "#phy-cells"
+    description: >
+                 determine the number of cells that should be given in
+                 the phandle while referencing this phy.
+    reference: phy-device
+  - name: "clocks"
+    description: >
+                 a list of phandles and clock-specifier pairs, one for
+                 each entry in clock-names.
+    reference: clock-consumer
+  - name: "clock-names"
+    description: >
+                 should include:
+                 * "wkupclk" - wakeup clock.
+                 * "refclk" - reference clock (optional).
+    reference: clock-consumer
+
+optional:
+  - name: "ctrl-module"
+    description: >
+                 phandle of the control module used by PHY driver to
+                 power on the PHY.
+
+example:
+  - dts: |
+      usb2phy@4a0ad080 {
+                compatible = "ti,omap-usb2";
+                reg = <0x4a0ad080 0x58>;
+                ctrl-module = <&omap_control_usb>;
+                #phy-cells = <0>;
+                clocks = <&usb_phy_cm_clk32k>, <&usb_otg_ss_refclk960m>;
+                clock-names = "wkupclk", "refclk";
+      };
+    description: >
+                 This is usually a subnode of ocp2scp to which it is
+                 connected.
+...
+
+---
+id: ti-pipe3-phy
+
+title: TI Pipe3 PHY
+
+compatible:
+  - name: "ti,phy-usb3"
+  - name: "ti,phy-pipe3-sata"
+  - name: "ti,phy-pipe3-pcie"
+  - deprecated: "ti,omap-usb3"
+
+required:
+  - name: "reg"
+    description: >
+                 Address and length of the register set for the device.
+  - name: "reg-names"
+    description: >
+                 The names of the register addresses corresponding to
+                 the registers filled in "reg".
+  - name: "#phy-cells"
+    description: >
+                 determine the number of cells that should be given in
+                 the phandle while referencing this phy.
+    reference: phy-device
+  - name: "clocks"
+    description: >
+                 a list of phandles and clock-specifier pairs, one for
+                 each entry in clock-names.
+    reference: clock-consumer
+  - name: "clock-names"
+    description: >
+                 should include:
+                 * "wkupclk" - wakeup clock.
+                 * "sysclk" - system clock.
+                 * "refclk" - reference clock.
+                 * "dpll_ref" - external dpll ref clk
+                 * "dpll_ref_m2" - external dpll ref clk
+                 * "phy-div" - divider for apll
+                 * "div-clk" - apll clock
+    reference: clock-consumer
+
+optional:
+  - name: "ctrl-module"
+    description: >
+                 phandle of the control module used by PHY driver to
+                 power on the PHY.
+  - name: "id"
+    description: >
+                 If there are multiple instance of the same type, in
+                 order to differentiate between each instance "id"
+                 can be used (e.g., multi-lane PCIe PHY). If "id" is
+                 not provided, it is set to default value of '1'.
+
+example:
+  - dts: |
+      usb3phy@4a084400 {
+              compatible = "ti,phy-usb3";
+              reg = <0x4a084400 0x80>,
+                    <0x4a084800 0x64>,
+                    <0x4a084c00 0x40>;
+              reg-names = "phy_rx", "phy_tx", "pll_ctrl";
+              ctrl-module = <&omap_control_usb>;
+              #phy-cells = <0>;
+              clocks = <&usb_phy_cm_clk32k>,
+                       <&sys_clkin>,
+                       <&usb_otg_ss_refclk960m>;
+              clock-names = "wkupclk",
+                            "sysclk",
+                            "refclk";
+      };
+    description: >
+                 This is usually a subnode of ocp2scp to which it is
+                 connected.
+...
-- 
2.1.4
