From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V4 2/2] iio: accell: mma8452: add optional vdd/vddio regulator
 operation support
Date: Tue, 11 Dec 2018 05:13:20 +0000
Message-ID: <1544504839-10958-2-git-send-email-Anson.Huang@nxp.com>
References: <1544504839-10958-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544504839-10958-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "jic23@kernel.org" <jic23@kernel.org>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "lars@metafoo.de" <lars@metafoo.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "martink@posteo.de" <martink@posteo.de>, Leonard Crestez <leonard.crestez@nxp.com>, "rtresidd@electromag.com.au" <rtresidd@electromag.com.au>, "gustavo@embeddedor.com" <gustavo@embeddedor.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "preid@electromag.com.au" <preid@electromag.com.au>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

The accelerometer's power supply could be controlled by regulator
on some platforms, such as i.MX6Q-SABRESD board, the mma8451's
power supply is controlled by a GPIO fixed regulator, need to make
sure the regulator is enabled before any communication with mma8451,
this patch adds optional vdd/vddio regulator operation support.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Acked-by: Martin Kepplinger <martink@posteo.de>
---
ChangeLog since V3:
	- add disabling vdd regulator in vddio error path;
	- improve regulator enable/disable sequence.
---
 drivers/iio/accel/mma8452.c | 186 ++++++++++++++++++++++++++++++++++++++++=
+---
 1 file changed, 176 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
index 421a0a8..590a95d 100644
--- a/drivers/iio/accel/mma8452.c
+++ b/drivers/iio/accel/mma8452.c
@@ -31,6 +31,7 @@
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
=20
 #define MMA8452_STATUS				0x00
 #define  MMA8452_STATUS_DRDY			(BIT(2) | BIT(1) | BIT(0))
@@ -107,6 +108,8 @@ struct mma8452_data {
 	u8 data_cfg;
 	const struct mma_chip_info *chip_info;
 	int sleep_val;
+	struct regulator *vdd_reg;
+	struct regulator *vddio_reg;
 };
=20
  /**
@@ -1533,10 +1536,35 @@ static int mma8452_probe(struct i2c_client *client,
 	data->client =3D client;
 	mutex_init(&data->lock);
 	data->chip_info =3D match->data;
+	data->vdd_reg =3D devm_regulator_get_optional(&client->dev, "vdd");
+	if (!IS_ERR(data->vdd_reg)) {
+		ret =3D regulator_enable(data->vdd_reg);
+		if (ret) {
+			dev_err(&client->dev, "failed to enable VDD regulator\n");
+			return ret;
+		}
+	} else {
+		ret =3D PTR_ERR(data->vdd_reg);
+		if (ret !=3D -ENODEV)
+			return ret;
+	}
+
+	data->vddio_reg =3D devm_regulator_get_optional(&client->dev, "vddio");
+	if (!IS_ERR(data->vddio_reg)) {
+		ret =3D regulator_enable(data->vddio_reg);
+		if (ret) {
+			dev_err(&client->dev, "failed to enable VDDIO regulator\n");
+			goto disable_regulator_vdd;
+		}
+	} else {
+		ret =3D PTR_ERR(data->vddio_reg);
+		if (ret !=3D -ENODEV)
+			goto disable_regulator_vdd;
+	}
=20
 	ret =3D i2c_smbus_read_byte_data(client, MMA8452_WHO_AM_I);
 	if (ret < 0)
-		return ret;
+		goto disable_regulators;
=20
 	switch (ret) {
 	case MMA8451_DEVICE_ID:
@@ -1549,7 +1577,8 @@ static int mma8452_probe(struct i2c_client *client,
 			break;
 		/* else: fall through */
 	default:
-		return -ENODEV;
+		ret =3D -ENODEV;
+		goto disable_regulators;
 	}
=20
 	dev_info(&client->dev, "registering %s accelerometer; ID 0x%x\n",
@@ -1566,13 +1595,13 @@ static int mma8452_probe(struct i2c_client *client,
=20
 	ret =3D mma8452_reset(client);
 	if (ret < 0)
-		return ret;
+		goto disable_regulators;
=20
 	data->data_cfg =3D MMA8452_DATA_CFG_FS_2G;
 	ret =3D i2c_smbus_write_byte_data(client, MMA8452_DATA_CFG,
 					data->data_cfg);
 	if (ret < 0)
-		return ret;
+		goto disable_regulators;
=20
 	/*
 	 * By default set transient threshold to max to avoid events if
@@ -1581,7 +1610,7 @@ static int mma8452_probe(struct i2c_client *client,
 	ret =3D i2c_smbus_write_byte_data(client, MMA8452_TRANSIENT_THS,
 					MMA8452_TRANSIENT_THS_MASK);
 	if (ret < 0)
-		return ret;
+		goto disable_regulators;
=20
 	if (client->irq) {
 		int irq2;
@@ -1595,7 +1624,7 @@ static int mma8452_probe(struct i2c_client *client,
 						MMA8452_CTRL_REG5,
 						data->chip_info->all_events);
 			if (ret < 0)
-				return ret;
+				goto disable_regulators;
=20
 			dev_dbg(&client->dev, "using interrupt line INT1\n");
 		}
@@ -1604,11 +1633,11 @@ static int mma8452_probe(struct i2c_client *client,
 					MMA8452_CTRL_REG4,
 					data->chip_info->enabled_events);
 		if (ret < 0)
-			return ret;
+			goto disable_regulators;
=20
 		ret =3D mma8452_trigger_setup(indio_dev);
 		if (ret < 0)
-			return ret;
+			goto disable_regulators;
 	}
=20
 	data->ctrl_reg1 =3D MMA8452_CTRL_ACTIVE |
@@ -1661,12 +1690,22 @@ static int mma8452_probe(struct i2c_client *client,
 trigger_cleanup:
 	mma8452_trigger_cleanup(indio_dev);
=20
+disable_regulators:
+	if (!IS_ERR(data->vddio_reg))
+		regulator_disable(data->vddio_reg);
+
+disable_regulator_vdd:
+	if (!IS_ERR(data->vdd_reg))
+		regulator_disable(data->vdd_reg);
+
 	return ret;
 }
=20
 static int mma8452_remove(struct i2c_client *client)
 {
 	struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
+	struct mma8452_data *data =3D iio_priv(indio_dev);
+	int ret;
=20
 	iio_device_unregister(indio_dev);
=20
@@ -1678,6 +1717,21 @@ static int mma8452_remove(struct i2c_client *client)
 	mma8452_trigger_cleanup(indio_dev);
 	mma8452_standby(iio_priv(indio_dev));
=20
+	if (!IS_ERR(data->vddio_reg)) {
+		ret =3D regulator_disable(data->vddio_reg);
+		if (ret) {
+			dev_err(&client->dev, "failed to disable VDDIO regulator\n");
+			return ret;
+		}
+	}
+	if (!IS_ERR(data->vdd_reg)) {
+		ret =3D regulator_disable(data->vdd_reg);
+		if (ret) {
+			dev_err(&client->dev, "failed to disable VDD regulator\n");
+			return ret;
+		}
+	}
+
 	return 0;
 }
=20
@@ -1696,6 +1750,21 @@ static int mma8452_runtime_suspend(struct device *de=
v)
 		return -EAGAIN;
 	}
=20
+	if (!IS_ERR(data->vddio_reg)) {
+		ret =3D regulator_disable(data->vddio_reg);
+		if (ret) {
+			dev_err(dev, "failed to disable VDDIO regulator\n");
+			return ret;
+		}
+	}
+	if (!IS_ERR(data->vdd_reg)) {
+		ret =3D regulator_disable(data->vdd_reg);
+		if (ret) {
+			dev_err(dev, "failed to disable VDD regulator\n");
+			return ret;
+		}
+	}
+
 	return 0;
 }
=20
@@ -1705,6 +1774,23 @@ static int mma8452_runtime_resume(struct device *dev=
)
 	struct mma8452_data *data =3D iio_priv(indio_dev);
 	int ret, sleep_val;
=20
+	if (!IS_ERR(data->vdd_reg)) {
+		ret =3D regulator_enable(data->vdd_reg);
+		if (ret) {
+			dev_err(dev, "failed to enable VDD regulator\n");
+			return ret;
+		}
+	}
+	if (!IS_ERR(data->vddio_reg)) {
+		ret =3D regulator_enable(data->vddio_reg);
+		if (ret) {
+			dev_err(dev, "failed to enable VDDIO regulator\n");
+			if (!IS_ERR(data->vdd_reg))
+				regulator_disable(data->vdd_reg);
+			return ret;
+		}
+	}
+
 	ret =3D mma8452_active(data);
 	if (ret < 0)
 		return ret;
@@ -1723,14 +1809,94 @@ static int mma8452_runtime_resume(struct device *de=
v)
 #ifdef CONFIG_PM_SLEEP
 static int mma8452_suspend(struct device *dev)
 {
-	return mma8452_standby(iio_priv(i2c_get_clientdata(
+	struct iio_dev *indio_dev =3D i2c_get_clientdata(to_i2c_client(dev));
+	struct mma8452_data *data =3D iio_priv(indio_dev);
+	int ret;
+
+	if (!IS_ERR(data->vdd_reg)) {
+		ret =3D regulator_enable(data->vdd_reg);
+		if (ret) {
+			dev_err(dev, "failed to enable VDD regulator\n");
+			return ret;
+		}
+	}
+	if (!IS_ERR(data->vddio_reg)) {
+		ret =3D regulator_enable(data->vddio_reg);
+		if (ret) {
+			dev_err(dev, "failed to enable VDDIO regulator\n");
+			if (!IS_ERR(data->vdd_reg))
+				regulator_disable(data->vdd_reg);
+			return ret;
+		}
+	}
+
+	ret =3D mma8452_standby(iio_priv(i2c_get_clientdata(
 		to_i2c_client(dev))));
+	if (ret)
+		return ret;
+
+	if (!IS_ERR(data->vddio_reg)) {
+		ret =3D regulator_disable(data->vddio_reg);
+		if (ret) {
+			dev_err(dev, "failed to disable VDDIO regulator\n");
+			return ret;
+		}
+	}
+	if (!IS_ERR(data->vdd_reg)) {
+		ret =3D regulator_disable(data->vdd_reg);
+		if (ret) {
+			dev_err(dev, "failed to disable VDD regulator\n");
+			return ret;
+		}
+	}
+
+	return 0;
 }
=20
 static int mma8452_resume(struct device *dev)
 {
-	return mma8452_active(iio_priv(i2c_get_clientdata(
+	struct iio_dev *indio_dev =3D i2c_get_clientdata(to_i2c_client(dev));
+	struct mma8452_data *data =3D iio_priv(indio_dev);
+	int ret;
+
+	if (!IS_ERR(data->vdd_reg)) {
+		ret =3D regulator_enable(data->vdd_reg);
+		if (ret) {
+			dev_err(dev, "failed to enable VDD regulator\n");
+			return ret;
+		}
+	}
+	if (!IS_ERR(data->vddio_reg)) {
+		ret =3D regulator_enable(data->vddio_reg);
+		if (ret) {
+			dev_err(dev, "failed to enable VDDIO regulator\n");
+			if (!IS_ERR(data->vdd_reg))
+				regulator_disable(data->vdd_reg);
+			return ret;
+		}
+	}
+
+	ret =3D mma8452_active(iio_priv(i2c_get_clientdata(
 		to_i2c_client(dev))));
+	if (ret)
+		return ret;
+
+	if (!IS_ERR(data->vddio_reg)) {
+		ret =3D regulator_disable(data->vddio_reg);
+		if (ret) {
+			dev_err(dev, "failed to disable VDDIO regulator\n");
+			return ret;
+		}
+	}
+	if (!IS_ERR(data->vdd_reg)) {
+		ret =3D regulator_disable(data->vdd_reg);
+		if (ret) {
+			dev_err(dev, "failed to disable VDD regulator\n");
+			return ret;
+		}
+	}
+
+	return 0;
 }
 #endif
=20
--=20
2.7.4
