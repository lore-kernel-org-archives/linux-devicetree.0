From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 13/34] dt-bindings: arm: amlogic: Move 'amlogic,meson-gx-ao-secure' binding to its own file
Date: Mon,  3 Dec 2018 15:32:02 -0600
Message-ID: <20181203213223.16986-14-robh@kernel.org>
References: <20181203213223.16986-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203213223.16986-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, arm@kernel.org, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

It is best practice to have 1 binding per file, so board level bindings
should be separate for various misc SoC bindings.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Carlo Caione <carlo@caione.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/amlogic.txt       | 29 -------------------
 .../amlogic/amlogic,meson-gx-ao-secure.txt    | 28 ++++++++++++++++++
 2 files changed, 28 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index 4498292b833d..f5c8d50a3506 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -107,32 +107,3 @@ Board compatible values (alphabetically, grouped by SoC):
   - "amlogic,s400" (Meson axg a113d)
 
   - "amlogic,u200" (Meson g12a s905d2)
-
-Amlogic Meson Firmware registers Interface
-------------------------------------------
-
-The Meson SoCs have a register bank with status and data shared with the
-secure firmware.
-
-Required properties:
- - compatible: For Meson GX SoCs, must be "amlogic,meson-gx-ao-secure", "syscon"
-
-Properties should indentify components of this register interface :
-
-Meson GX SoC Information
-------------------------
-A firmware register encodes the SoC type, package and revision information on
-the Meson GX SoCs.
-If present, the following property should be added :
-
-Optional properties:
-  - amlogic,has-chip-id: If present, the interface gives the current SoC version.
-
-Example
--------
-
-ao-secure@140 {
-	compatible = "amlogic,meson-gx-ao-secure", "syscon";
-	reg = <0x0 0x140 0x0 0x140>;
-	amlogic,has-chip-id;
-};
diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
new file mode 100644
index 000000000000..c67d9f48fb91
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
@@ -0,0 +1,28 @@
+Amlogic Meson Firmware registers Interface
+------------------------------------------
+
+The Meson SoCs have a register bank with status and data shared with the
+secure firmware.
+
+Required properties:
+ - compatible: For Meson GX SoCs, must be "amlogic,meson-gx-ao-secure", "syscon"
+
+Properties should indentify components of this register interface :
+
+Meson GX SoC Information
+------------------------
+A firmware register encodes the SoC type, package and revision information on
+the Meson GX SoCs.
+If present, the following property should be added :
+
+Optional properties:
+  - amlogic,has-chip-id: If present, the interface gives the current SoC version.
+
+Example
+-------
+
+ao-secure@140 {
+	compatible = "amlogic,meson-gx-ao-secure", "syscon";
+	reg = <0x0 0x140 0x0 0x140>;
+	amlogic,has-chip-id;
+};
-- 
2.19.1
