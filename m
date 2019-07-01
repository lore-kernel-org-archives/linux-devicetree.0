From: Pawel Dembicki <paweldembicki@gmail.com>
Subject: [PATCH 3/4] net: dsa: vsc73xx: add support for parallel mode
Date: Mon,  1 Jul 2019 17:27:22 +0200
Message-ID: <20190701152723.624-3-paweldembicki@gmail.com>
References: <20190701152723.624-1-paweldembicki@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190701152723.624-1-paweldembicki@gmail.com>
Sender: netdev-owner@vger.kernel.org
Cc: linus.walleij@linaro.org, paweldembicki@gmail.com, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch add platform part of vsc73xx driver.
It allows to use chip connected by PI interface.

Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
---
 drivers/net/dsa/Kconfig                    |   8 +
 drivers/net/dsa/Makefile                   |   1 +
 drivers/net/dsa/vitesse-vsc73xx-platform.c | 166 +++++++++++++++++++++
 3 files changed, 175 insertions(+)
 create mode 100644 drivers/net/dsa/vitesse-vsc73xx-platform.c

diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
index 4ab2aa09e2e4..80965808949d 100644
--- a/drivers/net/dsa/Kconfig
+++ b/drivers/net/dsa/Kconfig
@@ -116,4 +116,12 @@ config NET_DSA_VITESSE_VSC73XX_SPI
 	---help---
 	  This enables support for the Vitesse VSC7385, VSC7388, VSC7395
 	  and VSC7398 SparX integrated ethernet switches in SPI managed mode.
+
+config NET_DSA_VITESSE_VSC73XX_PLATFORM
+	tristate "Vitesse VSC7385/7388/7395/7398 Platform mode support"
+	depends on HAS_IOMEM
+	select NET_DSA_VITESSE_VSC73XX
+	---help---
+	  This enables support for the Vitesse VSC7385, VSC7388, VSC7395
+	  and VSC7398 SparX integrated ethernet switches in Platform managed mode.
 endmenu
diff --git a/drivers/net/dsa/Makefile b/drivers/net/dsa/Makefile
index 117bf78be211..d5e4c668ac03 100644
--- a/drivers/net/dsa/Makefile
+++ b/drivers/net/dsa/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_NET_DSA_SMSC_LAN9303) += lan9303-core.o
 obj-$(CONFIG_NET_DSA_SMSC_LAN9303_I2C) += lan9303_i2c.o
 obj-$(CONFIG_NET_DSA_SMSC_LAN9303_MDIO) += lan9303_mdio.o
 obj-$(CONFIG_NET_DSA_VITESSE_VSC73XX) += vitesse-vsc73xx-core.o
+obj-$(CONFIG_NET_DSA_VITESSE_VSC73XX_PLATFORM) += vitesse-vsc73xx-platform.o
 obj-$(CONFIG_NET_DSA_VITESSE_VSC73XX_SPI) += vitesse-vsc73xx-spi.o
 obj-y				+= b53/
 obj-y				+= microchip/
diff --git a/drivers/net/dsa/vitesse-vsc73xx-platform.c b/drivers/net/dsa/vitesse-vsc73xx-platform.c
new file mode 100644
index 000000000000..b2e5da0ffde3
--- /dev/null
+++ b/drivers/net/dsa/vitesse-vsc73xx-platform.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0
+/* DSA driver for:
+ * Vitesse VSC7385 SparX-G5 5+1-port Integrated Gigabit Ethernet Switch
+ * Vitesse VSC7388 SparX-G8 8-port Integrated Gigabit Ethernet Switch
+ * Vitesse VSC7395 SparX-G5e 5+1-port Integrated Gigabit Ethernet Switch
+ * Vitesse VSC7398 SparX-G8e 8-port Integrated Gigabit Ethernet Switch
+ *
+ * This driver takes control of the switch chip over Platform and
+ * configures it to route packages around when connected to a CPU port.
+ *
+ * Copyright (C) 2019 pawel Dembicki <paweldembicki@gmail.com>
+ * Based on vitesse-vsc-spi.c by:
+ * Copyright (C) 2018 Linus Wallej <linus.walleij@linaro.org>
+ * Includes portions of code from the firmware uploader by:
+ * Copyright (C) 2009 Gabor Juhos <juhosg@openwrt.org>
+ */
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include "vitesse-vsc73xx.h"
+
+#define VSC73XX_CMD_PLATFORM_BLOCK_SHIFT		14
+#define VSC73XX_CMD_PLATFORM_BLOCK_MASK		0x7
+#define VSC73XX_CMD_PLATFORM_SUBBLOCK_SHIFT		10
+#define VSC73XX_CMD_PLATFORM_SUBBLOCK_MASK	0xf
+#define VSC73XX_CMD_PLATFORM_REGISTER_SHIFT		2
+
+/**
+ * struct vsc73xx_platform - VSC73xx Platform state container
+ */
+struct vsc73xx_platform {
+	struct platform_device *pdev;
+	void __iomem *base_addr;
+	struct vsc73xx vsc;
+};
+
+static const struct vsc73xx_ops vsc73xx_platform_ops;
+
+static u32 vsc73xx_make_addr(u8 block, u8 subblock, u8 reg)
+{
+	u32 ret;
+
+	ret = (block & VSC73XX_CMD_PLATFORM_BLOCK_MASK)
+		<< VSC73XX_CMD_PLATFORM_BLOCK_SHIFT;
+	ret |= (subblock & VSC73XX_CMD_PLATFORM_SUBBLOCK_MASK)
+		<< VSC73XX_CMD_PLATFORM_SUBBLOCK_SHIFT;
+	ret |= reg << VSC73XX_CMD_PLATFORM_REGISTER_SHIFT;
+
+	return ret;
+}
+
+static int vsc73xx_platform_read(struct vsc73xx *vsc, u8 block, u8 subblock,
+				 u8 reg, u32 *val)
+{
+	struct vsc73xx_platform *vsc_platform = vsc->priv;
+	u32 offset;
+
+	if (!vsc73xx_is_addr_valid(block, subblock))
+		return -EINVAL;
+
+	offset = vsc73xx_make_addr(block, subblock, reg);
+
+	mutex_lock(&vsc->lock);
+		*val = ioread32be(vsc_platform->base_addr + offset);
+	mutex_unlock(&vsc->lock);
+
+	return 0;
+}
+
+static int vsc73xx_platform_write(struct vsc73xx *vsc, u8 block, u8 subblock,
+				  u8 reg, u32 val)
+{
+	struct vsc73xx_platform *vsc_platform = vsc->priv;
+	u32 offset;
+
+	if (!vsc73xx_is_addr_valid(block, subblock))
+		return -EINVAL;
+
+	offset = vsc73xx_make_addr(block, subblock, reg);
+
+	mutex_lock(&vsc->lock);
+		iowrite32be(val, vsc_platform->base_addr + offset);
+	mutex_unlock(&vsc->lock);
+
+	return 0;
+}
+
+static int vsc73xx_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct vsc73xx_platform *vsc_platform;
+	struct resource *res = NULL;
+	int ret;
+
+	vsc_platform = devm_kzalloc(dev, sizeof(*vsc_platform), GFP_KERNEL);
+	if (!vsc_platform)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, vsc_platform);
+	vsc_platform->pdev = pdev;
+	vsc_platform->vsc.dev = dev;
+	vsc_platform->vsc.priv = vsc_platform;
+	vsc_platform->vsc.ops = &vsc73xx_platform_ops;
+
+	/* obtain I/O memory space */
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "cannot obtain I/O memory space\n");
+		ret = -ENXIO;
+		return ret;
+	}
+
+	vsc_platform->base_addr = devm_ioremap_resource(&pdev->dev, res);
+	if (!vsc_platform->base_addr) {
+		dev_err(&pdev->dev, "cannot request I/O memory space\n");
+		ret = -ENXIO;
+		return ret;
+	}
+
+	return vsc73xx_probe(&vsc_platform->vsc);
+}
+
+static int vsc73xx_platform_remove(struct platform_device *pdev)
+{
+	struct vsc73xx_platform *vsc_platform = platform_get_drvdata(pdev);
+
+	return vsc73xx_remove(&vsc_platform->vsc);
+}
+
+static const struct vsc73xx_ops vsc73xx_platform_ops = {
+	.read = vsc73xx_platform_read,
+	.write = vsc73xx_platform_write,
+};
+
+static const struct of_device_id vsc73xx_platform_of_match[] = {
+	{
+		.compatible = "vitesse,vsc7385-platform",
+	},
+	{
+		.compatible = "vitesse,vsc7388-platform",
+	},
+	{
+		.compatible = "vitesse,vsc7395-platform",
+	},
+	{
+		.compatible = "vitesse,vsc7398-platform",
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, vsc73xx_platform_of_match);
+
+static struct platform_driver vsc73xx_platform_driver = {
+	.probe = vsc73xx_platform_probe,
+	.remove = vsc73xx_platform_remove,
+	.driver = {
+		.name = "vsc73xx-platform",
+		.of_match_table = vsc73xx_platform_of_match,
+	},
+};
+module_platform_driver(vsc73xx_platform_driver);
+
+MODULE_AUTHOR("Pawel Dembicki <paweldembicki@gmail.com>");
+MODULE_DESCRIPTION("Vitesse VSC7385/7388/7395/7398 Platform driver");
+MODULE_LICENSE("GPL v2");
-- 
2.20.1
