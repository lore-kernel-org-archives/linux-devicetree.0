From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH RESEND 2/5] extcon: arizona: Add support for new ADC value headphone detect
Date: Tue, 11 Aug 2015 09:14:01 +0100
Message-ID: <1439280844-9808-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1439280844-9808-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439280844-9808-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, cw00.choi@samsung.com
Cc: patches@opensource.wolfsonmicro.com, devicetree@vger.kernel.org, myungjoo.ham@samsung.com, sameo@linux.intel.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Newer devices give users the option to make the 3/4 pole jack
determination using a software comparison rather than a hardware one.
This patch adds support for this functionality.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/extcon/extcon-arizona.c |   67 +++++++++++++++++++++++++++++++++++---
 1 files changed, 61 insertions(+), 6 deletions(-)

diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index 4b9f09c..f372156 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -48,6 +48,10 @@
 #define HPDET_DEBOUNCE 500
 #define DEFAULT_MICD_TIMEOUT 2000
 
+#define QUICK_HEADPHONE_MAX_OHM 3
+#define MICROPHONE_MIN_OHM      1257
+#define MICROPHONE_MAX_OHM      30000
+
 #define MICD_DBTIME_TWO_READINGS 2
 #define MICD_DBTIME_FOUR_READINGS 4
 
@@ -117,12 +121,15 @@ static const struct arizona_micd_range micd_default_ranges[] = {
 	{ .max = 430, .key = BTN_5 },
 };
 
+/* The number of levels in arizona_micd_levels valid for button thresholds */
+#define ARIZONA_NUM_MICD_BUTTON_LEVELS 64
+
 static const int arizona_micd_levels[] = {
 	3, 6, 8, 11, 13, 16, 18, 21, 23, 26, 28, 31, 34, 36, 39, 41, 44, 46,
 	49, 52, 54, 57, 60, 62, 65, 67, 70, 73, 75, 78, 81, 83, 89, 94, 100,
 	105, 111, 116, 122, 127, 139, 150, 161, 173, 186, 196, 209, 220, 245,
 	270, 295, 321, 348, 375, 402, 430, 489, 550, 614, 681, 752, 903, 1071,
-	1257,
+	1257, 30000,
 };
 
 static const unsigned int arizona_cable[] = {
@@ -270,6 +277,7 @@ static void arizona_start_mic(struct arizona_extcon_info *info)
 	struct arizona *arizona = info->arizona;
 	bool change;
 	int ret;
+	unsigned int mode;
 
 	/* Microphone detection can't use idle mode */
 	pm_runtime_get(info->dev);
@@ -295,9 +303,14 @@ static void arizona_start_mic(struct arizona_extcon_info *info)
 		regmap_write(arizona->regmap, 0x80, 0x0);
 	}
 
+	if (info->detecting && arizona->pdata.micd_software_compare)
+		mode = ARIZONA_ACCDET_MODE_ADC;
+	else
+		mode = ARIZONA_ACCDET_MODE_MIC;
+
 	regmap_update_bits(arizona->regmap,
 			   ARIZONA_ACCESSORY_DETECT_MODE_1,
-			   ARIZONA_ACCDET_MODE_MASK, ARIZONA_ACCDET_MODE_MIC);
+			   ARIZONA_ACCDET_MODE_MASK, mode);
 
 	arizona_extcon_pulse_micbias(info);
 
@@ -804,6 +817,37 @@ static void arizona_micd_detect(struct work_struct *work)
 		return;
 	}
 
+	if (info->detecting && arizona->pdata.micd_software_compare) {
+		/* Must disable MICD before we read the ADCVAL */
+		regmap_update_bits(arizona->regmap, ARIZONA_MIC_DETECT_1,
+				   ARIZONA_MICD_ENA, 0);
+		ret = regmap_read(arizona->regmap, ARIZONA_MIC_DETECT_4, &val);
+		if (ret != 0) {
+			dev_err(arizona->dev,
+				"Failed to read MICDET_ADCVAL: %d\n",
+				ret);
+			mutex_unlock(&info->lock);
+			return;
+		}
+
+		dev_dbg(arizona->dev, "MICDET_ADCVAL: %x\n", val);
+
+		val &= ARIZONA_MICDET_ADCVAL_MASK;
+		if (val < ARRAY_SIZE(arizona_micd_levels))
+			val = arizona_micd_levels[val];
+		else
+			val = INT_MAX;
+
+		if (val <= QUICK_HEADPHONE_MAX_OHM)
+			val = ARIZONA_MICD_STS | ARIZONA_MICD_LVL_0;
+		else if (val <= MICROPHONE_MIN_OHM)
+			val = ARIZONA_MICD_STS | ARIZONA_MICD_LVL_1;
+		else if (val <= MICROPHONE_MAX_OHM)
+			val = ARIZONA_MICD_STS | ARIZONA_MICD_LVL_8;
+		else
+			val = ARIZONA_MICD_LVL_8;
+	}
+
 	for (i = 0; i < 10 && !(val & MICD_LVL_0_TO_8); i++) {
 		ret = regmap_read(arizona->regmap, ARIZONA_MIC_DETECT_3, &val);
 		if (ret != 0) {
@@ -932,10 +976,17 @@ static void arizona_micd_detect(struct work_struct *work)
 	}
 
 handled:
-	if (info->detecting)
+	if (info->detecting) {
+		if (arizona->pdata.micd_software_compare)
+			regmap_update_bits(arizona->regmap,
+					   ARIZONA_MIC_DETECT_1,
+					   ARIZONA_MICD_ENA,
+					   ARIZONA_MICD_ENA);
+
 		queue_delayed_work(system_power_efficient_wq,
 				   &info->micd_timeout_work,
 				   msecs_to_jiffies(info->micd_timeout));
+	}
 
 	pm_runtime_mark_last_busy(info->dev);
 	mutex_unlock(&info->lock);
@@ -1162,6 +1213,9 @@ static int arizona_extcon_device_get_pdata(struct arizona *arizona)
 	pdata->micd_force_micbias = device_property_read_bool(arizona->dev,
 						"wlf,micd-force-micbias");
 
+	pdata->micd_software_compare = device_property_read_bool(arizona->dev,
+						"wlf,micd-software-compare");
+
 	return 0;
 }
 
@@ -1335,7 +1389,8 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 		break;
 	}
 
-	BUILD_BUG_ON(ARRAY_SIZE(arizona_micd_levels) != 0x40);
+	BUILD_BUG_ON(ARRAY_SIZE(arizona_micd_levels) <
+		     ARIZONA_NUM_MICD_BUTTON_LEVELS);
 
 	if (arizona->pdata.num_micd_ranges) {
 		info->micd_ranges = pdata->micd_ranges;
@@ -1368,11 +1423,11 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 
 	/* Set up all the buttons the user specified */
 	for (i = 0; i < info->num_micd_ranges; i++) {
-		for (j = 0; j < ARRAY_SIZE(arizona_micd_levels); j++)
+		for (j = 0; j < ARIZONA_NUM_MICD_BUTTON_LEVELS; j++)
 			if (arizona_micd_levels[j] >= info->micd_ranges[i].max)
 				break;
 
-		if (j == ARRAY_SIZE(arizona_micd_levels)) {
+		if (j == ARIZONA_NUM_MICD_BUTTON_LEVELS) {
 			dev_err(arizona->dev, "Unsupported MICD level %d\n",
 				info->micd_ranges[i].max);
 			ret = -EINVAL;
-- 
1.7.2.5
