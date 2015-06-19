From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v5 1/7] extcon: arizona: Simplify pdata symantics for micd_dbtime
Date: Fri, 19 Jun 2015 17:23:28 +0100
Message-ID: <1434731014-19980-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1434731014-19980-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434731014-19980-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, sameo@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Currently micd_dbtime can be set to 0 for default, 1 for 4 measurements,
or a greater than 16-bit value for 2 measurements. This patch simplifies
the symantics to 2 for 2 measurements, 4 for 4 measurements and any
other value for the default.

I am not super keen on changing the symantics of the pdata at this stage
in the drivers life, but acceptance of the DT binding for this field has
been made conditional on this happening.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/extcon/extcon-arizona.c   |   14 +++++++++++---
 include/linux/mfd/arizona/pdata.h |    3 +++
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index 9262b45..1fbe3b4 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -1267,11 +1267,19 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 				   arizona->pdata.micd_rate
 				   << ARIZONA_MICD_RATE_SHIFT);
 
-	if (arizona->pdata.micd_dbtime)
+	switch (arizona->pdata.micd_dbtime) {
+	case ARIZONA_MICD_DBTIME_FOUR_READINGS:
 		regmap_update_bits(arizona->regmap, ARIZONA_MIC_DETECT_1,
 				   ARIZONA_MICD_DBTIME_MASK,
-				   arizona->pdata.micd_dbtime
-				   << ARIZONA_MICD_DBTIME_SHIFT);
+				   ARIZONA_MICD_DBTIME);
+		break;
+	case ARIZONA_MICD_DBTIME_TWO_READINGS:
+		regmap_update_bits(arizona->regmap, ARIZONA_MIC_DETECT_1,
+				   ARIZONA_MICD_DBTIME_MASK, 0);
+		break;
+	default:
+		break;
+	}
 
 	BUILD_BUG_ON(ARRAY_SIZE(arizona_micd_levels) != 0x40);
 
diff --git a/include/linux/mfd/arizona/pdata.h b/include/linux/mfd/arizona/pdata.h
index aa5c48b..bd68355 100644
--- a/include/linux/mfd/arizona/pdata.h
+++ b/include/linux/mfd/arizona/pdata.h
@@ -53,6 +53,9 @@
 
 #define ARIZONA_MAX_PDM_SPK 2
 
+#define ARIZONA_MICD_DBTIME_TWO_READINGS 2
+#define ARIZONA_MICD_DBTIME_FOUR_READINGS 4
+
 struct regulator_init_data;
 
 struct arizona_micbias {
-- 
1.7.2.5
