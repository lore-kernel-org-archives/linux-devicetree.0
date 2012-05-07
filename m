From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V1] regulator: fixed: dt: add property for gpio open drain flag
Date: Mon,  7 May 2012 15:58:19 +0530
Message-ID: <1336386499-20408-1-git-send-email-ldewangan@nvidia.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: broonie@opensource.wolfsonmicro.com, lrg@ti.com, grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Add property for the gpio flag open drain when registering
fixed regulator.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 .../bindings/regulator/fixed-regulator.txt         |    5 ++++-
 drivers/regulator/fixed.c                          |    3 +++
 2 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/fixed-regulator.txt b/Documentation/devicetree/bindings/regulator/fixed-regulator.txt
index 9cf57fd..2f5b6b1 100644
--- a/Documentation/devicetree/bindings/regulator/fixed-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/fixed-regulator.txt
@@ -8,6 +8,8 @@ Optional properties:
 - startup-delay-us: startup time in microseconds
 - enable-active-high: Polarity of GPIO is Active high
 If this property is missing, the default assumed is Active low.
+- gpio-open-drain: GPIO is open drain type.
+  If this property is missing then default assumption is false.
 
 Any property defined as part of the core regulator
 binding, defined in regulator.txt, can also be used.
@@ -25,5 +27,6 @@ Example:
 		gpio = <&gpio1 16 0>;
 		startup-delay-us = <70000>;
 		enable-active-high;
-		regulator-boot-on
+		regulator-boot-on;
+		gpio-open-drain;
 	};
diff --git a/drivers/regulator/fixed.c b/drivers/regulator/fixed.c
index bd437c1..f09fe7b 100644
--- a/drivers/regulator/fixed.c
+++ b/drivers/regulator/fixed.c
@@ -90,6 +90,9 @@ of_get_fixed_voltage_config(struct device *dev)
 	if (of_find_property(np, "enable-active-high", NULL))
 		config->enable_high = true;
 
+	if (of_find_property(np, "gpio-open-drain", NULL))
+		config->gpio_is_open_drain = true;
+
 	return config;
 }
 
-- 
1.7.1.1

