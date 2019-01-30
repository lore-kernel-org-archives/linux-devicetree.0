From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: Add Qualcomm USB SuperSpeed PHY bindings
Date: Wed, 30 Jan 2019 19:50:30 +0100
Message-ID: <20190130185031.24798-2-jorge.ramirez-ortiz@linaro.org>
References: <20190130185031.24798-1-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190130185031.24798-1-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org, gregkh@linuxfoundation.org, mark.rutland@arm.com, kishon@ti.com, jackp@codeaurora.org, andy.gross@linaro.org, swboyd@chromium.org
Cc: shawn.guo@linaro.org, vkoul@kernel.org, khasim.mohammed@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Binding description for Qualcomm's 1.0.0 SuperSpeed phy controller 
embedded in QCS404.

Based on Sriharsha Allenki's <sallenki@codeaurora.org> original
definitions.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 .../bindings/usb/qcom,usb-ssphy.txt           | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,usb-ssphy.txt

diff --git a/Documentation/devicetree/bindings/usb/qcom,usb-ssphy.txt b/Documentation/devicetree/bindings/usb/qcom,usb-ssphy.txt
new file mode 100644
index 000000000000..83748a07d665
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,usb-ssphy.txt
@@ -0,0 +1,74 @@
+Qualcomm Synopsys 1.0.0 SS phy controller
+===========================================
+
+Qualcomm 1.0.0 SS phy controller supports SuperSpeed USB connectivity on
+some Qualcomm platforms.
+
+Required properties:
+
+- compatible:
+    Value type: <string>
+    Definition: Should contain "qcom,usb-ssphy".
+
+- reg:
+    Value type: <prop-encoded-array>
+    Definition: USB PHY base address and length of the register map.
+
+- #phy-cells:
+    Value type: <u32>
+    Definition: Should be 0. See phy/phy-bindings.txt for details.
+
+- clocks:
+    Value type: <prop-encoded-array>
+    Definition: See clock-bindings.txt section "consumers". List of
+		 three clock specifiers for reference, phy core and
+		 pipe clocks.
+
+- clock-names:
+    Value type: <string>
+    Definition: Names of the clocks in 1-1 correspondence with the "clocks"
+		 property. Must contain "ref", "phy" and "pipe".
+
+- vdd-supply:
+    Value type: <phandle>
+    Definition: phandle to the regulator VDD supply node.
+
+- vdda1p8-supply:
+    Value type: <phandle>
+    Definition: phandle to the regulator 1.8V supply node.
+
+
+Optional child nodes:
+
+- vbus-supply:
+    Value type: <phandle>
+    Definition: phandle to the VBUS supply node.
+
+- resets:
+    Value type: <prop-encoded-array>
+    Definition: See reset.txt section "consumers". PHY reset specifiers
+		 for phy core and COR resets.
+
+- reset-names:
+    Value type: <string>
+    Definition: Names of the resets in 1-1 correspondence with the "resets"
+		 property. Must contain "com" and "phy" if the property is
+		 specified.
+
+Example:
+
+usb3_phy: phy@78000 {
+	compatible = "qcom,usb-ssphy";
+	reg = <0x78000 0x400>;
+	#phy-cells = <0>;
+	clocks = <&rpmcc RPM_SMD_LN_BB_CLK>,
+		 <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
+		 <&gcc GCC_USB3_PHY_PIPE_CLK>;
+	clock-names = "ref", "phy", "pipe";
+	resets = <&gcc GCC_USB3_PHY_BCR>,
+		 <&gcc GCC_USB3PHY_PHY_BCR>;
+	reset-names = "com", "phy";
+	vdd-supply = <&vreg_l3_1p05>;
+	vdda1p8-supply = <&vreg_l5_1p8>;
+	vbus-supply = <&usb3_vbus_reg>;
+};
-- 
2.20.1
