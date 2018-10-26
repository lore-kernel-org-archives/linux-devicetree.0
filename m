From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH 1/2] regulator: act8945: Implement PM functionalities
Date: Fri, 26 Oct 2018 16:19:48 +0000
Message-ID: <1540570753-16370-2-git-send-email-claudiu.beznea@microchip.com>
References: <1540570753-16370-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540570753-16370-1-git-send-email-claudiu.beznea@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, boris.brezillon@bootlin.com, Claudiu.Beznea@microchip.com
List-Id: devicetree@vger.kernel.org

From: Boris Brezillon <boris.brezillon@bootlin.com>

The regulator supports a dedicated suspend mode.
Implement the appropriate ->set_suspend_xx() hooks, add support for
->set_mode(), and provide basic PM ops functionalities to setup the
regulator in a suspend state when the system is entering suspend.

We also implement the ->shutdown() method to make sure the PMIC will
not enter the suspend state when the system is shutdown.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
[claudiu.beznea@microchip.com: remove dev_pm_ops, fix checkpatch warking, a=
dapt commit message]
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/regulator/act8945a-regulator.c | 195 +++++++++++++++++++++++++++++=
+++-
 1 file changed, 193 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/act8945a-regulator.c b/drivers/regulator/act=
8945a-regulator.c
index 43fda8b4455a..41bf7d224abb 100644
--- a/drivers/regulator/act8945a-regulator.c
+++ b/drivers/regulator/act8945a-regulator.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
=20
@@ -23,23 +24,36 @@
  */
 #define ACT8945A_SYS_MODE	0x00
 #define ACT8945A_SYS_CTRL	0x01
+#define ACT8945A_SYS_UNLK_REGS	0x0b
 #define ACT8945A_DCDC1_VSET1	0x20
 #define ACT8945A_DCDC1_VSET2	0x21
 #define ACT8945A_DCDC1_CTRL	0x22
+#define ACT8945A_DCDC1_SUS	0x24
 #define ACT8945A_DCDC2_VSET1	0x30
 #define ACT8945A_DCDC2_VSET2	0x31
 #define ACT8945A_DCDC2_CTRL	0x32
+#define ACT8945A_DCDC2_SUS	0x34
 #define ACT8945A_DCDC3_VSET1	0x40
 #define ACT8945A_DCDC3_VSET2	0x41
 #define ACT8945A_DCDC3_CTRL	0x42
+#define ACT8945A_DCDC3_SUS	0x44
+
+#define ACT8945A_DCDC_MODE_MSK		BIT(5)
+#define ACT8945A_DCDC_MODE_FIXED	BIT(5)
+#define ACT8945A_DCDC_MODE_POWER_SAVING	(0)
+
 #define ACT8945A_LDO1_VSET	0x50
 #define ACT8945A_LDO1_CTRL	0x51
+#define ACT8945A_LDO1_SUS	0x52
 #define ACT8945A_LDO2_VSET	0x54
 #define ACT8945A_LDO2_CTRL	0x55
+#define ACT8945A_LDO2_SUS	0x56
 #define ACT8945A_LDO3_VSET	0x60
 #define ACT8945A_LDO3_CTRL	0x61
+#define ACT8945A_LDO3_SUS	0x62
 #define ACT8945A_LDO4_VSET	0x64
 #define ACT8945A_LDO4_CTRL	0x65
+#define ACT8945A_LDO4_SUS	0x66
=20
 /**
  * Field Definitions.
@@ -63,12 +77,154 @@ enum {
 	ACT8945A_REG_NUM,
 };
=20
+struct act8945a_pmic {
+	struct regulator_dev *rdevs[ACT8945A_REG_NUM];
+	struct regmap *regmap;
+};
+
 static const struct regulator_linear_range act8945a_voltage_ranges[] =3D {
 	REGULATOR_LINEAR_RANGE(600000, 0, 23, 25000),
 	REGULATOR_LINEAR_RANGE(1200000, 24, 47, 50000),
 	REGULATOR_LINEAR_RANGE(2400000, 48, 63, 100000),
 };
=20
+static int act8945a_set_suspend_state(struct regulator_dev *rdev, bool ena=
ble)
+{
+	struct regmap *regmap =3D rdev->regmap;
+	int id =3D rdev->desc->id, ret, reg, val;
+
+	switch (id) {
+	case ACT8945A_ID_DCDC1:
+		reg =3D ACT8945A_DCDC1_SUS;
+		val =3D 0xa8;
+		break;
+	case ACT8945A_ID_DCDC2:
+		reg =3D ACT8945A_DCDC2_SUS;
+		val =3D 0xa8;
+		break;
+	case ACT8945A_ID_DCDC3:
+		reg =3D ACT8945A_DCDC3_SUS;
+		val =3D 0xa8;
+		break;
+	case ACT8945A_ID_LDO1:
+		reg =3D ACT8945A_LDO1_SUS;
+		val =3D 0xe8;
+		break;
+	case ACT8945A_ID_LDO2:
+		reg =3D ACT8945A_LDO2_SUS;
+		val =3D 0xe8;
+		break;
+	case ACT8945A_ID_LDO3:
+		reg =3D ACT8945A_LDO3_SUS;
+		val =3D 0xe8;
+		break;
+	case ACT8945A_ID_LDO4:
+		reg =3D ACT8945A_LDO4_SUS;
+		val =3D 0xe8;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (enable)
+		val |=3D BIT(4);
+
+	/*
+	 * Ask the PMIC to enable/disable this output when entering hibernate
+	 * mode.
+	 */
+	ret =3D regmap_write(regmap, reg, val);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Ask the PMIC to enter the suspend mode on the next PWRHLD
+	 * transition.
+	 */
+	return regmap_write(regmap, ACT8945A_SYS_CTRL, 0x42);
+}
+
+static int act8945a_set_suspend_enable(struct regulator_dev *rdev)
+{
+	return act8945a_set_suspend_state(rdev, true);
+}
+
+static int act8945a_set_suspend_disable(struct regulator_dev *rdev)
+{
+	return act8945a_set_suspend_state(rdev, false);
+}
+
+static unsigned int act8945a_of_map_mode(unsigned int mode)
+{
+	if (mode =3D=3D ACT8945A_DCDC_MODE_POWER_SAVING)
+		return REGULATOR_MODE_STANDBY;
+
+	return REGULATOR_MODE_NORMAL;
+}
+
+static int act8945a_set_mode(struct regulator_dev *rdev, unsigned int mode=
)
+{
+	struct regmap *regmap =3D rdev->regmap;
+	int id =3D rdev->desc->id;
+	int reg, val;
+
+	switch (mode) {
+	case REGULATOR_MODE_STANDBY:
+		val =3D ACT8945A_DCDC_MODE_POWER_SAVING;
+		break;
+	case REGULATOR_MODE_NORMAL:
+		val =3D ACT8945A_DCDC_MODE_FIXED;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (id) {
+	case ACT8945A_ID_DCDC1:
+		reg =3D ACT8945A_DCDC1_CTRL;
+		break;
+	case ACT8945A_ID_DCDC2:
+		reg =3D ACT8945A_DCDC2_CTRL;
+		break;
+	case ACT8945A_ID_DCDC3:
+		reg =3D ACT8945A_DCDC3_CTRL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(regmap, reg, ACT8945A_DCDC_MODE_MSK, val);
+}
+
+static unsigned int act8945a_get_mode(struct regulator_dev *rdev)
+{
+	struct regmap *regmap =3D rdev->regmap;
+	int id =3D rdev->desc->id;
+	unsigned int val;
+	int reg;
+
+	switch (id) {
+	case ACT8945A_ID_DCDC1:
+		reg =3D ACT8945A_DCDC1_CTRL;
+		break;
+	case ACT8945A_ID_DCDC2:
+		reg =3D ACT8945A_DCDC2_CTRL;
+		break;
+	case ACT8945A_ID_DCDC3:
+		reg =3D ACT8945A_DCDC3_CTRL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_read(regmap, reg, &val);
+
+	if ((val & ACT8945A_DCDC_MODE_MSK) =3D=3D ACT8945A_DCDC_MODE_POWER_SAVING=
)
+		return REGULATOR_MODE_STANDBY;
+
+	return REGULATOR_MODE_NORMAL;
+}
+
 static const struct regulator_ops act8945a_ops =3D {
 	.list_voltage		=3D regulator_list_voltage_linear_range,
 	.map_voltage		=3D regulator_map_voltage_linear_range,
@@ -76,7 +232,11 @@ static const struct regulator_ops act8945a_ops =3D {
 	.set_voltage_sel	=3D regulator_set_voltage_sel_regmap,
 	.enable			=3D regulator_enable_regmap,
 	.disable		=3D regulator_disable_regmap,
+	.set_mode		=3D act8945a_set_mode,
+	.get_mode		=3D act8945a_get_mode,
 	.is_enabled		=3D regulator_is_enabled_regmap,
+	.set_suspend_enable	=3D act8945a_set_suspend_enable,
+	.set_suspend_disable	=3D act8945a_set_suspend_disable,
 };
=20
 #define ACT89xx_REG(_name, _family, _id, _vsel_reg, _supply)		\
@@ -84,6 +244,7 @@ static const struct regulator_ops act8945a_ops =3D {
 		.name			=3D _name,			\
 		.supply_name		=3D _supply,			\
 		.of_match		=3D of_match_ptr("REG_"#_id),	\
+		.of_map_mode		=3D act8945a_of_map_mode,		\
 		.regulators_node	=3D of_match_ptr("regulators"),	\
 		.id			=3D _family##_ID_##_id,		\
 		.type			=3D REGULATOR_VOLTAGE,		\
@@ -122,10 +283,22 @@ static int act8945a_pmic_probe(struct platform_device=
 *pdev)
 {
 	struct regulator_config config =3D { };
 	const struct regulator_desc *regulators;
+	struct act8945a_pmic *act8945a;
 	struct regulator_dev *rdev;
 	int i, num_regulators;
 	bool voltage_select;
=20
+	act8945a =3D devm_kzalloc(&pdev->dev, sizeof(*act8945a), GFP_KERNEL);
+	if (!act8945a)
+		return -ENOMEM;
+
+	act8945a->regmap =3D dev_get_regmap(pdev->dev.parent, NULL);
+	if (!act8945a->regmap) {
+		dev_err(&pdev->dev,
+			"could not retrieve regmap from parent device\n");
+		return -EINVAL;
+	}
+
 	voltage_select =3D of_property_read_bool(pdev->dev.parent->of_node,
 					       "active-semi,vsel-high");
=20
@@ -140,16 +313,33 @@ static int act8945a_pmic_probe(struct platform_device=
 *pdev)
 	config.dev =3D &pdev->dev;
 	config.dev->of_node =3D pdev->dev.parent->of_node;
 	for (i =3D 0; i < num_regulators; i++) {
-		rdev =3D devm_regulator_register(&pdev->dev, &regulators[i], &config);
+		rdev =3D devm_regulator_register(&pdev->dev, &regulators[i],
+					       &config);
 		if (IS_ERR(rdev)) {
 			dev_err(&pdev->dev,
 				"failed to register %s regulator\n",
 				regulators[i].name);
 			return PTR_ERR(rdev);
 		}
+
+		act8945a->rdevs[i] =3D rdev;
 	}
=20
-	return 0;
+	platform_set_drvdata(pdev, act8945a);
+
+	/* Unlock expert registers. */
+	return regmap_write(act8945a->regmap, ACT8945A_SYS_UNLK_REGS, 0xef);
+}
+
+static void act8945a_pmic_shutdown(struct platform_device *pdev)
+{
+	struct act8945a_pmic *act8945a =3D platform_get_drvdata(pdev);
+	struct regmap *regmap =3D act8945a->regmap;
+
+	/*
+	 * Ask the PMIC to shutdown everything on the next PWRHLD transition.
+	 */
+	regmap_write(regmap, ACT8945A_SYS_CTRL, 0x0);
 }
=20
 static struct platform_driver act8945a_pmic_driver =3D {
@@ -157,6 +347,7 @@ static struct platform_driver act8945a_pmic_driver =3D =
{
 		.name =3D "act8945a-regulator",
 	},
 	.probe =3D act8945a_pmic_probe,
+	.shutdown =3D act8945a_pmic_shutdown,
 };
 module_platform_driver(act8945a_pmic_driver);
=20
--=20
2.7.4
