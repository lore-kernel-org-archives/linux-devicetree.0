From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 06/10] iio: gyro: itg3200: add mount matrix support
Date: Thu, 21 Feb 2019 18:02:51 +0100
Message-ID: <ad1f1af237439dcf2a0769280f9e7b1806d484f2.1550768574.git.hns@goldelico.com>
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
 drivers/iio/gyro/itg3200_core.c  | 20 ++++++++++++++++++++
 include/linux/iio/gyro/itg3200.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/iio/gyro/itg3200_core.c b/drivers/iio/gyro/itg3200_core.c
index 7adecb562c81..203a6be33b70 100644
--- a/drivers/iio/gyro/itg3200_core.c
+++ b/drivers/iio/gyro/itg3200_core.c
@@ -242,6 +242,20 @@ static int itg3200_initial_setup(struct iio_dev *indio_dev)
 	return ret;
 }
 
+static const struct iio_mount_matrix *
+itg3200_get_mount_matrix(const struct iio_dev *indio_dev,
+			  const struct iio_chan_spec *chan)
+{
+	struct itg3200 *data = iio_priv(indio_dev);
+
+	return &data->orientation;
+}
+
+static const struct iio_chan_spec_ext_info itg3200_ext_info[] = {
+	IIO_MOUNT_MATRIX(IIO_SHARED_BY_DIR, itg3200_get_mount_matrix),
+	{ }
+};
+
 #define ITG3200_ST						\
 	{ .sign = 's', .realbits = 16, .storagebits = 16, .endianness = IIO_BE }
 
@@ -255,6 +269,7 @@ static int itg3200_initial_setup(struct iio_dev *indio_dev)
 	.address = ITG3200_REG_GYRO_ ## _mod ## OUT_H, \
 	.scan_index = ITG3200_SCAN_GYRO_ ## _mod, \
 	.scan_type = ITG3200_ST, \
+	.ext_info = itg3200_ext_info, \
 }
 
 static const struct iio_chan_spec itg3200_channels[] = {
@@ -297,6 +312,11 @@ static int itg3200_probe(struct i2c_client *client,
 
 	st = iio_priv(indio_dev);
 
+	ret = iio_read_mount_matrix(&client->dev, "mount-matrix",
+				&st->orientation);
+	if (ret)
+		return ret;
+
 	i2c_set_clientdata(client, indio_dev);
 	st->i2c = client;
 
diff --git a/include/linux/iio/gyro/itg3200.h b/include/linux/iio/gyro/itg3200.h
index 2a820850f284..0a30fddccfb3 100644
--- a/include/linux/iio/gyro/itg3200.h
+++ b/include/linux/iio/gyro/itg3200.h
@@ -104,6 +104,7 @@
 struct itg3200 {
 	struct i2c_client	*i2c;
 	struct iio_trigger	*trig;
+	struct iio_mount_matrix orientation;
 };
 
 enum ITG3200_SCAN_INDEX {
-- 
2.19.1
