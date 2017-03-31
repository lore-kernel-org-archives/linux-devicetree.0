From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/3] dt-bindings: arm: amlogic: Add SoC information bindings
Date: Fri, 31 Mar 2017 10:47:58 +0200
Message-ID: <1490950079-10145-3-git-send-email-narmstrong@baylibre.com>
References: <1490950079-10145-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1490950079-10145-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: khilman@baylibre.com, carlo@caione.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add bindings for the SoC information register of the Amlogic SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.txt | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index bfd5b55..b850985 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -52,3 +52,23 @@ Board compatible values:
   - "amlogic,q201" (Meson gxm s912)
   - "nexbox,a95x" (Meson gxbb or Meson gxl s905x)
   - "nexbox,a1" (Meson gxm s912)
+
+Amlogic Meson GX SoCs Information
+----------------------------------
+
+The Meson SoCs have a Product Register that allows to retrieve SoC type,
+package and revision information. If present, a device node for this register
+should be added.
+
+Required properties:
+  - compatible: For Meson GX SoCs, must be "amlogic,meson-gx-socinfo".
+  - reg: Base address and length of the register block.
+
+Examples
+--------
+
+	chipid@220 {
+		compatible = "amlogic,meson-gx-socinfo";
+		reg = <0x0 0x00220 0x0 0x4>;
+	};
+
-- 
1.9.1
