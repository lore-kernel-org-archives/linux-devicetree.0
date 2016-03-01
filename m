From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH 1/1] gpio: mcp23s08: Add support for mcp23s18.
Date: Tue,  1 Mar 2016 14:25:41 +0800
Message-ID: <1456813541-74321-2-git-send-email-preid@electromag.com.au>
References: <1456813541-74321-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1456813541-74321-1-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Phil Reid <preid@electromag.com.au>
List-Id: devicetree@vger.kernel.org

This patch adds support for the mcp23s18 which is very similar to
the mcp23s17. A couple of control bits are not the same.
Notable IOCON_HAEN (s17 only) & IOCON_INTCC. Which can be ignored.

Patch changes the following:
- Add mcp23s18 types.
- Always set mirror bit if the dts defines mcp23s18. regardless of type.
  Mirror bit is ignored on 8 bit devices anyway.
- In mcp23s08_probe use chip.ngpio instead of logic based on type
  to determine number of gpio lins to increment by. This is set
  appropiately by the call to mcp23s08_probe_one.
- Add mcp23s18 to device tree documentation.
- Remove statement that irqs don't work for spi. They do.
  Tested with mcp23s18.

Signed-off-by: Phil Reid <preid@electromag.com.au>
---
 .../devicetree/bindings/gpio/gpio-mcp23s08.txt        |  4 +---
 drivers/gpio/gpio-mcp23s08.c                          | 19 +++++++++++++++----
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt b/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt
index f3332b9..c934106 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt
@@ -10,6 +10,7 @@ Required properties:
 
     - "microchip,mcp23s08" for  8 GPIO SPI version
     - "microchip,mcp23s17" for 16 GPIO SPI version
+    - "microchip,mcp23s18" for 16 GPIO SPI version
     - "microchip,mcp23008" for  8 GPIO I2C version or
     - "microchip,mcp23017" for 16 GPIO I2C version of the chip
     NOTE: Do not use the old mcp prefix any more. It is deprecated and will be
@@ -43,9 +44,6 @@ Optional properties:
   - first cell is the pin number
   - second cell is used to specify flags.
 - interrupt-controller: Marks the device node as a interrupt controller.
-NOTE: The interrupt functionality is only supported for i2c versions of the
-chips. The spi chips can also do the interrupts, but this is not supported by
-the linux driver yet.
 
 Optional device specific properties:
 - microchip,irq-mirror: Sets the mirror flag in the IOCON register. Devices
diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index c767879..72521d9 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -31,6 +31,7 @@
 #define MCP_TYPE_S17	1
 #define MCP_TYPE_008	2
 #define MCP_TYPE_017	3
+#define MCP_TYPE_S18    4
 
 /* Registers are all 8 bits wide.
  *
@@ -617,6 +618,12 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 		mcp->chip.ngpio = 16;
 		mcp->chip.label = "mcp23s17";
 		break;
+
+	case MCP_TYPE_S18:
+		mcp->ops = &mcp23s17_ops;
+		mcp->chip.ngpio = 16;
+		mcp->chip.label = "mcp23s18";
+		break;
 #endif /* CONFIG_SPI_MASTER */
 
 #if IS_ENABLED(CONFIG_I2C)
@@ -657,8 +664,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 			of_property_read_bool(mcp->chip.parent->of_node,
 					      "microchip,irq-active-high");
 
-		if (type == MCP_TYPE_017)
-			mirror = pdata->mirror;
+		mirror = pdata->mirror;
 	}
 
 	if ((status & IOCON_SEQOP) || !(status & IOCON_HAEN) || mirror ||
@@ -735,6 +741,10 @@ static const struct of_device_id mcp23s08_spi_of_match[] = {
 		.compatible = "microchip,mcp23s17",
 		.data = (void *) MCP_TYPE_S17,
 	},
+	{
+		.compatible = "microchip,mcp23s18",
+		.data = (void *) MCP_TYPE_S18,
+	},
 /* NOTE: The use of the mcp prefix is deprecated and will be removed. */
 	{
 		.compatible = "mcp,mcp23s08",
@@ -969,8 +979,8 @@ static int mcp23s08_probe(struct spi_device *spi)
 			goto fail;
 
 		if (pdata->base != -1)
-			pdata->base += (type == MCP_TYPE_S17) ? 16 : 8;
-		ngpio += (type == MCP_TYPE_S17) ? 16 : 8;
+			pdata->base += data->mcp[addr]->chip.ngpio;
+		ngpio += data->mcp[addr]->chip.ngpio;
 	}
 	data->ngpio = ngpio;
 
@@ -1012,6 +1022,7 @@ static int mcp23s08_remove(struct spi_device *spi)
 static const struct spi_device_id mcp23s08_ids[] = {
 	{ "mcp23s08", MCP_TYPE_S08 },
 	{ "mcp23s17", MCP_TYPE_S17 },
+	{ "mcp23s18", MCP_TYPE_S18 },
 	{ },
 };
 MODULE_DEVICE_TABLE(spi, mcp23s08_ids);
-- 
1.8.3.1

