From: Sebastien Bourdelin <sebastien.bourdelin@gmail.com>
Subject: [PATCH 1/2] iio: chemical: bme680: Add device-tree support
Date: Fri, 11 Jan 2019 14:31:40 -0500
Message-ID: <20190111193141.20607-1-sebastien.bourdelin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org, himanshujha199640@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org, pmeerw@pmeerw.net, lars@metafoo.de, knaack.h@gmx.de, jic23@kernel.org, Sebastien Bourdelin <sebastien.bourdelin@gmail.com>
List-Id: devicetree@vger.kernel.org

This commit allow the driver to work with device-tree.

Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@gmail.com>
---
 drivers/iio/chemical/bme680_i2c.c | 7 +++++++
 drivers/iio/chemical/bme680_spi.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/iio/chemical/bme680_i2c.c b/drivers/iio/chemical/bme680_i2c.c
index 06d4be539d2e..94a36ebdf0b2 100644
--- a/drivers/iio/chemical/bme680_i2c.c
+++ b/drivers/iio/chemical/bme680_i2c.c
@@ -70,10 +70,17 @@ static const struct acpi_device_id bme680_acpi_match[] = {
 };
 MODULE_DEVICE_TABLE(acpi, bme680_acpi_match);
 
+static const struct of_device_id bme680_of_i2c_match[] = {
+	{ .compatible = "bosch,bme680", },
+	{},
+}
+MODULE_DEVICE_TABLE(of, bme680_of_i2c_match);
+
 static struct i2c_driver bme680_i2c_driver = {
 	.driver = {
 		.name			= "bme680_i2c",
 		.acpi_match_table       = ACPI_PTR(bme680_acpi_match),
+		.of_match_table		= of_match_ptr(bme680_of_i2c_match),
 	},
 	.probe = bme680_i2c_probe,
 	.id_table = bme680_i2c_id,
diff --git a/drivers/iio/chemical/bme680_spi.c b/drivers/iio/chemical/bme680_spi.c
index c9fb05e8d0b9..45bd4e93a891 100644
--- a/drivers/iio/chemical/bme680_spi.c
+++ b/drivers/iio/chemical/bme680_spi.c
@@ -110,10 +110,17 @@ static const struct acpi_device_id bme680_acpi_match[] = {
 };
 MODULE_DEVICE_TABLE(acpi, bme680_acpi_match);
 
+static const struct of_device_id bme680_of_spi_match[] = {
+	{ .compatible = "bosch,bme680", },
+	{},
+}
+MODULE_DEVICE_TABLE(of, bme680_of_spi_match);
+
 static struct spi_driver bme680_spi_driver = {
 	.driver = {
 		.name			= "bme680_spi",
 		.acpi_match_table	= ACPI_PTR(bme680_acpi_match),
+		.of_match_table		= of_match_ptr(bme680_of_spi_match),
 	},
 	.probe = bme680_spi_probe,
 	.id_table = bme680_spi_id,
-- 
2.20.1
