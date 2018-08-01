From: John Crispin <john@phrozen.org>
Subject: [PATCH V2 1/3] dt-bindings: phy-qcom-ipq4019-usb: add binding document
Date: Wed,  1 Aug 2018 12:49:39 +0200
Message-ID: <20180801104941.29432-2-john@phrozen.org>
References: <20180801104941.29432-1-john@phrozen.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180801104941.29432-1-john@phrozen.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alban Bedel <albeu@free.fr>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, John Crispin <john@phrozen.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds the binding documentation for the HS/SS USB PHY found
inside Qualcomm Dakota SoCs.

Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: John Crispin <john@phrozen.org>
---
 .../bindings/phy/phy-qcom-ipq4019-usb.txt           | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-qcom-ipq4019-usb.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-qcom-ipq4019-usb.txt b/Documentation/devicetree/bindings/phy/phy-qcom-ipq4019-usb.txt
new file mode 100644
index 000000000000..320a596c45b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-qcom-ipq4019-usb.txt
@@ -0,0 +1,21 @@
+Qualcom Dakota HS/SS USB PHY
+
+Required properties:
+ - compatible: "qcom,ipq4019-usb-ss-phy",
+	       "qcom,ipq4019-usb-hs-phy"
+ - reg: offset and length of the registers
+ - #phy-cells: should be 0
+ - resets: the reset controllers as listed below
+ - reset-names: the names of the reset controllers
+	"por" - the POR reset line for SS and HS phys
+	"srif" - the SRIF reset line for HS phys
+Example:
+
+usb-phy@a8000 {
+	compatible = "qcom,ipq4019-usb-hs-phy";
+	phy-cells = <0>;
+	reg = <0xa8000 0x40>;
+	resets = <&gcc USB2_HSPHY_POR_ARES>,
+		 <&gcc USB2_HSPHY_S_ARES>;
+	reset-names = "por", "srif";
+};
-- 
2.11.0
