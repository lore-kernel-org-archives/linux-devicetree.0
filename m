From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: [PATCH 1/2] net: dsa: ksz9477: add I2C managed mode support
Date: Sun, 16 Dec 2018 08:57:40 +0100
Message-ID: <20181216075741.13827-1-sergio.paracuellos@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Woojung.Huh@microchip.com
Cc: andrew@lunn.ch, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, netdev@vger.kernel.org, driverdev-devel@linuxdriverproject.org, UNGLinuxDriver@microchip.com, devicetree@vger.kernel.org, davem@davemloft.net
List-Id: devicetree@vger.kernel.org

In this mode the switch device and the internal phys will be managed via
I2C interface.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/net/dsa/microchip/Kconfig       |   6 +
 drivers/net/dsa/microchip/Makefile      |   1 +
 drivers/net/dsa/microchip/ksz9477_i2c.c | 258 ++++++++++++++++++++++++
 3 files changed, 265 insertions(+)
 create mode 100644 drivers/net/dsa/microchip/ksz9477_i2c.c

diff --git a/drivers/net/dsa/microchip/Kconfig b/drivers/net/dsa/microchip/Kconfig
index a8caf9249d50..162fec43d204 100644
--- a/drivers/net/dsa/microchip/Kconfig
+++ b/drivers/net/dsa/microchip/Kconfig
@@ -14,3 +14,9 @@ config NET_DSA_MICROCHIP_KSZ9477_SPI
 	depends on NET_DSA_MICROCHIP_KSZ9477 && SPI
 	help
 	  Select to enable support for registering switches configured through SPI.
+
+config NET_DSA_MICROCHIP_KSZ9477_I2C
+	tristate "KSZ series I2C connected switch driver"
+	depends on NET_DSA_MICROCHIP_KSZ9477 && I2C
+	help
+	  Select to enable support for registering switches configured through I2C.
diff --git a/drivers/net/dsa/microchip/Makefile b/drivers/net/dsa/microchip/Makefile
index 3142c18b8f57..eb9b768face2 100644
--- a/drivers/net/dsa/microchip/Makefile
+++ b/drivers/net/dsa/microchip/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_NET_DSA_MICROCHIP_KSZ_COMMON)	+= ksz_common.o
 obj-$(CONFIG_NET_DSA_MICROCHIP_KSZ9477)		+= ksz9477.o
 obj-$(CONFIG_NET_DSA_MICROCHIP_KSZ9477_SPI)	+= ksz9477_spi.o
+obj-$(CONFIG_NET_DSA_MICROCHIP_KSZ9477_I2C)	+= ksz9477_i2c.o
diff --git a/drivers/net/dsa/microchip/ksz9477_i2c.c b/drivers/net/dsa/microchip/ksz9477_i2c.c
new file mode 100644
index 000000000000..2b88d66e8c20
--- /dev/null
+++ b/drivers/net/dsa/microchip/ksz9477_i2c.c
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Microchip KSZ series register access through I2C
+ *
+ * Author: Sergio Paracuellos <sergio.paracuellos@gmail.com>
+ */
+
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+#include "ksz_priv.h"
+
+/**
+ * ksz_i2c_read_reg - issue read register command
+ * @client: i2c client structure
+ * @reg: The register address.
+ * @val: The buffer to return the result into.
+ * @len: The length of data expected.
+ *
+ * This is the low level read call that issues the necessary i2c message(s)
+ * to read data from the register specified in @reg.
+ */
+static int ksz_i2c_read_reg(struct i2c_client *client, u32 reg, u8 *val,
+			    unsigned int len)
+{
+	struct i2c_adapter *adapter = client->adapter;
+	struct i2c_msg msg[2];
+	u8 txd[2];
+	int ret;
+
+	txd[0] = (u8)(reg >> 8);
+	txd[1] = (u8)reg;
+
+	msg[0].addr = client->addr;
+	msg[0].flags = 0;
+	msg[0].len = 2;
+	msg[0].buf = txd;
+
+	msg[1].addr = client->addr;
+	msg[1].flags = I2C_M_RD;
+	msg[1].len = len;
+	msg[1].buf = val;
+
+	ret = i2c_transfer(adapter, msg, 2);
+	return (ret != 2) ? -EREMOTEIO : 0;
+}
+
+static int ksz_i2c_read(struct ksz_device *dev, u32 reg, u8 *data,
+			unsigned int len)
+{
+	struct i2c_client *client = dev->priv;
+
+	return ksz_i2c_read_reg(client, reg, data, len);
+}
+
+static int ksz_i2c_read8(struct ksz_device *dev, u32 reg, u8 *val)
+{
+	return ksz_i2c_read(dev, reg, val, 1);
+}
+
+static int ksz_i2c_read16(struct ksz_device *dev, u32 reg, u16 *val)
+{
+	int ret = ksz_i2c_read(dev, reg, (u8 *)val, 2);
+
+	if (!ret)
+		*val = be16_to_cpu(*val);
+
+	return ret;
+}
+
+static int ksz_i2c_read24(struct ksz_device *dev, u32 reg, u32 *val)
+{
+	int ret;
+
+	*val = 0;
+	ret = ksz_i2c_read(dev, reg, (u8 *)val, 3);
+
+	if (!ret) {
+		*val = be32_to_cpu(*val);
+		/* convert to 24 bit */
+		*val >>= 8;
+	}
+
+	return ret;
+}
+
+static int ksz_i2c_read32(struct ksz_device *dev, u32 reg, u32 *val)
+{
+	int ret = ksz_i2c_read(dev, reg, (u8 *)val, 4);
+
+	if (!ret)
+		*val = be32_to_cpu(*val);
+
+	return ret;
+}
+
+/**
+ * ksz_i2c_write_reg - issue write register command
+ * @client: i2c client structure
+ * @reg: The register address.
+ * @val: value to write
+ * @len: The length of data
+ *
+ * This is the low level write call that issues the necessary i2c message(s)
+ * to write data to the register specified in @reg.
+ */
+static int ksz_i2c_write_reg(struct i2c_client *client, u32 reg, u8 *val,
+			     unsigned int len)
+{
+	struct i2c_adapter *adapter = client->adapter;
+	struct i2c_msg msg;
+	u8 txd[32];
+	int ret;
+
+	txd[0] = (u8)(reg >> 8);
+	txd[1] = (u8)reg;
+	memcpy(&txd[2], val, len);
+
+	msg.addr = client->addr;
+	msg.flags = 0;
+	msg.len = 2 + len;
+	msg.buf = txd;
+
+	ret = i2c_transfer(adapter, &msg, 1);
+	return (ret != 1) ? -EREMOTEIO : 0;
+}
+
+static int ksz_i2c_write(struct ksz_device *dev, u32 reg, u8 *val,
+			 unsigned int len)
+{
+	struct i2c_client *client = dev->priv;
+	unsigned int cnt = len;
+	int i = 0;
+	u8 txb[4];
+
+	do {
+		txb[i++] = (u8)(*val >> (8 * (cnt - 1)));
+		cnt--;
+	} while (cnt);
+
+	return ksz_i2c_write_reg(client, reg, txb, len);
+}
+
+static int ksz_i2c_write8(struct ksz_device *dev, u32 reg, u8 value)
+{
+	return ksz_i2c_write(dev, reg, &value, 1);
+}
+
+static int ksz_i2c_write16(struct ksz_device *dev, u32 reg, u16 value)
+{
+	value = cpu_to_be16(value);
+	return ksz_i2c_write(dev, reg, (u8 *)&value, 2);
+}
+
+static int ksz_i2c_write24(struct ksz_device *dev, u32 reg, u32 value)
+{
+	/* make it to big endian 24bit from MSB */
+	value <<= 8;
+	value = cpu_to_be32(value);
+
+	return ksz_i2c_write(dev, reg, (u8 *)&value, 3);
+}
+
+static int ksz_i2c_write32(struct ksz_device *dev, u32 reg, u32 value)
+{
+	value = cpu_to_be32(value);
+	return ksz_i2c_write(dev, reg, (u8 *)&value, 4);
+}
+
+static int ksz_i2c_get(struct ksz_device *dev, u32 reg, void *data, size_t len)
+{
+	return ksz_i2c_read(dev, reg, data, len);
+}
+
+static int ksz_i2c_set(struct ksz_device *dev, u32 reg, void *data, size_t len)
+{
+	return ksz_i2c_write(dev, reg, data, len);
+}
+
+static const struct ksz_io_ops ksz_i2c_ops = {
+	.read8 = ksz_i2c_read8,
+	.read16 = ksz_i2c_read16,
+	.read24 = ksz_i2c_read24,
+	.read32 = ksz_i2c_read32,
+	.write8 = ksz_i2c_write8,
+	.write16 = ksz_i2c_write16,
+	.write24 = ksz_i2c_write24,
+	.write32 = ksz_i2c_write32,
+	.get = ksz_i2c_get,
+	.set = ksz_i2c_set,
+};
+
+static int ksz_i2c_probe(struct i2c_client *client,
+			 const struct i2c_device_id *id)
+{
+	struct ksz_device *dev;
+	int ret;
+
+	dev = ksz_switch_alloc(&client->dev, &ksz_i2c_ops, client);
+	if (!dev)
+		return -ENOMEM;
+
+	if (client->dev.platform_data)
+		dev->pdata = client->dev.platform_data;
+
+	i2c_set_clientdata(client, dev);
+
+	ret = ksz9477_switch_register(dev);
+	if (ret) {
+		dev_err(&client->dev, "registering switch (ret: %d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ksz_i2c_remove(struct i2c_client *client)
+{
+	struct ksz_device *dev = i2c_get_clientdata(client);
+
+	if (dev)
+		ksz_switch_remove(dev);
+
+	return 0;
+}
+
+static const struct i2c_device_id ksz_i2c_id[] = {
+	{ "ksz9477-switch", 0 },
+	{},
+};
+
+MODULE_DEVICE_TABLE(i2c, ksz_i2c_id);
+
+static const struct of_device_id ksz_dt_match[] = {
+	{ .compatible = "microchip,ksz9477" },
+	{ .compatible = "microchip,ksz9897" },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, ksz_dt_match);
+
+static struct i2c_driver ksz_i2c_driver = {
+	.driver = {
+		.name   = "ksz9477-switch",
+		.owner  = THIS_MODULE,
+		.of_match_table = ksz_dt_match,
+	},
+	.probe  = ksz_i2c_probe,
+	.remove = ksz_i2c_remove,
+	.id_table = ksz_i2c_id,
+};
+
+module_i2c_driver(ksz_i2c_driver);
+
+MODULE_AUTHOR("Sergio Paracuellos <sergio.paracuellos@gmail.com>");
+MODULE_DESCRIPTION("Microchip KSZ Series Switch I2C access Driver");
+MODULE_LICENSE("GPL");
-- 
2.19.1
