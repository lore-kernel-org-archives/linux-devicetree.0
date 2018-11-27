From: Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v5 1/2] dt-bindings: phy: Add Qualcomm Synopsys High-Speed USB PHY binding
Date: Tue, 27 Nov 2018 18:07:21 +0800
Message-ID: <20181127100722.9993-2-shawn.guo@linaro.org>
References: <20181127100722.9993-1-shawn.guo@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181127100722.9993-1-shawn.guo@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Sriharsha Allenki <sallenki@codeaurora.org>, Anu Ramanathan <anur@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Sriharsha Allenki <sallenki@codeaurora.org>

It adds bindings for Synopsys 28nm femto phy controller that supports
LS/FS/HS usb connectivity on Qualcomm chipsets.

Signed-off-by: Sriharsha Allenki <sallenki@codeaurora.org>
Signed-off-by: Anu Ramanathan <anur@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 .../phy/qcom,snps-28nm-usb-hs-phy.txt         | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,snps-28nm-usb-hs-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-28nm-usb-hs-phy.txt b/Documentation/devicetree/bindings/phy/qcom,snps-28nm-usb-hs-phy.txt
new file mode 100644
index 000000000000..301987e716fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-28nm-usb-hs-phy.txt
@@ -0,0 +1,87 @@
+Qualcomm Synopsys 28nm Femto phy controller
+===========================================
+
+Synopsys 28nm femto phy controller supports LS/FS/HS usb connectivity on
+Qualcomm chipsets.
+
+Required properties:
+
+- compatible:
+    Value type: <string>
+    Definition: Should contain "qcom,qcs404-usb-hsphy".
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
+		three clock specifiers for reference, phy core and
+		sleep clocks.
+
+- clock-names:
+    Value type: <string>
+    Definition: Names of the clocks in 1-1 correspondence with the "clocks"
+		property. Must contain "ref", "phy" and "sleep".
+
+- resets:
+    Value type: <prop-encoded-array>
+    Definition: See reset.txt section "consumers". PHY reset specifiers
+		for phy core and POR resets.
+
+- reset-names:
+    Value type: <string>
+    Definition: Names of the resets in 1-1 correspondence with the "resets"
+		property. Must contain "phy" and "por".
+
+- vdd-supply:
+    Value type: <phandle>
+    Definition: phandle to the regulator VDD supply node.
+
+- vdda1p8-supply:
+    Value type: <phandle>
+    Definition: phandle to the regulator 1.8V supply node.
+
+- vdda3p3-supply:
+    Value type: <phandle>
+    Definition: phandle to the regulator 3.3V supply node.
+
+- qcom,vdd-voltage-level:
+    Value type: <prop-array>
+    Definition: This is a list of three integer values <no min max> where
+		each value corresponding to voltage corner in uV.
+
+Optional child nodes:
+
+- The link to the USB connector should be modeled using the OF graph bindings
+  specified in bindings/graph.txt.
+
+Example:
+
+	phy@7a000 {
+		compatible = "qcom,qcs404-usb-hsphy";
+		reg = <0x7a000 0x200>;
+		#phy-cells = <0>;
+		clocks = <&rpmcc RPM_SMD_LN_BB_CLK>,
+			 <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
+			 <&gcc GCC_USB2A_PHY_SLEEP_CLK>;
+		clock-names = "ref", "phy", "sleep";
+		resets = <&gcc GCC_USB_HS_PHY_CFG_AHB_BCR>,
+			 <&gcc GCC_USB2A_PHY_BCR>;
+		reset-names = "phy", "por";
+		vdd-supply = <&vreg_l4_1p2>;
+		vdda1p8-supply = <&vreg_l5_1p8>;
+		vdda3p3-supply = <&vreg_l12_3p3>;
+		qcom,vdd-voltage-level = <0 1144000 1200000>;
+
+		port {
+			ep_usb_phy: endpoint {
+				remote-endpoint = <&ep_usb_con>;
+			};
+		};
+	};
-- 
2.18.0
