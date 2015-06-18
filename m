From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 2/5] extcon: arizona: Add basic microphone detection DT/ACPI bindings
Date: Thu, 18 Jun 2015 13:52:26 +0100
Message-ID: <1434631949-28594-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1434631949-28594-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434631949-28594-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, sameo@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

This patch adds bindings for the basic microphone detection platform
data.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/extcon/extcon-arizona.c |   30 ++++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index 3b41905..c1197df 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -25,6 +25,7 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/extcon.h>
 
@@ -1115,6 +1116,7 @@ static int arizona_extcon_device_get_pdata(struct arizona *arizona)
 {
 	struct arizona_pdata *pdata = &arizona->pdata;
 	unsigned int val = ARIZONA_ACCDET_MODE_HPL;
+	unsigned int dbtime;
 
 	device_property_read_u32(arizona->dev, "wlf,hpdet-channel", &val);
 	switch (val) {
@@ -1128,6 +1130,34 @@ static int arizona_extcon_device_get_pdata(struct arizona *arizona)
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
+	dbtime = 0;
+	device_property_read_u32(arizona->dev, "wlf,micd-dbtime", &dbtime);
+	switch (dbtime) {
+	case 2:
+		pdata->micd_dbtime = 0x10000;
+		break;
+	case 4:
+		pdata->micd_dbtime = 0x0001;
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
 
-- 
1.7.2.5
