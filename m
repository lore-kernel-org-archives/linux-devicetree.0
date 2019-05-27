From: Beniamin Bia <beniamin.bia@analog.com>
Subject: [PATCH v2 4/4] iio: adc: ad7606: Add debug mode for ad7616
Date: Mon, 27 May 2019 15:56:50 +0300
Message-ID: <20190527125650.2405-4-beniamin.bia@analog.com>
References: <20190527125650.2405-1-beniamin.bia@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190527125650.2405-1-beniamin.bia@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, knaack.h@gmx.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, biabeniamin@outlook.com, Beniamin Bia <beniamin.bia@analog.com>
List-Id: devicetree@vger.kernel.org

Support for register access was added for spi devices.

Signed-off-by: Beniamin Bia <beniamin.bia@analog.com>
Acked-by: Jonathan Cameron <jic23@kernel.org>
---
Changes in v2:
-nothing changed

 drivers/iio/adc/ad7606.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
index 8e09ad4bb72e..0eccfc873802 100644
--- a/drivers/iio/adc/ad7606.c
+++ b/drivers/iio/adc/ad7606.c
@@ -134,6 +134,30 @@ static int ad7606_spi_write_mask(struct ad7606_state *st,
 	return ad7606_spi_reg_write(st, addr, readval);
 }
 
+static int ad7606_reg_access(struct iio_dev *indio_dev,
+			     unsigned int reg,
+			     unsigned int writeval,
+			     unsigned int *readval)
+{
+	struct ad7606_state *st = iio_priv(indio_dev);
+	int ret;
+
+	mutex_lock(&st->lock);
+	if (readval) {
+		ret = ad7606_spi_reg_read(st, reg);
+		if (ret < 0)
+			goto err_unlock;
+		*readval = ret;
+		ret = 0;
+	} else {
+		ret = ad7606_spi_reg_write(st, reg, writeval);
+	}
+err_unlock:
+	mutex_unlock(&st->lock);
+
+	return ret;
+}
+
 static int ad7606_read_samples(struct ad7606_state *st)
 {
 	unsigned int num = st->chip_info->num_channels;
@@ -645,6 +669,7 @@ static const struct iio_info ad7606_info_no_os_or_range = {
 static const struct iio_info ad7606_info_os_and_range = {
 	.read_raw = &ad7606_read_raw,
 	.write_raw = &ad7606_write_raw,
+	.debugfs_reg_access = &ad7606_reg_access,
 	.attrs = &ad7606_attribute_group_os_and_range,
 	.validate_trigger = &ad7606_validate_trigger,
 };
-- 
2.17.1
