From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 4/9] iio: accel: bma180: add mount matrix support
Date: Wed, 20 Feb 2019 15:00:51 +0100
Message-ID: <445e2cafb4c741859219830bc1204bb3cb87f152.1550671256.git.hns@goldelico.com>
References: <cover.1550671256.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1550671256.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "H. Nikolaus Schaller" <hns@goldelico.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Song Qiang <songqiang1304521@gmail.com>
Cc: letux-kernel@openphoenux.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch allows to read a mount-matrix device tree
property and report to user-space or in-kernel iio
clients.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/iio/accel/bma180.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/iio/accel/bma180.c b/drivers/iio/accel/bma180.c
index cb9765a3de60..248be67e4f41 100644
--- a/drivers/iio/accel/bma180.c
+++ b/drivers/iio/accel/bma180.c
@@ -116,6 +116,7 @@ struct bma180_data {
 	struct i2c_client *client;
 	struct iio_trigger *trig;
 	const struct bma180_part_info *part_info;
+	struct iio_mount_matrix orientation;
 	struct mutex mutex;
 	bool sleep_state;
 	int scale;
@@ -561,6 +562,13 @@ static int bma180_set_power_mode(struct iio_dev *indio_dev,
 	return ret;
 }
 
+static const struct iio_mount_matrix *
+bma180_accel_get_mount_matrix(const struct iio_dev *indio_dev,
+				const struct iio_chan_spec *chan)
+{
+	return &((struct bma180_data *)iio_priv(indio_dev))->orientation;
+}
+
 static const struct iio_enum bma180_power_mode_enum = {
 	.items = bma180_power_modes,
 	.num_items = ARRAY_SIZE(bma180_power_modes),
@@ -571,6 +579,7 @@ static const struct iio_enum bma180_power_mode_enum = {
 static const struct iio_chan_spec_ext_info bma180_ext_info[] = {
 	IIO_ENUM("power_mode", true, &bma180_power_mode_enum),
 	IIO_ENUM_AVAILABLE("power_mode", &bma180_power_mode_enum),
+	IIO_MOUNT_MATRIX(IIO_SHARED_BY_DIR, bma180_accel_get_mount_matrix),
 	{ },
 };
 
@@ -722,6 +731,11 @@ static int bma180_probe(struct i2c_client *client,
 		chip = id->driver_data;
 	data->part_info = &bma180_part_info[chip];
 
+	ret = of_iio_read_mount_matrix(&client->dev, "mount-matrix",
+				&data->orientation);
+	if (ret)
+		return ret;
+
 	ret = data->part_info->chip_config(data);
 	if (ret < 0)
 		goto err_chip_disable;
-- 
2.19.1
