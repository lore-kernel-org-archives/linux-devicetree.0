From: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: [PATCH 1/4] mtd: mchp23k256: Add OF device ID table
Date: Wed, 17 May 2017 17:39:05 +1200
Message-ID: <20170517053908.26138-2-chris.packham@alliedtelesis.co.nz>
References: <20170517053908.26138-1-chris.packham@alliedtelesis.co.nz>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170517053908.26138-1-chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This allows registering of this device via a Device Tree.

Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
---
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
