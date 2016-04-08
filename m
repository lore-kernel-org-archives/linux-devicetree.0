From: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Subject: [RFC 1/3] mfd: RK808: Add RK818 support
Date: Fri, 8 Apr 2016 11:47:39 +0200
Message-ID: <1460108861-32818-2-git-send-email-w.egorov@phytec.de>
References: <1460108861-32818-1-git-send-email-w.egorov@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1460108861-32818-1-git-send-email-w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

The RK818 chip is a power management IC for multimedia and handheld
devices. It contains the following components:

- Regulators
- RTC
- Clkout
- battery support

Both chips RK808 and RK818 are using a similar register map.
So we can reuse the RTC and Clkout functionality.

Signed-off-by: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
---
 drivers/mfd/Kconfig       |   6 +-
 drivers/mfd/rk808.c       | 279 +++++++++++++++++++++++++++++++++++++---------
 include/linux/mfd/rk808.h | 182 ++++++++++++++++++++++++++++--
 3 files changed, 405 insertions(+), 62 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index eea61e3..7cbbfa4 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -813,14 +813,14 @@ config MFD_RC5T583
 	  Additional drivers must be enabled in order to use the
 	  different functionality of the device.
 
-config MFD_RK808
-	tristate "Rockchip RK808 Power Management chip"
+config MFD_RK8XX
+	tristate "Rockchip RK8xx Power Management chip"
 	depends on I2C && OF
 	select MFD_CORE
 	select REGMAP_I2C
 	select REGMAP_IRQ
 	help
-	  If you say yes here you get support for the RK808
+	  If you say yes here you get support for the RK808 and RK818
 	  Power Management chips.
 	  This driver provides common support for accessing the device
 	  through I2C interface. The device supports multiple sub-devices
diff --git a/drivers/mfd/rk808.c b/drivers/mfd/rk808.c
index 4b1e439..d3fd8ef 100644
--- a/drivers/mfd/rk808.c
+++ b/drivers/mfd/rk808.c
@@ -1,11 +1,14 @@
 /*
- * MFD core driver for Rockchip RK808
+ * MFD core driver for Rockchip RK8xx
  *
  * Copyright (c) 2014, Fuzhou Rockchip Electronics Co., Ltd
  *
  * Author: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
  * Author: Zhang Qing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
  *
+ * Copyright (C) 2016 PHYTEC Messtechnik GmbH
+ * Author: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
+ *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
  * version 2, as published by the Free Software Foundation.
@@ -22,14 +25,14 @@
 #include <linux/mfd/core.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include <linux/of_device.h>
 
-struct rk808_reg_data {
-	int addr;
-	int mask;
-	int value;
+static const char * const rk8xx_model_names[] = {
+	"RK808",
+	"RK818",
 };
 
-static bool rk808_is_volatile_reg(struct device *dev, unsigned int reg)
+static bool rk8xx_is_volatile_reg(struct device *dev, unsigned int reg)
 {
 	/*
 	 * Notes:
@@ -62,7 +65,15 @@ static const struct regmap_config rk808_regmap_config = {
 	.val_bits = 8,
 	.max_register = RK808_IO_POL_REG,
 	.cache_type = REGCACHE_RBTREE,
-	.volatile_reg = rk808_is_volatile_reg,
+	.volatile_reg = rk8xx_is_volatile_reg,
+};
+
+static const struct regmap_config rk818_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = RK818_USB_CTRL_REG,
+	.cache_type = REGCACHE_RBTREE,
+	.volatile_reg = rk8xx_is_volatile_reg,
 };
 
 static struct resource rtc_resources[] = {
@@ -83,7 +94,17 @@ static const struct mfd_cell rk808s[] = {
 	},
 };
 
-static const struct rk808_reg_data pre_init_reg[] = {
+static const struct mfd_cell rk818s[] = {
+	{ .name = "rk808-clkout", },
+	{ .name = "rk808-regulator", },
+	{
+		.name = "rk808-rtc",
+		.num_resources = ARRAY_SIZE(rtc_resources),
+		.resources = &rtc_resources[0],
+	},
+};
+
+static const struct rk8xx_reg_data rk808_pre_init_reg[] = {
 	{ RK808_BUCK3_CONFIG_REG, BUCK_ILMIN_MASK,  BUCK_ILMIN_150MA },
 	{ RK808_BUCK4_CONFIG_REG, BUCK_ILMIN_MASK,  BUCK_ILMIN_200MA },
 	{ RK808_BOOST_CONFIG_REG, BOOST_ILMIN_MASK, BOOST_ILMIN_100MA },
@@ -94,6 +115,27 @@ static const struct rk808_reg_data pre_init_reg[] = {
 						    VB_LO_SEL_3500MV },
 };
 
+static const struct rk8xx_reg_data rk818_pre_init_reg[] = {
+	{ RK818_USB_CTRL_REG,	RK818_USB_ILIM_SEL_MASK,
+						RK818_USB_ILMIN_2000MA },
+	/* close charger when usb lower then 3.4V */
+	{ RK818_USB_CTRL_REG,	RK818_USB_CHG_SD_VSEL_MASK, (0x7 << 4) },
+	/* no action when vref */
+	{ RK818_H5V_EN_REG,	(0x1 << 1),	RK818_REF_RDY_CTRL },
+
+	/* enable HDMI 5V */
+	{ RK818_H5V_EN_REG,	(0x1 << 0),	RK818_H5V_EN },
+
+	/* improve efficiency */
+	{ RK818_BUCK2_CONFIG_REG, BUCK2_RATE_MASK,  BUCK_ILMIN_250MA },
+	{ RK818_BUCK4_CONFIG_REG, BUCK_ILMIN_MASK,  BUCK_ILMIN_250MA },
+
+	{ RK818_BOOST_CONFIG_REG, BOOST_ILMIN_MASK, BOOST_ILMIN_100MA },
+
+	{ RK808_VB_MON_REG,       MASK_ALL,         VB_LO_ACT |
+						    VB_LO_SEL_3500MV },
+};
+
 static const struct regmap_irq rk808_irqs[] = {
 	/* INT_STS */
 	[RK808_IRQ_VOUT_LO] = {
@@ -136,6 +178,81 @@ static const struct regmap_irq rk808_irqs[] = {
 	},
 };
 
+static const struct regmap_irq rk818_irqs[] = {
+	/* INT_STS */
+	[RK818_IRQ_VOUT_LO] = {
+		.mask = RK818_IRQ_VOUT_LO_MSK,
+		.reg_offset = 0,
+	},
+	[RK818_IRQ_VB_LO] = {
+		.mask = RK818_IRQ_VB_LO_MSK,
+		.reg_offset = 0,
+	},
+	[RK818_IRQ_PWRON] = {
+		.mask = RK818_IRQ_PWRON_MSK,
+		.reg_offset = 0,
+	},
+	[RK818_IRQ_PWRON_LP] = {
+		.mask = RK818_IRQ_PWRON_LP_MSK,
+		.reg_offset = 0,
+	},
+	[RK818_IRQ_HOTDIE] = {
+		.mask = RK818_IRQ_HOTDIE_MSK,
+		.reg_offset = 0,
+	},
+	[RK818_IRQ_RTC_ALARM] = {
+		.mask = RK818_IRQ_RTC_ALARM_MSK,
+		.reg_offset = 0,
+	},
+	[RK818_IRQ_RTC_PERIOD] = {
+		.mask = RK818_IRQ_RTC_PERIOD_MSK,
+		.reg_offset = 0,
+	},
+	[RK818_IRQ_USB_OV] = {
+		.mask = RK818_IRQ_USB_OV_MSK,
+		.reg_offset = 0,
+	},
+
+	/* INT_STS2 */
+	[RK818_IRQ_PLUG_IN] = {
+		.mask = RK818_IRQ_PLUG_IN_MSK,
+		.reg_offset = 1,
+	},
+	[RK818_IRQ_PLUG_OUT] = {
+		.mask = RK818_IRQ_PLUG_OUT_MSK,
+		.reg_offset = 1,
+	},
+	[RK818_IRQ_CHG_OK] = {
+		.mask = RK818_IRQ_CHG_OK_MSK,
+		.reg_offset = 1,
+	},
+
+	[RK818_IRQ_CHG_TE] = {
+		.mask = RK818_IRQ_CHG_TE_MSK,
+		.reg_offset = 1,
+	},
+
+	[RK818_IRQ_CHG_TS1] = {
+		.mask = RK818_IRQ_CHG_TS1_MSK,
+		.reg_offset = 1,
+	},
+
+	[RK818_IRQ_TS2] = {
+		.mask = RK818_IRQ_TS2_MSK,
+		.reg_offset = 1,
+	},
+
+	[RK818_IRQ_CHG_CVTLIM] = {
+		.mask = RK818_IRQ_CHG_CVTLIM_MSK,
+		.reg_offset = 1,
+	},
+
+	[RK818_IRQ_DISCHG_ILIM] = {
+		.mask = RK818_IRQ_DISCHG_ILIM_MSK,
+		.reg_offset = 1,
+	},
+};
+
 static struct regmap_irq_chip rk808_irq_chip = {
 	.name = "rk808",
 	.irqs = rk808_irqs,
@@ -148,15 +265,27 @@ static struct regmap_irq_chip rk808_irq_chip = {
 	.init_ack_masked = true,
 };
 
-static struct i2c_client *rk808_i2c_client;
+static struct regmap_irq_chip rk818_irq_chip = {
+	.name = "rk818",
+	.irqs = rk818_irqs,
+	.num_irqs = ARRAY_SIZE(rk808_irqs),
+	.num_regs = 2,
+	.irq_reg_stride = 2,
+	.status_base = RK808_INT_STS_REG1,
+	.mask_base = RK808_INT_STS_MSK_REG1,
+	.ack_base = RK808_INT_STS_REG1,
+	.init_ack_masked = true,
+};
+
+static struct i2c_client *rk8xx_i2c_client;
 static void rk808_device_shutdown(void)
 {
 	int ret;
-	struct rk808 *rk808 = i2c_get_clientdata(rk808_i2c_client);
+	struct rk808 *rk808 = i2c_get_clientdata(rk8xx_i2c_client);
 
 	if (!rk808) {
-		dev_warn(&rk808_i2c_client->dev,
-			 "have no rk808, so do nothing here\n");
+		dev_warn(&rk8xx_i2c_client->dev,
+			 "have no rk8xx, so do nothing here\n");
 		return;
 	}
 
@@ -164,10 +293,57 @@ static void rk808_device_shutdown(void)
 				 RK808_DEVCTRL_REG,
 				 DEV_OFF_RST, DEV_OFF_RST);
 	if (ret)
-		dev_err(&rk808_i2c_client->dev, "power off error!\n");
+		dev_err(&rk8xx_i2c_client->dev, "power off error!\n");
+}
+
+static const struct of_device_id rk8xx_of_match[] = {
+	{ .compatible = "rockchip,rk808", .data = (void *) RK808_ID },
+	{ .compatible = "rockchip,rk818", .data = (void *) RK818_ID },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, rk8xx_of_match);
+
+static int rk8xx_match_device(struct rk808 *rk808, struct device *dev)
+{
+	const struct of_device_id *of_id;
+
+	if (dev->of_node) {
+		of_id = of_match_device(rk8xx_of_match, dev);
+		if (!of_id) {
+			dev_err(dev, "Unable to match OF ID\n");
+			return -ENODEV;
+		}
+		rk808->variant = (long) of_id->data;
+	}
+
+	switch (rk808->variant) {
+	case RK808_ID:
+		rk808->nr_cells = ARRAY_SIZE(rk808s);
+		rk808->cells = rk808s;
+		rk808->regmap_cfg = &rk808_regmap_config;
+		rk808->regmap_irq_chip = &rk808_irq_chip;
+		rk808->pre_init_reg = rk808_pre_init_reg;
+		rk808->nr_pre_init_regs = ARRAY_SIZE(rk808_pre_init_reg);
+		break;
+	case RK818_ID:
+		rk808->nr_cells = ARRAY_SIZE(rk818s);
+		rk808->cells = rk818s;
+		rk808->regmap_cfg = &rk818_regmap_config;
+		rk808->regmap_irq_chip = &rk818_irq_chip;
+		rk808->pre_init_reg = rk818_pre_init_reg;
+		rk808->nr_pre_init_regs = ARRAY_SIZE(rk818_pre_init_reg);
+		break;
+	default:
+		dev_err(dev, "unsupported RK8XX ID %lu\n", rk808->variant);
+		return -EINVAL;
+	}
+	dev_info(dev, "RK8XX variant %s found\n",
+		rk8xx_model_names[rk808->variant]);
+
+	return 0;
 }
 
-static int rk808_probe(struct i2c_client *client,
+static int rk8xx_probe(struct i2c_client *client,
 		       const struct i2c_device_id *id)
 {
 	struct device_node *np = client->dev.of_node;
@@ -176,45 +352,51 @@ static int rk808_probe(struct i2c_client *client,
 	int ret;
 	int i;
 
-	if (!client->irq) {
-		dev_err(&client->dev, "No interrupt support, no core IRQ\n");
-		return -EINVAL;
-	}
-
 	rk808 = devm_kzalloc(&client->dev, sizeof(*rk808), GFP_KERNEL);
 	if (!rk808)
 		return -ENOMEM;
 
-	rk808->regmap = devm_regmap_init_i2c(client, &rk808_regmap_config);
+	ret = rk8xx_match_device(rk808, &client->dev);
+	if (ret)
+		return ret;
+
+	rk808->i2c = client;
+	i2c_set_clientdata(client, rk808);
+
+	rk808->regmap = devm_regmap_init_i2c(client, rk808->regmap_cfg);
 	if (IS_ERR(rk808->regmap)) {
 		dev_err(&client->dev, "regmap initialization failed\n");
 		return PTR_ERR(rk808->regmap);
 	}
 
-	for (i = 0; i < ARRAY_SIZE(pre_init_reg); i++) {
-		ret = regmap_update_bits(rk808->regmap, pre_init_reg[i].addr,
-					 pre_init_reg[i].mask,
-					 pre_init_reg[i].value);
-		if (ret) {
-			dev_err(&client->dev,
-				"0x%x write err\n", pre_init_reg[i].addr);
-			return ret;
-		}
+	if (!client->irq) {
+		dev_err(&client->dev, "No interrupt support, no core IRQ\n");
+		return -EINVAL;
 	}
 
 	ret = regmap_add_irq_chip(rk808->regmap, client->irq,
 				  IRQF_ONESHOT, -1,
-				  &rk808_irq_chip, &rk808->irq_data);
+				  rk808->regmap_irq_chip, &rk808->irq_data);
 	if (ret) {
 		dev_err(&client->dev, "Failed to add irq_chip %d\n", ret);
 		return ret;
 	}
 
-	rk808->i2c = client;
-	i2c_set_clientdata(client, rk808);
+	for (i = 0; i < rk808->nr_pre_init_regs; i++) {
+		ret = regmap_update_bits(rk808->regmap,
+					rk808->pre_init_reg[i].addr,
+					rk808->pre_init_reg[i].mask,
+					rk808->pre_init_reg[i].value);
+		if (ret) {
+			dev_err(&client->dev,
+				"0x%x write err\n",
+				rk808->pre_init_reg[i].addr);
+			return ret;
+		}
+	}
 
 	ret = mfd_add_devices(&client->dev, -1,
-			      rk808s, ARRAY_SIZE(rk808s),
+			      rk808->cells, rk808->nr_cells,
 			      NULL, 0, regmap_irq_get_domain(rk808->irq_data));
 	if (ret) {
 		dev_err(&client->dev, "failed to add MFD devices %d\n", ret);
@@ -224,7 +406,7 @@ static int rk808_probe(struct i2c_client *client,
 	pm_off = of_property_read_bool(np,
 				"rockchip,system-power-controller");
 	if (pm_off && !pm_power_off) {
-		rk808_i2c_client = client;
+		rk8xx_i2c_client = client;
 		pm_power_off = rk808_device_shutdown;
 	}
 
@@ -235,7 +417,7 @@ err_irq:
 	return ret;
 }
 
-static int rk808_remove(struct i2c_client *client)
+static int rk8xx_remove(struct i2c_client *client)
 {
 	struct rk808 *rk808 = i2c_get_clientdata(client);
 
@@ -246,31 +428,26 @@ static int rk808_remove(struct i2c_client *client)
 	return 0;
 }
 
-static const struct of_device_id rk808_of_match[] = {
-	{ .compatible = "rockchip,rk808" },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, rk808_of_match);
-
-static const struct i2c_device_id rk808_ids[] = {
+static const struct i2c_device_id rk8xx_ids[] = {
 	{ "rk808" },
+	{ "rk818" },
 	{ },
 };
-MODULE_DEVICE_TABLE(i2c, rk808_ids);
+MODULE_DEVICE_TABLE(i2c, rk8xx_ids);
 
-static struct i2c_driver rk808_i2c_driver = {
+static struct i2c_driver rk8xx_i2c_driver = {
 	.driver = {
-		.name = "rk808",
-		.of_match_table = rk808_of_match,
+		.name = "rk8xx",
+		.of_match_table = rk8xx_of_match,
 	},
-	.probe    = rk808_probe,
-	.remove   = rk808_remove,
-	.id_table = rk808_ids,
+	.probe    = rk8xx_probe,
+	.remove   = rk8xx_remove,
+	.id_table = rk8xx_ids,
 };
 
-module_i2c_driver(rk808_i2c_driver);
+module_i2c_driver(rk8xx_i2c_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>");
 MODULE_AUTHOR("Zhang Qing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>");
-MODULE_DESCRIPTION("RK808 PMIC driver");
+MODULE_DESCRIPTION("RK8xx PMIC driver");
diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
index 441b6ee..0858219 100644
--- a/include/linux/mfd/rk808.h
+++ b/include/linux/mfd/rk808.h
@@ -1,11 +1,14 @@
 /*
- * rk808.h for Rockchip RK808
+ * rk808.h for Rockchip RK8xx
  *
  * Copyright (c) 2014, Fuzhou Rockchip Electronics Co., Ltd
  *
  * Author: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
  * Author: Zhang Qing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
  *
+ * Copyright (C) 2016 PHYTEC Messtechnik GmbH
+ * Author: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
+ *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
  * version 2, as published by the Free Software Foundation.
@@ -16,8 +19,8 @@
  * more details.
  */
 
-#ifndef __LINUX_REGULATOR_rk808_H
-#define __LINUX_REGULATOR_rk808_H
+#ifndef __LINUX_REGULATOR_rk8xx_H
+#define __LINUX_REGULATOR_rk8xx_H
 
 #include <linux/regulator/machine.h>
 #include <linux/regmap.h>
@@ -47,6 +50,28 @@ enum rk808_reg {
 	RK808_ID_SWITCH2,
 };
 
+#define RK818_NUM_REGULATORS	17
+
+enum rk818_reg {
+	RK818_ID_DCDC1,
+	RK818_ID_DCDC2,
+	RK818_ID_DCDC3,
+	RK818_ID_DCDC4,
+	RK818_ID_BOOST,
+	RK818_ID_LDO1,
+	RK818_ID_LDO2,
+	RK818_ID_LDO3,
+	RK818_ID_LDO4,
+	RK818_ID_LDO5,
+	RK818_ID_LDO6,
+	RK818_ID_LDO7,
+	RK818_ID_LDO8,
+	RK818_ID_LDO9,
+	RK818_ID_SWITCH,
+	RK818_ID_HDMI_SWITCH,
+	RK818_ID_OTG_SWITCH,
+};
+
 #define RK808_SECONDS_REG	0x00
 #define RK808_MINUTES_REG	0x01
 #define RK808_HOURS_REG		0x02
@@ -115,7 +140,92 @@ enum rk808_reg {
 #define RK808_INT_STS_MSK_REG2	0x4f
 #define RK808_IO_POL_REG	0x50
 
-/* IRQ Definitions */
+/* RK818 */
+#define RK818_DCDC1			0
+#define RK818_LDO1			4
+
+#define RK818_SECONDS_REG		0x00
+#define RK818_MINUTES_REG		0x01
+#define RK818_HOURS_REG			0x02
+#define RK818_DAYS_REG			0x03
+#define RK818_MONTHS_REG		0x04
+#define RK818_YEARS_REG			0x05
+#define RK818_WEEKS_REG			0x06
+#define RK818_ALARM_SECONDS_REG		0x07
+#define RK818_ALARM_MINUTES_REG		0x08
+#define RK818_ALARM_HOURS_REG		0x09
+#define RK818_ALARM_DAYS_REG		0x0a
+#define RK818_ALARM_MONTHS_REG		0x0b
+#define RK818_ALARM_YEARS_REG		0x0c
+#define RK818_RTC_CTRL_REG		0x10
+#define RK818_RTC_STATUS_REG		0x11
+#define RK818_RTC_INT_REG		0x12
+#define RK818_RTC_COMP_LSB_REG		0x13
+#define RK818_RTC_COMP_MSB_REG		0x14
+#define RK818_CLK32OUT_REG		0x20
+#define RK818_VB_MON_REG		0x21
+#define RK818_THERMAL_REG		0x22
+#define RK818_DCDC_EN_REG		0x23
+#define RK818_LDO_EN_REG		0x24
+#define RK818_SLEEP_SET_OFF_REG1	0x25
+#define RK818_SLEEP_SET_OFF_REG2	0x26
+#define RK818_DCDC_UV_STS_REG		0x27
+#define RK818_DCDC_UV_ACT_REG		0x28
+#define RK818_LDO_UV_STS_REG		0x29
+#define RK818_LDO_UV_ACT_REG		0x2a
+#define RK818_DCDC_PG_REG		0x2b
+#define RK818_LDO_PG_REG		0x2c
+#define RK818_VOUT_MON_TDB_REG		0x2d
+#define RK818_BUCK1_CONFIG_REG		0x2e
+#define RK818_BUCK1_ON_VSEL_REG		0x2f
+#define RK818_BUCK1_SLP_VSEL_REG	0x30
+#define RK818_BUCK2_CONFIG_REG		0x32
+#define RK818_BUCK2_ON_VSEL_REG		0x33
+#define RK818_BUCK2_SLP_VSEL_REG	0x34
+#define RK818_BUCK3_CONFIG_REG		0x36
+#define RK818_BUCK4_CONFIG_REG		0x37
+#define RK818_BUCK4_ON_VSEL_REG		0x38
+#define RK818_BUCK4_SLP_VSEL_REG	0x39
+#define RK818_BOOST_CONFIG_REG		0x3a
+#define RK818_LDO1_ON_VSEL_REG		0x3b
+#define RK818_LDO1_SLP_VSEL_REG		0x3c
+#define RK818_LDO2_ON_VSEL_REG		0x3d
+#define RK818_LDO2_SLP_VSEL_REG		0x3e
+#define RK818_LDO3_ON_VSEL_REG		0x3f
+#define RK818_LDO3_SLP_VSEL_REG		0x40
+#define RK818_LDO4_ON_VSEL_REG		0x41
+#define RK818_LDO4_SLP_VSEL_REG		0x42
+#define RK818_LDO5_ON_VSEL_REG		0x43
+#define RK818_LDO5_SLP_VSEL_REG		0x44
+#define RK818_LDO6_ON_VSEL_REG		0x45
+#define RK818_LDO6_SLP_VSEL_REG		0x46
+#define RK818_LDO7_ON_VSEL_REG		0x47
+#define RK818_LDO7_SLP_VSEL_REG		0x48
+#define RK818_LDO8_ON_VSEL_REG		0x49
+#define RK818_LDO8_SLP_VSEL_REG		0x4a
+#define RK818_BOOST_LDO9_ON_VSEL_REG	0x54
+#define RK818_BOOST_LDO9_SLP_VSEL_REG	0x55
+#define RK818_DEVCTRL_REG		0x4b
+#define RK818_INT_STS_REG1		0X4c
+#define RK818_INT_STS_MSK_REG1		0x4d
+#define RK818_INT_STS_REG2		0x4e
+#define RK818_INT_STS_MSK_REG2		0x4f
+#define RK818_IO_POL_REG		0x50
+#define RK818_H5V_EN_REG		0x52
+#define RK818_SLEEP_SET_OFF_REG3	0x53
+#define RK818_BOOST_LDO9_ON_VSEL_REG	0x54
+#define RK818_BOOST_LDO9_SLP_VSEL_REG	0x55
+#define RK818_BOOST_CTRL_REG		0x56
+#define RK818_DCDC_ILMAX		0x90
+#define RK818_USB_CTRL_REG		0xa1
+
+#define RK818_H5V_EN			BIT(0)
+#define RK818_REF_RDY_CTRL		BIT(1)
+#define RK818_USB_ILIM_SEL_MASK		0xf
+#define RK818_USB_ILMIN_2000MA		0x7
+#define RK818_USB_CHG_SD_VSEL_MASK	0x70
+
+/* RK808 IRQ Definitions */
 #define RK808_IRQ_VOUT_LO	0
 #define RK808_IRQ_VB_LO		1
 #define RK808_IRQ_PWRON		2
@@ -137,6 +247,44 @@ enum rk808_reg {
 #define RK808_IRQ_PLUG_IN_INT_MSK	BIT(0)
 #define RK808_IRQ_PLUG_OUT_INT_MSK	BIT(1)
 
+/* RK818 IRQ Definitions */
+#define RK818_IRQ_VOUT_LO	0
+#define RK818_IRQ_VB_LO		1
+#define RK818_IRQ_PWRON		2
+#define RK818_IRQ_PWRON_LP	3
+#define RK818_IRQ_HOTDIE	4
+#define RK818_IRQ_RTC_ALARM	5
+#define RK818_IRQ_RTC_PERIOD	6
+#define RK818_IRQ_USB_OV	7
+#define RK818_IRQ_PLUG_IN	8
+#define RK818_IRQ_PLUG_OUT	9
+#define RK818_IRQ_CHG_OK	10
+#define RK818_IRQ_CHG_TE	11
+#define RK818_IRQ_CHG_TS1	12
+#define RK818_IRQ_TS2		13
+#define RK818_IRQ_CHG_CVTLIM	14
+#define RK818_IRQ_DISCHG_ILIM	7
+
+#define RK818_IRQ_VOUT_LO_MSK		BIT(0)
+#define RK818_IRQ_VB_LO_MSK		BIT(1)
+#define RK818_IRQ_PWRON_MSK		BIT(2)
+#define RK818_IRQ_PWRON_LP_MSK		BIT(3)
+#define RK818_IRQ_HOTDIE_MSK		BIT(4)
+#define RK818_IRQ_RTC_ALARM_MSK		BIT(5)
+#define RK818_IRQ_RTC_PERIOD_MSK	BIT(6)
+#define RK818_IRQ_USB_OV_MSK		BIT(7)
+#define RK818_IRQ_PLUG_IN_MSK		BIT(0)
+#define RK818_IRQ_PLUG_OUT_MSK		BIT(1)
+#define RK818_IRQ_CHG_OK_MSK		BIT(2)
+#define RK818_IRQ_CHG_TE_MSK		BIT(3)
+#define RK818_IRQ_CHG_TS1_MSK		BIT(4)
+#define RK818_IRQ_TS2_MSK		BIT(5)
+#define RK818_IRQ_CHG_CVTLIM_MSK	BIT(6)
+#define RK818_IRQ_DISCHG_ILIM_MSK	BIT(7)
+
+#define RK818_NUM_IRQ		16
+
+
 #define RK808_VBAT_LOW_2V8	0x00
 #define RK808_VBAT_LOW_2V9	0x01
 #define RK808_VBAT_LOW_3V0	0x02
@@ -191,9 +339,27 @@ enum {
 	BOOST_ILMIN_250MA,
 };
 
+enum {
+	RK808_ID = 0,
+	RK818_ID,
+};
+
+struct rk8xx_reg_data {
+	int addr;
+	int mask;
+	int value;
+};
+
 struct rk808 {
-	struct i2c_client *i2c;
-	struct regmap_irq_chip_data *irq_data;
-	struct regmap *regmap;
+	struct i2c_client		*i2c;
+	struct regmap_irq_chip_data	*irq_data;
+	struct regmap			*regmap;
+	long				variant;
+	int				nr_cells;
+	const struct mfd_cell		*cells;
+	const struct regmap_config	*regmap_cfg;
+	const struct regmap_irq_chip	*regmap_irq_chip;
+	const struct rk8xx_reg_data	*pre_init_reg;
+	int				nr_pre_init_regs;
 };
-#endif /* __LINUX_REGULATOR_rk808_H */
+#endif /* __LINUX_REGULATOR_rk8xx_H */
-- 
1.9.1
