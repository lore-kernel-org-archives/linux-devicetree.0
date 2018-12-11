From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V5 2/2] iio: light: isl29018: add optional vdd regulator
 operation support
Date: Tue, 11 Dec 2018 05:02:44 +0000
Message-ID: <1544504196-30277-2-git-send-email-Anson.Huang@nxp.com>
References: <1544504196-30277-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544504196-30277-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "jic23@kernel.org" <jic23@kernel.org>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "lars@metafoo.de" <lars@metafoo.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "preid@electromag.com.au" <preid@electromag.com.au>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

The light sensor's power supply could be controlled by regulator
on some platforms, such as i.MX6Q-SABRESD board, the light sensor
isl29023's power supply is controlled by a GPIO fixed regulator,
need to make sure the regulator is enabled before any operation of
sensor, this patch adds optional vdd regulator operation support.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
ChangeLog since V4:
	Since ONLY isl29018 has two power supplies and they are MUST shorted exter=
nally, so they can be
	treated as one power supply as well, using one regulator for driver.
---
 drivers/iio/light/isl29018.c | 47 ++++++++++++++++++++++++++++++++++++++++=
+---
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/light/isl29018.c b/drivers/iio/light/isl29018.c
index b45400f..5e3d1c1 100644
--- a/drivers/iio/light/isl29018.c
+++ b/drivers/iio/light/isl29018.c
@@ -23,6 +23,7 @@
 #include <linux/mutex.h>
 #include <linux/delay.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
@@ -95,6 +96,7 @@ struct isl29018_chip {
 	struct isl29018_scale	scale;
 	int			prox_scheme;
 	bool			suspended;
+	struct regulator	*vdd_reg;
 };
=20
 static int isl29018_set_integration_time(struct isl29018_chip *chip,
@@ -735,6 +737,19 @@ static int isl29018_probe(struct i2c_client *client,
=20
 	mutex_init(&chip->lock);
=20
+	chip->vdd_reg =3D devm_regulator_get_optional(&client->dev, "vdd");
+	if (!IS_ERR(chip->vdd_reg)) {
+		err =3D regulator_enable(chip->vdd_reg);
+		if (err) {
+			dev_err(&client->dev, "failed to enable VDD regulator\n");
+			return err;
+		}
+	} else {
+		err =3D PTR_ERR(chip->vdd_reg);
+		if (err !=3D -ENODEV)
+			return err;
+	}
+
 	chip->type =3D dev_id;
 	chip->calibscale =3D 1;
 	chip->ucalibscale =3D 0;
@@ -747,12 +762,12 @@ static int isl29018_probe(struct i2c_client *client,
 	if (IS_ERR(chip->regmap)) {
 		err =3D PTR_ERR(chip->regmap);
 		dev_err(&client->dev, "regmap initialization fails: %d\n", err);
-		return err;
+		goto disable_regulator;
 	}
=20
 	err =3D isl29018_chip_init(chip);
 	if (err)
-		return err;
+		goto disable_regulator;
=20
 	indio_dev->info =3D isl29018_chip_info_tbl[dev_id].indio_info;
 	indio_dev->channels =3D isl29018_chip_info_tbl[dev_id].channels;
@@ -761,13 +776,22 @@ static int isl29018_probe(struct i2c_client *client,
 	indio_dev->dev.parent =3D &client->dev;
 	indio_dev->modes =3D INDIO_DIRECT_MODE;
=20
-	return devm_iio_device_register(&client->dev, indio_dev);
+	err =3D devm_iio_device_register(&client->dev, indio_dev);
+	if (!err)
+		return 0;
+
+disable_regulator:
+	if (!IS_ERR(chip->vdd_reg))
+		regulator_disable(chip->vdd_reg);
+
+	return err;
 }
=20
 #ifdef CONFIG_PM_SLEEP
 static int isl29018_suspend(struct device *dev)
 {
 	struct isl29018_chip *chip =3D iio_priv(dev_get_drvdata(dev));
+	int ret;
=20
 	mutex_lock(&chip->lock);
=20
@@ -777,6 +801,14 @@ static int isl29018_suspend(struct device *dev)
 	 * So we do not have much to do here.
 	 */
 	chip->suspended =3D true;
+	if (!IS_ERR(chip->vdd_reg)) {
+		ret =3D regulator_disable(chip->vdd_reg);
+		if (ret) {
+			dev_err(dev, "failed to disable VDD regulator\n");
+			mutex_unlock(&chip->lock);
+			return ret;
+		}
+	}
=20
 	mutex_unlock(&chip->lock);
=20
@@ -790,6 +822,15 @@ static int isl29018_resume(struct device *dev)
=20
 	mutex_lock(&chip->lock);
=20
+	if (!IS_ERR(chip->vdd_reg)) {
+		err =3D regulator_enable(chip->vdd_reg);
+		if (err) {
+			dev_err(dev, "failed to enable VDD regulator\n");
+			mutex_unlock(&chip->lock);
+			return err;
+		}
+	}
+
 	err =3D isl29018_chip_init(chip);
 	if (!err)
 		chip->suspended =3D false;
--=20
2.7.4
