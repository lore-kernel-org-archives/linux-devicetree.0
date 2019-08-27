From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: [PATCH 2/8] regulator: add support for SY8824C regulator
Date: Tue, 27 Aug 2019 08:45:33 +0000
Message-ID: <20190827163418.1a32fc48@xhacker.debian>
References: <20190827163252.4982af95@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190827163252.4982af95@xhacker.debian>
Content-Language: en-US
Content-ID: <22CDAC869B941D468C6D90BB0FD699A0@namprd03.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

SY8824C is an I2C attached single output regulator made by Silergy Corp,
which is used on several Synaptics berlin platforms to control the
power supply of the ARM cores.

Add a driver for it.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/regulator/Kconfig   |   7 ++
 drivers/regulator/Makefile  |   1 +
 drivers/regulator/sy8824x.c | 192 ++++++++++++++++++++++++++++++++++++
 3 files changed, 200 insertions(+)
 create mode 100644 drivers/regulator/sy8824x.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index b57093d7c01f..e8093a909e85 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -906,6 +906,13 @@ config REGULATOR_SY8106A
 	help
 	  This driver supports SY8106A single output regulator.
=20
+config REGULATOR_SY8824X
+	tristate "Silergy SY8824C regulator"
+	depends on I2C && (OF || COMPILE_TEST)
+	select REGMAP_I2C
+	help
+	  This driver supports SY8824C single output regulator.
+
 config REGULATOR_TPS51632
 	tristate "TI TPS51632 Power Regulator"
 	depends on I2C
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index eef73b5a35a4..922bf975070f 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -111,6 +111,7 @@ obj-$(CONFIG_REGULATOR_STM32_PWR) +=3D stm32-pwr.o
 obj-$(CONFIG_REGULATOR_STPMIC1) +=3D stpmic1_regulator.o
 obj-$(CONFIG_REGULATOR_STW481X_VMMC) +=3D stw481x-vmmc.o
 obj-$(CONFIG_REGULATOR_SY8106A) +=3D sy8106a-regulator.o
+obj-$(CONFIG_REGULATOR_SY8824X) +=3D sy8824x.o
 obj-$(CONFIG_REGULATOR_TI_ABB) +=3D ti-abb-regulator.o
 obj-$(CONFIG_REGULATOR_TPS6105X) +=3D tps6105x-regulator.o
 obj-$(CONFIG_REGULATOR_TPS62360) +=3D tps62360-regulator.o
diff --git a/drivers/regulator/sy8824x.c b/drivers/regulator/sy8824x.c
new file mode 100644
index 000000000000..2d8a61ca6643
--- /dev/null
+++ b/drivers/regulator/sy8824x.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SY8824C regulator driver
+ *
+ * Copyright (C) 2019 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#include <linux/module.h>
+#include <linux/i2c.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/of_regulator.h>
+
+#define BUCK_EN		(1 << 7)
+#define MODE		(1 << 6)
+
+struct sy8824_config {
+	/* registers */
+	unsigned int vol_reg;
+	unsigned int mode_reg;
+	unsigned int enable_reg;
+	/* Voltage range and step(linear) */
+	unsigned int vsel_min;
+	unsigned int vsel_step;
+	unsigned int vsel_count;
+};
+
+struct sy8824_device_info {
+	struct device *dev;
+	struct regulator_desc desc;
+	struct regulator_init_data *regulator;
+	const struct sy8824_config *cfg;
+};
+
+static int sy8824_set_mode(struct regulator_dev *rdev, unsigned int mode)
+{
+	struct sy8824_device_info *di =3D rdev_get_drvdata(rdev);
+	const struct sy8824_config *cfg =3D di->cfg;
+
+	switch (mode) {
+	case REGULATOR_MODE_FAST:
+		regmap_update_bits(rdev->regmap, cfg->mode_reg, MODE, MODE);
+		break;
+	case REGULATOR_MODE_NORMAL:
+		regmap_update_bits(rdev->regmap, cfg->mode_reg, MODE, 0);
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static unsigned int sy8824_get_mode(struct regulator_dev *rdev)
+{
+	struct sy8824_device_info *di =3D rdev_get_drvdata(rdev);
+	const struct sy8824_config *cfg =3D di->cfg;
+	u32 val;
+	int ret =3D 0;
+
+	ret =3D regmap_read(rdev->regmap, cfg->mode_reg, &val);
+	if (ret < 0)
+		return ret;
+	if (val & MODE)
+		return REGULATOR_MODE_FAST;
+	else
+		return REGULATOR_MODE_NORMAL;
+}
+
+static const struct regulator_ops sy8824_regulator_ops =3D {
+	.set_voltage_sel =3D regulator_set_voltage_sel_regmap,
+	.get_voltage_sel =3D regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel =3D regulator_set_voltage_time_sel,
+	.map_voltage =3D regulator_map_voltage_linear,
+	.list_voltage =3D regulator_list_voltage_linear,
+	.enable =3D regulator_enable_regmap,
+	.disable =3D regulator_disable_regmap,
+	.is_enabled =3D regulator_is_enabled_regmap,
+	.set_mode =3D sy8824_set_mode,
+	.get_mode =3D sy8824_get_mode,
+};
+
+static int sy8824_regulator_register(struct sy8824_device_info *di,
+			struct regulator_config *config)
+{
+	struct regulator_desc *rdesc =3D &di->desc;
+	const struct sy8824_config *cfg =3D di->cfg;
+	struct regulator_dev *rdev;
+
+	rdesc->name =3D "sy8824-reg";
+	rdesc->supply_name =3D "vin";
+	rdesc->ops =3D &sy8824_regulator_ops;
+	rdesc->type =3D REGULATOR_VOLTAGE;
+	rdesc->n_voltages =3D cfg->vsel_count;
+	rdesc->enable_reg =3D cfg->enable_reg;
+	rdesc->enable_mask =3D BUCK_EN;
+	rdesc->min_uV =3D cfg->vsel_min;
+	rdesc->uV_step =3D cfg->vsel_step;
+	rdesc->vsel_reg =3D cfg->vol_reg;
+	rdesc->vsel_mask =3D cfg->vsel_count - 1;
+	rdesc->owner =3D THIS_MODULE;
+
+	rdev =3D devm_regulator_register(di->dev, &di->desc, config);
+	return PTR_ERR_OR_ZERO(rdev);
+}
+
+static const struct regmap_config sy8824_regmap_config =3D {
+	.reg_bits =3D 8,
+	.val_bits =3D 8,
+};
+
+static int sy8824_i2c_probe(struct i2c_client *client,
+			    const struct i2c_device_id *id)
+{
+	struct device *dev =3D &client->dev;
+	struct device_node *np =3D dev->of_node;
+	struct sy8824_device_info *di;
+	struct regulator_config config =3D { };
+	struct regmap *regmap;
+	int ret;
+
+	di =3D devm_kzalloc(dev, sizeof(struct sy8824_device_info), GFP_KERNEL);
+	if (!di)
+		return -ENOMEM;
+
+	di->regulator =3D of_get_regulator_init_data(dev, np, &di->desc);
+	if (!di->regulator) {
+		dev_err(dev, "Platform data not found!\n");
+		return -EINVAL;
+	}
+
+	di->dev =3D dev;
+	di->cfg =3D of_device_get_match_data(dev);
+
+	regmap =3D devm_regmap_init_i2c(client, &sy8824_regmap_config);
+	if (IS_ERR(regmap)) {
+		dev_err(dev, "Failed to allocate regmap!\n");
+		return PTR_ERR(regmap);
+	}
+	i2c_set_clientdata(client, di);
+
+	config.dev =3D di->dev;
+	config.init_data =3D di->regulator;
+	config.regmap =3D regmap;
+	config.driver_data =3D di;
+	config.of_node =3D np;
+
+	ret =3D sy8824_regulator_register(di, &config);
+	if (ret < 0)
+		dev_err(dev, "Failed to register regulator!\n");
+	return ret;
+}
+
+static const struct sy8824_config sy8824c_cfg =3D {
+	.vol_reg =3D 0x00,
+	.mode_reg =3D 0x00,
+	.enable_reg =3D 0x00,
+	.vsel_min =3D 762500,
+	.vsel_step =3D 12500,
+	.vsel_count =3D 64,
+};
+
+static const struct of_device_id sy8824_dt_ids[] =3D {
+	{
+		.compatible =3D "silergy,sy8824c",
+		.data =3D &sy8824c_cfg
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sy8824_dt_ids);
+
+static const struct i2c_device_id sy8824_id[] =3D {
+	{ "sy8824", },
+	{ },
+};
+MODULE_DEVICE_TABLE(i2c, sy8824_id);
+
+static struct i2c_driver sy8824_regulator_driver =3D {
+	.driver =3D {
+		.name =3D "sy8824-regulator",
+		.of_match_table =3D of_match_ptr(sy8824_dt_ids),
+	},
+	.probe =3D sy8824_i2c_probe,
+	.id_table =3D sy8824_id,
+};
+module_i2c_driver(sy8824_regulator_driver);
+
+MODULE_AUTHOR("Jisheng Zhang <jszhang@kernel.org>");
+MODULE_DESCRIPTION("SY8824C regulator driver");
+MODULE_LICENSE("GPL v2");
--=20
2.23.0.rc1
