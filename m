From: David Veenstra <davidjulianveenstra@gmail.com>
Subject: [PATCH v3 3/9] staging: iio: ad2s1200: Replace legacy gpio API with
 modern API
Date: Mon, 23 Apr 2018 00:03:16 +0200
Message-ID: <14ae9c1f81cf85a04d6d44109fad6cb4891be4c4.1524432236.git.davidjulianveenstra@gmail.com>
References: <cover.1524432236.git.davidjulianveenstra@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <cover.1524432236.git.davidjulianveenstra@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: jic23@kernel.org, lars@metafoo.de, pmeerw@pmeerw.net
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org, robh+dt@kernel.org, knaack.h@gmx.de, daniel.baluta@nxp.com
List-Id: devicetree@vger.kernel.org

The legacy, integer based gpio API is replaced with the modern
descriptor based API.

Signed-off-by: David Veenstra <davidjulianveenstra@gmail.com>
---
Changes in v3:
 - This patch no longer deals with dt bindings. See the next
   patch.

 drivers/staging/iio/resolver/ad2s1200.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1200.c b/drivers/staging/iio/resolver/ad2s1200.c
index 998f458dc1bd..e7bfe5aa4c45 100644
--- a/drivers/staging/iio/resolver/ad2s1200.c
+++ b/drivers/staging/iio/resolver/ad2s1200.c
@@ -14,6 +14,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/spi/spi.h>
@@ -45,8 +46,8 @@
 struct ad2s1200_state {
 	struct mutex lock;
 	struct spi_device *sdev;
-	int sample;
-	int rdvel;
+	struct gpio_desc *sample;
+	struct gpio_desc *rdvel;
 	__be16 rx ____cacheline_aligned;
 };
 
@@ -60,12 +61,12 @@ static int ad2s1200_read_raw(struct iio_dev *indio_dev,
 	int ret = 0;
 
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
@@ -135,8 +136,8 @@ static int ad2s1200_probe(struct spi_device *spi)
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
2.16.2
