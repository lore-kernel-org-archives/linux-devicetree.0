From: Philippe Schenker <philippe.schenker@toradex.com>
Subject: [PATCH 1/3] regulator: fixed: add possibility to enable by clock
Date: Tue, 3 Sep 2019 08:03:46 +0000
Message-ID: <20190903080336.32288-2-philippe.schenker@toradex.com>
References: <20190903080336.32288-1-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190903080336.32288-1-philippe.schenker@toradex.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Max Krummenacher <max.krummenacher@toradex.com>, Rob Herring <robh+dt@kernel.org>, Stefan Agner <stefan.agner@toradex.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Mark Rutland <mark.rutland@arm.com>, Luka Pivk <luka.pivk@toradex.com>, Philippe Schenker <philippe.schenker@toradex.com>
List-Id: devicetree@vger.kernel.org

This commit adds the possibility to choose the compatible
"regulator-fixed-clock" in devicetree.

This is a special regulator-fixed that has to have a clock, from which
the regulator gets switched on and off.

Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
---

 drivers/regulator/fixed.c | 86 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 83 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/fixed.c b/drivers/regulator/fixed.c
index 999547dde99d..eadeca9a1a6c 100644
--- a/drivers/regulator/fixed.c
+++ b/drivers/regulator/fixed.c
@@ -23,14 +23,66 @@
 #include <linux/gpio/consumer.h>
 #include <linux/slab.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/regulator/of_regulator.h>
 #include <linux/regulator/machine.h>
+#include <linux/clk.h>
+
=20
 struct fixed_voltage_data {
 	struct regulator_desc desc;
 	struct regulator_dev *dev;
+
+	struct clk *enable_clock;
+	unsigned int clk_enable_counter;
+};
+
+struct fixed_dev_type {
+	bool has_enable_clock;
+};
+
+static const struct fixed_dev_type fixed_voltage_data =3D {
+	.has_enable_clock =3D false,
 };
=20
+static const struct fixed_dev_type fixed_clkenable_data =3D {
+	.has_enable_clock =3D true,
+};
+
+static int reg_clock_enable(struct regulator_dev *rdev)
+{
+	struct fixed_voltage_data *priv =3D rdev_get_drvdata(rdev);
+	int ret =3D 0;
+
+	ret =3D clk_prepare_enable(priv->enable_clock);
+	if (ret)
+		return ret;
+
+	priv->clk_enable_counter++;
+
+	return ret;
+}
+
+static int reg_clock_disable(struct regulator_dev *rdev)
+{
+	struct fixed_voltage_data *priv =3D rdev_get_drvdata(rdev);
+
+	clk_disable_unprepare(priv->enable_clock);
+	priv->clk_enable_counter--;
+
+	return 0;
+}
+
+static int reg_clock_is_enabled(struct regulator_dev *rdev)
+{
+	struct fixed_voltage_data *priv =3D rdev_get_drvdata(rdev);
+
+	if (priv->clk_enable_counter > 0)
+		return 1;
+
+	return 0;
+}
+
=20
 /**
  * of_get_fixed_voltage_config - extract fixed_voltage_config structure in=
fo
@@ -84,10 +136,19 @@ of_get_fixed_voltage_config(struct device *dev,
 static struct regulator_ops fixed_voltage_ops =3D {
 };
=20
+static struct regulator_ops fixed_voltage_clkenabled_ops =3D {
+	.enable =3D reg_clock_enable,
+	.disable =3D reg_clock_disable,
+	.is_enabled =3D reg_clock_is_enabled,
+};
+
 static int reg_fixed_voltage_probe(struct platform_device *pdev)
 {
+	struct device *dev =3D &pdev->dev;
 	struct fixed_voltage_config *config;
 	struct fixed_voltage_data *drvdata;
+	const struct fixed_dev_type *drvtype =3D
+		of_match_device(dev->driver->of_match_table, dev)->data;
 	struct regulator_config cfg =3D { };
 	enum gpiod_flags gflags;
 	int ret;
@@ -118,7 +179,18 @@ static int reg_fixed_voltage_probe(struct platform_dev=
ice *pdev)
 	}
 	drvdata->desc.type =3D REGULATOR_VOLTAGE;
 	drvdata->desc.owner =3D THIS_MODULE;
-	drvdata->desc.ops =3D &fixed_voltage_ops;
+
+	if (drvtype->has_enable_clock) {
+		drvdata->desc.ops =3D &fixed_voltage_clkenabled_ops;
+
+		drvdata->enable_clock =3D devm_clk_get(dev, NULL);
+		if (IS_ERR(drvdata->enable_clock)) {
+			dev_err(dev, "Cant get enable-clock from devicetree\n");
+			return -ENOENT;
+		}
+	} else {
+		drvdata->desc.ops =3D &fixed_voltage_ops;
+	}
=20
 	drvdata->desc.enable_time =3D config->startup_delay;
=20
@@ -191,8 +263,16 @@ static int reg_fixed_voltage_probe(struct platform_dev=
ice *pdev)
=20
 #if defined(CONFIG_OF)
 static const struct of_device_id fixed_of_match[] =3D {
-	{ .compatible =3D "regulator-fixed", },
-	{},
+	{
+		.compatible =3D "regulator-fixed",
+		.data =3D &fixed_voltage_data,
+	},
+	{
+		.compatible =3D "regulator-fixed-clock",
+		.data =3D &fixed_clkenable_data,
+	},
+	{
+	},
 };
 MODULE_DEVICE_TABLE(of, fixed_of_match);
 #endif
--=20
2.23.0
