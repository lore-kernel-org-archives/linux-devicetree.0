From: David Veenstra <davidjulianveenstra@gmail.com>
Subject: [PATCH v4 07/12] staging: iio: ad2s1200: Add dt table
Date: Fri, 18 May 2018 20:22:41 +0200
Message-ID: <eb4fa431405d0d4e73889d440b3b1c95d5c47e54.1526667118.git.davidjulianveenstra@gmail.com>
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

Add device tree table for matching with the vendor ID.

Signed-off-by: David Veenstra <davidjulianveenstra@gmail.com>
---
Changes in v4:
 - Introduced in this version.

 drivers/staging/iio/resolver/ad2s1200.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/iio/resolver/ad2s1200.c b/drivers/staging/iio/resolver/ad2s1200.c
index 9a8aa2448897..67d9747f88a6 100644
--- a/drivers/staging/iio/resolver/ad2s1200.c
+++ b/drivers/staging/iio/resolver/ad2s1200.c
@@ -154,6 +154,13 @@ static int ad2s1200_probe(struct spi_device *spi)
 	return devm_iio_device_register(&spi->dev, indio_dev);
 }
 
+static const struct of_device_id ad2s1200_of_match[] = {
+	{ .compatible = "adi,ad2s1200", },
+	{ .compatible = "adi,ad2s1205", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ad2s1200_of_match);
+
 static const struct spi_device_id ad2s1200_id[] = {
 	{ "ad2s1200" },
 	{ "ad2s1205" },
@@ -164,6 +171,7 @@ MODULE_DEVICE_TABLE(spi, ad2s1200_id);
 static struct spi_driver ad2s1200_driver = {
 	.driver = {
 		.name = DRV_NAME,
+		.of_match_table = of_match_ptr(ad2s1200_of_match),
 	},
 	.probe = ad2s1200_probe,
 	.id_table = ad2s1200_id,
-- 
2.17.0
