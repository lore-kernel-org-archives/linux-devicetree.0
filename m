From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V2 2/2] iio: accell: mma8452: add optional vdd/vddio regulator
 operation support
Date: Mon, 10 Dec 2018 07:25:28 +0000
Message-ID: <1544426368-16415-2-git-send-email-Anson.Huang@nxp.com>
References: <1544426368-16415-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544426368-16415-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "jic23@kernel.org" <jic23@kernel.org>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "lars@metafoo.de" <lars@metafoo.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "rtresidd@electromag.com.au" <rtresidd@electromag.com.au>, "gustavo@embeddedor.com" <gustavo@embeddedor.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Leonard Crestez <leonard.crestez@nxp.com>, "martink@posteo.de" <martink@posteo.de>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

The accelerometer's power supply could be controlled by regulator
on some platforms, such as i.MX6Q-SABRESD board, the mma8451's
power supply is controlled by a GPIO fixed regulator, need to make
sure the regulator is enabled before any communication with mma8451,
this patch adds optional vdd/vddio regulator operation support.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
ChangeLog since V1:
    - Add defer_probe check if the return value from devm_regulator_get_opt=
ional is ERR_PTR(-EPROBE_DEFER);
    - Replace the "vcc" with "vdd" according to datasheet, and add optional=
 "vddio" supply as well since
      mma8452 also has a vddio supply.
---
 drivers/iio/accel/mma8452.c | 151 ++++++++++++++++++++++++++++++++++++++++=
+++-
 1 file changed, 149 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
index 421a0a8..18dcf33 100644
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
@@ -1533,6 +1536,27 @@ static int mma8452_probe(struct i2c_client *client,
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
+	} else if (data->vdd_reg =3D=3D ERR_PTR(-EPROBE_DEFER)) {
+		return -EPROBE_DEFER;
+	}
+
+	data->vddio_reg =3D devm_regulator_get_optional(&client->dev, "vddio");
+	if (!IS_ERR(data->vddio_reg)) {
+		ret =3D regulator_enable(data->vddio_reg);
+		if (ret) {
+			dev_err(&client->dev, "failed to enable VDDIO regulator\n");
+			return ret;
+		}
+	} else if (data->vddio_reg =3D=3D ERR_PTR(-EPROBE_DEFER)) {
+		return -EPROBE_DEFER;
+	}
=20
 	ret =3D i2c_smbus_read_byte_data(client, MMA8452_WHO_AM_I);
 	if (ret < 0)
@@ -1667,6 +1691,8 @@ static int mma8452_probe(struct i2c_client *client,
 static int mma8452_remove(struct i2c_client *client)
 {
 	struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
+	struct mma8452_data *data =3D iio_priv(indio_dev);
+	int ret;
=20
 	iio_device_unregister(indio_dev);
=20
@@ -1678,6 +1704,21 @@ static int mma8452_remove(struct i2c_client *client)
 	mma8452_trigger_cleanup(indio_dev);
 	mma8452_standby(iio_priv(indio_dev));
=20
+	if (!IS_ERR(data->vdd_reg)) {
+		ret =3D regulator_disable(data->vdd_reg);
+		if (ret) {
+			dev_err(&client->dev, "failed to disable VDD regulator\n");
+			return ret;
+		}
+	}
+	if (!IS_ERR(data->vddio_reg)) {
+		ret =3D regulator_disable(data->vddio_reg);
+		if (ret) {
+			dev_err(&client->dev, "failed to disable VDDIO regulator\n");
+			return ret;
+		}
+	}
+
 	return 0;
 }
=20
@@ -1696,6 +1737,21 @@ static int mma8452_runtime_suspend(struct device *de=
v)
 		return -EAGAIN;
 	}
=20
+	if (!IS_ERR(data->vdd_reg)) {
+		ret =3D regulator_disable(data->vdd_reg);
+		if (ret) {
+			dev_err(dev, "failed to disable VDD regulator\n");
+			return ret;
+		}
+	}
+	if (!IS_ERR(data->vddio_reg)) {
+		ret =3D regulator_disable(data->vddio_reg);
+		if (ret) {
+			dev_err(dev, "failed to disable VDDIO regulator\n");
+			return ret;
+		}
+	}
+
 	return 0;
 }
=20
@@ -1705,6 +1761,21 @@ static int mma8452_runtime_resume(struct device *dev=
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
+			return ret;
+		}
+	}
+
 	ret =3D mma8452_active(data);
 	if (ret < 0)
 		return ret;
@@ -1723,14 +1794,90 @@ static int mma8452_runtime_resume(struct device *de=
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
+			return ret;
+		}
+	}
+
+	ret =3D mma8452_standby(iio_priv(i2c_get_clientdata(
 		to_i2c_client(dev))));
+	if (ret)
+		return ret;
+
+	if (!IS_ERR(data->vdd_reg)) {
+		ret =3D regulator_disable(data->vdd_reg);
+		if (ret) {
+			dev_err(dev, "failed to disable VDD regulator\n");
+			return ret;
+		}
+	}
+	if (!IS_ERR(data->vddio_reg)) {
+		ret =3D regulator_disable(data->vddio_reg);
+		if (ret) {
+			dev_err(dev, "failed to disable VDDIO regulator\n");
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
+			return ret;
+		}
+	}
+
+	ret =3D mma8452_active(iio_priv(i2c_get_clientdata(
 		to_i2c_client(dev))));
+	if (ret)
+		return ret;
+
+	if (!IS_ERR(data->vdd_reg)) {
+		ret =3D regulator_disable(data->vdd_reg);
+		if (ret) {
+			dev_err(dev, "failed to disable VDD regulator\n");
+			return ret;
+		}
+	}
+	if (!IS_ERR(data->vddio_reg)) {
+		ret =3D regulator_disable(data->vddio_reg);
+		if (ret) {
+			dev_err(dev, "failed to disable VDDIO regulator\n");
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
