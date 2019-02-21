From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 08/10] iio: magnetometer: hmc5843: add mount matrix support
Date: Thu, 21 Feb 2019 18:02:53 +0100
Message-ID: <fc3228d92f0c428e96e9925cd28378983596738d.1550768574.git.hns@goldelico.com>
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
 drivers/iio/magnetometer/hmc5843.h      |  1 +
 drivers/iio/magnetometer/hmc5843_core.c | 20 ++++++++++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/magnetometer/hmc5843.h b/drivers/iio/magnetometer/hmc5843.h
index a75224cf99df..e3e22d2508d3 100644
--- a/drivers/iio/magnetometer/hmc5843.h
+++ b/drivers/iio/magnetometer/hmc5843.h
@@ -43,6 +43,7 @@ struct hmc5843_data {
 	struct mutex lock;
 	struct regmap *regmap;
 	const struct hmc5843_chip_info *variant;
+	struct iio_mount_matrix orientation;
 	__be16 buffer[8];
 };
 
diff --git a/drivers/iio/magnetometer/hmc5843_core.c b/drivers/iio/magnetometer/hmc5843_core.c
index ada142fb7aa3..05629ec56d80 100644
--- a/drivers/iio/magnetometer/hmc5843_core.c
+++ b/drivers/iio/magnetometer/hmc5843_core.c
@@ -237,6 +237,15 @@ int hmc5843_set_measurement_configuration(struct iio_dev *indio_dev,
 	return hmc5843_set_meas_conf(data, meas_conf);
 }
 
+static const struct iio_mount_matrix *
+hmc5843_get_mount_matrix(const struct iio_dev *indio_dev,
+			  const struct iio_chan_spec *chan)
+{
+	struct hmc5843_data *data = iio_priv(indio_dev);
+
+	return &data->orientation;
+}
+
 static const struct iio_enum hmc5843_meas_conf_enum = {
 	.items = hmc5843_meas_conf_modes,
 	.num_items = ARRAY_SIZE(hmc5843_meas_conf_modes),
@@ -247,7 +256,8 @@ static const struct iio_enum hmc5843_meas_conf_enum = {
 static const struct iio_chan_spec_ext_info hmc5843_ext_info[] = {
 	IIO_ENUM("meas_conf", true, &hmc5843_meas_conf_enum),
 	IIO_ENUM_AVAILABLE("meas_conf", &hmc5843_meas_conf_enum),
-	{ },
+	IIO_MOUNT_MATRIX(IIO_SHARED_BY_DIR, hmc5843_get_mount_matrix),
+	{ }
 };
 
 static const struct iio_enum hmc5983_meas_conf_enum = {
@@ -260,7 +270,8 @@ static const struct iio_enum hmc5983_meas_conf_enum = {
 static const struct iio_chan_spec_ext_info hmc5983_ext_info[] = {
 	IIO_ENUM("meas_conf", true, &hmc5983_meas_conf_enum),
 	IIO_ENUM_AVAILABLE("meas_conf", &hmc5983_meas_conf_enum),
-	{ },
+	IIO_MOUNT_MATRIX(IIO_SHARED_BY_DIR, hmc5843_get_mount_matrix),
+	{ }
 };
 
 static
@@ -635,6 +646,11 @@ int hmc5843_common_probe(struct device *dev, struct regmap *regmap,
 	data->variant = &hmc5843_chip_info_tbl[id];
 	mutex_init(&data->lock);
 
+	ret = iio_read_mount_matrix(dev, "mount-matrix",
+				&data->orientation);
+	if (ret)
+		return ret;
+
 	indio_dev->dev.parent = dev;
 	indio_dev->name = name;
 	indio_dev->info = &hmc5843_info;
-- 
2.19.1
