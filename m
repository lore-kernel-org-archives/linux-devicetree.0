Return-Path: <SRS0=5lt5=Q4=martin.sperl.org=kernel@kernel.org>
From: kernel@martin.sperl.org
Subject: [PATCH V7 03/10] can: mcp25xxfd: add gpiolib support for GPIO0/1 (aka. INT0/INT1)
Date: Thu, 21 Feb 2019 21:07:29 +0000
Message-Id: <20190221210736.640-4-kernel@martin.sperl.org>
In-Reply-To: <20190221210736.640-1-kernel@martin.sperl.org>
References: <20190221210736.640-1-kernel@martin.sperl.org>
To: linux-can@vger.kernel.org, devicetree@vger.kernel.org, Wolfgang Grandegger <wg@grandegger.com>, Mark Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Martin Sperl <kernel@martin.sperl.org>
List-ID: <devicetree@vger.kernel.org>

From: Martin Sperl <kernel@martin.sperl.org>

Add GPIOLIB support to mcp25xxfd.

Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
---
 drivers/net/can/spi/mcp25xxfd/Makefile         |   1 +
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c |  13 +-
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_gpio.c | 194 +++++++++++++++++++++++++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_gpio.h |  16 ++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_priv.h |   2 +
 5 files changed, 225 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_gpio.c
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_gpio.h

diff --git a/drivers/net/can/spi/mcp25xxfd/Makefile b/drivers/net/can/spi/mcp25xxfd/Makefile
index 1d805ef2c286..162ded8054d4 100644
--- a/drivers/net/can/spi/mcp25xxfd/Makefile
+++ b/drivers/net/can/spi/mcp25xxfd/Makefile
@@ -9,4 +9,5 @@ mcp25xxfd-objs                  += mcp25xxfd_cmd.o
 mcp25xxfd-objs                  += mcp25xxfd_crc.o
 mcp25xxfd-objs                  += mcp25xxfd_debugfs.o
 mcp25xxfd-objs                  += mcp25xxfd_ecc.o
+mcp25xxfd-objs                  += mcp25xxfd_gpio.o
 mcp25xxfd-objs                  += mcp25xxfd_int.o
diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c
index 362510876fcf..e9cc2a90080f 100644
--- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c
@@ -17,6 +17,7 @@
 #include "mcp25xxfd_cmd.h"
 #include "mcp25xxfd_debugfs.h"
 #include "mcp25xxfd_ecc.h"
+#include "mcp25xxfd_gpio.h"
 #include "mcp25xxfd_int.h"
 #include "mcp25xxfd_priv.h"

@@ -147,15 +148,22 @@ static int mcp25xxfd_base_probe(struct spi_device *spi)
 	if (ret)
 		goto out_debugfs;

+	/* setting up GPIO */
+	ret = mcp25xxfd_gpio_setup(priv);
+	if (ret)
+		goto out_debugfs;
+
 	/* and put controller to sleep by stopping the can clock */
 	ret = mcp25xxfd_clock_stop(priv, MCP25XXFD_CLK_USER_CAN);
 	if (ret)
-		goto out_debugfs;
+		goto out_gpio;

 	dev_info(&spi->dev,
 		 "MCP%x successfully initialized.\n", priv->model);
 	return 0;

+out_gpio:
+	mcp25xxfd_gpio_remove(priv);
 out_debugfs:
 	mcp25xxfd_debugfs_remove(priv);
 out_ctlclk:
@@ -173,6 +181,9 @@ static int mcp25xxfd_base_remove(struct spi_device *spi)
 {
 	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);

+	/* remove gpio */
+	mcp25xxfd_gpio_remove(priv);
+
 	/* clear all running clocks */
 	mcp25xxfd_clock_stop(priv, priv->clk_user_mask);

diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_gpio.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_gpio.c
new file mode 100644
index 000000000000..69eb9c6ef176
--- /dev/null
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_gpio.c
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* CAN bus driver for Microchip 25XXFD CAN Controller with SPI Interface
+ *
+ * Copyright 2019 Martin Sperl <kernel@martin.sperl.org>
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
+#include "mcp25xxfd_clock.h"
+#include "mcp25xxfd_cmd.h"
+#include "mcp25xxfd_priv.h"
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
+	mcp25xxfd_clock_start(priv, clock_requestor);
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
+	mcp25xxfd_clock_stop(priv, clock_requestor);
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
+int mcp25xxfd_gpio_setup(struct mcp25xxfd_priv *priv)
+{
+	struct gpio_chip *gpio = &priv->gpio;
+
+	/* gpiochip only handles GPIO0 and GPIO1 */
+	gpio->owner                = THIS_MODULE;
+	gpio->parent               = &priv->spi->dev;
+	gpio->label                = dev_name(&priv->spi->dev);
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
+void mcp25xxfd_gpio_remove(struct mcp25xxfd_priv *priv)
+{
+	gpiochip_remove(&priv->gpio);
+}
+
+#else
+int mcp25xxfd_gpio_setup(struct mcp25xxfd_priv *priv)
+{
+	return 0;
+}
+
+void mcp25xxfd_gpio_remove(struct mcp25xxfd_priv *priv)
+{
+}
+#endif
diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_gpio.h b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_gpio.h
new file mode 100644
index 000000000000..46740e8abc45
--- /dev/null
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_gpio.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* CAN bus driver for Microchip 25XXFD CAN Controller with SPI Interface
+ *
+ * Copyright 2019 Martin Sperl <kernel@martin.sperl.org>
+ */
+#ifndef __MCP25XXFD_GPIO_H
+#define __MCP25XXFD_GPIO_H
+
+#include "mcp25xxfd_priv.h"
+
+/* gpiolib support */
+int mcp25xxfd_gpio_setup(struct mcp25xxfd_priv *priv);
+void mcp25xxfd_gpio_remove(struct mcp25xxfd_priv *priv);
+
+#endif /* __MCP25XXFD_GPIO_H */
diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_priv.h b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_priv.h
index f4ca69a51cf8..02f7ea2be4e2 100644
--- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_priv.h
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_priv.h
@@ -9,6 +9,7 @@

 #include <linux/clk.h>
 #include <linux/debugfs.h>
+#include <linux/gpio/driver.h>
 #include <linux/mutex.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
@@ -25,6 +26,7 @@ enum mcp25xxfd_model {
 struct mcp25xxfd_priv {
 	struct spi_device *spi;
 	struct clk *clk;
+	struct gpio_chip gpio;

 	/* the actual model of the mcp25xxfd */
 	enum mcp25xxfd_model model;
--
2.11.0
