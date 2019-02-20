From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 8/9] iio: magnetometer: bmc150: add mount matrix support
Date: Wed, 20 Feb 2019 15:00:55 +0100
Message-ID: <2600653840b79a9817b68c17b47ef9b043137d20.1550671256.git.hns@goldelico.com>
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
 drivers/iio/magnetometer/bmc150_magn.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/iio/magnetometer/bmc150_magn.c b/drivers/iio/magnetometer/bmc150_magn.c
index d91cb845e3d6..48e3a16432b4 100644
--- a/drivers/iio/magnetometer/bmc150_magn.c
+++ b/drivers/iio/magnetometer/bmc150_magn.c
@@ -143,6 +143,7 @@ struct bmc150_magn_data {
 	 */
 	struct mutex mutex;
 	struct regmap *regmap;
+	struct iio_mount_matrix orientation;
 	/* 4 x 32 bits for x, y z, 4 bytes align, 64 bits timestamp */
 	s32 buffer[6];
 	struct iio_trigger *dready_trig;
@@ -612,6 +613,18 @@ static ssize_t bmc150_magn_show_samp_freq_avail(struct device *dev,
 	return len;
 }
 
+static const struct iio_mount_matrix *
+bmc150_magn_get_mount_matrix(const struct iio_dev *indio_dev,
+			      const struct iio_chan_spec *chan)
+{
+	return &((struct bmc150_magn_data *)iio_priv(indio_dev))->orientation;
+}
+
+static const struct iio_chan_spec_ext_info bmc150_magn_ext_info[] = {
+	IIO_MOUNT_MATRIX(IIO_SHARED_BY_DIR, bmc150_magn_get_mount_matrix),
+	{ },
+};
+
 static IIO_DEV_ATTR_SAMP_FREQ_AVAIL(bmc150_magn_show_samp_freq_avail);
 
 static struct attribute *bmc150_magn_attributes[] = {
@@ -638,6 +651,7 @@ static const struct attribute_group bmc150_magn_attrs_group = {
 		.storagebits = 32,					\
 		.endianness = IIO_LE					\
 	},								\
+	.ext_info = bmc150_magn_ext_info,				\
 }
 
 static const struct iio_chan_spec bmc150_magn_channels[] = {
@@ -861,6 +875,11 @@ int bmc150_magn_probe(struct device *dev, struct regmap *regmap,
 	data->irq = irq;
 	data->dev = dev;
 
+	ret = of_iio_read_mount_matrix(dev, "mount-matrix",
+				&data->orientation);
+	if (ret)
+		return ret;
+
 	if (!name && ACPI_HANDLE(dev))
 		name = bmc150_magn_match_acpi_device(dev);
 
-- 
2.19.1
