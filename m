From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 4/4] mtd: mchp23k256: Add support for mchp23lcv1024
Date: Mon, 22 May 2017 17:00:35 +1200
Message-ID: <20170522050035.17995-5-chris.packham@alliedtelesis.co.nz>
References: <20170522050035.17995-1-chris.packham@alliedtelesis.co.nz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170522050035.17995-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org, andrew@lunn.ch, computersforpeace@gmail.com, dwmw2@infradead.org, boris.brezillon@free-electrons.com, linux-kernel@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The mchp23lcv1024 is software compatible with the mchp23k256, the
only difference (from a software point of view) is the size. There
is no way to detect the size so we must be told via a Device Tree.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
Changes in v2:
- fix formatting in switch statement
- add support for 24-bit addressing

 .../bindings/mtd/microchip,mchp23k256.txt          |  2 +-
 drivers/mtd/devices/mchp23k256.c                   | 53 ++++++++++++++++++----
 2 files changed, 44 insertions(+), 11 deletions(-)

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
index 02c6b9dcbd3e..878f23955e29 100644
--- a/drivers/mtd/devices/mchp23k256.c
+++ b/drivers/mtd/devices/mchp23k256.c
@@ -21,10 +21,14 @@
 #include <linux/spi/spi.h>
 #include <linux/of_device.h>
 
+#define MAX_CMD_SIZE		4
+enum chips { mchp23k256, mchp23lcv1024 };
+
 struct mchp23k256_flash {
 	struct spi_device	*spi;
 	struct mutex		lock;
 	struct mtd_info		mtd;
+	u8			addr_width;
 };
 
 #define MCHP23K256_CMD_WRITE_STATUS	0x01
@@ -34,22 +38,35 @@ struct mchp23k256_flash {
 
 #define to_mchp23k256_flash(x) container_of(x, struct mchp23k256_flash, mtd)
 
+static void mchp23k256_addr2cmd(struct mchp23k256_flash *flash,
+				unsigned int addr, u8 *cmd)
+{
+	/* cmd[0] has opcode */
+	cmd[1] = addr >> (flash->addr_width * 8 -  8);
+	cmd[2] = addr >> (flash->addr_width * 8 - 16);
+	cmd[3] = addr >> (flash->addr_width * 8 - 24);
+}
+
+static int mchp23k256_cmdsz(struct mchp23k256_flash *flash)
+{
+	return 1 + flash->addr_width;
+}
+
 static int mchp23k256_write(struct mtd_info *mtd, loff_t to, size_t len,
 			    size_t *retlen, const unsigned char *buf)
 {
 	struct mchp23k256_flash *flash = to_mchp23k256_flash(mtd);
 	struct spi_transfer transfer[2] = {};
 	struct spi_message message;
-	unsigned char command[3];
+	unsigned char command[MAX_CMD_SIZE];
 
 	spi_message_init(&message);
 
 	command[0] = MCHP23K256_CMD_WRITE;
-	command[1] = to >> 8;
-	command[2] = to;
+	mchp23k256_addr2cmd(flash, to, command);
 
 	transfer[0].tx_buf = command;
-	transfer[0].len = sizeof(command);
+	transfer[0].len = mchp23k256_cmdsz(flash);
 	spi_message_add_tail(&transfer[0], &message);
 
 	transfer[1].tx_buf = buf;
@@ -73,17 +90,16 @@ static int mchp23k256_read(struct mtd_info *mtd, loff_t from, size_t len,
 	struct mchp23k256_flash *flash = to_mchp23k256_flash(mtd);
 	struct spi_transfer transfer[2] = {};
 	struct spi_message message;
-	unsigned char command[3];
+	unsigned char command[MAX_CMD_SIZE];
 
 	spi_message_init(&message);
 
 	memset(&transfer, 0, sizeof(transfer));
 	command[0] = MCHP23K256_CMD_READ;
-	command[1] = from >> 8;
-	command[2] = from;
+	mchp23k256_addr2cmd(flash, from, command);
 
 	transfer[0].tx_buf = command;
-	transfer[0].len = sizeof(command);
+	transfer[0].len = mchp23k256_cmdsz(flash);
 	spi_message_add_tail(&transfer[0], &message);
 
 	transfer[1].rx_buf = buf;
@@ -128,6 +144,7 @@ static int mchp23k256_probe(struct spi_device *spi)
 	struct mchp23k256_flash *flash;
 	struct flash_platform_data *data;
 	int err;
+	enum chips chip;
 
 	flash = devm_kzalloc(&spi->dev, sizeof(*flash), GFP_KERNEL);
 	if (!flash)
@@ -143,15 +160,30 @@ static int mchp23k256_probe(struct spi_device *spi)
 
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
 
+	switch (chip) {
+	case mchp23lcv1024:
+		flash->mtd.size		= SZ_128K;
+		flash->addr_width	= 3;
+		break;
+	default:
+		flash->mtd.size		= SZ_32K;
+		flash->addr_width	= 2;
+		break;
+	}
+
 	flash->mtd.erasesize = PAGE_SIZE;
 	while (flash->mtd.size & (flash->mtd.erasesize - 1))
 		flash->mtd.erasesize >>= 1;
@@ -172,7 +204,8 @@ static int mchp23k256_remove(struct spi_device *spi)
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
