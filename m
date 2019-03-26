Return-Path: <SRS0=+QYM=R5=analog.com=Michael.Hennerich@kernel.org>
From: <michael.hennerich@analog.com>
Subject: [PATCH] power: supply: ltc3651-charger.c: Fix typo in device name
Date: Tue, 26 Mar 2019 14:57:15 +0100
Message-ID: <1553608635-29376-1-git-send-email-michael.hennerich@analog.com>
MIME-Version: 1.0
Content-Type: text/plain
To: mike.looijmans@topic.nl, sre@kernel.org, robh+dt@kernel.org
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, robin.getz@analog.com, Michael Hennerich <michael.hennerich@analog.com>
List-ID: <devicetree@vger.kernel.org>

From: Michael Hennerich <michael.hennerich@analog.com>

There never was a device called LTC3651, it always was just LT3651.
This circumstance makes it pretty difficult to identify what this
driver is meant to control. This patch is a minimal invasive attempt
to fix this issue without affecting existing systems.


Signed-off-by: Michael Hennerich <michael.hennerich@analog.com>
---
 .../devicetree/bindings/power/supply/ltc3651-charger.txt         | 8 +++++---
 drivers/power/supply/Kconfig                                     | 6 +++---
 drivers/power/supply/ltc3651-charger.c                           | 9 +++------
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/supply/ltc3651-charger.txt b/Documentation/devicetree/bindings/power/supply/ltc3651-charger.txt
index 71f2840..f012449 100644
--- a/Documentation/devicetree/bindings/power/supply/ltc3651-charger.txt
+++ b/Documentation/devicetree/bindings/power/supply/ltc3651-charger.txt
@@ -1,7 +1,9 @@
-ltc3651-charger
+Analog Devices LT3651 Charger Power Supply bindings: ltc3651-charger
 
 Required properties:
- - compatible: "lltc,ltc3651-charger"
+- compatible: Should contain one of the following:
+ * "lltc,ltc3651-charger",
+ * "lltc,lt3651-charger"
  - lltc,acpr-gpios: Connect to ACPR output. See remark below.
 
 Optional properties:
@@ -20,7 +22,7 @@ attributes to detect changes.
 Example:
 
 	charger: battery-charger {
-		compatible = "lltc,ltc3651-charger";
+		compatible = "lltc,lt3651-charger";
 		lltc,acpr-gpios = <&gpio0 68 GPIO_ACTIVE_LOW>;
 		lltc,fault-gpios = <&gpio0 64 GPIO_ACTIVE_LOW>;
 		lltc,chrg-gpios = <&gpio0 63 GPIO_ACTIVE_LOW>;
diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
index e901b9879..6816a86 100644
--- a/drivers/power/supply/Kconfig
+++ b/drivers/power/supply/Kconfig
@@ -476,11 +476,11 @@ config CHARGER_MANAGER
           with help of suspend_again support.
 
 config CHARGER_LTC3651
-	tristate "LTC3651 charger"
+	tristate "Analog Devices LT3651 charger"
 	depends on GPIOLIB
 	help
-	  Say Y to include support for the LTC3651 battery charger which reports
-	  its status via GPIO lines.
+	  Say Y to include support for the Analog Devices (Linear Technology)
+	  LT3651 battery charger which reports its status via GPIO lines.
 
 config CHARGER_MAX14577
 	tristate "Maxim MAX14577/77836 battery charger driver"
diff --git a/drivers/power/supply/ltc3651-charger.c b/drivers/power/supply/ltc3651-charger.c
index eea63ff..07ed537 100644
--- a/drivers/power/supply/ltc3651-charger.c
+++ b/drivers/power/supply/ltc3651-charger.c
@@ -1,11 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
+ *  Driver for Analog Devices (Linear Technology) LT3651 charger IC.
  *  Copyright (C) 2017, Topic Embedded Products
- *  Driver for LTC3651 charger IC.
- *
- *  This program is free software; you can redistribute it and/or modify it
- *  under  the terms of the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the License, or (at your
- *  option) any later version.
  */
 
 #include <linux/device.h>
@@ -190,6 +186,7 @@ static int ltc3651_charger_probe(struct platform_device *pdev)
 
 static const struct of_device_id ltc3651_charger_match[] = {
 	{ .compatible = "lltc,ltc3651-charger" },
+	{ .compatible = "lltc,lt3651-charger" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ltc3651_charger_match);
-- 
2.7.4
