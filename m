From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Applied "regulator: da9210: addition of device tree support" to the regulator tree
Date: Fri, 15 Jul 2016 12:56:50 +0100
Message-ID: <E1bO1je-0006uV-Db@debutante>
References: <20160715093617.498003FBD7@swsrvapps-01.diasemi.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160715093617.498003FBD7-GMeof6ifPvyPZR/jWPPeGKXmvbD0mHlG@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Twiss <stwiss.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, DEVICETREE <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LINUXKERNEL <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Support Opensource <support.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The patch

   regulator: da9210: addition of device tree support

has been applied to the regulator tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 2d0cf04ce166581c617f8943a116587a730f40b6 Mon Sep 17 00:00:00 2001
From: Steve Twiss <stwiss.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Date: Fri, 15 Jul 2016 10:29:41 +0100
Subject: [PATCH] regulator: da9210: addition of device tree support

Addition of device tree support for DA9210.
Two files are modified, the driver source file and the binding document.

Updates for the regulator source file include an .of_match_table entry and
node match checking in the probe() function for a compatible da9210 string.

Minor binding documentation changes have been made to the title and the
example.

Tested-by: Steve Twiss <stwiss.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Steve Twiss <stwiss.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/regulator/da9210.txt        | 12 ++++++++----
 drivers/regulator/da9210-regulator.c                | 21 +++++++++++++++++++--
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/da9210.txt b/Documentation/devicetree/bindings/regulator/da9210.txt
index 7aa9b1fa6b21..58065ca9e3b4 100644
--- a/Documentation/devicetree/bindings/regulator/da9210.txt
+++ b/Documentation/devicetree/bindings/regulator/da9210.txt
@@ -1,4 +1,4 @@
-* Dialog Semiconductor DA9210 Voltage Regulator
+* Dialog Semiconductor DA9210 Multi-phase 12A DCDC BUCK Converter
 
 Required properties:
 
@@ -18,8 +18,12 @@ Example:
 		compatible = "dlg,da9210";
 		reg = <0x68>;
 
-		regulator-min-microvolt = <900000>;
-		regulator-max-microvolt = <1000000>;
+		interrupt-parent = <...>;
+		interrupts = <...>;
+
+		regulator-min-microvolt = <300000>;
+		regulator-max-microvolt = <1570000>;
+		regulator-min-microamp = <1600000>;
+		regulator-max-microamp = <4600000>;
 		regulator-boot-on;
-		regulator-always-on;
 	};
diff --git a/drivers/regulator/da9210-regulator.c b/drivers/regulator/da9210-regulator.c
index 01c0e3709b66..d0496d6b0934 100644
--- a/drivers/regulator/da9210-regulator.c
+++ b/drivers/regulator/da9210-regulator.c
@@ -21,12 +21,11 @@
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
-#include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/slab.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
+#include <linux/of_device.h>
 #include <linux/regulator/of_regulator.h>
 #include <linux/regmap.h>
 
@@ -179,6 +178,13 @@ error_i2c:
 /*
  * I2C driver interface functions
  */
+
+static const struct of_device_id da9210_dt_ids[] = {
+	{ .compatible = "dlg,da9210", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, da9210_dt_ids);
+
 static int da9210_i2c_probe(struct i2c_client *i2c,
 			    const struct i2c_device_id *id)
 {
@@ -188,6 +194,16 @@ static int da9210_i2c_probe(struct i2c_client *i2c,
 	struct regulator_dev *rdev = NULL;
 	struct regulator_config config = { };
 	int error;
+	const struct of_device_id *match;
+
+	if (i2c->dev.of_node && !pdata) {
+		match = of_match_device(of_match_ptr(da9210_dt_ids),
+						&i2c->dev);
+		if (!match) {
+			dev_err(&i2c->dev, "Error: No device match found\n");
+			return -ENODEV;
+		}
+	}
 
 	chip = devm_kzalloc(&i2c->dev, sizeof(struct da9210), GFP_KERNEL);
 	if (!chip)
@@ -264,6 +280,7 @@ MODULE_DEVICE_TABLE(i2c, da9210_i2c_id);
 static struct i2c_driver da9210_regulator_driver = {
 	.driver = {
 		.name = "da9210",
+		.of_match_table = of_match_ptr(da9210_dt_ids),
 	},
 	.probe = da9210_i2c_probe,
 	.id_table = da9210_i2c_id,
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
