From: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Subject: [PATCH V4 1/3] mfd: arizona: factor out DCVDD isolation control
Date: Wed, 12 Aug 2015 12:58:10 +0100
Message-ID: <1439380692-7848-2-git-send-email-rf@opensource.wolfsonmicro.com>
References: <1439380692-7848-1-git-send-email-rf@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439380692-7848-1-git-send-email-rf@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: sameo@linux.intel.com, patches@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Currently DCVDD isolation is enabled and disabled for
runtime_suspend and runtime_resume. Future codecs will not
have the isolation control so to prepare for these codecs
this patch factors out the isolation control allowing it to
be called as needed in the existing codec-specific switch cases.

Signed-off-by: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
---
 drivers/mfd/arizona-core.c | 108 ++++++++++++++++++++++++++-------------------
 1 file changed, 62 insertions(+), 46 deletions(-)

diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
index bc814b0..33f3db4 100644
--- a/drivers/mfd/arizona-core.c
+++ b/drivers/mfd/arizona-core.c
@@ -462,6 +462,33 @@ static int wm5102_clear_write_sequencer(struct arizona *arizona)
 }
 
 #ifdef CONFIG_PM
+static int arizona_isolate_dcvdd(struct arizona *arizona)
+{
+	int ret;
+
+	ret = regmap_update_bits(arizona->regmap,
+				 ARIZONA_ISOLATION_CONTROL,
+				 ARIZONA_ISOLATE_DCVDD1,
+				 ARIZONA_ISOLATE_DCVDD1);
+	if (ret != 0)
+		dev_err(arizona->dev, "Failed to isolate DCVDD: %d\n", ret);
+
+	return ret;
+}
+
+static int arizona_connect_dcvdd(struct arizona *arizona)
+{
+	int ret;
+
+	ret = regmap_update_bits(arizona->regmap,
+				 ARIZONA_ISOLATION_CONTROL,
+				 ARIZONA_ISOLATE_DCVDD1, 0);
+	if (ret != 0)
+		dev_err(arizona->dev, "Failed to connect DCVDD: %d\n", ret);
+
+	return ret;
+}
+
 static int arizona_runtime_resume(struct device *dev)
 {
 	struct arizona *arizona = dev_get_drvdata(dev);
@@ -501,14 +528,9 @@ static int arizona_runtime_resume(struct device *dev)
 	switch (arizona->type) {
 	case WM5102:
 		if (arizona->external_dcvdd) {
-			ret = regmap_update_bits(arizona->regmap,
-						 ARIZONA_ISOLATION_CONTROL,
-						 ARIZONA_ISOLATE_DCVDD1, 0);
-			if (ret != 0) {
-				dev_err(arizona->dev,
-					"Failed to connect DCVDD: %d\n", ret);
+			ret = arizona_connect_dcvdd(arizona);
+			if (ret != 0)
 				goto err;
-			}
 		}
 
 		ret = wm5102_patch(arizona);
@@ -533,14 +555,9 @@ static int arizona_runtime_resume(struct device *dev)
 			goto err;
 
 		if (arizona->external_dcvdd) {
-			ret = regmap_update_bits(arizona->regmap,
-						 ARIZONA_ISOLATION_CONTROL,
-						 ARIZONA_ISOLATE_DCVDD1, 0);
-			if (ret) {
-				dev_err(arizona->dev,
-					"Failed to connect DCVDD: %d\n", ret);
+			ret = arizona_connect_dcvdd(arizona);
+			if (ret != 0)
 				goto err;
-			}
 		} else {
 			/*
 			 * As this is only called for the internal regulator
@@ -572,14 +589,9 @@ static int arizona_runtime_resume(struct device *dev)
 		}
 
 		if (arizona->external_dcvdd) {
-			ret = regmap_update_bits(arizona->regmap,
-						 ARIZONA_ISOLATION_CONTROL,
-						 ARIZONA_ISOLATE_DCVDD1, 0);
-			if (ret != 0) {
-				dev_err(arizona->dev,
-					"Failed to connect DCVDD: %d\n", ret);
+			ret = arizona_connect_dcvdd(arizona);
+			if (ret != 0)
 				goto err;
-			}
 		}
 		break;
 	}
@@ -612,37 +624,36 @@ static int arizona_runtime_suspend(struct device *dev)
 		return ret;
 	}
 
-	if (arizona->external_dcvdd) {
-		ret = regmap_update_bits(arizona->regmap,
-					 ARIZONA_ISOLATION_CONTROL,
-					 ARIZONA_ISOLATE_DCVDD1,
-					 ARIZONA_ISOLATE_DCVDD1);
-		if (ret != 0) {
-			dev_err(arizona->dev, "Failed to isolate DCVDD: %d\n",
-				ret);
-			return ret;
-		}
-	}
-
 	switch (arizona->type) {
 	case WM5110:
 	case WM8280:
-		if (arizona->external_dcvdd)
-			break;
-
-		/*
-		 * As this is only called for the internal regulator
-		 * (where we know voltage ranges available) it is ok
-		 * to request an exact range.
-		 */
-		ret = regulator_set_voltage(arizona->dcvdd, 1175000, 1175000);
-		if (ret < 0) {
-			dev_err(arizona->dev,
-				"Failed to set suspend voltage: %d\n", ret);
-			return ret;
+		if (arizona->external_dcvdd) {
+			ret = arizona_isolate_dcvdd(arizona);
+			if (ret != 0)
+				return ret;
+		} else {
+			/*
+			 * As this is only called for the internal regulator
+			 * (where we know voltage ranges available) it is ok
+			 * to request an exact range.
+			 */
+			ret = regulator_set_voltage(arizona->dcvdd,
+						    1175000, 1175000);
+			if (ret < 0) {
+				dev_err(arizona->dev,
+					"Failed to set suspend voltage: %d\n",
+					ret);
+				return ret;
+			}
 		}
 		break;
 	case WM5102:
+		if (arizona->external_dcvdd) {
+			ret = arizona_isolate_dcvdd(arizona);
+			if (ret != 0)
+				return ret;
+		}
+
 		if (!(val & ARIZONA_JD1_ENA)) {
 			ret = regmap_write(arizona->regmap,
 					   ARIZONA_WRITE_SEQUENCER_CTRL_3, 0x0);
@@ -655,6 +666,11 @@ static int arizona_runtime_suspend(struct device *dev)
 		}
 		break;
 	default:
+		if (arizona->external_dcvdd) {
+			ret = arizona_isolate_dcvdd(arizona);
+			if (ret != 0)
+				return ret;
+		}
 		break;
 	}
 
-- 
1.9.1
