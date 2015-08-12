From: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Subject: [PATCH V4 2/3] mfd: arizona: factor out checking of jack detection state
Date: Wed, 12 Aug 2015 12:58:11 +0100
Message-ID: <1439380692-7848-3-git-send-email-rf@opensource.wolfsonmicro.com>
References: <1439380692-7848-1-git-send-email-rf@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439380692-7848-1-git-send-email-rf@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: sameo@linux.intel.com, patches@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Currently runtime_suspend will fully power off the codec if
the jack detection is not enabled. Not all future codecs will
have jack detection so to prepare for these codecs this patch
factors out the check so that it be called as needed in the
existing codec-specific switch cases.

Signed-off-by: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
---
 drivers/mfd/arizona-core.c | 41 ++++++++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
index 33f3db4..43ca30b 100644
--- a/drivers/mfd/arizona-core.c
+++ b/drivers/mfd/arizona-core.c
@@ -489,6 +489,23 @@ static int arizona_connect_dcvdd(struct arizona *arizona)
 	return ret;
 }
 
+static int arizona_is_jack_det_active(struct arizona *arizona)
+{
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(arizona->regmap, ARIZONA_JACK_DETECT_ANALOGUE, &val);
+	if (ret) {
+		dev_err(arizona->dev,
+			"Failed to check jack det status: %d\n", ret);
+		return ret;
+	} else if (val & ARIZONA_JD1_ENA) {
+		return 1;
+	} else {
+		return 0;
+	}
+}
+
 static int arizona_runtime_resume(struct device *dev)
 {
 	struct arizona *arizona = dev_get_drvdata(dev);
@@ -613,20 +630,18 @@ err:
 static int arizona_runtime_suspend(struct device *dev)
 {
 	struct arizona *arizona = dev_get_drvdata(dev);
-	unsigned int val;
+	unsigned int jd_active = 0;
 	int ret;
 
 	dev_dbg(arizona->dev, "Entering AoD mode\n");
 
-	ret = regmap_read(arizona->regmap, ARIZONA_JACK_DETECT_ANALOGUE, &val);
-	if (ret) {
-		dev_err(dev, "Failed to check jack det status: %d\n", ret);
-		return ret;
-	}
-
 	switch (arizona->type) {
 	case WM5110:
 	case WM8280:
+		jd_active = arizona_is_jack_det_active(arizona);
+		if (jd_active < 0)
+			return jd_active;
+
 		if (arizona->external_dcvdd) {
 			ret = arizona_isolate_dcvdd(arizona);
 			if (ret != 0)
@@ -648,13 +663,17 @@ static int arizona_runtime_suspend(struct device *dev)
 		}
 		break;
 	case WM5102:
+		jd_active = arizona_is_jack_det_active(arizona);
+		if (jd_active < 0)
+			return jd_active;
+
 		if (arizona->external_dcvdd) {
 			ret = arizona_isolate_dcvdd(arizona);
 			if (ret != 0)
 				return ret;
 		}
 
-		if (!(val & ARIZONA_JD1_ENA)) {
+		if (!jd_active) {
 			ret = regmap_write(arizona->regmap,
 					   ARIZONA_WRITE_SEQUENCER_CTRL_3, 0x0);
 			if (ret) {
@@ -666,6 +685,10 @@ static int arizona_runtime_suspend(struct device *dev)
 		}
 		break;
 	default:
+		jd_active = arizona_is_jack_det_active(arizona);
+		if (jd_active < 0)
+			return jd_active;
+
 		if (arizona->external_dcvdd) {
 			ret = arizona_isolate_dcvdd(arizona);
 			if (ret != 0)
@@ -679,7 +702,7 @@ static int arizona_runtime_suspend(struct device *dev)
 	regulator_disable(arizona->dcvdd);
 
 	/* Allow us to completely power down if no jack detection */
-	if (!(val & ARIZONA_JD1_ENA)) {
+	if (!jd_active) {
 		dev_dbg(arizona->dev, "Fully powering off\n");
 
 		arizona->has_fully_powered_off = true;
-- 
1.9.1
