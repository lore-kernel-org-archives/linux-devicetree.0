From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 3/4] dt-bindings: phy: add DT bindings for UniPhier USB2 PHY driver
Date: Fri, 29 Jun 2018 17:39:00 +0900
Message-ID: <1530261541-23104-4-git-send-email-hayashi.kunihiko@socionext.com>
References: <1530261541-23104-1-git-send-email-hayashi.kunihiko@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530261541-23104-1-git-send-email-hayashi.kunihiko@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
List-Id: devicetree@vger.kernel.org

Add DT bindings for PHY interface built into USB2 controller
implemented on Socionext UniPhier SoCs.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 .../devicetree/bindings/phy/uniphier-usb2-phy.txt  | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/uniphier-usb2-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/uniphier-usb2-phy.txt b/Documentation/devicetree/bindings/phy/uniphier-usb2-phy.txt
new file mode 100644
index 0000000..95ee393
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/uniphier-usb2-phy.txt
@@ -0,0 +1,45 @@
+Socionext UniPhier USB2 PHY
+
+This describes the devicetree bindings for PHY interface built into
+USB2 controller implemented on Socionext UniPhier SoCs.
+
+Pro4 SoC has both USB2 and USB3 host controllers, however, this USB3
+controller doesn't include its own High-Speed PHY. This needs to specify
+USB2 PHY instead of USB3 HS-PHY.
+
+Required properties:
+- compatible: Should contain one of the following:
+    "socionext,uniphier-pro4-usb2-phy" - for Pro4 SoC
+    "socionext,uniphier-ld11-usb2-phy" - for LD11 SoC
+
+Sub-nodes:
+Each PHY should be represented as a sub-node.
+
+Sub-nodes required properties:
+- #phy-cells: Should be 0.
+- reg: The number of the PHY.
+
+Sub-nodes optional properties:
+- phy-supply: A phandle to the regulator for USB VBUS.
+
+Refer to phy/phy-bindings.txt for the generic PHY binding properties.
+
+Example:
+	soc-glue@5f800000 {
+		...
+		usb-phy {
+			compatible = "socionext,uniphier-ld11-usb2-phy";
+			usb_phy0: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+			...
+		};
+	};
+
+	usb@5a800100 {
+		compatible = "socionext,uniphier-ehci", "generic-ehci";
+		...
+		phy-names = "usb";
+		phys = <&usb_phy0>;
+	};
-- 
2.7.4
