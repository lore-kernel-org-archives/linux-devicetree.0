From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 1/5] mtd: mchp23k256: Add OF device ID table
Date: Tue, 23 May 2017 12:43:13 +1200
Message-ID: <20170523004317.16908-2-chris.packham@alliedtelesis.co.nz>
References: <20170523004317.16908-1-chris.packham@alliedtelesis.co.nz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170523004317.16908-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org, andrew@lunn.ch, computersforpeace@gmail.com, dwmw2@infradead.org, boris.brezillon@free-electrons.com, linux-kernel@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This allows registering of this device via a Device Tree.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Andrew Lunn <andrew@lunn.ch>
---
Changes in v2:
- collect review/test from Andrew
Changes in v3:
- None

 .../devicetree/bindings/mtd/microchip,mchp23k256.txt   | 18 ++++++++++++++++++
 drivers/mtd/devices/mchp23k256.c                       |  8 ++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt

diff --git a/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt b/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt
new file mode 100644
index 000000000000..25e5ad38b0f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt
@@ -0,0 +1,18 @@
+* MTD SPI driver for Microchip 23K256 (and similar) serial SRAM
+
+Required properties:
+- #address-cells, #size-cells : Must be present if the device has sub-nodes
+  representing partitions.
+- compatible : Must be "microchip,mchp23k256"
+- reg : Chip-Select number
+- spi-max-frequency : Maximum frequency of the SPI bus the chip can operate at
+
+Example:
+
+	spi-sram@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "microchip,mchp23k256";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
index e237db9f1bdb..9d8306a15833 100644
--- a/drivers/mtd/devices/mchp23k256.c
+++ b/drivers/mtd/devices/mchp23k256.c
@@ -19,6 +19,7 @@
 #include <linux/sizes.h>
 #include <linux/spi/flash.h>
 #include <linux/spi/spi.h>
+#include <linux/of_device.h>
 
 struct mchp23k256_flash {
 	struct spi_device	*spi;
@@ -166,9 +167,16 @@ static int mchp23k256_remove(struct spi_device *spi)
 	return mtd_device_unregister(&flash->mtd);
 }
 
+static const struct of_device_id mchp23k256_of_table[] = {
+	{ .compatible = "microchip,mchp23k256" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mchp23k256_of_table);
+
 static struct spi_driver mchp23k256_driver = {
 	.driver = {
 		.name	= "mchp23k256",
+		.of_match_table = of_match_ptr(mchp23k256_of_table),
 	},
 	.probe		= mchp23k256_probe,
 	.remove		= mchp23k256_remove,
-- 
2.11.0.24.ge6920cf
