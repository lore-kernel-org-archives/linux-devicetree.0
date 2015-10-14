From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 2/3] regulator: arizona: Add regulator specific device tree binding document
Date: Wed, 14 Oct 2015 15:12:23 +0100
Message-ID: <1444831944-4655-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1444831944-4655-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444831944-4655-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, lee.jones@linaro.org, cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 .../bindings/regulator/arizona-regulator.txt       |   34 ++++++++++++++++++++
 MAINTAINERS                                        |    1 +
 2 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/arizona-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/arizona-regulator.txt b/Documentation/devicetree/bindings/regulator/arizona-regulator.txt
new file mode 100644
index 0000000..25bb7f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/arizona-regulator.txt
@@ -0,0 +1,34 @@
+Cirrus Logic Arizona class audio SoCs
+
+These devices are audio SoCs with extensive digital capabilities and a range
+of analogue I/O.
+
+This document lists regulator specific bindings, see the primary binding
+document:
+  ../mfd/arizona.txt
+
+Required properties:
+
+  - AVDD-supply, DBVDD1-supply, CPVDD-supply : Power supplies for the device,
+    as covered in regulator.txt
+
+  - DBVDD2-supply, DBVDD3-supply : Additional databus power supplies (wm5102,
+    wm5110, wm8280, wm8998, wm1814)
+
+  - SPKVDDL-supply, SPKVDDR-supply : Speaker driver power supplies (wm5102,
+    wm5110, wm8280, wm8998, wm1814)
+
+  - SPKVDD-supply : Speaker driver power supply (wm8997)
+
+Optional properties:
+  - wlf,ldoena : GPIO specifier for the GPIO controlling LDOENA
+
+  - DCVDD-supply, MICVDD-supply : Power supplies, only need to be specified if
+    they are being externally supplied. As covered in
+    Documentation/devicetree/bindings/regulator/regulator.txt
+
+Optional subnodes:
+  - ldo1 : Initial data for the LDO1 regulator, as covered in
+    Documentation/devicetree/bindings/regulator/regulator.txt
+  - micvdd : Initial data for the MICVDD regulator, as covered in
+    Documentation/devicetree/bindings/regulator/regulator.txt
diff --git a/MAINTAINERS b/MAINTAINERS
index 08c804a..f353491 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11394,6 +11394,7 @@ W:	https://github.com/CirrusLogic/linux-drivers/wiki
 S:	Supported
 F:	Documentation/hwmon/wm83??
 F:	Documentation/devicetree/bindings/extcon/extcon-arizona.txt
+F:	Documentation/devicetree/bindings/regulator/arizona-regulator.txt
 F:	arch/arm/mach-s3c64xx/mach-crag6410*
 F:	drivers/clk/clk-wm83*.c
 F:	drivers/extcon/extcon-arizona.c
-- 
1.7.2.5
