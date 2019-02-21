From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 03/10] iio: accel: bmc150: add mount matrix support
Date: Thu, 21 Feb 2019 18:02:48 +0100
Message-ID: <5d256b403997704072ea5f5889a63adfe67b3a86.1550768574.git.hns@goldelico.com>
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
 drivers/iio/accel/bmc150-accel-core.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/iio/accel/bmc150-accel-core.c b/drivers/iio/accel/bmc150-accel-core.c
index 383c802eb5b8..b4e2d9b04e1d 100644
--- a/drivers/iio/accel/bmc150-accel-core.c
+++ b/drivers/iio/accel/bmc150-accel-core.c
@@ -204,6 +204,7 @@ struct bmc150_accel_data {
 	int ev_enable_state;
 	int64_t timestamp, old_timestamp; /* Only used in hw fifo mode. */
 	const struct bmc150_accel_chip_info *chip_info;
+	struct iio_mount_matrix orientation;
 };
 
 static const struct {
@@ -796,6 +797,20 @@ static ssize_t bmc150_accel_get_fifo_state(struct device *dev,
 	return sprintf(buf, "%d\n", state);
 }
 
+static const struct iio_mount_matrix *
+bmc150_accel_get_mount_matrix(const struct iio_dev *indio_dev,
+				const struct iio_chan_spec *chan)
+{
+	struct bmc150_accel_data *data = iio_priv(indio_dev);
+
+	return &data->orientation;
+}
+
+static const struct iio_chan_spec_ext_info bmc150_accel_ext_info[] = {
+	IIO_MOUNT_MATRIX(IIO_SHARED_BY_DIR, bmc150_accel_get_mount_matrix),
+	{ }
+};
+
 static IIO_CONST_ATTR(hwfifo_watermark_min, "1");
 static IIO_CONST_ATTR(hwfifo_watermark_max,
 		      __stringify(BMC150_ACCEL_FIFO_LENGTH));
@@ -978,6 +993,7 @@ static const struct iio_event_spec bmc150_accel_event = {
 		.shift = 16 - (bits),					\
 		.endianness = IIO_LE,					\
 	},								\
+	.ext_info = bmc150_accel_ext_info,				\
 	.event_spec = &bmc150_accel_event,				\
 	.num_event_specs = 1						\
 }
@@ -1555,6 +1571,11 @@ int bmc150_accel_core_probe(struct device *dev, struct regmap *regmap, int irq,
 
 	data->regmap = regmap;
 
+	ret = iio_read_mount_matrix(dev, "mount-matrix",
+				     &data->orientation);
+	if (ret)
+		return ret;
+
 	ret = bmc150_accel_chip_init(data);
 	if (ret < 0)
 		return ret;
-- 
2.19.1
