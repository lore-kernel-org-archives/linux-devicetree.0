Return-Path: <SRS0=tXJj=GQ=martin.sperl.org=kernel@kernel.org>
From: kernel@martin.sperl.org
Subject: [PATCH V3 3/3] can: mcp25xxfd: add gpiolib support for GPIO0/1 (aka. INT0/INT1)
Date: Mon, 26 Mar 2018 16:06:24 +0000
Message-Id: <20180326160624.32230-4-kernel@martin.sperl.org>
In-Reply-To: <20180326160624.32230-1-kernel@martin.sperl.org>
References: <20180326160624.32230-1-kernel@martin.sperl.org>
To: linux-can@vger.kernel.org, devicetree@vger.kernel.org, Wolfgang Grandegger <wg@grandegger.com>, Mark Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Martin Sperl <kernel@martin.sperl.org>, Marcel Birthelmer <Marcel.Birthelmer@microchip.com>, Sukkin Pang <skp@skpang.co.uk>, Gerhard Bertelsmann <info@gerhard-bertelsmann.de>
List-ID: <devicetree@vger.kernel.org>

From: Martin Sperl <kernel@martin.sperl.org>

Add GPIOLIB support to mcp25xxfd.

Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
Tested-by: Gerhard Bertelsmann <info@gerhard-bertelsmann.de>

---
Changelog:
  V1 -> V2: implemented support as per feedback
  V2 -> V3: moved dt-binding changes to patch 1

---
 drivers/net/can/spi/mcp25xxfd.c | 185 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 185 insertions(+)

diff --git a/drivers/net/can/spi/mcp25xxfd.c b/drivers/net/can/spi/mcp25xxfd.c
index 49a454da2196..10b60baddfb2 100644
--- a/drivers/net/can/spi/mcp25xxfd.c
+++ b/drivers/net/can/spi/mcp25xxfd.c
@@ -20,6 +20,7 @@
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/freezer.h>
+#include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/jiffies.h>
@@ -806,9 +807,15 @@ struct mcp25xxfd_priv {
 	struct mutex clk_user_lock; /* lock for enabling/disabling the clock */
 	int clk_user_mask;
 #define MCP25XXFD_CLK_USER_CAN BIT(0)
+#define MCP25XXFD_CLK_USER_GPIO0 BIT(1)
+#define MCP25XXFD_CLK_USER_GPIO1 BIT(2)

 	struct dentry *debugfs_dir;

+#ifdef CONFIG_GPIOLIB
+	struct gpio_chip gpio;
+#endif
+
 	/* the actual model of the mcp25xxfd */
 	enum mcp25xxfd_model model;

@@ -1494,6 +1501,179 @@ static int mcp25xxfd_stop_clock(struct spi_device *spi, int requestor_mask)
 	return 0;
 }

+/* mcp25xxfd GPIO helper functions */
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
+				      &priv->regs.iocon, mask,
+				      priv->spi_setup_speed_hz);
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
+				 priv->regs.iocon, mask,
+				 priv->spi_setup_speed_hz);
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
+					mask_tri | mask_stby | mask_pm,
+					priv->spi_setup_speed_hz);
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
+					mask_pm | mask_stby,
+					priv->spi_setup_speed_hz);
+}
+
+static int mcp25xxfd_gpio_setup(struct spi_device *spi)
+{
+	struct mcp25xxfd_priv *priv = spi_get_drvdata(spi);
+
+	/* gpiochip only handles GPIO0 and GPIO1 */
+	priv->gpio.owner		= THIS_MODULE;
+	priv->gpio.parent		= &spi->dev;
+	priv->gpio.label		= dev_name(&spi->dev);
+	priv->gpio.direction_input	= mcp25xxfd_gpio_direction_input;
+	priv->gpio.get			= mcp25xxfd_gpio_get;
+	priv->gpio.direction_output	= mcp25xxfd_gpio_direction_output;
+	priv->gpio.set			= mcp25xxfd_gpio_set;
+	priv->gpio.request		= mcp25xxfd_gpio_request;
+	priv->gpio.free			= mcp25xxfd_gpio_free;
+	priv->gpio.base			= -1;
+	priv->gpio.ngpio		= 2;
+	priv->gpio.can_sleep		= 1;
+
+	return devm_gpiochip_add_data(&spi->dev, &priv->gpio, priv);
+}
+
+#else
+
+static int mcp25xxfd_gpio_setup(struct spi_device *spi)
+{
+	return 0;
+}
+
+#endif
+
 /* ideally these would be defined in uapi/linux/can.h */
 #define CAN_EFF_SID_SHIFT		(CAN_EFF_ID_BITS - CAN_SFF_ID_BITS)
 #define CAN_EFF_SID_BITS		CAN_SFF_ID_BITS
@@ -4104,6 +4284,11 @@ static int mcp25xxfd_can_probe(struct spi_device *spi)
 	if (ret)
 		goto out_free;

+	/* Setup GPIO controller */
+	ret = mcp25xxfd_gpio_setup(spi);
+	if (ret)
+		goto out_clk;
+
 	/* all by default as push/pull */
 	priv->config.gpio_opendrain = false;

--
2.11.0
