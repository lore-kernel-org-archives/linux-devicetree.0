From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: [PATCH 2/3] gpio: mcp23s08: Add simple IRQ support for SPI devices
Date: Mon, 17 Nov 2014 09:38:10 +0100
Message-ID: <1416213491-9775-2-git-send-email-alexander.stein@systec-electronic.com>
References: <1416213491-9775-1-git-send-email-alexander.stein@systec-electronic.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1416213491-9775-1-git-send-email-alexander.stein@systec-electronic.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Currently this implementation only supports one IRQ for (all) SPI devices
using the same chip select.

Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
---
 drivers/gpio/gpio-mcp23s08.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index 9295b6e..529025e 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -935,11 +935,14 @@ static int mcp23s08_probe(struct spi_device *spi)
 		return -ENOMEM;
 	spi_set_drvdata(spi, data);
 
+	spi->irq = irq_of_parse_and_map(spi->dev.of_node, 0);
+
 	for (addr = 0; addr < ARRAY_SIZE(pdata->chip); addr++) {
 		if (!(spi_present_mask & (1 << addr)))
 			continue;
 		chips--;
 		data->mcp[addr] = &data->chip[chips];
+		data->mcp[addr]->irq = spi->irq;
 		status = mcp23s08_probe_one(data->mcp[addr], &spi->dev, spi,
 					    0x40 | (addr << 1), type, pdata,
 					    addr);
@@ -980,6 +983,8 @@ static int mcp23s08_remove(struct spi_device *spi)
 		if (!data->mcp[addr])
 			continue;
 
+		if (spi->irq && data->mcp[addr]->irq_controller)
+			mcp23s08_irq_teardown(data->mcp[addr]);
 		gpiochip_remove(&data->mcp[addr]->chip);
 	}
 	kfree(data);
-- 
2.0.4

