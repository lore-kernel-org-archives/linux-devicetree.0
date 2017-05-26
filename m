From: Roshni Shah <roshni.shah@timesys.com>
Subject: [PATCH] misc: ad525x_dpot_spi: Add device tree support
Date: Fri, 26 May 2017 14:17:46 -0400
Message-ID: <20170526181746.25896-1-roshni.shah@timesys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Roshni Shah <roshni.shah@timesys.com>
List-Id: devicetree@vger.kernel.org

This patch adds Device Tree support to the Analog Devices
digital potentiometers (SPI bus) AD525x driver.

Signed-off-by: Roshni Shah <roshni.shah@timesys.com>
---
 .../devicetree/bindings/misc/ad525x_dpot-spi.txt   |  44 ++++++
 drivers/misc/ad525x_dpot-spi.c                     | 161 ++++++++++++++++++++-
 2 files changed, 204 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/misc/ad525x_dpot-spi.txt

diff --git a/Documentation/devicetree/bindings/misc/ad525x_dpot-spi.txt b/Documentation/devicetree/bindings/misc/ad525x_dpot-spi.txt
new file mode 100644
index 000000000000..d383aa58b2de
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/ad525x_dpot-spi.txt
@@ -0,0 +1,44 @@
+Digital Potentiometers (SPI) compatible with Analog Devices family
+
+Required properties:
+- compatible: Should be one of
+	* "ad,ad5160"
+	* "ad,ad5161"
+	* "ad,ad5162"
+	* "ad,ad5165"
+	* "ad,ad5200"
+	* "ad,ad5201"
+	* "ad,ad5203"
+	* "ad,ad5204"
+	* "ad,ad5206"
+	* "ad,ad5207"
+	* "ad,ad5231"
+	* "ad,ad5232"
+	* "ad,ad5233"
+	* "ad,ad5235"
+	* "ad,ad5260"
+	* "ad,ad5262"
+	* "ad,ad5263"
+	* "ad,ad5290"
+	* "ad,ad5291"
+	* "ad,ad5292"
+	* "ad,ad5293"
+	* "ad,ad7376"
+	* "ad,ad8400"
+	* "ad,ad8402"
+	* "ad,ad8403"
+	* "ad,adn2850"
+	* "ad,ad5270"
+	* "ad,ad5271"
+- reg : spi chip select number for the device
+- spi-max-frequency : max spi frequency to use
+see: Documentation/misc-devices/ad525x_dpot.txt
+
+Example:
+	ad5204@1 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "ad,ad5204";
+		spi-max-frequency = <5000000>;
+		reg = <1>;
+	};
diff --git a/drivers/misc/ad525x_dpot-spi.c b/drivers/misc/ad525x_dpot-spi.c
index 39a7f517ee7e..d649cf2b6631 100644
--- a/drivers/misc/ad525x_dpot-spi.c
+++ b/drivers/misc/ad525x_dpot-spi.c
@@ -8,6 +8,7 @@
 
 #include <linux/spi/spi.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 
 #include "ad525x_dpot.h"
 
@@ -81,14 +82,26 @@ static const struct ad_dpot_bus_ops bops = {
 };
 static int ad_dpot_spi_probe(struct spi_device *spi)
 {
+	int ret;
+	const struct of_device_id *of_id = of_match_device(ad_dpot_spi_of_match,
+							   &spi->dev);
+
 	struct ad_dpot_bus_data bdata = {
 		.client = spi,
 		.bops = &bops,
 	};
 
-	return ad_dpot_probe(&spi->dev, &bdata,
+	if (of_id) {
+		ret = ad_dpot_probe(&spi->dev, &bdata,
+			     of_id->data,
+			     of_id->name);
+	} else {
+		ret = ad_dpot_probe(&spi->dev, &bdata,
 			     spi_get_device_id(spi)->driver_data,
 			     spi_get_device_id(spi)->name);
+	}
+
+	return ret;
 }
 
 static int ad_dpot_spi_remove(struct spi_device *spi)
@@ -129,9 +142,155 @@ static const struct spi_device_id ad_dpot_spi_id[] = {
 };
 MODULE_DEVICE_TABLE(spi, ad_dpot_spi_id);
 
+static const struct of_device_id ad_dpot_spi_of_match[] = {
+	{
+		.compatible	= "ad,ad5160",
+		.name		= "ad5160",
+		.data		= (void *)AD5160_ID,
+	},
+	{
+		.compatible	= "ad,ad5161",
+		.name		= "ad5161",
+		.data		= (void *)AD5161_ID,
+	},
+	{
+		.compatible	= "ad,ad5162",
+		.name		= "ad5162",
+		.data		= (void *)AD5162_ID,
+	},
+	{
+		.compatible	= "ad,ad5165",
+		.name		= "ad5165",
+		.data		= (void *)AD5165_ID,
+	},
+	{
+		.compatible	= "ad,ad5200",
+		.name		= "ad5200",
+		.data		= (void *)AD5200_ID,
+	},
+	{
+		.compatible	= "ad,ad5201",
+		.name		= "ad5201",
+		.data		= (void *)AD5201_ID,
+	},
+	{
+		.compatible	= "ad,ad5203",
+		.name		= "ad5203",
+		.data		= (void *)AD5203_ID,
+	},
+	{
+		.compatible	= "ad,ad5204",
+		.name		= "ad5204",
+		.data		= (void *)AD5204_ID,
+	},
+	{
+		.compatible	= "ad,ad5206",
+		.name		= "ad5206",
+		.data		= (void *)AD5206_ID,
+	},
+	{
+		.compatible	= "ad,ad5207",
+		.name		= "ad5207",
+		.data		= (void *)AD5207_ID,
+	},
+	{
+		.compatible	= "ad,ad5231",
+		.name		= "ad5231",
+		.data		= (void *)AD5231_ID,
+	},
+	{
+		.compatible	= "ad,ad5232",
+		.name		= "ad5232",
+		.data		= (void *)AD5232_ID,
+	},
+	{
+		.compatible	= "ad,ad5233",
+		.name		= "ad5233",
+		.data		= (void *)AD5233_ID,
+	},
+	{
+		.compatible	= "ad,ad5235",
+		.name		= "ad5235",
+		.data		= (void *)AD5235_ID,
+	},
+	{
+		.compatible	= "ad,ad5260",
+		.name		= "ad5260",
+		.data		= (void *)AD5260_ID,
+	},
+	{
+		.compatible	= "ad,ad5262",
+		.name		= "ad5262",
+		.data		= (void *)AD5262_ID,
+	},
+	{
+		.compatible	= "ad,ad5263",
+		.name		= "ad5263",
+		.data		= (void *)AD5263_ID,
+	},
+	{
+		.compatible	= "ad,ad5290",
+		.name		= "ad5290",
+		.data		= (void *)AD5290_ID,
+	},
+	{
+		.compatible	= "ad,ad5291",
+		.name		= "ad5291",
+		.data		= (void *)AD5291_ID,
+	},
+	{
+		.compatible	= "ad,ad5292",
+		.name		= "ad5292",
+		.data		= (void *)AD5292_ID,
+	},
+	{
+		.compatible	= "ad,ad5293",
+		.name		= "ad5293",
+		.data		= (void *)AD5293_ID,
+	},
+	{
+		.compatible	= "ad,ad7376",
+		.name		= "ad7376",
+		.data		= (void *)AD7376_ID,
+	},
+	{
+		.compatible	= "ad,ad8400",
+		.name		= "ad8400",
+		.data		= (void *)AD8400_ID,
+	},
+	{
+		.compatible	= "ad,ad8402",
+		.name		= "ad8402",
+		.data		= (void *)AD8402_ID,
+	},
+	{
+		.compatible	= "ad,ad8403",
+		.name		= "ad8403",
+		.data		= (void *)AD8403_ID,
+	},
+	{
+		.compatible	= "ad,adn2850",
+		.name		= "adn2850",
+		.data		= (void *)ADN2850_ID,
+	},
+	{
+		.compatible	= "ad,ad5270",
+		.name		= "ad5270",
+		.data		= (void *)AD5270_ID,
+	},
+	{
+		.compatible	= "ad,ad5271",
+		.name		= "ad5271",
+		.data		= (void *)AD5271_ID,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ad_dpot_spi_of_match);
+
 static struct spi_driver ad_dpot_spi_driver = {
 	.driver = {
 		.name	= "ad_dpot",
+		.of_match_table = ad_dpot_spi_of_match,
 	},
 	.probe		= ad_dpot_spi_probe,
 	.remove		= ad_dpot_spi_remove,
-- 
2.13.0
