From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] MTD: m25p80: Add option to limit SPI
 transfer size.
Date: Thu, 30 Apr 2015 15:46:11 +0200
Message-ID: <3b0c112672f364452e80c333048161eaffb655db.1430403750.git.hramrach@gmail.com>
References: <cover.1430403750.git.hramrach@gmail.com>
Reply-To: hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCQMLUOX54MBBJP2RCVAKGQEEJDT7TQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <cover.1430403750.git.hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Hutchings <ben-/+tVBieCtBitmTQ+vhA3Yw@public.gmane.org>, Alison Chaiken <alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Mika Westerberg <mika.westerberg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "grmoore-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org" <grmoore-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

My SPI driver does not support DMA so sizes larger than 64 bytes return
an error. Add an option to limit transfer size so m25p80 can be used
with reduced speed with such controller.

Signed-off-by: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/mtd/m25p80.txt |  5 +++++
 drivers/mtd/devices/m25p80.c                     | 19 +++++++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/m25p80.txt b/Documentation/devicetree/bindings/mtd/m25p80.txt
index f20b111..2bda5be 100644
--- a/Documentation/devicetree/bindings/mtd/m25p80.txt
+++ b/Documentation/devicetree/bindings/mtd/m25p80.txt
@@ -19,6 +19,11 @@ Optional properties:
                    all chips and support for it can not be detected at runtime.
                    Refer to your chips' datasheet to check if this is supported
                    by your chip.
+- linux,max_tx_len : With some SPI controller drivers transfer size is
+                     limited.s
+                     Transfer data in chunks no larger than this value.
+                     Using this option will degrade performance when
+                     max_tx_len is smaller than flash page size.
 
 Example:
 
diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 0b2bc21..dfdb750 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -26,12 +26,14 @@
 #include <linux/spi/spi.h>
 #include <linux/spi/flash.h>
 #include <linux/mtd/spi-nor.h>
+#include <linux/of_platform.h>
 
 #define	MAX_CMD_SIZE		6
 struct m25p {
 	struct spi_device	*spi;
 	struct spi_nor		spi_nor;
 	struct mtd_info		mtd;
+	size_t max_tx_len;
 	u8			command[MAX_CMD_SIZE];
 };
 
@@ -97,7 +99,10 @@ static void m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
 	spi_message_add_tail(&t[0], &m);
 
 	t[1].tx_buf = buf;
-	t[1].len = len;
+	if (flash->max_tx_len)
+		t[1].len = min(len,flash->max_tx_len);
+	else
+		t[1].len = len;
 	spi_message_add_tail(&t[1], &m);
 
 	spi_sync(spi, &m);
@@ -145,7 +150,10 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 
 	t[1].rx_buf = buf;
 	t[1].rx_nbits = m25p80_rx_nbits(nor);
-	t[1].len = len;
+	if (flash->max_tx_len)
+		t[1].len = min(len,flash->max_tx_len);
+	else
+		t[1].len = len;
 	spi_message_add_tail(&t[1], &m);
 
 	spi_sync(spi, &m);
@@ -233,6 +241,13 @@ static int m25p_probe(struct spi_device *spi)
 		return ret;
 
 	ppdata.of_node = spi->dev.of_node;
+	if (spi->dev.of_node){
+		int result = of_property_read_u32(spi->dev.of_node, "linux,max_tx_len", &flash->max_tx_len);
+		if (result)
+			flash->max_tx_len = 0;
+		else
+			dev_info(&spi->dev, "Using maximum transfer length %u\n", flash->max_tx_len);
+	}
 
 	return mtd_device_parse_register(&flash->mtd, NULL, &ppdata,
 			data ? data->parts : NULL,
-- 
2.1.4
