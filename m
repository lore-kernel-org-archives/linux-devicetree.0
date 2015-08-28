From: Milo Kim <milo.kim@ti.com>
Subject: [RFC 3/4] mfd: tps65910: use of_dev_get_platdata()
Date: Fri, 28 Aug 2015 18:12:07 +0900
Message-ID: <1440753128-3288-4-git-send-email-milo.kim@ti.com>
References: <1440753128-3288-1-git-send-email-milo.kim@ti.com>
 <1440753128-3288-2-git-send-email-milo.kim@ti.com>
 <1440753128-3288-3-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440753128-3288-3-git-send-email-milo.kim@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@linaro.org, devicetree@vger.kernel.org
Cc: Milo Kim <milo.kim@ti.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Platform data allocation, CONFIG_OF and condition statements are supported
in of_dev_get_platdata().
This patch shows how to use private data in each parser function.
tps65910 calls of_dev_get_platdata() with driver private data, 'chip_id'.
This data is used in tps65910_parse_dt().

'of_pmic_plat_data' is unnecessary any more. IRQ number is updated after
parsing the DT.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Felipe Balbi <balbi@ti.com>
Cc: Grant Likely <grant.likely@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Milo Kim <milo.kim@ti.com>
---
 drivers/mfd/tps65910.c | 49 ++++++++++++++++---------------------------------
 1 file changed, 16 insertions(+), 33 deletions(-)

diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index 7612d89..2a068d7 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -378,7 +378,6 @@ err_sleep_init:
 	return ret;
 }
 
-#ifdef CONFIG_OF
 static const struct of_device_id tps65910_of_match[] = {
 	{ .compatible = "ti,tps65910", .data = (void *)TPS65910},
 	{ .compatible = "ti,tps65911", .data = (void *)TPS65911},
@@ -386,30 +385,23 @@ static const struct of_device_id tps65910_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tps65910_of_match);
 
-static struct tps65910_board *tps65910_parse_dt(struct i2c_client *client,
-						unsigned long *chip_id)
+static int tps65910_parse_dt(struct device *dev, void *data, void *priv)
 {
-	struct device_node *np = client->dev.of_node;
-	struct tps65910_board *board_info;
+	struct device_node *np = dev->of_node;
+	struct tps65910_board *board_info = data;
+	unsigned long *chip_id = priv;
 	unsigned int prop;
 	const struct of_device_id *match;
 	int ret = 0;
 
-	match = of_match_device(tps65910_of_match, &client->dev);
+	match = of_match_device(tps65910_of_match, dev);
 	if (!match) {
-		dev_err(&client->dev, "Failed to find matching dt id\n");
-		return NULL;
+		dev_err(dev, "Failed to find matching dt id\n");
+		return -EINVAL;
 	}
 
 	*chip_id  = (unsigned long)match->data;
 
-	board_info = devm_kzalloc(&client->dev, sizeof(*board_info),
-			GFP_KERNEL);
-	if (!board_info) {
-		dev_err(&client->dev, "Failed to allocate pdata\n");
-		return NULL;
-	}
-
 	ret = of_property_read_u32(np, "ti,vmbch-threshold", &prop);
 	if (!ret)
 		board_info->vmbch_threshold = prop;
@@ -421,21 +413,12 @@ static struct tps65910_board *tps65910_parse_dt(struct i2c_client *client,
 	prop = of_property_read_bool(np, "ti,en-ck32k-xtal");
 	board_info->en_ck32k_xtal = prop;
 
-	board_info->irq = client->irq;
 	board_info->irq_base = -1;
 	board_info->pm_off = of_property_read_bool(np,
 			"ti,system-power-controller");
 
-	return board_info;
-}
-#else
-static inline
-struct tps65910_board *tps65910_parse_dt(struct i2c_client *client,
-					 unsigned long *chip_id)
-{
-	return NULL;
+	return 0;
 }
-#endif
 
 static struct i2c_client *tps65910_i2c_client;
 static void tps65910_power_off(void)
@@ -457,21 +440,21 @@ static int tps65910_i2c_probe(struct i2c_client *i2c,
 {
 	struct tps65910 *tps65910;
 	struct tps65910_board *pmic_plat_data;
-	struct tps65910_board *of_pmic_plat_data = NULL;
 	struct tps65910_platform_data *init_data;
 	unsigned long chip_id = id->driver_data;
 	int ret = 0;
 
-	pmic_plat_data = dev_get_platdata(&i2c->dev);
-
-	if (!pmic_plat_data && i2c->dev.of_node) {
-		pmic_plat_data = tps65910_parse_dt(i2c, &chip_id);
-		of_pmic_plat_data = pmic_plat_data;
-	}
+	pmic_plat_data = of_dev_get_platdata(&i2c->dev,
+					     sizeof(*pmic_plat_data),
+					     tps65910_parse_dt, &chip_id);
+	if (IS_ERR(pmic_plat_data))
+		return PTR_ERR(pmic_plat_data);
 
 	if (!pmic_plat_data)
 		return -EINVAL;
 
+	pmic_plat_data->irq = i2c->irq;
+
 	init_data = devm_kzalloc(&i2c->dev, sizeof(*init_data), GFP_KERNEL);
 	if (init_data == NULL)
 		return -ENOMEM;
@@ -480,7 +463,7 @@ static int tps65910_i2c_probe(struct i2c_client *i2c,
 	if (tps65910 == NULL)
 		return -ENOMEM;
 
-	tps65910->of_plat_data = of_pmic_plat_data;
+	tps65910->of_plat_data = pmic_plat_data;
 	i2c_set_clientdata(i2c, tps65910);
 	tps65910->dev = &i2c->dev;
 	tps65910->i2c_client = i2c;
-- 
1.9.1
