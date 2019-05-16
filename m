From: Beniamin Bia <beniamin.bia@analog.com>
Subject: [PATCH 3/5] iio: adc: ad7606: Make SPI register calculation generic and add spi support
Date: Thu, 16 May 2019 17:32:06 +0300
Message-ID: <20190516143208.19294-3-beniamin.bia@analog.com>
References: <20190516143208.19294-1-beniamin.bia@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190516143208.19294-1-beniamin.bia@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, knaack.h@gmx.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, biabeniamin@outlook.com, Beniamin Bia <beniamin.bia@analog.com>
List-Id: devicetree@vger.kernel.org

In order to support AD7616 software mode, the spi register access must be
added and the calculation of registers address must be generic.
The length of address and bit which specifies the read/write operation is
different for every device, that is why it was made generic.

Signed-off-by: Beniamin Bia <beniamin.bia@analog.com>
---
 drivers/iio/adc/ad7606.c | 60 ++++++++++++++++++++++++++++++++++++++++
 drivers/iio/adc/ad7606.h |  2 ++
 2 files changed, 62 insertions(+)

diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
index aba0fd123a51..6df81117cacc 100644
--- a/drivers/iio/adc/ad7606.c
+++ b/drivers/iio/adc/ad7606.c
@@ -25,6 +25,8 @@
 #include <linux/iio/triggered_buffer.h>
 #include <linux/iio/trigger_consumer.h>
 
+#include <linux/spi/spi.h>
+
 #include "ad7606.h"
 
 /*
@@ -43,6 +45,11 @@ static const unsigned int ad7616_oversampling_avail[8] = {
 	1, 2, 4, 8, 16, 32, 64, 128,
 };
 
+static int ad7616_spi_rd_wr_cmd(int addr, char isWriteOp)
+{
+	return ((addr & 0x7F) << 1) | ((isWriteOp & 0x1) << 7);
+}
+
 static int ad7606_reset(struct ad7606_state *st)
 {
 	if (st->gpio_reset) {
@@ -55,6 +62,59 @@ static int ad7606_reset(struct ad7606_state *st)
 	return -ENODEV;
 }
 
+static int ad7606_spi_reg_read(struct ad7606_state *st, unsigned int addr)
+{
+	struct spi_device *spi = to_spi_device(st->dev);
+	struct spi_transfer t[] = {
+		{
+			.tx_buf = &st->data[0],
+			.len = 2,
+			.cs_change = 0,
+		}, {
+			.rx_buf = &st->data[1],
+			.len = 2,
+		},
+	};
+	int ret;
+
+	st->data[0] = cpu_to_be16(st->chip_info->spi_rd_wr_cmd(addr, 0) << 8);
+
+	ret = spi_sync_transfer(spi, t, ARRAY_SIZE(t));
+	if (ret < 0)
+		return ret;
+
+	return be16_to_cpu(st->data[1]);
+}
+
+static int ad7606_spi_reg_write(struct ad7606_state *st,
+				unsigned int addr,
+				unsigned int val)
+{
+	struct spi_device *spi = to_spi_device(st->dev);
+
+	st->data[0] = cpu_to_be16((st->chip_info->spi_rd_wr_cmd(addr, 1) << 8) |
+				  (val & 0x1FF));
+
+	return spi_write(spi, &st->data[0], sizeof(st->data[0]));
+}
+
+static int ad7606_spi_write_mask(struct ad7606_state *st,
+				 unsigned int addr,
+				 unsigned long mask,
+				 unsigned int val)
+{
+	int readval;
+
+	readval = ad7606_spi_reg_read(st, addr);
+	if (readval < 0)
+		return readval;
+
+	readval &= ~mask;
+	readval |= val;
+
+	return ad7606_spi_reg_write(st, addr, readval);
+}
+
 static int ad7606_read_samples(struct ad7606_state *st)
 {
 	unsigned int num = st->chip_info->num_channels;
diff --git a/drivers/iio/adc/ad7606.h b/drivers/iio/adc/ad7606.h
index d8a509c2c428..dfc60af9b8ac 100644
--- a/drivers/iio/adc/ad7606.h
+++ b/drivers/iio/adc/ad7606.h
@@ -16,6 +16,7 @@
  *			oversampling ratios.
  * @oversampling_num	number of elements stored in oversampling_avail array
  * @os_req_reset	some devices require a reset to update oversampling
+ * @spi_rd_wr_cmd	pointer to the function which calculates the spi address
  * @write_scale_sw	pointer to the function which writes the scale via spi
 			in software mode
  * @write_os_sw		pointer to the function which writes the os via spi
@@ -29,6 +30,7 @@ struct ad7606_chip_info {
 	const unsigned int		*oversampling_avail;
 	unsigned int			oversampling_num;
 	bool				os_req_reset;
+	int (*spi_rd_wr_cmd)(int addr, char isWriteOp);
 	int (*write_scale_sw)(struct iio_dev *indio_dev, int ch, int val);
 	int (*write_os_sw)(struct iio_dev *indio_dev, int val);
 	int (*sw_mode_config)(struct iio_dev *indio_dev);
-- 
2.17.1
