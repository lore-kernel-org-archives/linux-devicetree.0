From: Pierre-Hugues Husson <phh-8tEavu1zA38@public.gmane.org>
Subject: [PATCH 1/2] mfd: rn5t618: Add Ricoh RC5T619 PMIC support
Date: Sat,  5 Nov 2016 17:19:24 +0100
Message-ID: <20161105161925.14910-2-phh@phh.me>
References: <20161105161925.14910-1-phh@phh.me>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161105161925.14910-1-phh-8tEavu1zA38@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pierre-Hugues Husson <phh-8tEavu1zA38@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Ricoh RN5T567 is from the same family as the Ricoh RN5T618 is,
the differences are:

+ DCDC4/DCDC5
+ LDO7-10
+ Slightly different output voltage/currents
+ 32kHz Output
+ RTC
+ USB Charger detection

Signed-off-by: Pierre-Hugues Husson <phh-8tEavu1zA38@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/rn5t618.txt | 16 ++++++++++------
 drivers/mfd/Kconfig                               |  3 ++-
 drivers/mfd/rn5t618.c                             |  1 +
 include/linux/mfd/rn5t618.h                       |  9 +++++++++
 4 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/rn5t618.txt b/Documentation/devicetree/bindings/mfd/rn5t618.txt
index 9e6770b..65c2326 100644
--- a/Documentation/devicetree/bindings/mfd/rn5t618.txt
+++ b/Documentation/devicetree/bindings/mfd/rn5t618.txt
@@ -1,21 +1,25 @@
 * Ricoh RN5T567/RN5T618 PMIC
 
-Ricoh RN5T567/RN5T618 is a power management IC family which integrates
-3 to 4 step-down DCDC converters, 7 low-dropout regulators, GPIOs and
-a watchdog timer. The RN5T618 provides additionally a Li-ion battery
-charger, fuel gauge and an ADC. It can be controlled through an I2C
-interface.
+Ricoh RN5T567/RN5T618/RC5T619 is a power management IC family which
+integrates 3 to 5 step-down DCDC converters, 7 to 10 low-dropout regulators,
+GPIOs, and a watchdog timer. It can be controlled through an I2C interface.
+The RN5T618/RC5T619 provides additionally a Li-ion battery charger,
+fuel gauge, and an ADC.
+The RC5T619 additionnally includes USB charger detection and an RTC.
 
 Required properties:
  - compatible: must be one of
 		"ricoh,rn5t567"
 		"ricoh,rn5t618"
+		"ricoh,rc5t619"
  - reg: the I2C slave address of the device
 
 Sub-nodes:
  - regulators: the node is required if the regulator functionality is
    needed. The valid regulator names are: DCDC1, DCDC2, DCDC3, DCDC4
-   (RN5T567), LDO1, LDO2, LDO3, LDO4, LDO5, LDORTC1 and LDORTC2.
+   (RN5T567/RC5T619), LDO1, LDO2, LDO3, LDO4, LDO5, LDO6, LDO7, LDO8,
+   LDO9, LDO10, LDORTC1 and LDORTC2.
+   LDO7-10 are specific to RC5T619.
    The common bindings for each individual regulator can be found in:
    Documentation/devicetree/bindings/regulator/regulator.txt
 
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index c6df644..65d0a65 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -881,7 +881,8 @@ config MFD_RN5T618
 	select MFD_CORE
 	select REGMAP_I2C
 	help
-	  Say yes here to add support for the Ricoh RN5T567 or R5T618 PMIC.
+	  Say yes here to add support for the Ricoh RN5T567,
+          RN5T618, RC5T619 PMIC.
 	  This driver provides common support for accessing the device,
 	  additional drivers must be enabled in order to use the
 	  functionality of the device.
diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618.c
index 9d377d6..0b5a2a1 100644
--- a/drivers/mfd/rn5t618.c
+++ b/drivers/mfd/rn5t618.c
@@ -87,6 +87,7 @@ static int rn5t618_restart(struct notifier_block *this,
 static const struct of_device_id rn5t618_of_match[] = {
 	{ .compatible = "ricoh,rn5t567", .data = (void *)RN5T567 },
 	{ .compatible = "ricoh,rn5t618", .data = (void *)RN5T618 },
+	{ .compatible = "ricoh,rc5t619", .data = (void *)RC5T619 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rn5t618_of_match);
diff --git a/include/linux/mfd/rn5t618.h b/include/linux/mfd/rn5t618.h
index cadc654..e5a6cde 100644
--- a/include/linux/mfd/rn5t618.h
+++ b/include/linux/mfd/rn5t618.h
@@ -58,10 +58,13 @@
 #define RN5T618_DC3CTL2			0x31
 #define RN5T618_DC4CTL			0x32
 #define RN5T618_DC4CTL2			0x33
+#define RN5T618_DC5CTL			0x34
+#define RN5T618_DC5CTL2			0x35
 #define RN5T618_DC1DAC			0x36
 #define RN5T618_DC2DAC			0x37
 #define RN5T618_DC3DAC			0x38
 #define RN5T618_DC4DAC			0x39
+#define RN5T618_DC5DAC			0x3a
 #define RN5T618_DC1DAC_SLP		0x3b
 #define RN5T618_DC2DAC_SLP		0x3c
 #define RN5T618_DC3DAC_SLP		0x3d
@@ -77,6 +80,11 @@
 #define RN5T618_LDO3DAC			0x4e
 #define RN5T618_LDO4DAC			0x4f
 #define RN5T618_LDO5DAC			0x50
+#define RN5T618_LDO6DAC			0x51
+#define RN5T618_LDO7DAC			0x52
+#define RN5T618_LDO8DAC			0x53
+#define RN5T618_LDO9DAC			0x54
+#define RN5T618_LDO10DAC		0x55
 #define RN5T618_LDORTCDAC		0x56
 #define RN5T618_LDORTC2DAC		0x57
 #define RN5T618_LDO1DAC_SLP		0x58
@@ -231,6 +239,7 @@ enum {
 enum {
 	RN5T567 = 0,
 	RN5T618,
+	RC5T619,
 };
 
 struct rn5t618 {
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
