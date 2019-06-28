Return-Path: <SRS0=7p7P=U3=vger.kernel.org=devicetree-owner@kernel.org>
Received: from anchovy1.45ru.net.au ([203.30.46.145]:34255 "EHLO
        anchovy1.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbfF1DZz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Jun 2019 23:25:55 -0400
From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH v2 2/2] clk: clk-cdce925: Add regulator support
Date: Fri, 28 Jun 2019 11:19:10 +0800
Message-Id: <1561691950-42154-3-git-send-email-preid@electromag.com.au>
In-Reply-To: <1561691950-42154-1-git-send-email-preid@electromag.com.au>
References: <1561691950-42154-1-git-send-email-preid@electromag.com.au>
Sender: devicetree-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, preid@electromag.com.au, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The cdce925 power supplies could be controllable on some platforms.
Enable them before communicating with the cdce925.

Signed-off-by: Phil Reid <preid@electromag.com.au>
---
 drivers/clk/clk-cdce925.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/clk/clk-cdce925.c b/drivers/clk/clk-cdce925.c
index a98b3f19..2678ee6 100644
--- a/drivers/clk/clk-cdce925.c
+++ b/drivers/clk/clk-cdce925.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/gcd.h>
 
@@ -602,6 +603,30 @@ static int cdce925_regmap_i2c_read(void *context,
 	return &data->clk[idx].hw;
 }
 
+static void cdce925_regulator_disable(void *regulator)
+{
+	regulator_disable(regulator);
+}
+
+static int cdce925_regulator_enable(struct device *dev, const char *name)
+{
+	struct regulator *regulator;
+	int err;
+
+	regulator = devm_regulator_get(dev, name);
+	if (IS_ERR(regulator))
+		return PTR_ERR(regulator);
+
+	err = regulator_enable(regulator);
+	if (err) {
+		dev_err(dev, "Failed to enable %s: %d\n", name, err);
+		return err;
+	}
+
+	return devm_add_action_or_reset(dev, cdce925_regulator_disable,
+					regulator);
+}
+
 /* The CDCE925 uses a funky way to read/write registers. Bulk mode is
  * just weird, so just use the single byte mode exclusively. */
 static struct regmap_bus regmap_cdce925_bus = {
@@ -630,6 +655,15 @@ static int cdce925_probe(struct i2c_client *client,
 	};
 
 	dev_dbg(&client->dev, "%s\n", __func__);
+
+	err = cdce925_regulator_enable(&client->dev, "vdd");
+	if (err)
+		return err;
+
+	err = cdce925_regulator_enable(&client->dev, "vddout");
+	if (err)
+		return err;
+
 	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
-- 
1.8.3.1
