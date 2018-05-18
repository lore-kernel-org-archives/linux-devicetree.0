From: David Veenstra <davidjulianveenstra@gmail.com>
Subject: [PATCH v4 05/12] staging: iio: ad2s1200: Replace legacy gpio API
 with modern API
Date: Fri, 18 May 2018 20:21:56 +0200
Message-ID: <78bc9c09403ac1fa08d610a86505416b85edb306.1526667118.git.davidjulianveenstra@gmail.com>
References: <cover.1526667118.git.davidjulianveenstra@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <cover.1526667118.git.davidjulianveenstra@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: jic23@kernel.org, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org
Cc: linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Michael.Hennerich@analog.com, knaack.h@gmx.de
List-Id: devicetree@vger.kernel.org

The legacy, integer based gpio API is replaced with the modern
descriptor based API.

Signed-off-by: David Veenstra <davidjulianveenstra@gmail.com>
---
 drivers/staging/iio/resolver/ad2s1200.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1200.c b/drivers/staging/iio/resolver/ad2s1200.c
index 430cc62591fe..b2c46a8c6b77 100644
--- a/drivers/staging/iio/resolver/ad2s1200.c
+++ b/drivers/staging/iio/resolver/ad2s1200.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/spi/spi.h>
@@ -43,8 +44,8 @@
 struct ad2s1200_state {
 	struct mutex lock;
 	struct spi_device *sdev;
-	int sample;
-	int rdvel;
+	struct gpio_desc *sample;
+	struct gpio_desc *rdvel;
 	__be16 rx ____cacheline_aligned;
 };
 
@@ -58,12 +59,12 @@ static int ad2s1200_read_raw(struct iio_dev *indio_dev,
 	int ret;
 
 	mutex_lock(&st->lock);
-	gpio_set_value(st->sample, 0);
+	gpiod_set_value(st->sample, 0);
 
 	/* delay (6 * AD2S1200_TSCLK + 20) nano seconds */
 	udelay(1);
-	gpio_set_value(st->sample, 1);
-	gpio_set_value(st->rdvel, !!(chan->type == IIO_ANGL));
+	gpiod_set_value(st->sample, 1);
+	gpiod_set_value(st->rdvel, !!(chan->type == IIO_ANGL));
 
 	ret = spi_read(st->sdev, &st->rx, 2);
 	if (ret < 0) {
@@ -133,8 +134,8 @@ static int ad2s1200_probe(struct spi_device *spi)
 	st = iio_priv(indio_dev);
 	mutex_init(&st->lock);
 	st->sdev = spi;
-	st->sample = pins[0];
-	st->rdvel = pins[1];
+	st->sample = gpio_to_desc(pins[0]);
+	st->rdvel = gpio_to_desc(pins[1]);
 
 	indio_dev->dev.parent = &spi->dev;
 	indio_dev->info = &ad2s1200_info;
-- 
2.17.0
