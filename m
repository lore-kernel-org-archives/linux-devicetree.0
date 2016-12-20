From: Nicolas Saenz Julienne <nicolas.saenz@prodys.net>
Subject: [PATCH v4 2/2] dt-bindings: power: add bindings for sbs-charger
Date: Tue, 20 Dec 2016 16:31:14 +0100
Message-ID: <1482247874-28713-3-git-send-email-nicolas.saenz@prodys.net>
References: <1482247874-28713-1-git-send-email-nicolas.saenz@prodys.net>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1482247874-28713-1-git-send-email-nicolas.saenz@prodys.net>
Sender: linux-pm-owner@vger.kernel.org
To: sre@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, nicolas.saenz@prodys.net
List-Id: devicetree@vger.kernel.org

Adds device tree documentation for SBS charger compilant devices as defined
here: http://sbs-forum.org/specs/sbc110.pdf

Signed-off-by: Nicolas Saenz Julienne <nicolas.saenz@prodys.net>
---
v3 -> v4:
- use part-number/fallback compatible string structure

v2 -> v3:
- add part number as compatible
 .../bindings/power/supply/sbs_sbs-charger.txt      | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/sbs_sbs-charger.txt

diff --git a/Documentation/devicetree/bindings/power/supply/sbs_sbs-charger.txt b/Documentation/devicetree/bindings/power/supply/sbs_sbs-charger.txt
new file mode 100644
index 0000000..a371962
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/sbs_sbs-charger.txt
@@ -0,0 +1,23 @@
+SBS sbs-charger
+~~~~~~~~~~
+
+Required properties:
+ - compatible: "<vendor>,<part-number>", "sbs,sbs-charger" as fallback. The part
+     number compatible string might be used in order to take care of vendor
+     specific registers.
+
+Optional properties:
+- interrupt-parent: Should be the phandle for the interrupt controller. Use in
+    conjunction with "interrupts".
+- interrupts: Interrupt mapping for GPIO IRQ. Use in conjunction with
+    "interrupt-parent". If an interrupt is not provided the driver will switch
+    automatically to polling.
+
+Example:
+
+	ltc4100@9 {
+		compatible = "lltc,ltc4100", "sbs,sbs-charger";
+		reg = <0x9>;
+		interrupt-parent = <&gpio6>;
+		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
+	};
-- 
2.7.4

