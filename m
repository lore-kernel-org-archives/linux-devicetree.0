From: Renato Lui Geh <renatogeh@gmail.com>
Subject: [PATCH v4 5/9] staging: iio: ad7780: move regulator to after GPIO init
Date: Thu, 28 Feb 2019 11:25:09 -0300
Message-ID: <93cabb081605ac356f2f0d9a9a41d5bc5e63820d.1551358569.git.renatogeh@gmail.com>
References: <cover.1551358569.git.renatogeh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <cover.1551358569.git.renatogeh@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, stefan.popa@analog.com, alexandru.Ardelean@analog.com, giuliano.belinassi@usp.br, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-usp@googlegroups.com
List-Id: devicetree@vger.kernel.org

To maintain consistency between ad7780_probe and ad7780_remove orders,
regulator initialization has been moved to after GPIO initializations.

Signed-off-by: Renato Lui Geh <renatogeh@gmail.com>
---
 drivers/staging/iio/adc/ad7780.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7780.c b/drivers/staging/iio/adc/ad7780.c
index ad7617a3a141..12aef0f101bc 100644
--- a/drivers/staging/iio/adc/ad7780.c
+++ b/drivers/staging/iio/adc/ad7780.c
@@ -255,16 +255,6 @@ static int ad7780_probe(struct spi_device *spi)
 
 	ad_sd_init(&st->sd, indio_dev, spi, &ad7780_sigma_delta_info);
 
-	st->reg = devm_regulator_get(&spi->dev, "avdd");
-	if (IS_ERR(st->reg))
-		return PTR_ERR(st->reg);
-
-	ret = regulator_enable(st->reg);
-	if (ret) {
-		dev_err(&spi->dev, "Failed to enable specified AVdd supply\n");
-		return ret;
-	}
-
 	st->chip_info =
 		&ad7780_chip_info_tbl[spi_get_device_id(spi)->driver_data];
 
@@ -284,7 +274,7 @@ static int ad7780_probe(struct spi_device *spi)
 		ret = PTR_ERR(st->powerdown_gpio);
 		dev_err(&spi->dev, "Failed to request powerdown GPIO: %d\n",
 			ret);
-		goto error_disable_reg;
+		return ret;
 	}
 
 	if (st->chip_info->is_ad778x) {
@@ -295,7 +285,7 @@ static int ad7780_probe(struct spi_device *spi)
 			ret = PTR_ERR(st->gain_gpio);
 			dev_err(&spi->dev, "Failed to request gain GPIO: %d\n",
 				ret);
-			goto error_disable_reg;
+			return ret;
 		}
 
 		st->filter_gpio = devm_gpiod_get_optional(&spi->dev,
@@ -306,10 +296,20 @@ static int ad7780_probe(struct spi_device *spi)
 			dev_err(&spi->dev,
 				"Failed to request filter GPIO: %d\n",
 				ret);
-			goto error_disable_reg;
+			return ret;
 		}
 	}
 
+	st->reg = devm_regulator_get(&spi->dev, "avdd");
+	if (IS_ERR(st->reg))
+		return PTR_ERR(st->reg);
+
+	ret = regulator_enable(st->reg);
+	if (ret) {
+		dev_err(&spi->dev, "Failed to enable specified AVdd supply\n");
+		return ret;
+	}
+
 	ret = ad_sd_setup_buffer_and_trigger(indio_dev);
 	if (ret)
 		goto error_disable_reg;
-- 
2.21.0
