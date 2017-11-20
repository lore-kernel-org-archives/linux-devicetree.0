From: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Subject: [PATCH v7 1/3] dt-bindings: net: add mt76 wireless device binding
Date: Mon, 20 Nov 2017 20:35:47 +0100
Message-ID: <20171120193549.80831-2-nbd@nbd.name>
References: <20171120193549.80831-1-nbd@nbd.name>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171120193549.80831-1-nbd-Vt+b4OUoWG0@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add documentation describing how device tree can be used to configure
wireless chips supported by the mt76 driver.

Signed-off-by: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
---
 .../bindings/net/wireless/mediatek,mt76.txt        | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt
new file mode 100644
index 000000000000..0c17a0ec9b7b
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt
@@ -0,0 +1,32 @@
+* MediaTek mt76xx devices
+
+This node provides properties for configuring the MediaTek mt76xx wireless
+device. The node is expected to be specified as a child node of the PCI
+controller to which the wireless chip is connected.
+
+Optional properties:
+
+- mac-address: See ethernet.txt in the parent directory
+- local-mac-address: See ethernet.txt in the parent directory
+- ieee80211-freq-limit: See ieee80211.txt
+- mediatek,mtd-eeprom: Specify a MTD partition + offset containing EEPROM data
+
+Optional nodes:
+- led: Properties for a connected LED
+  Optional properties:
+    - led-sources: See Documentation/devicetree/bindings/leds/common.txt
+
+&pcie {
+	pcie0 {
+		wifi@0,0 {
+			compatible = "mediatek,mt76";
+			reg = <0x0000 0 0 0 0>;
+			ieee80211-freq-limit = <5000000 6000000>;
+			mediatek,mtd-eeprom = <&factory 0x8000>;
+
+			led {
+				led-sources = <2>;
+			};
+		};
+	};
+};
-- 
2.14.2
