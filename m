From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: [PATCH v2 4/8] regulator: sy8824x: add SY8824E support
Date: Wed, 28 Aug 2019 06:10:36 +0000
Message-ID: <20190828135920.536c9e1e@xhacker.debian>
References: <20190828135646.52457ac3@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828135646.52457ac3@xhacker.debian>
Content-Language: en-US
Content-ID: <02898B0919D5E449828C79C22BDEF91B@namprd03.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

The only difference between SY8824E and SY8824C is the vsel_min.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/regulator/Kconfig   |  2 +-
 drivers/regulator/sy8824x.c | 17 +++++++++++++++--
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index e8093a909e85..b70a0a07795b 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -907,7 +907,7 @@ config REGULATOR_SY8106A
 	  This driver supports SY8106A single output regulator.
=20
 config REGULATOR_SY8824X
-	tristate "Silergy SY8824C regulator"
+	tristate "Silergy SY8824C/SY8824E regulator"
 	depends on I2C && (OF || COMPILE_TEST)
 	select REGMAP_I2C
 	help
diff --git a/drivers/regulator/sy8824x.c b/drivers/regulator/sy8824x.c
index 335a2cc1fc4a..c93c49e64315 100644
--- a/drivers/regulator/sy8824x.c
+++ b/drivers/regulator/sy8824x.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 //
-// SY8824C regulator driver
+// SY8824C/SY8824E regulator driver
 //
 // Copyright (C) 2019 Synaptics Incorporated
 // Author: Jisheng Zhang <jszhang@kernel.org>
@@ -162,11 +162,24 @@ static const struct sy8824_config sy8824c_cfg =3D {
 	.vsel_count =3D 64,
 };
=20
+static const struct sy8824_config sy8824e_cfg =3D {
+	.vol_reg =3D 0x00,
+	.mode_reg =3D 0x00,
+	.enable_reg =3D 0x00,
+	.vsel_min =3D 700000,
+	.vsel_step =3D 12500,
+	.vsel_count =3D 64,
+};
+
 static const struct of_device_id sy8824_dt_ids[] =3D {
 	{
 		.compatible =3D "silergy,sy8824c",
 		.data =3D &sy8824c_cfg
 	},
+	{
+		.compatible =3D "silergy,sy8824e",
+		.data =3D &sy8824e_cfg
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sy8824_dt_ids);
@@ -188,5 +201,5 @@ static struct i2c_driver sy8824_regulator_driver =3D {
 module_i2c_driver(sy8824_regulator_driver);
=20
 MODULE_AUTHOR("Jisheng Zhang <jszhang@kernel.org>");
-MODULE_DESCRIPTION("SY8824C regulator driver");
+MODULE_DESCRIPTION("SY8824C/SY8824E regulator driver");
 MODULE_LICENSE("GPL v2");
--=20
2.23.0.rc1
