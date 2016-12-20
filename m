From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH v3 1/4] dt-bindings: phy: Add support for QUSB2 phy
Date: Tue, 20 Dec 2016 22:33:48 +0530
Message-ID: <1482253431-23160-2-git-send-email-vivek.gautam@codeaurora.org>
References: <1482253431-23160-1-git-send-email-vivek.gautam@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1482253431-23160-1-git-send-email-vivek.gautam@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robh+dt@kernel.org, kishon@ti.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Qualcomm chipsets have QUSB2 phy controller that provides
HighSpeed functionality for DWC3 controller.
Adding dt binding information for the same.

Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
---

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

 .../devicetree/bindings/phy/qcom-qusb2-phy.txt     | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
new file mode 100644
index 000000000000..594f2dcd12dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
@@ -0,0 +1,53 @@
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
+ - resets: a list of phandles and reset controller specifier pairs,
+	   one for each entry in reset-names.
+ - reset-names: must be "phy" for reset of phy block.
+
+Optional properties:
+ - nvmem-cells: a list of phandles to nvmem cells that contain fused
+		tuning parameters for qusb2 phy, one for each entry
+		in nvmem-cell-names.
+ - nvmem-cell-names: must be "tune2_hstx_trim" for cell containing
+		     HS Tx trim value.
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
+		reset-names = "phy";
+
+		nvmem-cells = <&qusb2p_hstx_trim>;
+		nvmem-cell-names = "tune2_hstx_trim";
+        };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
