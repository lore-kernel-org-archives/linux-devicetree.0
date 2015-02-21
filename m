From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v2] mfd: arizona: Move useful defines into a dt-binding include
Date: Sat, 21 Feb 2015 12:17:57 +0000
Message-ID: <1424521077-5954-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org, sameo@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Move parts of linux/mfd/arizona/pdata.h and gpio.h into a new file in
the dt-binding directory for use by device tree bindings. This also
makes gpio.h redundant so remove it in the process.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 include/dt-bindings/mfd/arizona.h |  109 +++++++++++++++++++++++++++++++++++++
 include/linux/mfd/arizona/gpio.h  |   96 --------------------------------
 include/linux/mfd/arizona/pdata.h |   46 +---------------
 sound/soc/codecs/arizona.c        |    1 -
 4 files changed, 110 insertions(+), 142 deletions(-)
 create mode 100644 include/dt-bindings/mfd/arizona.h
 delete mode 100644 include/linux/mfd/arizona/gpio.h

diff --git a/include/dt-bindings/mfd/arizona.h b/include/dt-bindings/mfd/arizona.h
new file mode 100644
index 0000000..f2a4821
--- /dev/null
+++ b/include/dt-bindings/mfd/arizona.h
@@ -0,0 +1,109 @@
+/*
+ * Device Tree defines for Arizona devices
+ *
+ * Copyright 2014 Wolfson Microelectronics. PLC.
+ *
+ * Author: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef _DT_BINDINGS_MFD_ARIZONA_H
+#define _DT_BINDINGS_MFD_ARIZONA_H
+
+#define ARIZONA_GP_FN_TXLRCLK                    0x00
+#define ARIZONA_GP_FN_GPIO                       0x01
+#define ARIZONA_GP_FN_IRQ1                       0x02
+#define ARIZONA_GP_FN_IRQ2                       0x03
+#define ARIZONA_GP_FN_OPCLK                      0x04
+#define ARIZONA_GP_FN_FLL1_OUT                   0x05
+#define ARIZONA_GP_FN_FLL2_OUT                   0x06
+#define ARIZONA_GP_FN_PWM1                       0x08
+#define ARIZONA_GP_FN_PWM2                       0x09
+#define ARIZONA_GP_FN_SYSCLK_UNDERCLOCKED        0x0A
+#define ARIZONA_GP_FN_ASYNCCLK_UNDERCLOCKED      0x0B
+#define ARIZONA_GP_FN_FLL1_LOCK                  0x0C
+#define ARIZONA_GP_FN_FLL2_LOCK                  0x0D
+#define ARIZONA_GP_FN_FLL1_CLOCK_OK              0x0F
+#define ARIZONA_GP_FN_FLL2_CLOCK_OK              0x10
+#define ARIZONA_GP_FN_HEADPHONE_DET              0x12
+#define ARIZONA_GP_FN_MIC_DET                    0x13
+#define ARIZONA_GP_FN_WSEQ_STATUS                0x15
+#define ARIZONA_GP_FN_CIF_ADDRESS_ERROR          0x16
+#define ARIZONA_GP_FN_ASRC1_LOCK                 0x1A
+#define ARIZONA_GP_FN_ASRC2_LOCK                 0x1B
+#define ARIZONA_GP_FN_ASRC_CONFIG_ERROR          0x1C
+#define ARIZONA_GP_FN_DRC1_SIGNAL_DETECT         0x1D
+#define ARIZONA_GP_FN_DRC1_ANTICLIP              0x1E
+#define ARIZONA_GP_FN_DRC1_DECAY                 0x1F
+#define ARIZONA_GP_FN_DRC1_NOISE                 0x20
+#define ARIZONA_GP_FN_DRC1_QUICK_RELEASE         0x21
+#define ARIZONA_GP_FN_DRC2_SIGNAL_DETECT         0x22
+#define ARIZONA_GP_FN_DRC2_ANTICLIP              0x23
+#define ARIZONA_GP_FN_DRC2_DECAY                 0x24
+#define ARIZONA_GP_FN_DRC2_NOISE                 0x25
+#define ARIZONA_GP_FN_DRC2_QUICK_RELEASE         0x26
+#define ARIZONA_GP_FN_MIXER_DROPPED_SAMPLE       0x27
+#define ARIZONA_GP_FN_AIF1_CONFIG_ERROR          0x28
+#define ARIZONA_GP_FN_AIF2_CONFIG_ERROR          0x29
+#define ARIZONA_GP_FN_AIF3_CONFIG_ERROR          0x2A
+#define ARIZONA_GP_FN_SPK_TEMP_SHUTDOWN          0x2B
+#define ARIZONA_GP_FN_SPK_TEMP_WARNING           0x2C
+#define ARIZONA_GP_FN_UNDERCLOCKED               0x2D
+#define ARIZONA_GP_FN_OVERCLOCKED                0x2E
+#define ARIZONA_GP_FN_DSP_IRQ1                   0x35
+#define ARIZONA_GP_FN_DSP_IRQ2                   0x36
+#define ARIZONA_GP_FN_ASYNC_OPCLK                0x3D
+#define ARIZONA_GP_FN_BOOT_DONE                  0x44
+#define ARIZONA_GP_FN_DSP1_RAM_READY             0x45
+#define ARIZONA_GP_FN_SYSCLK_ENA_STATUS          0x4B
+#define ARIZONA_GP_FN_ASYNCCLK_ENA_STATUS        0x4C
+
+#define ARIZONA_GPN_DIR                          0x8000  /* GPN_DIR */
+#define ARIZONA_GPN_DIR_MASK                     0x8000  /* GPN_DIR */
+#define ARIZONA_GPN_DIR_SHIFT                        15  /* GPN_DIR */
+#define ARIZONA_GPN_DIR_WIDTH                         1  /* GPN_DIR */
+#define ARIZONA_GPN_PU                           0x4000  /* GPN_PU */
+#define ARIZONA_GPN_PU_MASK                      0x4000  /* GPN_PU */
+#define ARIZONA_GPN_PU_SHIFT                         14  /* GPN_PU */
+#define ARIZONA_GPN_PU_WIDTH                          1  /* GPN_PU */
+#define ARIZONA_GPN_PD                           0x2000  /* GPN_PD */
+#define ARIZONA_GPN_PD_MASK                      0x2000  /* GPN_PD */
+#define ARIZONA_GPN_PD_SHIFT                         13  /* GPN_PD */
+#define ARIZONA_GPN_PD_WIDTH                          1  /* GPN_PD */
+#define ARIZONA_GPN_LVL                          0x0800  /* GPN_LVL */
+#define ARIZONA_GPN_LVL_MASK                     0x0800  /* GPN_LVL */
+#define ARIZONA_GPN_LVL_SHIFT                        11  /* GPN_LVL */
+#define ARIZONA_GPN_LVL_WIDTH                         1  /* GPN_LVL */
+#define ARIZONA_GPN_POL                          0x0400  /* GPN_POL */
+#define ARIZONA_GPN_POL_MASK                     0x0400  /* GPN_POL */
+#define ARIZONA_GPN_POL_SHIFT                        10  /* GPN_POL */
+#define ARIZONA_GPN_POL_WIDTH                         1  /* GPN_POL */
+#define ARIZONA_GPN_OP_CFG                       0x0200  /* GPN_OP_CFG */
+#define ARIZONA_GPN_OP_CFG_MASK                  0x0200  /* GPN_OP_CFG */
+#define ARIZONA_GPN_OP_CFG_SHIFT                      9  /* GPN_OP_CFG */
+#define ARIZONA_GPN_OP_CFG_WIDTH                      1  /* GPN_OP_CFG */
+#define ARIZONA_GPN_DB                           0x0100  /* GPN_DB */
+#define ARIZONA_GPN_DB_MASK                      0x0100  /* GPN_DB */
+#define ARIZONA_GPN_DB_SHIFT                          8  /* GPN_DB */
+#define ARIZONA_GPN_DB_WIDTH                          1  /* GPN_DB */
+#define ARIZONA_GPN_FN_MASK                      0x007F  /* GPN_FN - [6:0] */
+#define ARIZONA_GPN_FN_SHIFT                          0  /* GPN_FN - [6:0] */
+#define ARIZONA_GPN_FN_WIDTH                          7  /* GPN_FN - [6:0] */
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
+
+#endif
diff --git a/include/linux/mfd/arizona/gpio.h b/include/linux/mfd/arizona/gpio.h
deleted file mode 100644
index d2146bb..0000000
--- a/include/linux/mfd/arizona/gpio.h
+++ /dev/null
@@ -1,96 +0,0 @@
-/*
- * GPIO configuration for Arizona devices
- *
- * Copyright 2013 Wolfson Microelectronics. PLC.
- *
- * Author: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- */
-
-#ifndef _ARIZONA_GPIO_H
-#define _ARIZONA_GPIO_H
-
-#define ARIZONA_GP_FN_TXLRCLK                    0x00
-#define ARIZONA_GP_FN_GPIO                       0x01
-#define ARIZONA_GP_FN_IRQ1                       0x02
-#define ARIZONA_GP_FN_IRQ2                       0x03
-#define ARIZONA_GP_FN_OPCLK                      0x04
-#define ARIZONA_GP_FN_FLL1_OUT                   0x05
-#define ARIZONA_GP_FN_FLL2_OUT                   0x06
-#define ARIZONA_GP_FN_PWM1                       0x08
-#define ARIZONA_GP_FN_PWM2                       0x09
-#define ARIZONA_GP_FN_SYSCLK_UNDERCLOCKED        0x0A
-#define ARIZONA_GP_FN_ASYNCCLK_UNDERCLOCKED      0x0B
-#define ARIZONA_GP_FN_FLL1_LOCK                  0x0C
-#define ARIZONA_GP_FN_FLL2_LOCK                  0x0D
-#define ARIZONA_GP_FN_FLL1_CLOCK_OK              0x0F
-#define ARIZONA_GP_FN_FLL2_CLOCK_OK              0x10
-#define ARIZONA_GP_FN_HEADPHONE_DET              0x12
-#define ARIZONA_GP_FN_MIC_DET                    0x13
-#define ARIZONA_GP_FN_WSEQ_STATUS                0x15
-#define ARIZONA_GP_FN_CIF_ADDRESS_ERROR          0x16
-#define ARIZONA_GP_FN_ASRC1_LOCK                 0x1A
-#define ARIZONA_GP_FN_ASRC2_LOCK                 0x1B
-#define ARIZONA_GP_FN_ASRC_CONFIG_ERROR          0x1C
-#define ARIZONA_GP_FN_DRC1_SIGNAL_DETECT         0x1D
-#define ARIZONA_GP_FN_DRC1_ANTICLIP              0x1E
-#define ARIZONA_GP_FN_DRC1_DECAY                 0x1F
-#define ARIZONA_GP_FN_DRC1_NOISE                 0x20
-#define ARIZONA_GP_FN_DRC1_QUICK_RELEASE         0x21
-#define ARIZONA_GP_FN_DRC2_SIGNAL_DETECT         0x22
-#define ARIZONA_GP_FN_DRC2_ANTICLIP              0x23
-#define ARIZONA_GP_FN_DRC2_DECAY                 0x24
-#define ARIZONA_GP_FN_DRC2_NOISE                 0x25
-#define ARIZONA_GP_FN_DRC2_QUICK_RELEASE         0x26
-#define ARIZONA_GP_FN_MIXER_DROPPED_SAMPLE       0x27
-#define ARIZONA_GP_FN_AIF1_CONFIG_ERROR          0x28
-#define ARIZONA_GP_FN_AIF2_CONFIG_ERROR          0x29
-#define ARIZONA_GP_FN_AIF3_CONFIG_ERROR          0x2A
-#define ARIZONA_GP_FN_SPK_TEMP_SHUTDOWN          0x2B
-#define ARIZONA_GP_FN_SPK_TEMP_WARNING           0x2C
-#define ARIZONA_GP_FN_UNDERCLOCKED               0x2D
-#define ARIZONA_GP_FN_OVERCLOCKED                0x2E
-#define ARIZONA_GP_FN_DSP_IRQ1                   0x35
-#define ARIZONA_GP_FN_DSP_IRQ2                   0x36
-#define ARIZONA_GP_FN_ASYNC_OPCLK                0x3D
-#define ARIZONA_GP_FN_BOOT_DONE                  0x44
-#define ARIZONA_GP_FN_DSP1_RAM_READY             0x45
-#define ARIZONA_GP_FN_SYSCLK_ENA_STATUS          0x4B
-#define ARIZONA_GP_FN_ASYNCCLK_ENA_STATUS        0x4C
-
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
-
-#endif
diff --git a/include/linux/mfd/arizona/pdata.h b/include/linux/mfd/arizona/pdata.h
index 4578c72..34a0bcc 100644
--- a/include/linux/mfd/arizona/pdata.h
+++ b/include/linux/mfd/arizona/pdata.h
@@ -7,61 +7,17 @@
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
  */
-
 #ifndef _ARIZONA_PDATA_H
 #define _ARIZONA_PDATA_H
 
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
-#define ARIZONA_GPN_FN_MASK                      0x007F  /* GPN_FN - [6:0] */
-#define ARIZONA_GPN_FN_SHIFT                          0  /* GPN_FN - [6:0] */
-#define ARIZONA_GPN_FN_WIDTH                          7  /* GPN_FN - [6:0] */
+#include <dt-bindings/mfd/arizona.h>
 
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
