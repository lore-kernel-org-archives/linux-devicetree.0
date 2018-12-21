Return-Path: <SRS0=0JaT=O6=martin.sperl.org=kernel@kernel.org>
From: kernel@martin.sperl.org
Subject: [PATCH V5 3/4] can: mcp25xxfd: add gpiolib support for GPIO0/1 (aka. INT0/INT1)
Date: Fri, 21 Dec 2018 09:29:49 +0000
Message-Id: <20181221092950.14192-4-kernel@martin.sperl.org>
In-Reply-To: <20181221092950.14192-1-kernel@martin.sperl.org>
References: <20181221092950.14192-1-kernel@martin.sperl.org>
To: linux-can@vger.kernel.org, devicetree@vger.kernel.org, Wolfgang Grandegger <wg@grandegger.com>, Mark Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Martin Sperl <kernel@martin.sperl.org>, Sukkin Pang <skp@skpang.co.uk>, Gerhard Bertelsmann <info@gerhard-bertelsmann.de>, Wilhelm Leichtfried <Wilhelm.Leichtfried@microchip.com>, Thomas Kopp <Thomas.Kopp@microchip.com>, Enrico Scholz <enrico.scholz@sigma-chemnitz.de>, Brad Hanson <Brad.Hanson@arity.com>, Teemu Keskinarkaus <teemu.keskinarkaus@crosscontrol.com>
List-ID: <devicetree@vger.kernel.org>

From: Martin Sperl <kernel@martin.sperl.org>

Add GPIOLIB support to mcp25xxfd.

Signed-off-by: Martin Sperl <kernel@martin.sperl.org>

---
Changelog:
  V1 -> V2: implemented support as per feedback
  V2 -> V3: moved dt-binding changes to patch 1
  V3 -> V4: resend
  V4 -> V5: reorganized driver into separate files

---
 drivers/net/can/spi/mcp25xxfd/Makefile         |   1 +
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd.h      |   5 +
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c |  12 +-
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_gpio.c | 199 +++++++++++++++++++++++++
 4 files changed, 216 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_gpio.c

diff --git a/drivers/net/can/spi/mcp25xxfd/Makefile b/drivers/net/can/spi/mcp25xxfd/Makefile
index 83de2d40cf9a..5dd7f13674ec 100644
--- a/drivers/net/can/spi/mcp25xxfd/Makefile
+++ b/drivers/net/can/spi/mcp25xxfd/Makefile
@@ -4,3 +4,4 @@
 obj-$(CONFIG_CAN_MCP25XXFD)	+= mcp25xxfd.o
 mcp25xxfd-objs                  := mcp25xxfd_base.o
 mcp25xxfd-objs                  += mcp25xxfd_can.o
+mcp25xxfd-objs                  += mcp25xxfd_gpio.o
diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd.h b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd.h
index 0f02c78a9a56..73817a567219 100644
--- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd.h
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd.h
@@ -107,6 +107,7 @@ enum mcp25xxfd_model {

 struct mcp25xxfd_priv {
 	struct spi_device *spi;
+	struct gpio_chip *gpio;
 	struct clk *clk;

 	/* the actual model of the mcp25xxfd */
@@ -236,3 +237,7 @@ int mcp25xxfd_clear_interrupts(struct spi_device *spi);

 /* enabling interrupts */
 int mcp25xxfd_enable_interrupts(struct spi_device *spi, bool enable);
+
+/* gpiolib support */
+int mcp25xxfd_gpio_setup(struct spi_device *spi);
+void mcp25xxfd_gpio_remove(struct spi_device *spi);
diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c
index 9c34893243d1..b0851d97bcbb 100644
--- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c
@@ -1105,15 +1105,22 @@ static int mcp25xxfd_probe(struct spi_device *spi)
 	if (ret)
 		goto out_debugfs;

+	/* setting up GPIO */
+	ret = mcp25xxfd_gpio_setup(spi);
+	if (ret)
+		goto out_debugfs;
+
 	/* and put controller to sleep by stopping the can clock */
 	ret = mcp25xxfd_stop_clock(spi, MCP25XXFD_CLK_USER_CAN);
 	if (ret)
-		goto out_debugfs;
+		goto out_gpio;

 	dev_info(&spi->dev,
 		 "MCP%x successfully initialized.\n", priv->model);
 	return 0;

+out_gpio:
+	mcp25xxfd_gpio_remove(spi);
 out_debugfs:
 	mcp25xxfd_debugfs_remove(spi);
 out_ctlclk:
@@ -1132,6 +1139,9 @@ static int mcp25xxfd_remove(struct spi_device *spi)
 {
 	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);

+	/* remove gpio */
+	mcp25xxfd_gpio_remove(spi);
+
 	/* clear all running clocks */
 	mcp25xxfd_stop_clock(spi, priv->clk_user_mask);

diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_gpio.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_gpio.c
new file mode 100644
index 000000000000..06c5db937d81
--- /dev/null
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_gpio.c
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* CAN bus driver for Microchip 25XXFD CAN Controller with SPI Interface
+ *
+ * Copyright 2017 Martin Sperl <kernel@martin.sperl.org>
+ *
+ *
+ * Based on Microchip MCP251x CAN controller driver written by
+ * David Vrabel, Copyright 2006 Arcom Control Systems Ltd.
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+
+#include "mcp25xxfd.h"
+
+/* GPIO component */
+#ifdef CONFIG_GPIOLIB
+
+enum mcp25xxfd_gpio_pins {
+	MCP25XXFD_GPIO_GPIO0 = 0,
+	MCP25XXFD_GPIO_GPIO1 = 1,
+};
+
+static int mcp25xxfd_gpio_request(struct gpio_chip *chip,
+				  unsigned int offset)
+{
+	struct mcp25xxfd_priv *priv = gpiochip_get_data(chip);
+	int clock_requestor = offset ?
+		MCP25XXFD_CLK_USER_GPIO1 : MCP25XXFD_CLK_USER_GPIO0;
+
+	/* only handle gpio 0/1 */
+	if (offset > 1)
+		return -EINVAL;
+
+	mcp25xxfd_start_clock(priv->spi, clock_requestor);
+
+	return 0;
+}
+
+static void mcp25xxfd_gpio_free(struct gpio_chip *chip,
+				unsigned int offset)
+{
+	struct mcp25xxfd_priv *priv = gpiochip_get_data(chip);
+	int clock_requestor = offset ?
+		MCP25XXFD_CLK_USER_GPIO1 : MCP25XXFD_CLK_USER_GPIO0;
+
+	/* only handle gpio 0/1 */
+	if (offset > 1)
+		return;
+
+	mcp25xxfd_stop_clock(priv->spi, clock_requestor);
+}
+
+static int mcp25xxfd_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct mcp25xxfd_priv *priv = gpiochip_get_data(chip);
+	u32 mask = (offset) ? MCP25XXFD_IOCON_GPIO1 : MCP25XXFD_IOCON_GPIO0;
+	int ret;
+
+	/* only handle gpio 0/1 */
+	if (offset > 1)
+		return -EINVAL;
+
+	/* read the relevant gpio Latch */
+	ret = mcp25xxfd_cmd_read_mask(priv->spi, MCP25XXFD_IOCON,
+				      &priv->regs.iocon, mask);
+	if (ret)
+		return ret;
+
+	/* return the match */
+	return priv->regs.iocon & mask;
+}
+
+static void mcp25xxfd_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			       int value)
+{
+	struct mcp25xxfd_priv *priv = gpiochip_get_data(chip);
+	u32 mask = (offset) ? MCP25XXFD_IOCON_LAT1 : MCP25XXFD_IOCON_LAT0;
+
+	/* only handle gpio 0/1 */
+	if (offset > 1)
+		return;
+
+	/* update in memory representation with the corresponding value */
+	if (value)
+		priv->regs.iocon |= mask;
+	else
+		priv->regs.iocon &= ~mask;
+
+	mcp25xxfd_cmd_write_mask(priv->spi, MCP25XXFD_IOCON,
+				 priv->regs.iocon, mask);
+}
+
+static int mcp25xxfd_gpio_direction_input(struct gpio_chip *chip,
+					  unsigned int offset)
+{
+	struct mcp25xxfd_priv *priv = gpiochip_get_data(chip);
+	u32 mask_tri = (offset) ?
+		MCP25XXFD_IOCON_TRIS1 : MCP25XXFD_IOCON_TRIS0;
+	u32 mask_stby = (offset) ?
+		0 : MCP25XXFD_IOCON_XSTBYEN;
+	u32 mask_pm = (offset) ?
+		MCP25XXFD_IOCON_PM1 : MCP25XXFD_IOCON_PM0;
+
+	/* only handle gpio 0/1 */
+	if (offset > 1)
+		return -EINVAL;
+
+	/* set the mask */
+	priv->regs.iocon |= mask_tri | mask_pm;
+
+	/* clear stby */
+	priv->regs.iocon &= ~mask_stby;
+
+	return mcp25xxfd_cmd_write_mask(priv->spi, MCP25XXFD_IOCON,
+					priv->regs.iocon,
+					mask_tri | mask_stby | mask_pm);
+}
+
+static int mcp25xxfd_gpio_direction_output(struct gpio_chip *chip,
+					   unsigned int offset, int value)
+{
+	struct mcp25xxfd_priv *priv = gpiochip_get_data(chip);
+	u32 mask_tri = (offset) ?
+		MCP25XXFD_IOCON_TRIS1 : MCP25XXFD_IOCON_TRIS0;
+	u32 mask_lat = (offset) ?
+		MCP25XXFD_IOCON_LAT1 : MCP25XXFD_IOCON_LAT0;
+	u32 mask_pm = (offset) ?
+		MCP25XXFD_IOCON_PM1 : MCP25XXFD_IOCON_PM0;
+	u32 mask_stby = (offset) ?
+		0 : MCP25XXFD_IOCON_XSTBYEN;
+
+	/* only handle gpio 0/1 */
+	if (offset > 1)
+		return -EINVAL;
+
+	/* clear the tristate bit and also clear stby */
+	priv->regs.iocon &= ~(mask_tri | mask_stby);
+
+	/* set GPIO mode */
+	priv->regs.iocon |= mask_pm;
+
+	/* set the value */
+	if (value)
+		priv->regs.iocon |= mask_lat;
+	else
+		priv->regs.iocon &= ~mask_lat;
+
+	return mcp25xxfd_cmd_write_mask(priv->spi, MCP25XXFD_IOCON,
+					priv->regs.iocon,
+					mask_tri | mask_lat |
+					mask_pm | mask_stby);
+}
+
+int mcp25xxfd_gpio_setup(struct spi_device *spi)
+{
+	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
+	struct gpio_chip *gpio = devm_kzalloc(&spi->dev, sizeof(*gpio),
+					     GFP_KERNEL);
+	priv->gpio = gpio;
+
+	/* gpiochip only handles GPIO0 and GPIO1 */
+	gpio->owner                = THIS_MODULE;
+	gpio->parent               = &spi->dev;
+	gpio->label                = dev_name(&spi->dev);
+	gpio->direction_input      = mcp25xxfd_gpio_direction_input;
+	gpio->get                  = mcp25xxfd_gpio_get;
+	gpio->direction_output     = mcp25xxfd_gpio_direction_output;
+	gpio->set                  = mcp25xxfd_gpio_set;
+	gpio->request              = mcp25xxfd_gpio_request;
+	gpio->free                 = mcp25xxfd_gpio_free;
+	gpio->base                 = -1;
+	gpio->ngpio                = 2;
+	gpio->can_sleep            = 1;
+
+	return gpiochip_add_data(gpio, priv);
+}
+
+void mcp25xxfd_gpio_remove(struct spi_device *spi)
+{
+	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
+
+	gpiochip_remove(priv->gpio);
+	priv->gpio = NULL;
+}
+
+#else
+int mcp25xxfd_gpio_setup(struct spi_device *spi)
+{
+	return 0;
+}
+
+void mcp25xxfd_gpio_remove(struct spi_device *spi)
+{
+}
+#endif
--
2.11.0
