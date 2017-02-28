From: Anatolij Gustschin <agust@denx.de>
Subject: [PATCH v4 2/2] fpga manager: Add Xilinx slave serial SPI driver
Date: Tue, 28 Feb 2017 17:40:22 +0100
Message-ID: <1488300022-30150-3-git-send-email-agust@denx.de>
References: <1488300022-30150-1-git-send-email-agust@denx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1488300022-30150-1-git-send-email-agust@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Alan Tull <atull@opensource.altera.com>, Moritz Fischer <moritz.fischer@ettus.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

The driver loads FPGA firmware over SPI, using the "slave serial"
configuration interface on Xilinx FPGAs.

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
This patch requires patch https://lkml.org/lkml/2017/2/15/667
for building

Changes in v4:

 - increase program latency up to 7.5ms for other Xilinx FPGAs
 - continue to apply CCLK cycles until specified timeout elapses (to
   cover more possible configuration DONE scenarios)
 - apply 8 CCLK cycles afer DONE signal
 - rebased to apply on top of Kconfig/Makefile changes by queued
   fpga manager patches

Changes in v3:

 - use named constant for udelay()/usleep_range() arguments
 - drop not needed .owner init
 - correct module licence (GPL v2)
 - fix build warning with newer gcc (in min() macro)

Changes in v2:

 - rebased on v4.10

 drivers/fpga/Kconfig      |   7 ++
 drivers/fpga/Makefile     |   1 +
 drivers/fpga/xilinx-spi.c | 198 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 206 insertions(+)
 create mode 100644 drivers/fpga/xilinx-spi.c

diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
index dee470f..c81cb7d 100644
--- a/drivers/fpga/Kconfig
+++ b/drivers/fpga/Kconfig
@@ -46,6 +46,13 @@ config FPGA_MGR_TS73XX
 	  FPGA manager driver support for the Altera Cyclone II FPGA
 	  present on the TS-73xx SBC boards.
 
+config FPGA_MGR_XILINX_SPI
+	tristate "Xilinx Configuration over Slave Serial (SPI)"
+	depends on SPI
+	help
+	  FPGA manager driver support for Xilinx FPGA configuration
+	  over slave serial interface.
+
 config FPGA_MGR_ZYNQ_FPGA
 	tristate "Xilinx Zynq FPGA"
 	depends on ARCH_ZYNQ || COMPILE_TEST
diff --git a/drivers/fpga/Makefile b/drivers/fpga/Makefile
index a5ee3ff..c6f5d74 100644
--- a/drivers/fpga/Makefile
+++ b/drivers/fpga/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_FPGA_MGR_ICE40_SPI)	+= ice40-spi.o
 obj-$(CONFIG_FPGA_MGR_SOCFPGA)		+= socfpga.o
 obj-$(CONFIG_FPGA_MGR_SOCFPGA_A10)	+= socfpga-a10.o
 obj-$(CONFIG_FPGA_MGR_TS73XX)		+= ts73xx-fpga.o
+obj-$(CONFIG_FPGA_MGR_XILINX_SPI)	+= xilinx-spi.o
 obj-$(CONFIG_FPGA_MGR_ZYNQ_FPGA)	+= zynq-fpga.o
 
 # FPGA Bridge Drivers
diff --git a/drivers/fpga/xilinx-spi.c b/drivers/fpga/xilinx-spi.c
new file mode 100644
index 0000000..9b62a4c
--- /dev/null
+++ b/drivers/fpga/xilinx-spi.c
@@ -0,0 +1,198 @@
+/*
+ * Xilinx Spartan6 Slave Serial SPI Driver
+ *
+ * Copyright (C) 2017 DENX Software Engineering
+ *
+ * Anatolij Gustschin <agust@denx.de>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * Manage Xilinx FPGA firmware that is loaded over SPI using
+ * the slave serial configuration interface.
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/fpga/fpga-mgr.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/spi/spi.h>
+#include <linux/sizes.h>
+
+struct xilinx_spi_conf {
+	struct spi_device *spi;
+	struct gpio_desc *prog_b;
+	struct gpio_desc *done;
+};
+
+static enum fpga_mgr_states xilinx_spi_state(struct fpga_manager *mgr)
+{
+	struct xilinx_spi_conf *conf = mgr->priv;
+
+	if (!gpiod_get_value(conf->done))
+		return FPGA_MGR_STATE_RESET;
+
+	return FPGA_MGR_STATE_UNKNOWN;
+}
+
+static int xilinx_spi_write_init(struct fpga_manager *mgr,
+				 struct fpga_image_info *info,
+				 const char *buf, size_t count)
+{
+	struct xilinx_spi_conf *conf = mgr->priv;
+	const size_t prog_latency_7500us = 7500;
+	const size_t prog_pulse_1us = 1;
+
+	if (info->flags & FPGA_MGR_PARTIAL_RECONFIG) {
+		dev_err(&mgr->dev, "Partial reconfiguration not supported.\n");
+		return -EINVAL;
+	}
+
+	gpiod_set_value(conf->prog_b, 1);
+
+	udelay(prog_pulse_1us); /* min is 500 ns */
+
+	gpiod_set_value(conf->prog_b, 0);
+
+	if (gpiod_get_value(conf->done)) {
+		dev_err(&mgr->dev, "Unexpected DONE pin state...\n");
+		return -EIO;
+	}
+
+	/* program latency */
+	usleep_range(prog_latency_7500us, prog_latency_7500us + 100);
+	return 0;
+}
+
+static int xilinx_spi_write(struct fpga_manager *mgr, const char *buf,
+			    size_t count)
+{
+	struct xilinx_spi_conf *conf = mgr->priv;
+	const char *fw_data = buf;
+	const char *fw_data_end = fw_data + count;
+
+	while (fw_data < fw_data_end) {
+		size_t remaining, stride;
+		int ret;
+
+		remaining = fw_data_end - fw_data;
+		stride = min_t(size_t, remaining, SZ_4K);
+
+		ret = spi_write(conf->spi, fw_data, stride);
+		if (ret) {
+			dev_err(&mgr->dev, "SPI error in firmware write: %d\n",
+				ret);
+			return ret;
+		}
+		fw_data += stride;
+	}
+
+	return 0;
+}
+
+static int xilinx_spi_apply_cclk_cycles(struct xilinx_spi_conf *conf)
+{
+	struct spi_device *spi = conf->spi;
+	const u8 din_data[1] = { 0xff };
+	int ret;
+
+	ret = spi_write(conf->spi, din_data, sizeof(din_data));
+	if (ret)
+		dev_err(&spi->dev, "applying CCLK cycles failed: %d\n", ret);
+
+	return ret;
+}
+
+static int xilinx_spi_write_complete(struct fpga_manager *mgr,
+				     struct fpga_image_info *info)
+{
+	struct xilinx_spi_conf *conf = mgr->priv;
+	unsigned long timeout;
+	int ret;
+
+	if (gpiod_get_value(conf->done))
+		return xilinx_spi_apply_cclk_cycles(conf);
+
+	timeout = jiffies + usecs_to_jiffies(info->config_complete_timeout_us);
+
+	while (time_before(jiffies, timeout)) {
+
+		ret = xilinx_spi_apply_cclk_cycles(conf);
+		if (ret)
+			return ret;
+
+		if (gpiod_get_value(conf->done))
+			return xilinx_spi_apply_cclk_cycles(conf);
+	}
+
+	dev_err(&mgr->dev, "Timeout after config data transfer.\n");
+	return -ETIMEDOUT;
+}
+
+static const struct fpga_manager_ops xilinx_spi_ops = {
+	.state = xilinx_spi_state,
+	.write_init = xilinx_spi_write_init,
+	.write = xilinx_spi_write,
+	.write_complete = xilinx_spi_write_complete,
+};
+
+static int xilinx_spi_probe(struct spi_device *spi)
+{
+	struct xilinx_spi_conf *conf;
+
+	conf = devm_kzalloc(&spi->dev, sizeof(*conf), GFP_KERNEL);
+	if (!conf)
+		return -ENOMEM;
+
+	conf->spi = spi;
+
+	/* PROGRAM_B is active low */
+	conf->prog_b = devm_gpiod_get(&spi->dev, "prog_b", GPIOD_OUT_LOW);
+	if (IS_ERR(conf->prog_b)) {
+		dev_err(&spi->dev, "Failed to get PROGRAM_B gpio: %ld\n",
+			PTR_ERR(conf->prog_b));
+		return PTR_ERR(conf->prog_b);
+	}
+
+	conf->done = devm_gpiod_get(&spi->dev, "done", GPIOD_IN);
+	if (IS_ERR(conf->done)) {
+		dev_err(&spi->dev, "Failed to get DONE gpio: %ld\n",
+			PTR_ERR(conf->done));
+		return PTR_ERR(conf->done);
+	}
+
+	return fpga_mgr_register(&spi->dev, "Xilinx Slave Serial FPGA Manager",
+				 &xilinx_spi_ops, conf);
+}
+
+static int xilinx_spi_remove(struct spi_device *spi)
+{
+	fpga_mgr_unregister(&spi->dev);
+
+	return 0;
+}
+
+static const struct of_device_id xlnx_spi_of_match[] = {
+	{ .compatible = "xlnx,fpga-slave-serial", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, xlnx_spi_of_match);
+
+static struct spi_driver xilinx_slave_spi_driver = {
+	.driver = {
+		.name = "xlnx-slave-spi",
+		.of_match_table = of_match_ptr(xlnx_spi_of_match),
+	},
+	.probe = xilinx_spi_probe,
+	.remove = xilinx_spi_remove,
+};
+
+module_spi_driver(xilinx_slave_spi_driver)
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Anatolij Gustschin <agust@denx.de>");
+MODULE_DESCRIPTION("Load Xilinx FPGA firmware over SPI");
-- 
2.7.4
