From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v3 2/3] regulator: add support for SY8106A regulator
Date: Mon, 23 Apr 2018 22:46:56 +0800
Message-ID: <20180423144657.63264-3-icenowy@aosc.io>
References: <20180423144657.63264-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBHHE67LAKGQEHODUZAQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180423144657.63264-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>

SY8106A is an I2C attached single output regulator made by Silergy Corp,
which is used on several Allwinner H3/H5 SBCs to control the power
supply of the ARM cores.

Add a driver for it.

Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
[Icenowy: Change commit message, remove enable/disable code, add default
 ramp_delay, add comment for go bit, add code for fixed mode voltage]
Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
Changes in v3:
- Return the fixed voltage defined in device tree when I2C regulating
  not enabled (in this situation the register may contain no valid
  voltage data).

Changes in v2:
- Dropped the enable/disable code.
- Added default ramp_delay value.
- Added comment for the "go bit".

 MAINTAINERS                           |   6 ++
 drivers/regulator/Kconfig             |   7 ++
 drivers/regulator/Makefile            |   2 +-
 drivers/regulator/sy8106a-regulator.c | 175 ++++++++++++++++++++++++++++++=
++++
 4 files changed, 189 insertions(+), 1 deletion(-)
 create mode 100644 drivers/regulator/sy8106a-regulator.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a33643739820..e0cb78568458 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13464,6 +13464,12 @@ S:	Supported
 F:	net/switchdev/
 F:	include/net/switchdev.h
=20
+SY8106A REGULATOR DRIVER
+M:	Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
+S:	Maintained
+F:	drivers/regulator/sy8106a-regulator.c
+F:	Documentation/devicetree/bindings/regulator/sy8106a-regulator.txt
+
 SYNC FILE FRAMEWORK
 M:	Sumit Semwal <sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
 R:	Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 097f61784a7d..4efae3b7e746 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -801,6 +801,13 @@ config REGULATOR_STW481X_VMMC
 	  This driver supports the internal VMMC regulator in the STw481x
 	  PMIC chips.
=20
+config REGULATOR_SY8106A
+	tristate "Silergy SY8106A regulator"
+	depends on I2C && (OF || COMPILE_TEST)
+	select REGMAP_I2C
+	help
+	  This driver supports SY8106A single output regulator.
+
 config REGULATOR_TPS51632
 	tristate "TI TPS51632 Power Regulator"
 	depends on I2C
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 590674fbecd7..d81fb02bd6e9 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -100,6 +100,7 @@ obj-$(CONFIG_REGULATOR_SC2731) +=3D sc2731-regulator.o
 obj-$(CONFIG_REGULATOR_SKY81452) +=3D sky81452-regulator.o
 obj-$(CONFIG_REGULATOR_STM32_VREFBUF) +=3D stm32-vrefbuf.o
 obj-$(CONFIG_REGULATOR_STW481X_VMMC) +=3D stw481x-vmmc.o
+obj-$(CONFIG_REGULATOR_SY8106A) +=3D sy8106a-regulator.o
 obj-$(CONFIG_REGULATOR_TI_ABB) +=3D ti-abb-regulator.o
 obj-$(CONFIG_REGULATOR_TPS6105X) +=3D tps6105x-regulator.o
 obj-$(CONFIG_REGULATOR_TPS62360) +=3D tps62360-regulator.o
@@ -125,5 +126,4 @@ obj-$(CONFIG_REGULATOR_WM8350) +=3D wm8350-regulator.o
 obj-$(CONFIG_REGULATOR_WM8400) +=3D wm8400-regulator.o
 obj-$(CONFIG_REGULATOR_WM8994) +=3D wm8994-regulator.o
=20
-
 ccflags-$(CONFIG_REGULATOR_DEBUG) +=3D -DDEBUG
diff --git a/drivers/regulator/sy8106a-regulator.c b/drivers/regulator/sy81=
06a-regulator.c
new file mode 100644
index 000000000000..6dbe41044ab9
--- /dev/null
+++ b/drivers/regulator/sy8106a-regulator.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * sy8106a-regulator.c - Regulator device driver for SY8106A
+ *
+ * Copyright (C) 2016 Ond=C5=99ej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
+ * Copyright (c) 2017-2018 Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/of_regulator.h>
+
+#define SY8106A_REG_VOUT1_SEL		0x01
+#define SY8106A_REG_VOUT_COM		0x02
+#define SY8106A_REG_VOUT1_SEL_MASK	0x7f
+#define SY8106A_DISABLE_REG		BIT(0)
+/*
+ * The I2C controlled voltage will only work when this bit is set; otherwi=
se
+ * it will behave like a fixed regulator.
+ */
+#define SY8106A_GO_BIT			BIT(7)
+
+struct sy8106a {
+	struct regulator_dev *rdev;
+	struct regmap *regmap;
+	u32 fixed_voltage;
+};
+
+static const struct regmap_config sy8106a_regmap_config =3D {
+	.reg_bits =3D 8,
+	.val_bits =3D 8,
+};
+
+static int sy8106a_set_voltage_sel(struct regulator_dev *rdev, unsigned in=
t sel)
+{
+	/* We use our set_voltage_sel in order to avoid unnecessary I2C
+	 * chatter, because the regulator_get_voltage_sel_regmap using
+	 * apply_bit would perform 4 unnecessary transfers instead of one,
+	 * increasing the chance of error.
+	 */
+	return regmap_write(rdev->regmap, rdev->desc->vsel_reg,
+			    sel | SY8106A_GO_BIT);
+}
+
+static int sy8106a_get_voltage_sel(struct regulator_dev *rdev)
+{
+	struct sy8106a *chip =3D rdev_get_drvdata(rdev);
+	unsigned int reg;
+	int error;
+
+	error =3D regmap_read(rdev->regmap, rdev->desc->vsel_reg, &reg);
+	if (error)
+		return error;
+
+	if (reg & SY8106A_GO_BIT)
+		return reg & rdev->desc->vsel_mask;
+	else
+		return (chip->fixed_voltage - rdev->desc->min_uV) /
+		       rdev->desc->uV_step;
+}
+
+static const struct regulator_ops sy8106a_ops =3D {
+	.set_voltage_sel =3D sy8106a_set_voltage_sel,
+	.set_voltage_time_sel =3D regulator_set_voltage_time_sel,
+	.get_voltage_sel =3D sy8106a_get_voltage_sel,
+	.list_voltage =3D regulator_list_voltage_linear,
+	/* Enabling/disabling the regulator is not yet implemented */
+};
+
+/* Default limits measured in millivolts */
+#define SY8106A_MIN_MV		680
+#define SY8106A_MAX_MV		1950
+#define SY8106A_STEP_MV		10
+
+static const struct regulator_desc sy8106a_reg =3D {
+	.name =3D "SY8106A",
+	.id =3D 0,
+	.ops =3D &sy8106a_ops,
+	.type =3D REGULATOR_VOLTAGE,
+	.n_voltages =3D ((SY8106A_MAX_MV - SY8106A_MIN_MV) / SY8106A_STEP_MV) + 1=
,
+	.min_uV =3D (SY8106A_MIN_MV * 1000),
+	.uV_step =3D (SY8106A_STEP_MV * 1000),
+	.vsel_reg =3D SY8106A_REG_VOUT1_SEL,
+	.vsel_mask =3D SY8106A_REG_VOUT1_SEL_MASK,
+	/*
+	 * This ramp_delay is a conservative default value which works on
+	 * H3/H5 boards VDD-CPUX situations.
+	 */
+	.ramp_delay =3D 200,
+	.owner =3D THIS_MODULE,
+};
+
+/*
+ * I2C driver interface functions
+ */
+static int sy8106a_i2c_probe(struct i2c_client *i2c,
+			    const struct i2c_device_id *id)
+{
+	struct sy8106a *chip;
+	struct device *dev =3D &i2c->dev;
+	struct regulator_dev *rdev =3D NULL;
+	struct regulator_config config =3D { };
+	int error;
+
+	chip =3D devm_kzalloc(&i2c->dev, sizeof(struct sy8106a), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	error =3D of_property_read_u32(dev->of_node, "silergy,fixed-microvolt",
+				     &chip->fixed_voltage);
+	if (error)
+		return error;
+
+	chip->regmap =3D devm_regmap_init_i2c(i2c, &sy8106a_regmap_config);
+	if (IS_ERR(chip->regmap)) {
+		error =3D PTR_ERR(chip->regmap);
+		dev_err(dev, "Failed to allocate register map: %d\n", error);
+		return error;
+	}
+
+	config.dev =3D &i2c->dev;
+	config.regmap =3D chip->regmap;
+	config.driver_data =3D chip;
+
+	config.of_node =3D dev->of_node;
+	config.init_data =3D of_get_regulator_init_data(dev, dev->of_node,
+						      &sy8106a_reg);
+
+	if (!config.init_data)
+		return -ENOMEM;
+
+	/* Probe regulator */
+	rdev =3D devm_regulator_register(&i2c->dev, &sy8106a_reg, &config);
+	if (IS_ERR(rdev)) {
+		error =3D PTR_ERR(rdev);
+		dev_err(&i2c->dev, "Failed to register SY8106A regulator: %d\n", error);
+		return error;
+	}
+
+	chip->rdev =3D rdev;
+
+	i2c_set_clientdata(i2c, chip);
+
+	return 0;
+}
+
+static const struct of_device_id sy8106a_i2c_of_match[] =3D {
+	{ .compatible =3D "silergy,sy8106a" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, sy8106a_i2c_of_match);
+
+static const struct i2c_device_id sy8106a_i2c_id[] =3D {
+	{ "sy8106a", 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(i2c, sy8106a_i2c_id);
+
+static struct i2c_driver sy8106a_regulator_driver =3D {
+	.driver =3D {
+		.name =3D "sy8106a",
+		.of_match_table	=3D of_match_ptr(sy8106a_i2c_of_match),
+	},
+	.probe =3D sy8106a_i2c_probe,
+	.id_table =3D sy8106a_i2c_id,
+};
+
+module_i2c_driver(sy8106a_regulator_driver);
+
+MODULE_AUTHOR("Ond=C5=99ej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>");
+MODULE_AUTHOR("Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>");
+MODULE_DESCRIPTION("Regulator device driver for Silergy SY8106A");
+MODULE_LICENSE("GPL");
--=20
2.15.1

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
