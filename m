Return-Path: <SRS0=SxbK=JL=linaro.org=vinod.koul@kernel.org>
From: Vinod Koul <vinod.koul@linaro.org>
Subject: [PATCH v2 4/5] input: pm8941-pwrkey: Abstract register offsets and event code
Date: Mon, 25 Jun 2018 10:39:37 +0530
Message-Id: <20180625050938.4700-5-vkoul@kernel.org>
In-Reply-To: <20180625050938.4700-1-vkoul@kernel.org>
References: <20180625050938.4700-1-vkoul@kernel.org>
To: linux-input@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
List-ID: <devicetree@vger.kernel.org>

In order to support resin thru the pwrkey driver (they are very
similar in nature) we need to abstract the handling in this driver.

First we abstract pull_up_bit and status_bit along in driver data.
The event code sent for key events is quiried from DT.

Since the device can be child of pon lookup regmap and reg from
parent if lookup fails (we are child).

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/input/misc/pm8941-pwrkey.c | 61 ++++++++++++++++++++++++++++++--------
 1 file changed, 48 insertions(+), 13 deletions(-)

diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
index 18ad956454f1..b2c1093f7d62 100644
--- a/drivers/input/misc/pm8941-pwrkey.c
+++ b/drivers/input/misc/pm8941-pwrkey.c
@@ -20,6 +20,7 @@
 #include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
 #include <linux/regmap.h>
@@ -42,6 +43,10 @@
 #define PON_DBC_CTL			0x71
 #define  PON_DBC_DELAY_MASK		0x7
 
+struct pm8941_data {
+	unsigned int pull_up_bit;
+	unsigned int status_bit;
+};
 
 struct pm8941_pwrkey {
 	struct device *dev;
@@ -52,6 +57,9 @@ struct pm8941_pwrkey {
 
 	unsigned int revision;
 	struct notifier_block reboot_notifier;
+
+	unsigned int code;
+	const struct pm8941_data *data;
 };
 
 static int pm8941_reboot_notify(struct notifier_block *nb,
@@ -124,7 +132,8 @@ static irqreturn_t pm8941_pwrkey_irq(int irq, void *_data)
 	if (error)
 		return IRQ_HANDLED;
 
-	input_report_key(pwrkey->input, KEY_POWER, !!(sts & PON_KPDPWR_N_SET));
+	input_report_key(pwrkey->input, pwrkey->code,
+			 sts & pwrkey->data->status_bit);
 	input_sync(pwrkey->input);
 
 	return IRQ_HANDLED;
@@ -157,6 +166,7 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
 {
 	struct pm8941_pwrkey *pwrkey;
 	bool pull_up;
+	struct device *parent;
 	u32 req_delay;
 	int error;
 
@@ -175,12 +185,30 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	pwrkey->dev = &pdev->dev;
+	pwrkey->data = of_device_get_match_data(&pdev->dev);
 
-	pwrkey->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	parent = pdev->dev.parent;
+	pwrkey->regmap = dev_get_regmap(parent, NULL);
 	if (!pwrkey->regmap) {
-		dev_err(&pdev->dev, "failed to locate regmap\n");
-		return -ENODEV;
+		/*
+		 * we failed to get regmap for parent
+		 * Check if we are child on pon and read regmap and reg from
+		 * parent
+		 */
+		pwrkey->regmap = dev_get_regmap(parent->parent, NULL);
+		if (!pwrkey->regmap) {
+			dev_err(&pdev->dev, "failed to locate regmap\n");
+			return -ENODEV;
+		}
+
+		error = of_property_read_u32(parent->of_node,
+					     "reg", &pwrkey->baseaddr);
+	} else {
+		error = of_property_read_u32(pdev->dev.of_node, "reg",
+					     &pwrkey->baseaddr);
 	}
+	if (error)
+		return error;
 
 	pwrkey->irq = platform_get_irq(pdev, 0);
 	if (pwrkey->irq < 0) {
@@ -188,11 +216,6 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
 		return pwrkey->irq;
 	}
 
-	error = of_property_read_u32(pdev->dev.of_node, "reg",
-				     &pwrkey->baseaddr);
-	if (error)
-		return error;
-
 	error = regmap_read(pwrkey->regmap, pwrkey->baseaddr + PON_REV2,
 			    &pwrkey->revision);
 	if (error) {
@@ -200,13 +223,20 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
 		return error;
 	}
 
+	error = of_property_read_u32(pdev->dev.of_node, "linux,code",
+				     &pwrkey->code);
+	if (error) {
+		dev_info(&pdev->dev, "no linux,code assuming power%d\n", error);
+		pwrkey->code = KEY_POWER;
+	}
+
 	pwrkey->input = devm_input_allocate_device(&pdev->dev);
 	if (!pwrkey->input) {
 		dev_dbg(&pdev->dev, "unable to allocate input device\n");
 		return -ENOMEM;
 	}
 
-	input_set_capability(pwrkey->input, EV_KEY, KEY_POWER);
+	input_set_capability(pwrkey->input, EV_KEY, pwrkey->code);
 
 	pwrkey->input->name = "pm8941_pwrkey";
 	pwrkey->input->phys = "pm8941_pwrkey/input0";
@@ -225,8 +255,8 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
 
 	error = regmap_update_bits(pwrkey->regmap,
 				   pwrkey->baseaddr + PON_PULL_CTL,
-				   PON_KPDPWR_PULL_UP,
-				   pull_up ? PON_KPDPWR_PULL_UP : 0);
+				   pwrkey->data->pull_up_bit,
+				   pull_up ? pwrkey->data->pull_up_bit : 0);
 	if (error) {
 		dev_err(&pdev->dev, "failed to set pull: %d\n", error);
 		return error;
@@ -271,8 +301,13 @@ static int pm8941_pwrkey_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct pm8941_data pwrkey_data = {
+	.pull_up_bit = PON_KPDPWR_PULL_UP,
+	.status_bit = PON_KPDPWR_N_SET,
+};
+
 static const struct of_device_id pm8941_pwr_key_id_table[] = {
-	{ .compatible = "qcom,pm8941-pwrkey" },
+	{ .compatible = "qcom,pm8941-pwrkey", .data = &pwrkey_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pm8941_pwr_key_id_table);
-- 
2.14.4
