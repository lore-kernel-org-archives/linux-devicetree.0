From: James Bans <James.Ban.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH V1] regulator: da9211: update for supporting da9223/4/5
Date: Mon, 30 Oct 2017 11:32:38 +0900
Message-ID: <20171030024902.49A5E5F7E8@krsrvapps-01.diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, DEVICETREE <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DEVICETREE <dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, LINUX-KERNEL <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Support Opensource <support.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


From: James Ban <James.Ban.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>

This is update for supporting additional devices da9223/4/5.
Only device strings is added because only package type is different.

Signed-off-by: James Ban <James.Ban..opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>

---
This patch applies against linux-next and next-20171018 


 .../devicetree/bindings/regulator/da9211.txt       |   82 ++++++++++++++++++--
 drivers/regulator/Kconfig                          |    2 +-
 drivers/regulator/da9211-regulator.c               |   14 +++-
 drivers/regulator/da9211-regulator.h               |    2 +-
 include/linux/regulator/da9211.h                   |    5 +-
 5 files changed, 91 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/da9211.txt b/Documentation/devicetree/bindings/regulator/da9211.txt
index 0f2a6f8..27717e8 100644
--- a/Documentation/devicetree/bindings/regulator/da9211.txt
+++ b/Documentation/devicetree/bindings/regulator/da9211.txt
@@ -1,8 +1,9 @@
-* Dialog Semiconductor DA9211/DA9212/DA9213/DA9214/DA9215 Voltage Regulator
+* Dialog Semiconductor DA9211/DA9212/DA9213/DA9223/DA9214/DA9224/DA9215/DA9225
+ Voltage Regulator
 
 Required properties:
-- compatible: "dlg,da9211" or "dlg,da9212" or "dlg,da9213"
-  or "dlg,da9214" or "dlg,da9215"
+- compatible: "dlg,da9211" or "dlg,da9212" or "dlg,da9213" or "dlg,da9223"
+  or "dlg,da9214" or "dlg,da9224" or "dlg,da9215" or "dlg,da9225"
 - reg: I2C slave address, usually 0x68.
 - interrupts: the interrupt outputs of the controller
 - regulators: A node that houses a sub-node for each regulator within the
@@ -16,7 +17,6 @@ Optional properties:
 - Any optional property defined in regulator.txt
 
 Example 1) DA9211
-
 	pmic: da9211@68 {
 		compatible = "dlg,da9211";
 		reg = <0x68>;
@@ -35,7 +35,6 @@ Example 1) DA9211
 	};
 
 Example 2) DA9212
-
 	pmic: da9212@68 {
 		compatible = "dlg,da9212";
 		reg = <0x68>;
@@ -79,7 +78,25 @@ Example 3) DA9213
 		};
 	};
 
-Example 4) DA9214
+Example 4) DA9223
+	pmic: da9223@68 {
+		compatible = "dlg,da9223";
+		reg = <0x68>;
+		interrupts = <3 27>;
+
+		regulators {
+			BUCKA {
+				regulator-name = "VBUCKA";
+				regulator-min-microvolt = < 300000>;
+				regulator-max-microvolt = <1570000>;
+				regulator-min-microamp 	= <3000000>;
+				regulator-max-microamp 	= <6000000>;
+				enable-gpios = <&gpio 27 0>;
+			};
+		};
+	};
+
+Example 5) DA9214
 	pmic: da9214@68 {
 		compatible = "dlg,da9214";
 		reg = <0x68>;
@@ -105,7 +122,33 @@ Example 4) DA9214
 		};
 	};
 
-Example 5) DA9215
+Example 6) DA9224
+	pmic: da9224@68 {
+		compatible = "dlg,da9224";
+		reg = <0x68>;
+		interrupts = <3 27>;
+
+		regulators {
+			BUCKA {
+				regulator-name = "VBUCKA";
+				regulator-min-microvolt = < 300000>;
+				regulator-max-microvolt = <1570000>;
+				regulator-min-microamp 	= <3000000>;
+				regulator-max-microamp 	= <6000000>;
+				enable-gpios = <&gpio 27 0>;
+			};
+			BUCKB {
+				regulator-name = "VBUCKB";
+				regulator-min-microvolt = < 300000>;
+				regulator-max-microvolt = <1570000>;
+				regulator-min-microamp 	= <3000000>;
+				regulator-max-microamp 	= <6000000>;
+				enable-gpios = <&gpio 17 0>;
+			};
+		};
+	};
+
+Example 7) DA9215
 	pmic: da9215@68 {
 		compatible = "dlg,da9215";
 		reg = <0x68>;
@@ -131,3 +174,28 @@ Example 5) DA9215
 		};
 	};
 
+Example 8) DA9225
+	pmic: da9225@68 {
+		compatible = "dlg,da9225";
+		reg = <0x68>;
+		interrupts = <3 27>;
+
+		regulators {
+			BUCKA {
+				regulator-name = "VBUCKA";
+				regulator-min-microvolt = < 300000>;
+				regulator-max-microvolt = <1570000>;
+				regulator-min-microamp 	= <4000000>;
+				regulator-max-microamp 	= <7000000>;
+				enable-gpios = <&gpio 27 0>;
+			};
+			BUCKB {
+				regulator-name = "VBUCKB";
+				regulator-min-microvolt = < 300000>;
+				regulator-max-microvolt = <1570000>;
+				regulator-min-microamp 	= <4000000>;
+				regulator-max-microamp 	= <7000000>;
+				enable-gpios = <&gpio 17 0>;
+			};
+		};
+	};
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 0fd6195..96cd55f 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -244,7 +244,7 @@ config REGULATOR_DA9210
 	  interface.
 
 config REGULATOR_DA9211
-	tristate "Dialog Semiconductor DA9211/DA9212/DA9213/DA9214/DA9215 regulator"
+	tristate "Dialog Semiconductor DA9211/DA9212/DA9213/DA9223/DA9214/DA9224/DA9215/DA9225 regulator"
 	depends on I2C
 	select REGMAP_I2C
 	help
diff --git a/drivers/regulator/da9211-regulator.c b/drivers/regulator/da9211-regulator.c
index aa47280..9b8f476 100644
--- a/drivers/regulator/da9211-regulator.c
+++ b/drivers/regulator/da9211-regulator.c
@@ -1,6 +1,6 @@
 /*
  * da9211-regulator.c - Regulator device driver for DA9211/DA9212
- * /DA9213/DA9214/DA9215
+ * /DA9213/DA9223/DA9214/DA9224/DA9215/DA9225
  * Copyright (C) 2015  Dialog Semiconductor Ltd.
  *
  * This library is free software; you can redistribute it and/or
@@ -496,8 +496,11 @@ static int da9211_i2c_probe(struct i2c_client *i2c,
 	{"da9211", DA9211},
 	{"da9212", DA9212},
 	{"da9213", DA9213},
+	{"da9223", DA9223},
 	{"da9214", DA9214},
+	{"da9224", DA9224},
 	{"da9215", DA9215},
+	{"da9225", DA9225},
 	{},
 };
 MODULE_DEVICE_TABLE(i2c, da9211_i2c_id);
@@ -507,8 +510,11 @@ static int da9211_i2c_probe(struct i2c_client *i2c,
 	{ .compatible = "dlg,da9211", .data = &da9211_i2c_id[0] },
 	{ .compatible = "dlg,da9212", .data = &da9211_i2c_id[1] },
 	{ .compatible = "dlg,da9213", .data = &da9211_i2c_id[2] },
-	{ .compatible = "dlg,da9214", .data = &da9211_i2c_id[3] },
-	{ .compatible = "dlg,da9215", .data = &da9211_i2c_id[4] },
+	{ .compatible = "dlg,da9223", .data = &da9211_i2c_id[3] },
+	{ .compatible = "dlg,da9214", .data = &da9211_i2c_id[4] },
+	{ .compatible = "dlg,da9224", .data = &da9211_i2c_id[5] },
+	{ .compatible = "dlg,da9215", .data = &da9211_i2c_id[6] },
+	{ .compatible = "dlg,da9225", .data = &da9211_i2c_id[7] },
 	{},
 };
 MODULE_DEVICE_TABLE(of, da9211_dt_ids);
@@ -526,5 +532,5 @@ static int da9211_i2c_probe(struct i2c_client *i2c,
 module_i2c_driver(da9211_regulator_driver);
 
 MODULE_AUTHOR("James Ban <James.Ban.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>");
-MODULE_DESCRIPTION("DA9211/DA9212/DA9213/DA9214/DA9215 regulator driver");
+MODULE_DESCRIPTION("DA9211/DA9212/DA9213/DA9223/DA9214/DA9224/DA9215/DA9225 regulator driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/regulator/da9211-regulator.h b/drivers/regulator/da9211-regulator.h
index b841bbf..2cb32aa 100644
--- a/drivers/regulator/da9211-regulator.h
+++ b/drivers/regulator/da9211-regulator.h
@@ -1,6 +1,6 @@
 /*
  * da9211-regulator.h - Regulator definitions for DA9211/DA9212
- * /DA9213/DA9214/DA9215
+ * /DA9213/DA9223/DA9214/DA9224/DA9215/DA9225
  * Copyright (C) 2015  Dialog Semiconductor Ltd.
  *
  * This program is free software; you can redistribute it and/or
diff --git a/include/linux/regulator/da9211.h b/include/linux/regulator/da9211.h
index 80cb40b..f2fd2d3 100644
--- a/include/linux/regulator/da9211.h
+++ b/include/linux/regulator/da9211.h
@@ -1,6 +1,6 @@
 /*
  * da9211.h - Regulator device driver for DA9211/DA9212
- * /DA9213/DA9214/DA9215
+ * /DA9213/DA9223/DA9214/DA9224/DA9215/DA9225
  * Copyright (C) 2015  Dialog Semiconductor Ltd.
  *
  * This program is free software; you can redistribute it and/or
@@ -25,8 +25,11 @@ enum da9211_chip_id {
 	DA9211,
 	DA9212,
 	DA9213,
+	DA9223,
 	DA9214,
+	DA9224,
 	DA9215,
+	DA9225,
 };
 
 struct da9211_pdata {
-- 
end-of-patch for PATCH V1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
