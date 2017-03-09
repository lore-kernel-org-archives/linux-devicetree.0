From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v5 1/4] dt-bindings: phy: Add support for QUSB2 phy
Date: Thu,  9 Mar 2017 14:37:18 +0530
Message-ID: <1489050441-3240-2-git-send-email-vivek.gautam@codeaurora.org>
References: <1489050441-3240-1-git-send-email-vivek.gautam@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489050441-3240-1-git-send-email-vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Qualcomm chipsets have QUSB2 phy controller that provides
HighSpeed functionality for DWC3 controller.
Adding dt binding information for the same.

Signed-off-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---

Changes since v4:
 - None.

Changes since v3:
 - Added 'Acked-by' from Rob.
 - Removed 'reset-names' and 'nvmem-cell-names' from the bindings
   since we use only one cell.

Changes since v2:
 - Removed binding for "ref_clk_src" since we don't request this
   clock in the driver.
 - Addressed s/vdda-phy-dpdm/vdda-phy-dpdm-supply.
 - Addressed s/ref_clk/ref. Don't need to add '_clk' suffix to clock names.
 - Addressed s/tune2_hstx_trim_efuse/tune2_hstx_trim. Don't need to add
   'efuse' suffix to nvmem cell.
 - Addressed s/qusb2phy/phy for the node name.

Changes since v1:
 - New patch, forked out of the original driver patch:
   "phy: qcom-qusb2: New driver for QUSB2 PHY on Qcom chips"
 - Updated dt bindings to remove 'hstx-trim-bit-offset' and
   'hstx-trim-bit-len' bindings.

 .../devicetree/bindings/phy/qcom-qusb2-phy.txt     | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
new file mode 100644
index 000000000000..218595fe8824
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
@@ -0,0 +1,45 @@
+Qualcomm QUSB2 phy controller
+=============================
+
+QUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
+
+Required properties:
+ - compatible: compatible list, contains "qcom,msm8996-qusb2-phy".
+ - reg: offset and length of the PHY register set.
+ - #phy-cells: must be 0.
+
+ - clocks: a list of phandles and clock-specifier pairs,
+	   one for each entry in clock-names.
+ - clock-names: must be "cfg_ahb" for phy config clock,
+			"ref" for 19.2 MHz ref clk,
+			"iface" for phy interface clock (Optional).
+
+ - vdd-phy-supply: Phandle to a regulator supply to PHY core block.
+ - vdda-pll-supply: Phandle to 1.8V regulator supply to PHY refclk pll block.
+ - vdda-phy-dpdm-supply: Phandle to 3.1V regulator supply to Dp/Dm port signals.
+
+ - resets: Phandle to reset to phy block.
+
+Optional properties:
+ - nvmem-cells: Phandle to nvmem cell that contains 'HS Tx trim'
+		tuning parameter value for qusb2 phy.
+
+ - qcom,tcsr-syscon: Phandle to TCSR syscon register region.
+
+Example:
+	hsusb_phy: phy@7411000 {
+		compatible = "qcom,msm8996-qusb2-phy";
+		reg = <0x07411000 0x180>;
+		#phy-cells = <0>;
+
+		clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+			<&gcc GCC_RX1_USB2_CLKREF_CLK>,
+		clock-names = "cfg_ahb", "ref";
+
+		vdd-phy-supply = <&pm8994_s2>;
+		vdda-pll-supply = <&pm8994_l12>;
+		vdda-phy-dpdm-supply = <&pm8994_l24>;
+
+		resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+		nvmem-cells = <&qusb2p_hstx_trim>;
+        };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
