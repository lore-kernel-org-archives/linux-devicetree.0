From: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/3] fpga manager: Add cyclonespi driver for Altera fpgas
Date: Thu,  6 Oct 2016 13:34:17 -0700
Message-ID: <4b4432c04b4ea92a2af814e3d7866c33f2eb12ea.1475783742.git.stillcompiling@gmail.com>
References: <cover.1475783742.git.stillcompiling@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1475783742.git.stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

cyclonespi loads fpga firmware over spi, using the "passive serial"
interface on Altera Cyclone FPGAS.

one of the simpler ways to set up an fpga at runtime.
The signal interface is close to unidirectional spi with lsb first.

Signed-off-by: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/fpga/Kconfig      |   6 ++
 drivers/fpga/Makefile     |   1 +
 drivers/fpga/cyclonespi.c | 173 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 180 insertions(+)
 create mode 100644 drivers/fpga/cyclonespi.c

diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
index cd84934..ccad5b1 100644
--- a/drivers/fpga/Kconfig
+++ b/drivers/fpga/Kconfig
@@ -13,6 +13,12 @@ config FPGA
 
 if FPGA
 
+config FPGA_MGR_CYCLONE_SPI
+	tristate "Altera Cyclone V SPI"
+	depends on SPI
+	help
+	  FPGA manager driver support for Altera Cyclone V over SPI
+
 config FPGA_MGR_SOCFPGA
 	tristate "Altera SOCFPGA FPGA Manager"
 	depends on ARCH_SOCFPGA
diff --git a/drivers/fpga/Makefile b/drivers/fpga/Makefile
index 8d83fc6..c03f40de 100644
--- a/drivers/fpga/Makefile
+++ b/drivers/fpga/Makefile
@@ -6,5 +6,6 @@
 obj-$(CONFIG_FPGA)			+= fpga-mgr.o
 
 # FPGA Manager Drivers
+obj-$(CONFIG_FPGA_MGR_CYCLONE_SPI)	+= cyclonespi.o
 obj-$(CONFIG_FPGA_MGR_SOCFPGA)		+= socfpga.o
 obj-$(CONFIG_FPGA_MGR_ZYNQ_FPGA)	+= zynq-fpga.o
diff --git a/drivers/fpga/cyclonespi.c b/drivers/fpga/cyclonespi.c
new file mode 100644
index 0000000..1ffa67c
--- /dev/null
+++ b/drivers/fpga/cyclonespi.c
@@ -0,0 +1,173 @@
+/**
+ * Copyright (c) 2015 United Western Technologies, Corporation
+ *
+ * Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ *
+ * Manage Altera fpga firmware that is loaded over spi.
+ * Firmware must be in binary "rbf" format.
+ * Works on Cyclone V. Should work on cyclone series.
+ * May work on other Altera fpgas.
+ *
+ */
+
+#include <linux/delay.h>
+#include <linux/fpga/fpga-mgr.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of_gpio.h>
+#include <linux/spi/spi.h>
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>");
+MODULE_DESCRIPTION("Module to load Altera FPGA firmware over spi");
+
+struct cyclonespi_conf {
+	struct gpio_desc *reset;
+	struct gpio_desc *status;
+	struct spi_device *spi;
+};
+
+static const struct of_device_id of_ef_match[] = {
+	{ .compatible = "altr,cyclonespi-fpga-mgr", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, of_ef_match);
+
+static enum fpga_mgr_states cyclonespi_state(struct fpga_manager *mgr)
+{
+	return mgr->state;
+}
+
+static inline u32 revbit8x4(u32 n)
+{
+	n = ((n & 0xF0F0F0F0UL) >> 4) | ((n & 0x0F0F0F0FUL) << 4);
+	n = ((n & 0xCCCCCCCCUL) >> 2) | ((n & 0x33333333UL) << 2);
+	n = ((n & 0xAAAAAAAAUL) >> 1) | ((n & 0x55555555UL) << 1);
+	return n;
+}
+
+static int cyclonespi_write_init(struct fpga_manager *mgr, u32 flags,
+				const char *buf, size_t count)
+{
+	struct cyclonespi_conf *conf = (struct cyclonespi_conf *)mgr->priv;
+	u32 *fw32 = (u32 *)buf;
+	const u32 *fw_end = (u32 *)(buf + count);
+
+	if (flags & FPGA_MGR_PARTIAL_RECONFIG) {
+		dev_err(&mgr->dev, "Partial reconfiguration not supported.\n");
+		return -EINVAL;
+	}
+
+	gpiod_set_value(conf->reset, 0);
+	udelay(50);
+	if (gpiod_get_value(conf->status) == 1) {
+		dev_err(&mgr->dev, "Status pin should be low.\n");
+		return -EIO;
+	}
+
+	gpiod_set_value(conf->reset, 1);
+	msleep(1);
+	if (gpiod_get_value(conf->status) == 0) {
+		dev_err(&mgr->dev, "Status pin not ready.\n");
+		return -EIO;
+	}
+
+	/* set buffer to lsb first */
+	while (fw32 < fw_end) {
+		*fw32 = revbit8x4(*fw32);
+		fw32++;
+	}
+
+	return 0;
+}
+
+static int cyclonespi_write(struct fpga_manager *mgr, const char *buf,
+			   size_t count)
+{
+	struct cyclonespi_conf *conf = (struct cyclonespi_conf *)mgr->priv;
+	const char *fw_data = buf;
+	const char *fw_data_end = fw_data + count;
+
+	while (fw_data < fw_data_end) {
+		int ret;
+		int stride = fw_data_end - fw_data;
+
+		if (stride > SZ_4K)
+			stride = SZ_4K;
+
+		ret = spi_write(conf->spi, fw_data, stride);
+		if (ret) {
+			dev_err(&mgr->dev, "spi error in firmware write: %d\n",
+					ret);
+			return ret;
+		}
+		fw_data += stride;
+	}
+
+	return 0;
+}
+
+static int cyclonespi_write_complete(struct fpga_manager *mgr, u32 flags)
+{
+	struct cyclonespi_conf *conf = (struct cyclonespi_conf *)mgr->priv;
+
+	if (gpiod_get_value(conf->status) == 0) {
+		dev_err(&mgr->dev, "Error during configuration.\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static const struct fpga_manager_ops cyclonespi_ops = {
+	.state = cyclonespi_state,
+	.write_init = cyclonespi_write_init,
+	.write = cyclonespi_write,
+	.write_complete = cyclonespi_write_complete,
+};
+
+static int cyclonespi_probe(struct spi_device *spi)
+{
+	struct cyclonespi_conf *conf = devm_kzalloc(&spi->dev, sizeof(*conf),
+						GFP_KERNEL);
+
+	if (!conf)
+		return -ENOMEM;
+
+	conf->spi = spi;
+	conf->reset = devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(conf->reset)) {
+		dev_err(&spi->dev, "Failed to get reset gpio: %ld\n",
+			PTR_ERR(conf->reset));
+		return PTR_ERR(conf->reset);
+	}
+
+	conf->status = devm_gpiod_get(&spi->dev, "status", GPIOD_IN);
+	if (IS_ERR(conf->status)) {
+		dev_err(&spi->dev, "Failed to get status gpio: %ld\n",
+				PTR_ERR(conf->status));
+		return PTR_ERR(conf->status);
+	}
+
+	return fpga_mgr_register(&spi->dev, "Altera SPI FPGA Manager",
+				 &cyclonespi_ops, conf);
+}
+
+static int cyclonespi_remove(struct spi_device *spi)
+{
+	fpga_mgr_unregister(&spi->dev);
+
+	return 0;
+}
+
+static struct spi_driver cyclonespi_driver = {
+	.driver = {
+		.name   = "cyclonespi",
+		.owner  = THIS_MODULE,
+		.of_match_table = of_match_ptr(of_ef_match),
+	},
+	.probe  = cyclonespi_probe,
+	.remove = cyclonespi_remove,
+};
+
+module_spi_driver(cyclonespi_driver)
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
