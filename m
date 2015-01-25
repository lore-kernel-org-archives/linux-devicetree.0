From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 3/4] tpm/st33zp24/spi: Add st33zp24 spi phy
Date: Sun, 25 Jan 2015 16:34:56 +0100
Message-ID: <1422200097-9869-4-git-send-email-christophe-h.ricard@st.com>
References: <1422200097-9869-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422200097-9869-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: PeterHuewe-Mmb7MZpHnFY@public.gmane.org
Cc: ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

st33zp24 TIS 1.2 support also SPI. It is using a proprietary protocol to
transport TIS data.

Reviewed-by: Jason Gunthorpe <jason.gunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/st33zp24/Kconfig  |  10 +
 drivers/char/tpm/st33zp24/Makefile |   3 +
 drivers/char/tpm/st33zp24/spi.c    | 386 +++++++++++++++++++++++++++++++++++++
 3 files changed, 399 insertions(+)
 create mode 100644 drivers/char/tpm/st33zp24/spi.c

diff --git a/drivers/char/tpm/st33zp24/Kconfig b/drivers/char/tpm/st33zp24/Kconfig
index 51dcef5..09cb7278 100644
--- a/drivers/char/tpm/st33zp24/Kconfig
+++ b/drivers/char/tpm/st33zp24/Kconfig
@@ -18,3 +18,13 @@ config TCG_TIS_ST33ZP24_I2C
 	  ST33ZP24 with i2c interface.
 	  To compile this driver as a module, choose M here; the module will be
 	  called tpm_st33zp24_i2c.
+
+config TCG_TIS_ST33ZP24_SPI
+	tristate "TPM 1.2 ST33ZP24 SPI support"
+	depends on TCG_TIS_ST33ZP24
+	depends on SPI
+	---help---
+	  This module adds support for the STMicroelectronics TPM security chip
+	  ST33ZP24 with spi interface.
+	  To compile this driver as a module, choose M here; the module will be
+	  called tpm_st33zp24_spi.
diff --git a/drivers/char/tpm/st33zp24/Makefile b/drivers/char/tpm/st33zp24/Makefile
index 414497f..74a722e 100644
--- a/drivers/char/tpm/st33zp24/Makefile
+++ b/drivers/char/tpm/st33zp24/Makefile
@@ -7,3 +7,6 @@ obj-$(CONFIG_TCG_TIS_ST33ZP24) += tpm_st33zp24.o
 
 tpm_st33zp24_i2c-objs = i2c.o
 obj-$(CONFIG_TCG_TIS_ST33ZP24_I2C) += tpm_st33zp24_i2c.o
+
+tpm_st33zp24_spi-objs = spi.o
+obj-$(CONFIG_TCG_TIS_ST33ZP24_SPI) += tpm_st33zp24_spi.o
diff --git a/drivers/char/tpm/st33zp24/spi.c b/drivers/char/tpm/st33zp24/spi.c
new file mode 100644
index 0000000..d481478
--- /dev/null
+++ b/drivers/char/tpm/st33zp24/spi.c
@@ -0,0 +1,386 @@
+/*
+ * STMicroelectronics TPM SPI Linux driver for TPM ST33ZP24
+ * Copyright (C) 2009 - 2015  STMicroelectronics
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/module.h>
+#include <linux/spi/spi.h>
+#include <linux/gpio.h>
+#include <linux/of_irq.h>
+#include <linux/of_gpio.h>
+#include <linux/tpm.h>
+#include <linux/platform_data/st33zp24.h>
+
+#include "st33zp24.h"
+
+#define TPM_DATA_FIFO           0x24
+#define TPM_INTF_CAPABILITY     0x14
+
+#define TPM_DUMMY_BYTE		0x00
+#define TPM_WRITE_DIRECTION	0x80
+#define TPM_BUFSIZE		2048
+
+#define MAX_SPI_LATENCY		15
+#define LOCALITY0		0
+
+#define ST33ZP24_OK					0x5A
+#define ST33ZP24_UNDEFINED_ERR				0x80
+#define ST33ZP24_BADLOCALITY				0x81
+#define ST33ZP24_TISREGISTER_UKNOWN			0x82
+#define ST33ZP24_LOCALITY_NOT_ACTIVATED			0x83
+#define ST33ZP24_HASH_END_BEFORE_HASH_START		0x84
+#define ST33ZP24_BAD_COMMAND_ORDER			0x85
+#define ST33ZP24_INCORECT_RECEIVED_LENGTH		0x86
+#define ST33ZP24_TPM_FIFO_OVERFLOW			0x89
+#define ST33ZP24_UNEXPECTED_READ_FIFO			0x8A
+#define ST33ZP24_UNEXPECTED_WRITE_FIFO			0x8B
+#define ST33ZP24_CMDRDY_SET_WHEN_PROCESSING_HASH_END	0x90
+#define ST33ZP24_DUMMY_BYTES				0x00
+
+struct st33zp24_spi_phy {
+	struct spi_device *spi_device;
+	struct spi_transfer spi_xfer;
+	int io_lpcpd;
+	int latency;
+};
+
+static int st33zp24_status_to_errno(u8 code)
+{
+	switch (code) {
+	case ST33ZP24_OK:
+		return 0;
+	case ST33ZP24_UNDEFINED_ERR:
+	case ST33ZP24_BADLOCALITY:
+	case ST33ZP24_TISREGISTER_UKNOWN:
+	case ST33ZP24_LOCALITY_NOT_ACTIVATED:
+	case ST33ZP24_HASH_END_BEFORE_HASH_START:
+	case ST33ZP24_BAD_COMMAND_ORDER:
+	case ST33ZP24_UNEXPECTED_READ_FIFO:
+	case ST33ZP24_UNEXPECTED_WRITE_FIFO:
+	case ST33ZP24_CMDRDY_SET_WHEN_PROCESSING_HASH_END:
+		return -EPROTO;
+	case ST33ZP24_INCORECT_RECEIVED_LENGTH:
+	case ST33ZP24_TPM_FIFO_OVERFLOW:
+		return -EMSGSIZE;
+	case ST33ZP24_DUMMY_BYTES:
+	default:
+		return -ENOSYS;
+	}
+}
+
+/*
+ * st33zp24_spi_send
+ * Send byte to the TIS register according to the ST33ZP24 SPI protocol.
+ * @param: tpm, the chip description
+ * @param: tpm_register, the tpm tis register where the data should be written
+ * @param: tpm_data, the tpm_data to write inside the tpm_register
+ * @param: tpm_size, The length of the data
+ * @return: should be zero if success else a negative error code.
+ */
+static int st33zp24_spi_send(void *phy_id, u8 tpm_register, u8 *tpm_data,
+			     int tpm_size)
+{
+	u8 data = 0;
+	int total_length = 0, nbr_dummy_bytes = 0, ret = 0;
+	struct st33zp24_spi_phy *phy = phy_id;
+	struct spi_device *dev = phy->spi_device;
+	u8 *tx_buf = (u8 *)phy->spi_xfer.tx_buf;
+	u8 *rx_buf = phy->spi_xfer.rx_buf;
+
+	/* Pre-Header */
+	data = TPM_WRITE_DIRECTION | LOCALITY0;
+	memcpy(tx_buf + total_length, &data, sizeof(data));
+	total_length++;
+	data = tpm_register;
+	memcpy(tx_buf + total_length, &data, sizeof(data));
+	total_length++;
+
+	if (tpm_size > 0 && tpm_register == TPM_DATA_FIFO) {
+		tx_buf[total_length++] = tpm_size >> 8;
+		tx_buf[total_length++] = tpm_size;
+	}
+
+	memcpy(&tx_buf[total_length], tpm_data, tpm_size);
+	total_length += tpm_size;
+
+	nbr_dummy_bytes = phy->latency;
+	memset(&tx_buf[total_length], TPM_DUMMY_BYTE, nbr_dummy_bytes);
+
+	phy->spi_xfer.len = total_length + nbr_dummy_bytes;
+
+	ret = spi_sync_transfer(dev, &phy->spi_xfer, 1);
+
+	if (ret == 0)
+		ret = rx_buf[total_length + nbr_dummy_bytes - 1];
+
+	return st33zp24_status_to_errno(ret);
+} /* st33zp24_spi_send() */
+
+/*
+ * read8_recv
+ * Recv byte from the TIS register according to the ST33ZP24 SPI protocol.
+ * @param: tpm, the chip description
+ * @param: tpm_register, the tpm tis register where the data should be read
+ * @param: tpm_data, the TPM response
+ * @param: tpm_size, tpm TPM response size to read.
+ * @return: should be zero if success else a negative error code.
+ */
+static int read8_reg(void *phy_id, u8 tpm_register, u8 *tpm_data, int tpm_size)
+{
+	u8 data = 0;
+	int total_length = 0, nbr_dummy_bytes, ret;
+	struct st33zp24_spi_phy *phy = phy_id;
+	struct spi_device *dev = phy->spi_device;
+	u8 *tx_buf = (u8 *)phy->spi_xfer.tx_buf;
+	u8 *rx_buf = phy->spi_xfer.rx_buf;
+
+	/* Pre-Header */
+	data = LOCALITY0;
+	memcpy(tx_buf + total_length, &data, sizeof(data));
+	total_length++;
+	data = tpm_register;
+	memcpy(tx_buf + total_length, &data, sizeof(data));
+	total_length++;
+
+	nbr_dummy_bytes = phy->latency;
+	memset(&tx_buf[total_length], TPM_DUMMY_BYTE,
+	       nbr_dummy_bytes + tpm_size);
+
+	phy->spi_xfer.len = total_length + nbr_dummy_bytes + tpm_size;
+
+	/* header + status byte + size of the data + status byte */
+	ret = spi_sync_transfer(dev, &phy->spi_xfer, 1);
+	if (tpm_size > 0 && ret == 0) {
+		ret = rx_buf[total_length + nbr_dummy_bytes - 1];
+
+		memcpy(tpm_data, rx_buf + total_length + nbr_dummy_bytes,
+		       tpm_size);
+	}
+
+	return ret;
+} /* read8_reg() */
+
+/*
+ * st33zp24_spi_recv
+ * Recv byte from the TIS register according to the ST33ZP24 SPI protocol.
+ * @param: tpm, the chip description
+ * @param: tpm_register, the tpm tis register where the data should be read
+ * @param: tpm_data, the TPM response
+ * @param: tpm_size, tpm TPM response size to read.
+ * @return: number of byte written successfully: should be one if success.
+ */
+static int st33zp24_spi_recv(void *phy_id, u8 tpm_register, u8 *tpm_data,
+			     int tpm_size)
+{
+	int ret;
+
+	ret = read8_reg(phy_id, tpm_register, tpm_data, tpm_size);
+	if (!ret)
+		return tpm_size;
+	return ret;
+} /* st33zp24_spi_recv() */
+
+static int evaluate_latency(void *phy_id)
+{
+	struct st33zp24_spi_phy *phy = phy_id;
+	int latency = 1, status = 0;
+	u8 data = 0;
+
+	while (!status && latency < MAX_SPI_LATENCY) {
+		phy->latency = latency;
+		status = read8_reg(phy_id, TPM_INTF_CAPABILITY, &data, 1);
+		latency++;
+	}
+	return latency - 1;
+} /* evaluate_latency() */
+
+static const struct st33zp24_phy_ops spi_phy_ops = {
+	.send = st33zp24_spi_send,
+	.recv = st33zp24_spi_recv,
+};
+
+#ifdef CONFIG_OF
+static int tpm_stm_spi_of_request_resources(struct st33zp24_spi_phy *phy)
+{
+	struct device_node *pp;
+	struct spi_device *dev = phy->spi_device;
+	int gpio;
+	int ret;
+
+	pp = dev->dev.of_node;
+	if (!pp) {
+		dev_err(&dev->dev, "No platform data\n");
+		return -ENODEV;
+	}
+
+	/* Get GPIO from device tree */
+	gpio = of_get_named_gpio(pp, "lpcpd-gpios", 0);
+	if (gpio < 0) {
+		dev_err(&dev->dev,
+			"Failed to retrieve lpcpd-gpios from dts.\n");
+		phy->io_lpcpd = -1;
+		/*
+		 * lpcpd pin is not specified. This is not an issue as
+		 * power management can be also managed by TPM specific
+		 * commands. So leave with a success status code.
+		 */
+		return 0;
+	}
+	/* GPIO request and configuration */
+	ret = devm_gpio_request_one(&dev->dev, gpio,
+			GPIOF_OUT_INIT_HIGH, "TPM IO LPCPD");
+	if (ret) {
+		dev_err(&dev->dev, "Failed to request lpcpd pin\n");
+		return -ENODEV;
+	}
+	phy->io_lpcpd = gpio;
+
+	return 0;
+}
+#else
+static int tpm_stm_spi_of_request_resources(struct st33zp24_spi_phy *phy)
+{
+	return -ENODEV;
+}
+#endif
+
+static int tpm_stm_spi_request_resources(struct spi_device *dev,
+					 struct st33zp24_spi_phy *phy)
+{
+	struct st33zp24_platform_data *pdata;
+	int ret;
+
+	pdata = dev->dev.platform_data;
+	if (!pdata) {
+		dev_err(&dev->dev, "No platform data\n");
+		return -ENODEV;
+	}
+
+	/* store for late use */
+	phy->io_lpcpd = pdata->io_lpcpd;
+
+	if (gpio_is_valid(pdata->io_lpcpd)) {
+		ret = devm_gpio_request_one(&dev->dev,
+				pdata->io_lpcpd, GPIOF_OUT_INIT_HIGH,
+				"TPM IO_LPCPD");
+		if (ret) {
+			dev_err(&dev->dev, "%s : reset gpio_request failed\n",
+				__FILE__);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * tpm_st33_spi_probe initialize the TPM device
+ * @param: client, the spi_device drescription (TPM SPI description).
+ * @param: id, the spi_device_id struct.
+ * @return: 0 in case of success.
+ *	 -1 in other case.
+ */
+static int
+tpm_st33_spi_probe(struct spi_device *dev)
+{
+	int ret;
+	struct st33zp24_platform_data *pdata;
+	struct st33zp24_spi_phy *phy;
+
+	/* Check SPI platform functionnalities */
+	if (!dev) {
+		pr_info("%s: dev is NULL. Device is not accessible.\n",
+			__func__);
+		return -ENODEV;
+	}
+
+	phy = devm_kzalloc(&dev->dev, sizeof(struct st33zp24_spi_phy),
+			   GFP_KERNEL);
+	if (!phy)
+		return -ENOMEM;
+
+	phy->spi_device = dev;
+	pdata = dev->dev.platform_data;
+	if (!pdata && dev->dev.of_node) {
+		ret = tpm_stm_spi_of_request_resources(phy);
+		if (ret)
+			return ret;
+	} else if (pdata) {
+		ret = tpm_stm_spi_request_resources(dev, phy);
+		if (ret)
+			return ret;
+	}
+
+	phy->spi_xfer.tx_buf = devm_kmalloc(&dev->dev, (TPM_BUFSIZE +
+					(TPM_BUFSIZE / 2) + TPM_DIGEST_SIZE) *
+					sizeof(u8), GFP_KERNEL);
+	if (!phy->spi_xfer.tx_buf)
+		return -ENOMEM;
+
+	phy->spi_xfer.rx_buf = devm_kmalloc(&dev->dev, (TPM_BUFSIZE +
+					(TPM_BUFSIZE / 2) + TPM_DIGEST_SIZE) *
+					sizeof(u8), GFP_KERNEL);
+	if (!phy->spi_xfer.rx_buf)
+		return -ENOMEM;
+
+	phy->latency = evaluate_latency(phy);
+	if (phy->latency <= 0)
+		return -ENODEV;
+
+	return st33zp24_probe(phy, &spi_phy_ops, &dev->dev, dev->irq,
+			      phy->io_lpcpd);
+}
+
+/*
+ * tpm_st33_spi_remove remove the TPM device
+ * @param: client, the spi_device drescription (TPM SPI description).
+ * @return: 0 in case of success.
+ */
+static int tpm_st33_spi_remove(struct spi_device *dev)
+{
+	struct tpm_chip *chip = spi_get_drvdata(dev);
+
+	return st33zp24_remove(chip);
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id of_st33zp24_spi_match[] = {
+	{ .compatible = "st,st33zp24-spi", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, of_st33zp24_spi_match);
+#endif
+
+static SIMPLE_DEV_PM_OPS(st33zp24_spi_ops, st33zp24_pm_suspend,
+			 st33zp24_pm_resume);
+
+static struct spi_driver tpm_st33_spi_driver = {
+	.driver = {
+		.owner = THIS_MODULE,
+		.name = TPM_ST33_SPI,
+		.pm = &st33zp24_spi_ops,
+		.of_match_table = of_match_ptr(of_st33zp24_spi_match),
+	},
+	.probe = tpm_st33_spi_probe,
+	.remove = tpm_st33_spi_remove,
+};
+
+module_spi_driver(tpm_st33_spi_driver);
+
+MODULE_AUTHOR("TPM support (TPMsupport-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org)");
+MODULE_DESCRIPTION("STM TPM 1.2 SPI ST33 Driver");
+MODULE_VERSION("1.3.0");
+MODULE_LICENSE("GPL");
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
