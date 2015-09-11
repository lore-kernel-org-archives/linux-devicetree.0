From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH v2 1/6] mfd: arizona: Add TST_CAP bits for headphone detection
Date: Fri, 11 Sep 2015 13:14:13 +0100
Message-ID: <1441973658-26234-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1441973658-26234-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441973658-26234-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Florida some additional settings are required to get accurate
measurements at the top end of the headphone detection range. This patch
adds the bits required for this.

Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Acked-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---

No change since v1.

 drivers/mfd/wm5110-tables.c           |    2 ++
 include/linux/mfd/arizona/registers.h |    8 ++++++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/drivers/mfd/wm5110-tables.c b/drivers/mfd/wm5110-tables.c
index acb3bb2..78032e8 100644
--- a/drivers/mfd/wm5110-tables.c
+++ b/drivers/mfd/wm5110-tables.c
@@ -1908,6 +1908,7 @@ static bool wm5110_readable_register(struct device *dev, unsigned int reg)
 	case ARIZONA_HP1_SHORT_CIRCUIT_CTRL:
 	case ARIZONA_HP2_SHORT_CIRCUIT_CTRL:
 	case ARIZONA_HP3_SHORT_CIRCUIT_CTRL:
+	case ARIZONA_HP_TEST_CTRL_1:
 	case ARIZONA_AIF1_BCLK_CTRL:
 	case ARIZONA_AIF1_TX_PIN_CTRL:
 	case ARIZONA_AIF1_RX_PIN_CTRL:
@@ -2853,6 +2854,7 @@ static bool wm5110_volatile_register(struct device *dev, unsigned int reg)
 	case ARIZONA_INPUT_ENABLES_STATUS:
 	case ARIZONA_OUTPUT_STATUS_1:
 	case ARIZONA_RAW_OUTPUT_STATUS_1:
+	case ARIZONA_HP_TEST_CTRL_1:
 	case ARIZONA_SLIMBUS_RX_PORT_STATUS:
 	case ARIZONA_SLIMBUS_TX_PORT_STATUS:
 	case ARIZONA_INTERRUPT_STATUS_1:
diff --git a/include/linux/mfd/arizona/registers.h b/include/linux/mfd/arizona/registers.h
index e96644c..fe1b5d0 100644
--- a/include/linux/mfd/arizona/registers.h
+++ b/include/linux/mfd/arizona/registers.h
@@ -237,6 +237,7 @@
 #define ARIZONA_HP1_SHORT_CIRCUIT_CTRL           0x4A0
 #define ARIZONA_HP2_SHORT_CIRCUIT_CTRL           0x4A1
 #define ARIZONA_HP3_SHORT_CIRCUIT_CTRL           0x4A2
+#define ARIZONA_HP_TEST_CTRL_1                   0x4A4
 #define ARIZONA_SPK_CTRL_2                       0x4B5
 #define ARIZONA_SPK_CTRL_3                       0x4B6
 #define ARIZONA_DAC_COMP_1                       0x4DC
@@ -3548,6 +3549,13 @@
 #define ARIZONA_HP3_SC_ENA_WIDTH                      1  /* HP3_SC_ENA */
 
 /*
+ * R1188 (0x4A4) HP Test Ctrl 1
+ */
+#define ARIZONA_HP1_TST_CAP_SEL_MASK             0x0003  /* HP1_TST_CAP_SEL - [1:0] */
+#define ARIZONA_HP1_TST_CAP_SEL_SHIFT                 0  /* HP1_TST_CAP_SEL - [1:0] */
+#define ARIZONA_HP1_TST_CAP_SEL_WIDTH                 2  /* HP1_TST_CAP_SEL - [1:0] */
+
+/*
  * R1244 (0x4DC) - DAC comp 1
  */
 #define ARIZONA_OUT_COMP_COEFF_MASK              0xFFFF  /* OUT_COMP_COEFF - [15:0] */
-- 
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
