From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH v3 3/7] extcon: arizona: Add basic microphone detection DT/ACPI bindings
Date: Fri, 19 Jun 2015 11:33:05 +0100
Message-ID: <1434709989-28300-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1434709989-28300-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434709989-28300-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds bindings for the basic microphone detection platform
data.

Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
---
 drivers/extcon/extcon-arizona.c   |   30 ++++++++++++++++++++++++++++++
 include/linux/mfd/arizona/pdata.h |    3 +++
 2 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index d990495..6826d99 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -1115,6 +1115,7 @@ static int arizona_extcon_device_get_pdata(struct arizona *arizona)
 {
 	struct arizona_pdata *pdata = &arizona->pdata;
 	unsigned int val = ARIZONA_ACCDET_MODE_HPL;
+	unsigned int num_debounces;
 
 	device_property_read_u32(arizona->dev, "wlf,hpdet-channel", &val);
 	switch (val) {
@@ -1128,6 +1129,35 @@ static int arizona_extcon_device_get_pdata(struct arizona *arizona)
 		pdata->hpdet_channel = ARIZONA_ACCDET_MODE_HPL;
 	}
 
+	device_property_read_u32(arizona->dev, "wlf,micd-detect-debounce",
+				 &pdata->micd_detect_debounce);
+
+	device_property_read_u32(arizona->dev, "wlf,micd-bias-start-time",
+				 &pdata->micd_bias_start_time);
+
+	device_property_read_u32(arizona->dev, "wlf,micd-rate",
+				 &pdata->micd_rate);
+
+	num_debounces = 0;
+	device_property_read_u32(arizona->dev, "wlf,micd-dbtime",
+				 &num_debounces);
+	switch (num_debounces) {
+	case 2:
+		pdata->micd_dbtime = ARIZONA_MICD_DBTIME_TWO_DEBOUNCES;
+		break;
+	case 4:
+		pdata->micd_dbtime = ARIZONA_MICD_DBTIME_FOUR_DEBOUNCES;
+		break;
+	default:
+		break;
+	}
+
+	device_property_read_u32(arizona->dev, "wlf,micd-timeout",
+				 &pdata->micd_timeout);
+
+	pdata->micd_force_micbias = device_property_read_bool(arizona->dev,
+						"wlf,micd-force-micbias");
+
 	return 0;
 }
 
diff --git a/include/linux/mfd/arizona/pdata.h b/include/linux/mfd/arizona/pdata.h
index aa5c48b..af44081 100644
--- a/include/linux/mfd/arizona/pdata.h
+++ b/include/linux/mfd/arizona/pdata.h
@@ -53,6 +53,9 @@
 
 #define ARIZONA_MAX_PDM_SPK 2
 
+#define ARIZONA_MICD_DBTIME_TWO_DEBOUNCES 0x10000
+#define ARIZONA_MICD_DBTIME_FOUR_DEBOUNCES 0x0001
+
 struct regulator_init_data;
 
 struct arizona_micbias {
-- 
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
