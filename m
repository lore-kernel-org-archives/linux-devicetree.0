From: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH v10 2/3] fpga manager: Add altera-ps-spi driver for Altera FPGAs
Date: Wed, 17 May 2017 20:23:41 +0200
Message-ID: <1495045422-19183-2-git-send-email-agust@denx.de>
References: <1495045422-19183-1-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1495045422-19183-1-git-send-email-agust-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, joshua.clayton-DelKAr4a3LpBDgjK7y7TUQ@public.gmane.org, bst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

altera-ps-spi loads FPGA firmware over SPI, using the "passive serial"
interface on Altera Arria 10, Cyclone V or Stratix V FPGAs.

This is one of the simpler ways to set up an FPGA at runtime.
The signal interface is close to unidirectional SPI with lsb first.

Signed-off-by: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
---
Changes in v10:
 - rename cyclone-ps-spi driver to altera-ps-spi since other FPGA
   series also supported
 - use _cansleep gpio functions, since the underlying GPIO driver can
   be for an USB-to-GPIO or I2C-to-GPIO device (with can_sleep=true
   in the GPIO driver)
 - add fpga image info flag for optional skipping of stream bitswapping
 - merge Arria 10 support from Bastian
 - add info about supported/tested FPGA series to the comment
 - add GPL v2 license info to the header comment and MODULE_LICENSE
 - register FPGA managers with unique device names (usefull in the
   logs to differentiate which device was configured, when multiple
   FPGAs used)
 - drop not needed casts of mgr-priv pointers
 - add COMPILE_TEST to depends in Kconfig
 - mention the supported FPGA series in Kconfig help and driver comment
 - rebase on fpga manager patches recently submitted to the list,
   applies on top of:
     https://patchwork.kernel.org/patch/9725677/
     https://patchwork.kernel.org/patch/9725721/

   requires below patch for building:
     https://patchwork.kernel.org/patch/9691381/

 drivers/fpga/Kconfig         |   7 ++
 drivers/fpga/Makefile        |   2 +
 drivers/fpga/altera-ps-spi.c | 290 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 299 insertions(+)
 create mode 100644 drivers/fpga/altera-ps-spi.c

diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
index 895529e..a404fac 100644
--- a/drivers/fpga/Kconfig
+++ b/drivers/fpga/Kconfig
@@ -33,6 +33,13 @@ config FPGA_MGR_ALTERA_CVP
 	  FPGA manager driver support for Arria-V, Cyclone-V, Stratix-V
 	  and Arria 10 Altera FPGAs using the CvP interface over PCIe.
 
+config FPGA_MGR_ALTERA_PS_SPI
+	tristate "Altera FPGA Passive Serial over SPI"
+	depends on SPI || COMPILE_TEST
+	help
+	  FPGA manager driver support for Altera Arria/Cyclone/Stratix
+	  using the passive serial interface over SPI.
+
 config FPGA_MGR_SOCFPGA
 	tristate "Altera SOCFPGA FPGA Manager"
 	depends on ARCH_SOCFPGA || COMPILE_TEST
diff --git a/drivers/fpga/Makefile b/drivers/fpga/Makefile
index 2e5c8b6..7a19091 100644
--- a/drivers/fpga/Makefile
+++ b/drivers/fpga/Makefile
@@ -7,6 +7,8 @@ obj-$(CONFIG_FPGA)			+= fpga-mgr.o
 
 # FPGA Manager Drivers
 obj-$(CONFIG_FPGA_MGR_ALTERA_CVP)	+= altera-cvp.o
+obj-$(CONFIG_FPGA_MGR_CYCLONE_PS_SPI)	+= cyclone-ps-spi.o
+obj-$(CONFIG_FPGA_MGR_ALTERA_PS_SPI)	+= altera-ps-spi.o
 obj-$(CONFIG_FPGA_MGR_ICE40_SPI)	+= ice40-spi.o
 obj-$(CONFIG_FPGA_MGR_SOCFPGA)		+= socfpga.o
 obj-$(CONFIG_FPGA_MGR_SOCFPGA_A10)	+= socfpga-a10.o
diff --git a/drivers/fpga/altera-ps-spi.c b/drivers/fpga/altera-ps-spi.c
new file mode 100644
index 0000000..f788cd7
--- /dev/null
+++ b/drivers/fpga/altera-ps-spi.c
@@ -0,0 +1,290 @@
+/*
+ * Altera Passive Serial SPI Driver
+ *
+ *  Copyright (c) 2017 United Western Technologies, Corporation
+ *
+ *  Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * Manage Altera FPGA firmware that is loaded over SPI using the passive
+ * serial configuration method.
+ * Firmware must be in binary "rbf" format.
+ * Works on Arria 10, Cyclone V and Stratix V. Should work on Cyclone series.
+ * May work on other Altera FPGAs.
+ */
+
+#include <linux/bitrev.h>
+#include <linux/delay.h>
+#include <linux/fpga/fpga-mgr.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of_gpio.h>
+#include <linux/of_device.h>
+#include <linux/spi/spi.h>
+#include <linux/sizes.h>
+
+enum altera_ps_devtype {
+	CYCLONE5,
+	ARRIA10,
+};
+
+struct altera_ps_data {
+	enum altera_ps_devtype devtype;
+	int status_wait_min_us;
+	int status_wait_max_us;
+	int t_cfg_us;
+	int t_st2ck_us;
+};
+
+struct altera_ps_conf {
+	struct gpio_desc *config;
+	struct gpio_desc *confd;
+	struct gpio_desc *status;
+	struct spi_device *spi;
+	const struct altera_ps_data *data;
+	u32 info_flags;
+	char mgr_name[64];
+};
+
+/*          |   Arria 10  |   Cyclone5  |   Stratix5  |
+ * t_CF2ST0 |     [; 600] |     [; 600] |     [; 600] |ns
+ * t_CFG    |        [2;] |        [2;] |        [2;] |µs
+ * t_STATUS | [268; 3000] | [268; 1506] | [268; 1506] |µs
+ * t_CF2ST1 |    [; 3000] |    [; 1506] |    [; 1506] |µs
+ * t_CF2CK  |     [3010;] |     [1506;] |     [1506;] |µs
+ * t_ST2CK  |       [10;] |        [2;] |        [2;] |µs
+ * t_CD2UM  |  [175; 830] |  [175; 437] |  [175; 437] |µs
+ */
+static struct altera_ps_data c5_data = {
+	/* these values for Cyclone5 are compatible with Stratix5 */
+	.devtype = CYCLONE5,
+	.status_wait_min_us = 268,
+	.status_wait_max_us = 1506,
+	.t_cfg_us = 2,
+	.t_st2ck_us = 2,
+};
+
+static struct altera_ps_data a10_data = {
+	.devtype = ARRIA10,
+	.status_wait_min_us = 268,  /* min(t_STATUS) */
+	.status_wait_max_us = 3000, /* max(t_CF2ST1) */
+	.t_cfg_us = 2,    /* max { min(t_CFG), max(tCF2ST0) } */
+	.t_st2ck_us = 10, /* min(t_ST2CK) */
+};
+
+static const struct of_device_id of_ef_match[] = {
+	{ .compatible = "altr,fpga-passive-serial", .data = &c5_data },
+	{ .compatible = "altr,fpga-arria10-passive-serial", .data = &a10_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, of_ef_match);
+
+static enum fpga_mgr_states altera_ps_state(struct fpga_manager *mgr)
+{
+	struct altera_ps_conf *conf = mgr->priv;
+
+	if (gpiod_get_value_cansleep(conf->status))
+		return FPGA_MGR_STATE_RESET;
+
+	return FPGA_MGR_STATE_UNKNOWN;
+}
+
+static inline void altera_ps_delay(int delay_us)
+{
+	if (delay_us > 10)
+		usleep_range(delay_us, delay_us + 5);
+	else
+		udelay(delay_us);
+}
+
+static int altera_ps_write_init(struct fpga_manager *mgr,
+				struct fpga_image_info *info,
+				const char *buf, size_t count)
+{
+	struct altera_ps_conf *conf = mgr->priv;
+	int min, max, waits;
+	int i;
+
+	conf->info_flags = info->flags;
+
+	if (info->flags & FPGA_MGR_PARTIAL_RECONFIG) {
+		dev_err(&mgr->dev, "Partial reconfiguration not supported.\n");
+		return -EINVAL;
+	}
+
+	gpiod_set_value_cansleep(conf->config, 1);
+
+	/* wait min reset pulse time */
+	altera_ps_delay(conf->data->t_cfg_us);
+
+	if (!gpiod_get_value_cansleep(conf->status)) {
+		dev_err(&mgr->dev, "Status pin failed to show a reset\n");
+		return -EIO;
+	}
+
+	gpiod_set_value_cansleep(conf->config, 0);
+
+	min = conf->data->status_wait_min_us;
+	max = conf->data->status_wait_max_us;
+	waits = max / min;
+	if (max % min)
+		waits++;
+
+	/* wait for max { max(t_STATUS), max(t_CF2ST1) } */
+	for (i = 0; i < waits; i++) {
+		usleep_range(min, min + 10);
+		if (!gpiod_get_value_cansleep(conf->status)) {
+			/* wait for min(t_ST2CK)*/
+			altera_ps_delay(conf->data->t_st2ck_us);
+			return 0;
+		}
+	}
+
+	dev_err(&mgr->dev, "Status pin not ready.\n");
+	return -EIO;
+}
+
+static void rev_buf(char *buf, size_t len)
+{
+	const char *fw_end = (buf + len);
+
+	/* set buffer to lsb first */
+	while (buf < fw_end) {
+		*buf = bitrev8(*buf);
+		buf++;
+	}
+}
+
+static int altera_ps_write(struct fpga_manager *mgr, const char *buf,
+			   size_t count)
+{
+	struct altera_ps_conf *conf = mgr->priv;
+	const char *fw_data = buf;
+	const char *fw_data_end = fw_data + count;
+
+	while (fw_data < fw_data_end) {
+		int ret;
+		size_t stride = min_t(size_t, fw_data_end - fw_data, SZ_4K);
+
+		if (!(conf->info_flags & FPGA_MGR_SPI_BITSTREAM_LSB_FIRST))
+			rev_buf((char *)fw_data, stride);
+
+		ret = spi_write(conf->spi, fw_data, stride);
+		if (ret) {
+			dev_err(&mgr->dev, "spi error in firmware write: %d\n",
+				ret);
+			return ret;
+		}
+		fw_data += stride;
+	}
+
+	return 0;
+}
+
+static int altera_ps_write_complete(struct fpga_manager *mgr,
+				    struct fpga_image_info *info)
+{
+	struct altera_ps_conf *conf = mgr->priv;
+	const char dummy[] = {0};
+	int ret;
+
+	if (gpiod_get_value_cansleep(conf->status)) {
+		dev_err(&mgr->dev, "Error during configuration.\n");
+		return -EIO;
+	}
+
+	if (!IS_ERR(conf->confd)) {
+		if (!gpiod_get_raw_value_cansleep(conf->confd)) {
+			dev_err(&mgr->dev, "CONF_DONE is low!\n");
+			return -EIO;
+		}
+	}
+
+	/*
+	 * After CONF_DONE goes high, send two additional falling edges on DCLK
+	 * to begin initialization and enter user mode
+	 */
+	ret = spi_write(conf->spi, dummy, 1);
+	if (ret) {
+		dev_err(&mgr->dev, "spi error during end sequence: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct fpga_manager_ops altera_ps_ops = {
+	.state = altera_ps_state,
+	.write_init = altera_ps_write_init,
+	.write = altera_ps_write,
+	.write_complete = altera_ps_write_complete,
+};
+
+static int altera_ps_probe(struct spi_device *spi)
+{
+	struct altera_ps_conf *conf;
+	const struct of_device_id *of_id;
+
+	conf = devm_kzalloc(&spi->dev, sizeof(*conf), GFP_KERNEL);
+	if (!conf)
+		return -ENOMEM;
+
+	of_id = of_match_device(of_ef_match, &spi->dev);
+	if (!of_id)
+		return -ENODEV;
+
+	conf->data = of_id->data;
+	conf->spi = spi;
+	conf->config = devm_gpiod_get(&spi->dev, "nconfig", GPIOD_OUT_HIGH);
+	if (IS_ERR(conf->config)) {
+		dev_err(&spi->dev, "Failed to get config gpio: %ld\n",
+			PTR_ERR(conf->config));
+		return PTR_ERR(conf->config);
+	}
+
+	conf->status = devm_gpiod_get(&spi->dev, "nstat", GPIOD_IN);
+	if (IS_ERR(conf->status)) {
+		dev_err(&spi->dev, "Failed to get status gpio: %ld\n",
+			PTR_ERR(conf->status));
+		return PTR_ERR(conf->status);
+	}
+
+	conf->confd = devm_gpiod_get(&spi->dev, "confd", GPIOD_IN);
+	if (IS_ERR(conf->confd)) {
+		dev_warn(&spi->dev, "Not using confd gpio: %ld\n",
+			 PTR_ERR(conf->confd));
+	}
+
+	/* Register manager with unique name */
+	snprintf(conf->mgr_name, sizeof(conf->mgr_name), "%s %s",
+		 dev_driver_string(&spi->dev), dev_name(&spi->dev));
+
+	return fpga_mgr_register(&spi->dev, conf->mgr_name,
+				 &altera_ps_ops, conf);
+}
+
+static int altera_ps_remove(struct spi_device *spi)
+{
+	fpga_mgr_unregister(&spi->dev);
+
+	return 0;
+}
+
+static struct spi_driver altera_ps_driver = {
+	.driver = {
+		.name = "altera-ps-spi",
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(of_ef_match),
+	},
+	.probe = altera_ps_probe,
+	.remove = altera_ps_remove,
+};
+
+module_spi_driver(altera_ps_driver)
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>");
+MODULE_DESCRIPTION("Module to load Altera FPGA firmware over SPI");
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
