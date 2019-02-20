From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 6/9] iio: gyro: bmg160: add mount matrix support
Date: Wed, 20 Feb 2019 15:00:53 +0100
Message-ID: <56495e0c2fe1b943430c26e14924a436718af9b9.1550671256.git.hns@goldelico.com>
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
 drivers/iio/gyro/bmg160_core.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/iio/gyro/bmg160_core.c b/drivers/iio/gyro/bmg160_core.c
index 63ca31628a93..7ae59be9a5ef 100644
--- a/drivers/iio/gyro/bmg160_core.c
+++ b/drivers/iio/gyro/bmg160_core.c
@@ -102,6 +102,7 @@ struct bmg160_data {
 	struct regmap *regmap;
 	struct iio_trigger *dready_trig;
 	struct iio_trigger *motion_trig;
+	struct iio_mount_matrix orientation;
 	struct mutex mutex;
 	s16 buffer[8];
 	u32 dps_range;
@@ -794,6 +795,18 @@ static int bmg160_write_event_config(struct iio_dev *indio_dev,
 	return 0;
 }
 
+static const struct iio_mount_matrix *
+bmg160_get_mount_matrix(const struct iio_dev *indio_dev,
+			 const struct iio_chan_spec *chan)
+{
+	return &((struct bmg160_data *)iio_priv(indio_dev))->orientation;
+}
+
+static const struct iio_chan_spec_ext_info bmg160_ext_info[] = {
+	IIO_MOUNT_MATRIX(IIO_SHARED_BY_DIR, bmg160_get_mount_matrix),
+	{ },
+};
+
 static IIO_CONST_ATTR_SAMP_FREQ_AVAIL("100 200 400 1000 2000");
 
 static IIO_CONST_ATTR(in_anglvel_scale_available,
@@ -831,6 +844,7 @@ static const struct iio_event_spec bmg160_event = {
 		.storagebits = 16,					\
 		.endianness = IIO_LE,					\
 	},								\
+	.ext_info = bmg160_ext_info,					\
 	.event_spec = &bmg160_event,					\
 	.num_event_specs = 1						\
 }
@@ -1075,6 +1089,11 @@ int bmg160_core_probe(struct device *dev, struct regmap *regmap, int irq,
 	data->irq = irq;
 	data->regmap = regmap;
 
+	ret = of_iio_read_mount_matrix(dev, "mount-matrix",
+				&data->orientation);
+	if (ret)
+		return ret;
+
 	ret = bmg160_chip_init(data);
 	if (ret < 0)
 		return ret;
-- 
2.19.1
