From: John Crispin <john@phrozen.org>
Subject: [PATCH 1/3] dt-bindings: phy-qcom-ipq4019-usb: add binding document
Date: Wed, 25 Jul 2018 07:40:57 +0200
Message-ID: <20180725054059.19506-1-john@phrozen.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alban Bedel <albeu@free.fr>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philippe Ombredanne <pombredanne@nexb.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, John Crispin <john@phrozen.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds the binding documentation for the HS/SS USB PHY found
inside Qualcom Dakota SoCs.

Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: John Crispin <john@phrozen.org>
---
 .../bindings/phy/phy-qcom-ipq4019-usb.txt           | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-qcom-ipq4019-usb.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-qcom-ipq4019-usb.txt b/Documentation/devicetree/bindings/phy/phy-qcom-ipq4019-usb.txt
new file mode 100644
index 000000000000..362877fcafed
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-qcom-ipq4019-usb.txt
@@ -0,0 +1,21 @@
+Qualcom Dakota HS/SS USB PHY
+
+Required properties:
+ - compatible: "qcom,usb-ss-ipq4019-phy",
+	       "qcom,usb-hs-ipq4019-phy"
+ - reg: offset and length of the registers
+ - #phy-cells: should be 0
+ - resets: the reset controllers as listed below
+ - reset-names: the names of the reset controllers
+	"por_rst" - the POR reset line for SS and HS phys
+	"srif_rst" - the SRIF reset line for HS phys
+Example:
+
+hsphy@a8000 {
+	compatible = "qcom,usb-hs-ipq4019-phy";
+	phy-cells = <0>;
+	reg = <0xa8000 0x40>;
+	resets = <&gcc USB2_HSPHY_POR_ARES>,
+		 <&gcc USB2_HSPHY_S_ARES>;
+	reset-names = "por_rst", "srif_rst";
+};
-- 
2.11.0
