From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 08/22] spi: Use of_device_match()
Date: Mon,  6 Jun 2016 10:31:50 +0200
Message-ID: <20160606083204.19760-9-thierry.reding@gmail.com>
References: <20160606083204.19760-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160606083204.19760-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Use the common implementation rather than the SPI-private variant.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/spi/spi.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 77e6e45951f4..df0d800b19f0 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -3019,16 +3019,11 @@ EXPORT_SYMBOL_GPL(spi_write_then_read);
 /*-------------------------------------------------------------------------*/
 
 #if IS_ENABLED(CONFIG_OF_DYNAMIC)
-static int __spi_of_device_match(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 /* must call put_device() when done with returned spi_device device */
 static struct spi_device *of_find_spi_device_by_node(struct device_node *node)
 {
 	struct device *dev = bus_find_device(&spi_bus_type, NULL, node,
-						__spi_of_device_match);
+					     of_device_match);
 	return dev ? to_spi_device(dev) : NULL;
 }
 
-- 
2.8.3
