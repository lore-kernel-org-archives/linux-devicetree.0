From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH RESEND 3/5] mfd: arizona: Add register bits for general purpose switch
Date: Tue, 11 Aug 2015 09:14:02 +0100
Message-ID: <1439280844-9808-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1439280844-9808-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439280844-9808-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The switch is typically used in conjunction with the MICDET clamp in
order to suppress pops and clicks associated with jack insertion.

Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
---
 drivers/mfd/wm5110-tables.c           |    2 ++
 include/linux/mfd/arizona/pdata.h     |    3 +++
 include/linux/mfd/arizona/registers.h |    8 ++++++++
 3 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/drivers/mfd/wm5110-tables.c b/drivers/mfd/wm5110-tables.c
index dd27872..acb3bb2 100644
--- a/drivers/mfd/wm5110-tables.c
+++ b/drivers/mfd/wm5110-tables.c
@@ -1472,6 +1472,7 @@ static const struct reg_default wm5110_reg_default[] = {
 	{ 0x00000C04, 0xA101 },    /* R3076  - GPIO5 CTRL */
 	{ 0x00000C0F, 0x0400 },    /* R3087  - IRQ CTRL 1 */
 	{ 0x00000C10, 0x1000 },    /* R3088  - GPIO Debounce Config */
+	{ 0x00000C18, 0x0000 },    /* R3096  - GP Switch 1 */
 	{ 0x00000C20, 0x8002 },    /* R3104  - Misc Pad Ctrl 1 */
 	{ 0x00000C21, 0x8001 },    /* R3105  - Misc Pad Ctrl 2 */
 	{ 0x00000C22, 0x0000 },    /* R3106  - Misc Pad Ctrl 3 */
@@ -2524,6 +2525,7 @@ static bool wm5110_readable_register(struct device *dev, unsigned int reg)
 	case ARIZONA_GPIO5_CTRL:
 	case ARIZONA_IRQ_CTRL_1:
 	case ARIZONA_GPIO_DEBOUNCE_CONFIG:
+	case ARIZONA_GP_SWITCH_1:
 	case ARIZONA_MISC_PAD_CTRL_1:
 	case ARIZONA_MISC_PAD_CTRL_2:
 	case ARIZONA_MISC_PAD_CTRL_3:
diff --git a/include/linux/mfd/arizona/pdata.h b/include/linux/mfd/arizona/pdata.h
index f030a32..e76577b 100644
--- a/include/linux/mfd/arizona/pdata.h
+++ b/include/linux/mfd/arizona/pdata.h
@@ -182,6 +182,9 @@ struct arizona_pdata {
 
 	/** GPIO for primary IRQ (used for edge triggered emulation) */
 	int irq_gpio;
+
+	/** General purpose switch control */
+	unsigned int gpsw;
 };
 
 #endif
diff --git a/include/linux/mfd/arizona/registers.h b/include/linux/mfd/arizona/registers.h
index 3f3bb2b..e96644c 100644
--- a/include/linux/mfd/arizona/registers.h
+++ b/include/linux/mfd/arizona/registers.h
@@ -869,6 +869,7 @@
 #define ARIZONA_GPIO5_CTRL                       0xC04
 #define ARIZONA_IRQ_CTRL_1                       0xC0F
 #define ARIZONA_GPIO_DEBOUNCE_CONFIG             0xC10
+#define ARIZONA_GP_SWITCH_1                      0xC18
 #define ARIZONA_MISC_PAD_CTRL_1                  0xC20
 #define ARIZONA_MISC_PAD_CTRL_2                  0xC21
 #define ARIZONA_MISC_PAD_CTRL_3                  0xC22
@@ -4573,6 +4574,13 @@
 #define ARIZONA_GP_DBTIME_WIDTH                       4  /* GP_DBTIME - [15:12] */
 
 /*
+ * R3096 (0xC18) - GP Switch 1
+ */
+#define ARIZONA_SW1_MODE_MASK                    0x0003  /* SW1_MODE - [1:0] */
+#define ARIZONA_SW1_MODE_SHIFT                        0  /* SW1_MODE - [1:0] */
+#define ARIZONA_SW1_MODE_WIDTH                        2  /* SW1_MODE - [1:0] */
+
+/*
  * R3104 (0xC20) - Misc Pad Ctrl 1
  */
 #define ARIZONA_LDO1ENA_PD                       0x8000  /* LDO1ENA_PD */
-- 
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
