From: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Subject: [PATCH 2/3] dt-bindings: net: mt76: update binding for mt7603 driver
Date: Wed, 30 Jan 2019 15:07:55 +0100
Message-ID: <20190130140756.91317-2-nbd@nbd.name>
References: <20190130140756.91317-1-nbd@nbd.name>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20190130140756.91317-1-nbd-Vt+b4OUoWG0@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In addition to MT7603E PCI devices, the driver supports the WLAN core on
MT7628/MT7688, which needs to be defined in DT.

Signed-off-by: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
---
 .../bindings/net/wireless/mediatek,mt76.txt   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt
index 0c17a0ec9b7b..7b9a776230c0 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt
@@ -4,6 +4,13 @@ This node provides properties for configuring the MediaTek mt76xx wireless
 device. The node is expected to be specified as a child node of the PCI
 controller to which the wireless chip is connected.
 
+Alternatively, it can specify the wireless part of the MT7628/MT7688 SoC.
+For SoC, use the compatible string "mediatek,mt7628-wmac" and the following
+properties:
+
+- reg: Address and length of the register set for the device.
+- interrupts: Main device interrupt
+
 Optional properties:
 
 - mac-address: See ethernet.txt in the parent directory
@@ -30,3 +37,15 @@ Optional nodes:
 		};
 	};
 };
+
+MT7628 example:
+
+wmac: wmac@10300000 {
+	compatible = "mediatek,mt7628-wmac";
+	reg = <0x10300000 0x100000>;
+
+	interrupt-parent = <&cpuintc>;
+	interrupts = <6>;
+
+	mediatek,mtd-eeprom = <&factory 0x0000>;
+};
-- 
2.17.0
