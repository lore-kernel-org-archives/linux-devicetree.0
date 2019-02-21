From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 04/10] iio: accel: bma180: add mount matrix support
Date: Thu, 21 Feb 2019 18:02:49 +0100
Message-ID: <39eb050ab5ba5a10f624f95f2bf4582e4e7ccbde.1550768574.git.hns@goldelico.com>
References: <cover.1550768574.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1550768574.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "H. Nikolaus Schaller" <hns@goldelico.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Song Qiang <songqiang1304521@gmail.com>, Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Martin Kelly <mkelly@xevo.com>, Jonathan Marek <jonathan@marek.ca>, Brian Masney <masneyb@onstation.org>, Stephan Gerhold <stephan@gerhold.net>
Cc: letux-kernel@openphoenux.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch allows to read a mount-matrix device tree
property and report to user-space or in-kernel iio
clients.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/iio/accel/bma180.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/accel/bma180.c b/drivers/iio/accel/bma180.c
index cb9765a3de60..f9720a1e8a7c 100644
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
@@ -561,6 +562,15 @@ static int bma180_set_power_mode(struct iio_dev *indio_dev,
 	return ret;
 }
 
+static const struct iio_mount_matrix *
+bma180_accel_get_mount_matrix(const struct iio_dev *indio_dev,
+				const struct iio_chan_spec *chan)
+{
+	struct bma180_data *data = iio_priv(indio_dev);
+
+	return &data->orientation;
+}
+
 static const struct iio_enum bma180_power_mode_enum = {
 	.items = bma180_power_modes,
 	.num_items = ARRAY_SIZE(bma180_power_modes),
@@ -571,7 +581,8 @@ static const struct iio_enum bma180_power_mode_enum = {
 static const struct iio_chan_spec_ext_info bma180_ext_info[] = {
 	IIO_ENUM("power_mode", true, &bma180_power_mode_enum),
 	IIO_ENUM_AVAILABLE("power_mode", &bma180_power_mode_enum),
-	{ },
+	IIO_MOUNT_MATRIX(IIO_SHARED_BY_DIR, bma180_accel_get_mount_matrix),
+	{ }
 };
 
 #define BMA180_ACC_CHANNEL(_axis, _bits) {				\
@@ -722,6 +733,11 @@ static int bma180_probe(struct i2c_client *client,
 		chip = id->driver_data;
 	data->part_info = &bma180_part_info[chip];
 
+	ret = iio_read_mount_matrix(&client->dev, "mount-matrix",
+				&data->orientation);
+	if (ret)
+		return ret;
+
 	ret = data->part_info->chip_config(data);
 	if (ret < 0)
 		goto err_chip_disable;
-- 
2.19.1
