From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v3] mfd: arizona: Move useful defines into a dt-binding include
Date: Wed, 25 Feb 2015 15:37:13 +0000
Message-ID: <1424878633-32460-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee@kernel.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org, sameo@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Move parts of linux/mfd/arizona/pdata.h and gpio.h into a new file in
the dt-binding directory for use by device tree bindings. This also
makes gpio.h redundant so remove it in the process.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
---

Changes since v2:
 - Generate patch using git format-patch -M

 Documentation/devicetree/bindings/mfd/arizona.txt  |   20 +++---
 .../arizona/gpio.h => dt-bindings/mfd/arizona.h}   |   67 +++++++++----------
 include/linux/mfd/arizona/pdata.h                  |   22 +------
 sound/soc/codecs/arizona.c                         |    1 -
 4 files changed, 44 insertions(+), 66 deletions(-)
 rename include/{linux/mfd/arizona/gpio.h => dt-bindings/mfd/arizona.h} (54%)

diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
index 7bd1273..bfef000 100644
--- a/Documentation/devicetree/bindings/mfd/arizona.txt
+++ b/Documentation/devicetree/bindings/mfd/arizona.txt
@@ -36,11 +36,11 @@ Optional properties:
   - wlf,reset : GPIO specifier for the GPIO controlling /RESET
   - wlf,ldoena : GPIO specifier for the GPIO controlling LDOENA
 
-  - wlf,gpio-defaults : A list of GPIO configuration register values. If
-    absent, no configuration of these registers is performed. If any
-    entry has a value that is out of range for a 16 bit register then
-    the chip default will be used.  If present exactly five values must
-    be specified.
+  - wlf,gpio-defaults : A list of GPIO configuration register values. Defines
+    for the appropriate values can found in <dt-bindings/mfd/arizona.txt>. If
+    absent, no configuration of these registers is performed. If any entry has
+    a value that is out of range for a 16 bit register then the chip default
+    will be used. If present exactly five values must be specified.
 
   - wlf,inmode : A list of INn_MODE register values, where n is the number
     of input signals. Valid values are 0 (Differential), 1 (Single-ended) and
@@ -73,10 +73,10 @@ codec: wm5102@1a {
 	#gpio-cells = <2>;
 
 	wlf,gpio-defaults = <
-		0x00000000 /* AIF1TXLRCLK */
-		0xffffffff
-		0xffffffff
-		0xffffffff
-		0xffffffff
+		ARIZONA_GP_FN_TXLRCLK
+		ARIZONA_GP_DEFAULT
+		ARIZONA_GP_DEFAULT
+		ARIZONA_GP_DEFAULT
+		ARIZONA_GP_DEFAULT
 	>;
 };
diff --git a/include/linux/mfd/arizona/gpio.h b/include/dt-bindings/mfd/arizona.h
similarity index 54%
rename from include/linux/mfd/arizona/gpio.h
rename to include/dt-bindings/mfd/arizona.h
index d2146bb..c7af7c7 100644
--- a/include/linux/mfd/arizona/gpio.h
+++ b/include/dt-bindings/mfd/arizona.h
@@ -1,7 +1,7 @@
 /*
- * GPIO configuration for Arizona devices
+ * Device Tree defines for Arizona devices
  *
- * Copyright 2013 Wolfson Microelectronics. PLC.
+ * Copyright 2015 Cirrus Logic Inc.
  *
  * Author: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
  *
@@ -10,9 +10,10 @@
  * published by the Free Software Foundation.
  */
 
-#ifndef _ARIZONA_GPIO_H
-#define _ARIZONA_GPIO_H
+#ifndef _DT_BINDINGS_MFD_ARIZONA_H
+#define _DT_BINDINGS_MFD_ARIZONA_H
 
+/* GPIO Function Definitions */
 #define ARIZONA_GP_FN_TXLRCLK                    0x00
 #define ARIZONA_GP_FN_GPIO                       0x01
 #define ARIZONA_GP_FN_IRQ1                       0x02
@@ -61,36 +62,32 @@
 #define ARIZONA_GP_FN_SYSCLK_ENA_STATUS          0x4B
 #define ARIZONA_GP_FN_ASYNCCLK_ENA_STATUS        0x4C
 
-#define ARIZONA_GPN_DIR                          0x8000  /* GPN_DIR */
-#define ARIZONA_GPN_DIR_MASK                     0x8000  /* GPN_DIR */
-#define ARIZONA_GPN_DIR_SHIFT                        15  /* GPN_DIR */
-#define ARIZONA_GPN_DIR_WIDTH                         1  /* GPN_DIR */
-#define ARIZONA_GPN_PU                           0x4000  /* GPN_PU */
-#define ARIZONA_GPN_PU_MASK                      0x4000  /* GPN_PU */
-#define ARIZONA_GPN_PU_SHIFT                         14  /* GPN_PU */
-#define ARIZONA_GPN_PU_WIDTH                          1  /* GPN_PU */
-#define ARIZONA_GPN_PD                           0x2000  /* GPN_PD */
-#define ARIZONA_GPN_PD_MASK                      0x2000  /* GPN_PD */
-#define ARIZONA_GPN_PD_SHIFT                         13  /* GPN_PD */
-#define ARIZONA_GPN_PD_WIDTH                          1  /* GPN_PD */
-#define ARIZONA_GPN_LVL                          0x0800  /* GPN_LVL */
-#define ARIZONA_GPN_LVL_MASK                     0x0800  /* GPN_LVL */
-#define ARIZONA_GPN_LVL_SHIFT                        11  /* GPN_LVL */
-#define ARIZONA_GPN_LVL_WIDTH                         1  /* GPN_LVL */
-#define ARIZONA_GPN_POL                          0x0400  /* GPN_POL */
-#define ARIZONA_GPN_POL_MASK                     0x0400  /* GPN_POL */
-#define ARIZONA_GPN_POL_SHIFT                        10  /* GPN_POL */
-#define ARIZONA_GPN_POL_WIDTH                         1  /* GPN_POL */
-#define ARIZONA_GPN_OP_CFG                       0x0200  /* GPN_OP_CFG */
-#define ARIZONA_GPN_OP_CFG_MASK                  0x0200  /* GPN_OP_CFG */
-#define ARIZONA_GPN_OP_CFG_SHIFT                      9  /* GPN_OP_CFG */
-#define ARIZONA_GPN_OP_CFG_WIDTH                      1  /* GPN_OP_CFG */
-#define ARIZONA_GPN_DB                           0x0100  /* GPN_DB */
-#define ARIZONA_GPN_DB_MASK                      0x0100  /* GPN_DB */
-#define ARIZONA_GPN_DB_SHIFT                          8  /* GPN_DB */
-#define ARIZONA_GPN_DB_WIDTH                          1  /* GPN_DB */
-#define ARIZONA_GPN_FN_MASK                      0x007F  /* GPN_DB */
-#define ARIZONA_GPN_FN_SHIFT                          0  /* GPN_DB */
-#define ARIZONA_GPN_FN_WIDTH                          7  /* GPN_DB */
+/* GPIO Configuration Bits */
+#define ARIZONA_GPN_DIR                          0x8000
+#define ARIZONA_GPN_PU                           0x4000
+#define ARIZONA_GPN_PD                           0x2000
+#define ARIZONA_GPN_LVL                          0x0800
+#define ARIZONA_GPN_POL                          0x0400
+#define ARIZONA_GPN_OP_CFG                       0x0200
+#define ARIZONA_GPN_DB                           0x0100
+
+/* Provide some defines for the most common configs */
+#define ARIZONA_GP_DEFAULT             0xffffffff
+#define ARIZONA_GP_OUTPUT              (ARIZONA_GP_FN_GPIO)
+#define ARIZONA_GP_INPUT               (ARIZONA_GP_FN_GPIO | \
+					ARIZONA_GPN_DIR)
+
+#define ARIZONA_32KZ_MCLK1 1
+#define ARIZONA_32KZ_MCLK2 2
+#define ARIZONA_32KZ_NONE  3
+
+#define ARIZONA_DMIC_MICVDD   0
+#define ARIZONA_DMIC_MICBIAS1 1
+#define ARIZONA_DMIC_MICBIAS2 2
+#define ARIZONA_DMIC_MICBIAS3 3
+
+#define ARIZONA_INMODE_DIFF 0
+#define ARIZONA_INMODE_SE   1
+#define ARIZONA_INMODE_DMIC 2
 
 #endif
diff --git a/include/linux/mfd/arizona/pdata.h b/include/linux/mfd/arizona/pdata.h
index 4578c72..48fe313 100644
--- a/include/linux/mfd/arizona/pdata.h
+++ b/include/linux/mfd/arizona/pdata.h
@@ -11,31 +11,26 @@
 #ifndef _ARIZONA_PDATA_H
 #define _ARIZONA_PDATA_H
 
-#define ARIZONA_GPN_DIR                          0x8000  /* GPN_DIR */
+#include <dt-bindings/mfd/arizona.h>
+
 #define ARIZONA_GPN_DIR_MASK                     0x8000  /* GPN_DIR */
 #define ARIZONA_GPN_DIR_SHIFT                        15  /* GPN_DIR */
 #define ARIZONA_GPN_DIR_WIDTH                         1  /* GPN_DIR */
-#define ARIZONA_GPN_PU                           0x4000  /* GPN_PU */
 #define ARIZONA_GPN_PU_MASK                      0x4000  /* GPN_PU */
 #define ARIZONA_GPN_PU_SHIFT                         14  /* GPN_PU */
 #define ARIZONA_GPN_PU_WIDTH                          1  /* GPN_PU */
-#define ARIZONA_GPN_PD                           0x2000  /* GPN_PD */
 #define ARIZONA_GPN_PD_MASK                      0x2000  /* GPN_PD */
 #define ARIZONA_GPN_PD_SHIFT                         13  /* GPN_PD */
 #define ARIZONA_GPN_PD_WIDTH                          1  /* GPN_PD */
-#define ARIZONA_GPN_LVL                          0x0800  /* GPN_LVL */
 #define ARIZONA_GPN_LVL_MASK                     0x0800  /* GPN_LVL */
 #define ARIZONA_GPN_LVL_SHIFT                        11  /* GPN_LVL */
 #define ARIZONA_GPN_LVL_WIDTH                         1  /* GPN_LVL */
-#define ARIZONA_GPN_POL                          0x0400  /* GPN_POL */
 #define ARIZONA_GPN_POL_MASK                     0x0400  /* GPN_POL */
 #define ARIZONA_GPN_POL_SHIFT                        10  /* GPN_POL */
 #define ARIZONA_GPN_POL_WIDTH                         1  /* GPN_POL */
-#define ARIZONA_GPN_OP_CFG                       0x0200  /* GPN_OP_CFG */
 #define ARIZONA_GPN_OP_CFG_MASK                  0x0200  /* GPN_OP_CFG */
 #define ARIZONA_GPN_OP_CFG_SHIFT                      9  /* GPN_OP_CFG */
 #define ARIZONA_GPN_OP_CFG_WIDTH                      1  /* GPN_OP_CFG */
-#define ARIZONA_GPN_DB                           0x0100  /* GPN_DB */
 #define ARIZONA_GPN_DB_MASK                      0x0100  /* GPN_DB */
 #define ARIZONA_GPN_DB_SHIFT                          8  /* GPN_DB */
 #define ARIZONA_GPN_DB_WIDTH                          1  /* GPN_DB */
@@ -45,23 +40,10 @@
 
 #define ARIZONA_MAX_GPIO 5
 
-#define ARIZONA_32KZ_MCLK1 1
-#define ARIZONA_32KZ_MCLK2 2
-#define ARIZONA_32KZ_NONE  3
-
 #define ARIZONA_MAX_INPUT 4
 
-#define ARIZONA_DMIC_MICVDD   0
-#define ARIZONA_DMIC_MICBIAS1 1
-#define ARIZONA_DMIC_MICBIAS2 2
-#define ARIZONA_DMIC_MICBIAS3 3
-
 #define ARIZONA_MAX_MICBIAS 3
 
-#define ARIZONA_INMODE_DIFF 0
-#define ARIZONA_INMODE_SE   1
-#define ARIZONA_INMODE_DMIC 2
-
 #define ARIZONA_MAX_OUTPUT 6
 
 #define ARIZONA_MAX_AIF 3
diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 9550d74..3ff2be9 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -19,7 +19,6 @@
 #include <sound/tlv.h>
 
 #include <linux/mfd/arizona/core.h>
-#include <linux/mfd/arizona/gpio.h>
 #include <linux/mfd/arizona/registers.h>
 
 #include "arizona.h"
-- 
1.7.2.5
