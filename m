From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 4/4] mtd: mchp23k256: Add support for mchp23lcv1024
Date: Wed, 17 May 2017 17:39:08 +1200
Message-ID: <20170517053908.26138-5-chris.packham@alliedtelesis.co.nz>
References: <20170517053908.26138-1-chris.packham@alliedtelesis.co.nz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170517053908.26138-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: dwmw2@infradead.org, computersforpeace@gmail.com, andrew@lunn.ch, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The mchp23lcv1024 is software compatible with the mchp23k256, the
only difference (from a software point of view) is the size. There
is no way to detect the size so we must be told via a Device Tree.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 .../bindings/mtd/microchip,mchp23k256.txt           |  2 +-
 drivers/mtd/devices/mchp23k256.c                    | 21 +++++++++++++++++++--
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt b/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt
index 25e5ad38b0f0..7328eb92a03c 100644
--- a/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt
+++ b/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt
@@ -3,7 +3,7 @@
 Required properties:
 - #address-cells, #size-cells : Must be present if the device has sub-nodes
   representing partitions.
-- compatible : Must be "microchip,mchp23k256"
+- compatible : Must be one of "microchip,mchp23k256" or "microchip,mchp23lcv1024"
 - reg : Chip-Select number
 - spi-max-frequency : Maximum frequency of the SPI bus the chip can operate at
 
diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
index 02c6b9dcbd3e..d1eba587633c 100644
--- a/drivers/mtd/devices/mchp23k256.c
+++ b/drivers/mtd/devices/mchp23k256.c
@@ -21,6 +21,8 @@
 #include <linux/spi/spi.h>
 #include <linux/of_device.h>
 
+enum chips { mchp23k256, mchp23lcv1024 };
+
 struct mchp23k256_flash {
 	struct spi_device	*spi;
 	struct mutex		lock;
@@ -128,6 +130,7 @@ static int mchp23k256_probe(struct spi_device *spi)
 	struct mchp23k256_flash *flash;
 	struct flash_platform_data *data;
 	int err;
+	enum chips chip;
 
 	flash = devm_kzalloc(&spi->dev, sizeof(*flash), GFP_KERNEL);
 	if (!flash)
@@ -143,15 +146,28 @@ static int mchp23k256_probe(struct spi_device *spi)
 
 	data = dev_get_platdata(&spi->dev);
 
+	if (spi->dev.of_node)
+		chip = (enum chips)of_device_get_match_data(&spi->dev);
+	else
+		chip = mchp23k256;
+
 	mtd_set_of_node(&flash->mtd, spi->dev.of_node);
 	flash->mtd.dev.parent	= &spi->dev;
 	flash->mtd.type		= MTD_RAM;
 	flash->mtd.flags	= MTD_CAP_RAM;
 	flash->mtd.writesize	= 1;
-	flash->mtd.size		= SZ_32K;
 	flash->mtd._read	= mchp23k256_read;
 	flash->mtd._write	= mchp23k256_write;
 
+	switch (chip){
+	case mchp23lcv1024:
+		flash->mtd.size		= SZ_128K;
+		break;
+	default:
+		flash->mtd.size		= SZ_32K;
+		break;
+	}
+
 	flash->mtd.erasesize = PAGE_SIZE;
 	while (flash->mtd.size & (flash->mtd.erasesize - 1))
 		flash->mtd.erasesize >>= 1;
@@ -172,7 +188,8 @@ static int mchp23k256_remove(struct spi_device *spi)
 }
 
 static const struct of_device_id mchp23k256_of_table[] = {
-	{ .compatible = "microchip,mchp23k256" },
+	{ .compatible = "microchip,mchp23k256", .data = (void *)mchp23k256 },
+	{ .compatible = "microchip,mchp23lcv1024", .data = (void *)mchp23lcv1024 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mchp23k256_of_table);
-- 
2.11.0.24.ge6920cf
