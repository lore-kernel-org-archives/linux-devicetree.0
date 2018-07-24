Return-Path: <SRS0=zuy1=KI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-db5eur01on0124.outbound.protection.outlook.com ([104.47.2.124]:17248
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388236AbeGXMee (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 24 Jul 2018 08:34:34 -0400
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Subject: [PATCH] spi: pl022: Add OF binding to disable DMA usage
Date: Tue, 24 Jul 2018 13:27:53 +0200
Message-Id: <20180724112753.6020-1-alexander.sverdlin@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: linux-spi@vger.kernel.org, devicetree@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@nokia.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Legacy platform instantiation of PL022 had an ability to configure DMA
usage on controller level. If PL022 is being instantiated from DT it still
claims couple of DMA channels capable of DMA_SLAVE unconditionally even if
there are no DMA channels specified in the DT.

Depending on the slave devices' configuration this might be waste of DMA
channels or this might even claim some precious DMA channels if there are
only few of them in the system.

Add a new boolean property to disable DMA usage on the controller level:
	"pl022,dma-disable"

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
 Documentation/devicetree/bindings/spi/spi_pl022.txt | 1 +
 drivers/spi/spi-pl022.c                             | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/spi_pl022.txt b/Documentation/devicetree/bindings/spi/spi_pl022.txt
index 7638b4968ddb..d877a0871a11 100644
--- a/Documentation/devicetree/bindings/spi/spi_pl022.txt
+++ b/Documentation/devicetree/bindings/spi/spi_pl022.txt
@@ -21,6 +21,7 @@ Optional properties:
 - dma-names: Names for the dma channels, if present. There must be at
 	     least one channel named "tx" for transmit and named "rx" for
              receive.
+- pl022,dma-disable : disable DMA usage
 
 
 SPI slave nodes must be children of the SPI master node and can
diff --git a/drivers/spi/spi-pl022.c b/drivers/spi/spi-pl022.c
index 1af8c96b940e..43039c7428fe 100644
--- a/drivers/spi/spi-pl022.c
+++ b/drivers/spi/spi-pl022.c
@@ -2086,7 +2086,7 @@ pl022_platform_data_dt_get(struct device *dev)
 		return NULL;
 
 	pd->bus_id = -1;
-	pd->enable_dma = 1;
+	pd->enable_dma = !of_property_read_bool(np, "pl022,dma-disable");
 	of_property_read_u32(np, "num-cs", &tmp);
 	pd->num_chipselect = tmp;
 	of_property_read_u32(np, "pl022,autosuspend-delay",
-- 
2.18.0

