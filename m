From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 08/10] tpm/tpm_i2c_stm_st33: Split tpm_i2c_tpm_st33 in 2 layers (core + phy)
Date: Tue, 13 Jan 2015 23:13:16 +0100
Message-ID: <1421187198-8503-9-git-send-email-christophe-h.ricard@st.com>
References: <1421187198-8503-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421187198-8503-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: PeterHuewe-Mmb7MZpHnFY@public.gmane.org
Cc: ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

tpm_i2c_stm_st33 is a TIS 1.2 TPM with a core interface which can be used
by different phy such as i2c or spi. The core part is called st33zp24 which
is also the main part reference.

include/linux/platform_data/tpm_stm_st33.h is renamed consequently.
The driver is also split into an i2c phy in charge of sending/receiving
data as well as managing platform data or dts configuration.

Reviewed-by: Jasob Gunthorpe <jason.gunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/Kconfig                   |  11 +-
 drivers/char/tpm/Makefile                  |   2 +-
 drivers/char/tpm/st33zp24/Kconfig          |  20 +
 drivers/char/tpm/st33zp24/Makefile         |   9 +
 drivers/char/tpm/st33zp24/i2c.c            | 281 +++++++++
 drivers/char/tpm/st33zp24/st33zp24.c       | 683 +++++++++++++++++++++
 drivers/char/tpm/st33zp24/st33zp24.h       |  32 +
 drivers/char/tpm/tpm_i2c_stm_st33.c        | 915 -----------------------------
 include/linux/platform_data/st33zp24.h     |  28 +
 include/linux/platform_data/tpm_stm_st33.h |  39 --
 10 files changed, 1055 insertions(+), 965 deletions(-)
 create mode 100644 drivers/char/tpm/st33zp24/Kconfig
 create mode 100644 drivers/char/tpm/st33zp24/Makefile
 create mode 100644 drivers/char/tpm/st33zp24/i2c.c
 create mode 100644 drivers/char/tpm/st33zp24/st33zp24.c
 create mode 100644 drivers/char/tpm/st33zp24/st33zp24.h
 delete mode 100644 drivers/char/tpm/tpm_i2c_stm_st33.c
 create mode 100644 include/linux/platform_data/st33zp24.h
 delete mode 100644 include/linux/platform_data/tpm_stm_st33.h

diff --git a/drivers/char/tpm/Kconfig b/drivers/char/tpm/Kconfig
index 9d4e375..2dc16d3 100644
--- a/drivers/char/tpm/Kconfig
+++ b/drivers/char/tpm/Kconfig
@@ -100,16 +100,6 @@ config TCG_IBMVTPM
 	  will be accessible from within Linux.  To compile this driver
 	  as a module, choose M here; the module will be called tpm_ibmvtpm.
 
-config TCG_TIS_I2C_ST33
-	tristate "TPM Interface Specification 1.2 Interface (I2C - STMicroelectronics)"
-	depends on I2C
-	depends on GPIOLIB
-	---help---
-	  If you have a TPM security chip from STMicroelectronics working with
-	  an I2C bus say Yes and it will be accessible from within Linux.
-	  To compile this driver as a module, choose M here; the module will be
-	  called tpm_i2c_stm_st33.
-
 config TCG_XEN
 	tristate "XEN TPM Interface"
 	depends on TCG_TPM && XEN
@@ -131,4 +121,5 @@ config TCG_CRB
 	  from within Linux.  To compile this driver as a module, choose
 	  M here; the module will be called tpm_crb.
 
+source "drivers/char/tpm/st33zp24/Kconfig"
 endif # TCG_TPM
diff --git a/drivers/char/tpm/Makefile b/drivers/char/tpm/Makefile
index 990cf18..56e8f1f 100644
--- a/drivers/char/tpm/Makefile
+++ b/drivers/char/tpm/Makefile
@@ -20,6 +20,6 @@ obj-$(CONFIG_TCG_NSC) += tpm_nsc.o
 obj-$(CONFIG_TCG_ATMEL) += tpm_atmel.o
 obj-$(CONFIG_TCG_INFINEON) += tpm_infineon.o
 obj-$(CONFIG_TCG_IBMVTPM) += tpm_ibmvtpm.o
-obj-$(CONFIG_TCG_TIS_I2C_ST33) += tpm_i2c_stm_st33.o
+obj-$(CONFIG_TCG_TIS_ST33ZP24) += st33zp24/
 obj-$(CONFIG_TCG_XEN) += xen-tpmfront.o
 obj-$(CONFIG_TCG_CRB) += tpm_crb.o
diff --git a/drivers/char/tpm/st33zp24/Kconfig b/drivers/char/tpm/st33zp24/Kconfig
new file mode 100644
index 0000000..51dcef5
--- /dev/null
+++ b/drivers/char/tpm/st33zp24/Kconfig
@@ -0,0 +1,20 @@
+config TCG_TIS_ST33ZP24
+	tristate "STMicroelectronics TPM Interface Specification 1.2 Interface"
+	depends on GPIOLIB
+	---help---
+	  STMicroelectronics ST33ZP24 core driver. It implements the core
+	  TPM1.2 logic and hooks into the TPM kernel APIs. Physical layers will
+	  register against it.
+
+	  To compile this driver as a module, choose m here. The module will be called
+	  tpm_st33zp24.
+
+config TCG_TIS_ST33ZP24_I2C
+	tristate "TPM 1.2 ST33ZP24 I2C support"
+	depends on TCG_TIS_ST33ZP24
+	depends on I2C
+	---help---
+	  This module adds support for the STMicroelectronics TPM security chip
+	  ST33ZP24 with i2c interface.
+	  To compile this driver as a module, choose M here; the module will be
+	  called tpm_st33zp24_i2c.
diff --git a/drivers/char/tpm/st33zp24/Makefile b/drivers/char/tpm/st33zp24/Makefile
new file mode 100644
index 0000000..414497f
--- /dev/null
+++ b/drivers/char/tpm/st33zp24/Makefile
@@ -0,0 +1,9 @@
+#
+# Makefile for ST33ZP24 TPM 1.2 driver
+#
+
+tpm_st33zp24-objs = st33zp24.o
+obj-$(CONFIG_TCG_TIS_ST33ZP24) += tpm_st33zp24.o
+
+tpm_st33zp24_i2c-objs = i2c.o
+obj-$(CONFIG_TCG_TIS_ST33ZP24_I2C) += tpm_st33zp24_i2c.o
diff --git a/drivers/char/tpm/st33zp24/i2c.c b/drivers/char/tpm/st33zp24/i2c.c
new file mode 100644
index 0000000..a47b18f
--- /dev/null
+++ b/drivers/char/tpm/st33zp24/i2c.c
@@ -0,0 +1,281 @@
+/*
+ * STMicroelectronics TPM I2C Linux driver for TPM ST33ZP24
+ * Copyright (C) 2009 - 2015 STMicroelectronics
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
+#include <linux/platform_device.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/gpio.h>
+#include <linux/of_irq.h>
+#include <linux/of_gpio.h>
+
+#include <linux/platform_data/st33zp24.h>
+#include <linux/tpm.h>
+
+#include "st33zp24.h"
+
+#define TPM_DUMMY_BYTE			0xAA
+#define TPM_WRITE_DIRECTION		0x80
+#define TPM_BUFSIZE			2048
+
+struct st33zp24_i2c_phy {
+	struct i2c_client *client;
+	u8 buf[TPM_BUFSIZE + 1];
+	int io_lpcpd;
+};
+
+/*
+ * write8_reg
+ * Send byte to the TIS register according to the ST33ZP24 I2C protocol.
+ * @param: tpm_register, the tpm tis register where the data should be written
+ * @param: tpm_data, the tpm_data to write inside the tpm_register
+ * @param: tpm_size, The length of the data
+ * @return: Returns negative errno, or else the number of bytes written.
+ */
+static int write8_reg(void *phy_id, u8 tpm_register, u8 *tpm_data, int tpm_size)
+{
+	struct st33zp24_i2c_phy *phy = phy_id;
+
+	phy->buf[0] = tpm_register;
+	memcpy(phy->buf + 1, tpm_data, tpm_size);
+	return i2c_master_send(phy->client, phy->buf, tpm_size + 1);
+} /* write8_reg() */
+
+/*
+ * read8_reg
+ * Recv byte from the TIS register according to the ST33ZP24 I2C protocol.
+ * @param: tpm_register, the tpm tis register where the data should be read
+ * @param: tpm_data, the TPM response
+ * @param: tpm_size, tpm TPM response size to read.
+ * @return: number of byte read successfully: should be one if success.
+ */
+static int read8_reg(void *phy_id, u8 tpm_register, u8 *tpm_data, int tpm_size)
+{
+	struct st33zp24_i2c_phy *phy = phy_id;
+	u8 status = 0;
+	u8 data;
+
+	data = TPM_DUMMY_BYTE;
+	status = write8_reg(phy, tpm_register, &data, 1);
+	if (status == 2)
+		status = i2c_master_recv(phy->client, tpm_data, tpm_size);
+	return status;
+} /* read8_reg() */
+
+/*
+ * st33zp24_i2c_send
+ * Send byte to the TIS register according to the ST33ZP24 I2C protocol.
+ * @param: phy_id, the phy description
+ * @param: tpm_register, the tpm tis register where the data should be written
+ * @param: tpm_data, the tpm_data to write inside the tpm_register
+ * @param: tpm_size, the length of the data
+ * @return: number of byte written successfully: should be one if success.
+ */
+static int st33zp24_i2c_send(void *phy_id, u8 tpm_register, u8 *tpm_data,
+			     int tpm_size)
+{
+	return write8_reg(phy_id, tpm_register | TPM_WRITE_DIRECTION, tpm_data,
+			  tpm_size);
+}
+
+/*
+ * st33zp24_i2c_recv
+ * Recv byte from the TIS register according to the ST33ZP24 I2C protocol.
+ * @param: phy_id, the phy description
+ * @param: tpm_register, the tpm tis register where the data should be read
+ * @param: tpm_data, the TPM response
+ * @param: tpm_size, tpm TPM response size to read.
+ * @return: number of byte read successfully: should be one if success.
+ */
+static int st33zp24_i2c_recv(void *phy_id, u8 tpm_register, u8 *tpm_data,
+			     int tpm_size)
+{
+	return read8_reg(phy_id, tpm_register, tpm_data, tpm_size);
+}
+
+static const struct st33zp24_phy_ops i2c_phy_ops = {
+	.send = st33zp24_i2c_send,
+	.recv = st33zp24_i2c_recv,
+};
+
+#ifdef CONFIG_OF
+static int st33zp24_i2c_of_request_resources(struct st33zp24_i2c_phy *phy)
+{
+	struct device_node *pp;
+	struct i2c_client *client = phy->client;
+	int gpio;
+	int ret;
+
+	pp = client->dev.of_node;
+	if (!pp) {
+		dev_err(&client->dev, "No platform data\n");
+		return -ENODEV;
+	}
+
+	/* Get GPIO from device tree */
+	gpio = of_get_named_gpio(pp, "lpcpd-gpios", 0);
+	if (gpio < 0) {
+		dev_err(&client->dev,
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
+	ret = devm_gpio_request_one(&client->dev, gpio,
+			GPIOF_OUT_INIT_HIGH, "TPM IO LPCPD");
+	if (ret) {
+		dev_err(&client->dev, "Failed to request lpcpd pin\n");
+		return -ENODEV;
+	}
+	phy->io_lpcpd = gpio;
+
+	return 0;
+}
+#else
+static int st33zp24_i2c_of_request_resources(struct st33zp24_i2c_phy *phy)
+{
+	return -ENODEV;
+}
+#endif
+
+static int st33zp24_i2c_request_resources(struct i2c_client *client,
+					  struct st33zp24_i2c_phy *phy)
+{
+	struct st33zp24_platform_data *pdata;
+	int ret;
+
+	pdata = client->dev.platform_data;
+	if (!pdata) {
+		dev_err(&client->dev, "No platform data\n");
+		return -ENODEV;
+	}
+
+	/* store for late use */
+	phy->io_lpcpd = pdata->io_lpcpd;
+
+	if (gpio_is_valid(pdata->io_lpcpd)) {
+		ret = devm_gpio_request_one(&client->dev,
+				pdata->io_lpcpd, GPIOF_OUT_INIT_HIGH,
+				"TPM IO_LPCPD");
+		if (ret) {
+			dev_err(&client->dev, "Failed to request lpcpd pin\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * st33zp24_i2c_probe initialize the TPM device
+ * @param: client, the i2c_client drescription (TPM I2C description).
+ * @param: id, the i2c_device_id struct.
+ * @return: 0 in case of success.
+ *	 -1 in other case.
+ */
+static int st33zp24_i2c_probe(struct i2c_client *client,
+			      const struct i2c_device_id *id)
+{
+	int ret;
+	struct st33zp24_platform_data *pdata;
+	struct st33zp24_i2c_phy *phy;
+
+	if (!client) {
+		pr_info("%s: i2c client is NULL. Device not accessible.\n",
+			__func__);
+		return -ENODEV;
+	}
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		dev_info(&client->dev, "client not i2c capable\n");
+		return -ENODEV;
+	}
+
+	phy = devm_kzalloc(&client->dev, sizeof(struct st33zp24_i2c_phy),
+			   GFP_KERNEL);
+	if (!phy)
+		return -ENOMEM;
+
+	phy->client = client;
+	pdata = client->dev.platform_data;
+	if (!pdata && client->dev.of_node) {
+		ret = st33zp24_i2c_of_request_resources(phy);
+		if (ret)
+			return ret;
+	} else if (pdata) {
+		ret = st33zp24_i2c_request_resources(client, phy);
+		if (ret)
+			return ret;
+	}
+
+	return st33zp24_probe(phy, &i2c_phy_ops, &client->dev, client->irq,
+			      phy->io_lpcpd);
+}
+
+/*
+ * st33zp24_i2c_remove remove the TPM device
+ * @param: client, the i2c_client description (TPM I2C description).
+ * @return: 0 in case of success.
+ */
+static int st33zp24_i2c_remove(struct i2c_client *client)
+{
+	struct tpm_chip *chip = i2c_get_clientdata(client);
+
+	return st33zp24_remove(chip);
+}
+
+static const struct i2c_device_id st33zp24_i2c_id[] = {
+	{TPM_ST33_I2C, 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, st33zp24_i2c_id);
+
+#ifdef CONFIG_OF
+static const struct of_device_id of_st33zp24_i2c_match[] = {
+	{ .compatible = "st,st33zp24-i2c", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, of_st33zp24_i2c_match);
+#endif
+
+static SIMPLE_DEV_PM_OPS(st33zp24_i2c_ops, st33zp24_pm_suspend,
+			 st33zp24_pm_resume);
+
+static struct i2c_driver st33zp24_i2c_driver = {
+	.driver = {
+		.owner = THIS_MODULE,
+		.name = TPM_ST33_I2C,
+		.pm = &st33zp24_i2c_ops,
+		.of_match_table = of_match_ptr(of_st33zp24_i2c_match),
+	},
+	.probe = st33zp24_i2c_probe,
+	.remove = st33zp24_i2c_remove,
+	.id_table = st33zp24_i2c_id
+};
+
+module_i2c_driver(st33zp24_i2c_driver);
+
+MODULE_AUTHOR("Christophe Ricard (tpmsupport-qxv4g6HH51o@public.gmane.org)");
+MODULE_DESCRIPTION("STM TPM 1.2 I2C ST33 Driver");
+MODULE_VERSION("1.3.0");
+MODULE_LICENSE("GPL");
diff --git a/drivers/char/tpm/st33zp24/st33zp24.c b/drivers/char/tpm/st33zp24/st33zp24.c
new file mode 100644
index 0000000..60a02c3
--- /dev/null
+++ b/drivers/char/tpm/st33zp24/st33zp24.c
@@ -0,0 +1,683 @@
+/*
+ * STMicroelectronics TPM Linux driver for TPM ST33ZP24
+ * Copyright (C) 2009 - 2015 STMicroelectronics
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
+#include <linux/fs.h>
+#include <linux/miscdevice.h>
+#include <linux/kernel.h>
+#include <linux/delay.h>
+#include <linux/wait.h>
+#include <linux/freezer.h>
+#include <linux/string.h>
+#include <linux/interrupt.h>
+#include <linux/gpio.h>
+#include <linux/sched.h>
+#include <linux/uaccess.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+
+#include "../tpm.h"
+#include "st33zp24.h"
+
+#define TPM_ACCESS			0x0
+#define TPM_STS				0x18
+#define TPM_DATA_FIFO			0x24
+#define TPM_INTF_CAPABILITY		0x14
+#define TPM_INT_STATUS			0x10
+#define TPM_INT_ENABLE			0x08
+
+#define TPM_HEADER_SIZE			10
+#define TPM_BUFSIZE			2048
+
+#define LOCALITY0			0
+
+enum st33zp24_access {
+	TPM_ACCESS_VALID = 0x80,
+	TPM_ACCESS_ACTIVE_LOCALITY = 0x20,
+	TPM_ACCESS_REQUEST_PENDING = 0x04,
+	TPM_ACCESS_REQUEST_USE = 0x02,
+};
+
+enum st33zp24_status {
+	TPM_STS_VALID = 0x80,
+	TPM_STS_COMMAND_READY = 0x40,
+	TPM_STS_GO = 0x20,
+	TPM_STS_DATA_AVAIL = 0x10,
+	TPM_STS_DATA_EXPECT = 0x08,
+};
+
+enum st33zp24_int_flags {
+	TPM_GLOBAL_INT_ENABLE = 0x80,
+	TPM_INTF_CMD_READY_INT = 0x080,
+	TPM_INTF_FIFO_AVALAIBLE_INT = 0x040,
+	TPM_INTF_WAKE_UP_READY_INT = 0x020,
+	TPM_INTF_LOCALITY_CHANGE_INT = 0x004,
+	TPM_INTF_STS_VALID_INT = 0x002,
+	TPM_INTF_DATA_AVAIL_INT = 0x001,
+};
+
+enum tis_defaults {
+	TIS_SHORT_TIMEOUT = 750,
+	TIS_LONG_TIMEOUT = 2000,
+};
+
+struct st33zp24_dev {
+	struct tpm_chip *chip;
+	void *phy_id;
+	const struct st33zp24_phy_ops *ops;
+	u32 intrs;
+	int io_lpcpd;
+};
+
+/*
+ * clear_interruption clear the pending interrupt.
+ * @param: tpm_dev, the tpm device device.
+ * @return: the interrupt status value.
+ */
+static u8 clear_interruption(struct st33zp24_dev *tpm_dev)
+{
+	u8 interrupt;
+
+	tpm_dev->ops->recv(tpm_dev->phy_id, TPM_INT_STATUS, &interrupt, 1);
+	tpm_dev->ops->send(tpm_dev->phy_id, TPM_INT_STATUS, &interrupt, 1);
+	return interrupt;
+} /* clear_interruption() */
+
+/*
+ * st33zp24_cancel, cancel is not implemented.
+ * @param: chip, the tpm_chip description as specified in driver/char/tpm/tpm.h
+ */
+static void st33zp24_cancel(struct tpm_chip *chip)
+{
+	struct st33zp24_dev *tpm_dev;
+	u8 data;
+
+	tpm_dev = (struct st33zp24_dev *)TPM_VPRIV(chip);
+
+	data = TPM_STS_COMMAND_READY;
+	tpm_dev->ops->send(tpm_dev->phy_id, TPM_STS, &data, 1);
+} /* st33zp24_cancel() */
+
+/*
+ * st33zp24_status return the TPM_STS register
+ * @param: chip, the tpm chip description
+ * @return: the TPM_STS register value.
+ */
+static u8 st33zp24_status(struct tpm_chip *chip)
+{
+	struct st33zp24_dev *tpm_dev;
+	u8 data;
+
+	tpm_dev = (struct st33zp24_dev *)TPM_VPRIV(chip);
+
+	tpm_dev->ops->recv(tpm_dev->phy_id, TPM_STS, &data, 1);
+	return data;
+} /* st33zp24_status() */
+
+/*
+ * check_locality if the locality is active
+ * @param: chip, the tpm chip description
+ * @return: the active locality or -EACCESS.
+ */
+static int check_locality(struct tpm_chip *chip)
+{
+	struct st33zp24_dev *tpm_dev;
+	u8 data;
+	u8 status;
+
+	tpm_dev = (struct st33zp24_dev *)TPM_VPRIV(chip);
+
+	status = tpm_dev->ops->recv(tpm_dev->phy_id, TPM_ACCESS, &data, 1);
+	if (status && (data &
+		(TPM_ACCESS_ACTIVE_LOCALITY | TPM_ACCESS_VALID)) ==
+		(TPM_ACCESS_ACTIVE_LOCALITY | TPM_ACCESS_VALID))
+		return chip->vendor.locality;
+
+	return -EACCES;
+} /* check_locality() */
+
+/*
+ * request_locality request the TPM locality
+ * @param: chip, the chip description
+ * @return: the active locality or negative value.
+ */
+static int request_locality(struct tpm_chip *chip)
+{
+	unsigned long stop;
+	long ret;
+	struct st33zp24_dev *tpm_dev;
+	u8 data;
+
+	if (check_locality(chip) == chip->vendor.locality)
+		return chip->vendor.locality;
+
+	tpm_dev = (struct st33zp24_dev *)TPM_VPRIV(chip);
+
+	data = TPM_ACCESS_REQUEST_USE;
+	ret = tpm_dev->ops->send(tpm_dev->phy_id, TPM_ACCESS, &data, 1);
+	if (ret < 0)
+		goto end;
+
+	stop = jiffies + chip->vendor.timeout_a;
+
+	/* Request locality is usually effective after the request */
+	do {
+		if (check_locality(chip) >= 0)
+			return chip->vendor.locality;
+		msleep(TPM_TIMEOUT);
+	} while (time_before(jiffies, stop));
+	ret = -EACCES;
+end:
+	return ret;
+} /* request_locality() */
+
+/*
+ * release_locality release the active locality
+ * @param: chip, the tpm chip description.
+ */
+static void release_locality(struct tpm_chip *chip)
+{
+	struct st33zp24_dev *tpm_dev;
+	u8 data;
+
+	tpm_dev = (struct st33zp24_dev *)TPM_VPRIV(chip);
+	data = TPM_ACCESS_ACTIVE_LOCALITY;
+
+	tpm_dev->ops->send(tpm_dev->phy_id, TPM_ACCESS, &data, 1);
+}
+
+/*
+ * get_burstcount return the burstcount address 0x19 0x1A
+ * @param: chip, the chip description
+ * return: the burstcount or negative value.
+ */
+static int get_burstcount(struct tpm_chip *chip)
+{
+	unsigned long stop;
+	int burstcnt, status;
+	u8 tpm_reg, temp;
+	struct st33zp24_dev *tpm_dev;
+
+	tpm_dev = (struct st33zp24_dev *)TPM_VPRIV(chip);
+
+	stop = jiffies + chip->vendor.timeout_d;
+	do {
+		tpm_reg = TPM_STS + 1;
+		status = tpm_dev->ops->recv(tpm_dev->phy_id, tpm_reg, &temp, 1);
+		if (status < 0)
+			goto end;
+
+		tpm_reg = tpm_reg + 1;
+		burstcnt = temp;
+		status = tpm_dev->ops->recv(tpm_dev->phy_id, tpm_reg, &temp, 1);
+		if (status < 0)
+			goto end;
+
+		burstcnt |= temp << 8;
+		if (burstcnt)
+			return burstcnt;
+		msleep(TPM_TIMEOUT);
+	} while (time_before(jiffies, stop));
+
+end:
+	return -EBUSY;
+} /* get_burstcount() */
+
+
+/*
+ * wait_for_tpm_stat_cond
+ * @param: chip, chip description
+ * @param: mask, expected mask value
+ * @param: check_cancel, does the command expected to be canceled ?
+ * @param: canceled, did we received a cancel request ?
+ * @return: true if status == mask or if the command is canceled.
+ * false in other cases.
+ */
+static bool wait_for_tpm_stat_cond(struct tpm_chip *chip, u8 mask,
+				bool check_cancel, bool *canceled)
+{
+	u8 status = chip->ops->status(chip);
+
+	*canceled = false;
+	if ((status & mask) == mask)
+		return true;
+	if (check_cancel && chip->ops->req_canceled(chip, status)) {
+		*canceled = true;
+		return true;
+	}
+	return false;
+}
+
+/*
+ * wait_for_stat wait for a TPM_STS value
+ * @param: chip, the tpm chip description
+ * @param: mask, the value mask to wait
+ * @param: timeout, the timeout
+ * @param: queue, the wait queue.
+ * @param: check_cancel, does the command can be cancelled ?
+ * @return: the tpm status, 0 if success, -ETIME if timeout is reached.
+ */
+static int wait_for_stat(struct tpm_chip *chip, u8 mask, unsigned long timeout,
+			wait_queue_head_t *queue, bool check_cancel)
+{
+	unsigned long stop;
+	int ret;
+	bool canceled = false;
+	bool condition;
+	u32 cur_intrs;
+	u8 status;
+	struct st33zp24_dev *tpm_dev;
+
+	tpm_dev = (struct st33zp24_dev *)TPM_VPRIV(chip);
+
+	/* check current status */
+	status = st33zp24_status(chip);
+	if ((status & mask) == mask)
+		return 0;
+
+	stop = jiffies + timeout;
+
+	if (chip->vendor.irq) {
+		cur_intrs = tpm_dev->intrs;
+		clear_interruption(tpm_dev);
+		enable_irq(chip->vendor.irq);
+
+again:
+		timeout = stop - jiffies;
+		if ((long) timeout <= 0)
+			return -1;
+
+		ret = wait_event_interruptible_timeout(*queue,
+					cur_intrs != tpm_dev->intrs, timeout);
+		clear_interruption(tpm_dev);
+		condition = wait_for_tpm_stat_cond(chip, mask,
+						   check_cancel, &canceled);
+		if (ret >= 0 && condition) {
+			if (canceled)
+				return -ECANCELED;
+			return 0;
+		}
+		if (ret == -ERESTARTSYS && freezing(current)) {
+			clear_thread_flag(TIF_SIGPENDING);
+			goto again;
+		}
+		disable_irq_nosync(chip->vendor.irq);
+
+	} else {
+		do {
+			msleep(TPM_TIMEOUT);
+			status = chip->ops->status(chip);
+			if ((status & mask) == mask)
+				return 0;
+		} while (time_before(jiffies, stop));
+	}
+
+	return -ETIME;
+} /* wait_for_stat() */
+
+/*
+ * recv_data receive data
+ * @param: chip, the tpm chip description
+ * @param: buf, the buffer where the data are received
+ * @param: count, the number of data to receive
+ * @return: the number of bytes read from TPM FIFO.
+ */
+static int recv_data(struct tpm_chip *chip, u8 *buf, size_t count)
+{
+	int size = 0, burstcnt, len, ret;
+	struct st33zp24_dev *tpm_dev;
+
+	tpm_dev = (struct st33zp24_dev *)TPM_VPRIV(chip);
+
+	while (size < count &&
+	       wait_for_stat(chip,
+			     TPM_STS_DATA_AVAIL | TPM_STS_VALID,
+			     chip->vendor.timeout_c,
+			     &chip->vendor.read_queue, true) == 0) {
+		burstcnt = get_burstcount(chip);
+		if (burstcnt < 0)
+			return burstcnt;
+		len = min_t(int, burstcnt, count - size);
+		ret = tpm_dev->ops->recv(tpm_dev->phy_id, TPM_DATA_FIFO,
+					 buf + size, len);
+		if (ret < 0)
+			return ret;
+
+		size += len;
+	}
+	return size;
+}
+
+/*
+ * tpm_ioserirq_handler the serirq irq handler
+ * @param: irq, the tpm chip description
+ * @param: dev_id, the description of the chip
+ * @return: the status of the handler.
+ */
+static irqreturn_t tpm_ioserirq_handler(int irq, void *dev_id)
+{
+	struct tpm_chip *chip = dev_id;
+	struct st33zp24_dev *tpm_dev;
+
+	tpm_dev = (struct st33zp24_dev *)TPM_VPRIV(chip);
+
+	tpm_dev->intrs++;
+	wake_up_interruptible(&chip->vendor.read_queue);
+	disable_irq_nosync(chip->vendor.irq);
+
+	return IRQ_HANDLED;
+} /* tpm_ioserirq_handler() */
+
+/*
+ * st33zp24_send send TPM commands through the I2C bus.
+ *
+ * @param: chip, the tpm_chip description as specified in driver/char/tpm/tpm.h
+ * @param: buf,	the buffer to send.
+ * @param: count, the number of bytes to send.
+ * @return: In case of success the number of bytes sent.
+ *			In other case, a < 0 value describing the issue.
+ */
+static int st33zp24_send(struct tpm_chip *chip, unsigned char *buf,
+			 size_t len)
+{
+	u32 status, i, size;
+	int burstcnt = 0;
+	int ret;
+	u8 data;
+	struct st33zp24_dev *tpm_dev;
+
+	if (!chip)
+		return -EBUSY;
+	if (len < TPM_HEADER_SIZE)
+		return -EBUSY;
+
+	tpm_dev = (struct st33zp24_dev *)TPM_VPRIV(chip);
+
+	ret = request_locality(chip);
+	if (ret < 0)
+		return ret;
+
+	status = st33zp24_status(chip);
+	if ((status & TPM_STS_COMMAND_READY) == 0) {
+		st33zp24_cancel(chip);
+		if (wait_for_stat
+		    (chip, TPM_STS_COMMAND_READY, chip->vendor.timeout_b,
+		     &chip->vendor.read_queue, false) < 0) {
+			ret = -ETIME;
+			goto out_err;
+		}
+	}
+
+	for (i = 0; i < len - 1;) {
+		burstcnt = get_burstcount(chip);
+		if (burstcnt < 0)
+			return burstcnt;
+		size = min_t(int, len - i - 1, burstcnt);
+		ret = tpm_dev->ops->send(tpm_dev->phy_id, TPM_DATA_FIFO,
+					 buf + i, size);
+		if (ret < 0)
+			goto out_err;
+
+		i += size;
+	}
+
+	status = st33zp24_status(chip);
+	if ((status & TPM_STS_DATA_EXPECT) == 0) {
+		ret = -EIO;
+		goto out_err;
+	}
+
+	ret = tpm_dev->ops->send(tpm_dev->phy_id, TPM_DATA_FIFO,
+				 buf + len - 1, 1);
+	if (ret < 0)
+		goto out_err;
+
+	status = st33zp24_status(chip);
+	if ((status & TPM_STS_DATA_EXPECT) != 0) {
+		ret = -EIO;
+		goto out_err;
+	}
+
+	data = TPM_STS_GO;
+	ret = tpm_dev->ops->send(tpm_dev->phy_id, TPM_STS, &data, 1);
+	if (ret < 0)
+		goto out_err;
+
+	return len;
+out_err:
+	st33zp24_cancel(chip);
+	release_locality(chip);
+	return ret;
+}
+
+/*
+ * st33zp24_recv received TPM response through TPM phy.
+ * @param: chip, the tpm_chip description as specified in driver/char/tpm/tpm.h.
+ * @param: buf,	the buffer to store datas.
+ * @param: count, the number of bytes to send.
+ * @return: In case of success the number of bytes received.
+ *	    In other case, a < 0 value describing the issue.
+ */
+static int st33zp24_recv(struct tpm_chip *chip, unsigned char *buf,
+			    size_t count)
+{
+	int size = 0;
+	int expected;
+
+	if (!chip)
+		return -EBUSY;
+
+	if (count < TPM_HEADER_SIZE) {
+		size = -EIO;
+		goto out;
+	}
+
+	size = recv_data(chip, buf, TPM_HEADER_SIZE);
+	if (size < TPM_HEADER_SIZE) {
+		dev_err(&chip->dev, "Unable to read header\n");
+		goto out;
+	}
+
+	expected = be32_to_cpu(*(__be32 *)(buf + 2));
+	if (expected > count) {
+		size = -EIO;
+		goto out;
+	}
+
+	size += recv_data(chip, &buf[TPM_HEADER_SIZE],
+			expected - TPM_HEADER_SIZE);
+	if (size < expected) {
+		dev_err(&chip->dev, "Unable to read remainder of result\n");
+		size = -ETIME;
+		goto out;
+	}
+
+out:
+	st33zp24_cancel(chip);
+	release_locality(chip);
+	return size;
+}
+
+/*
+ * st33zp24_req_canceled
+ * @param: chip, the tpm_chip description as specified in driver/char/tpm/tpm.h.
+ * @param: status, the TPM status.
+ * @return: Does TPM ready to compute a new command ? true.
+ */
+static bool st33zp24_req_canceled(struct tpm_chip *chip, u8 status)
+{
+	return (status == TPM_STS_COMMAND_READY);
+}
+
+static const struct tpm_class_ops st33zp24_tpm = {
+	.send = st33zp24_send,
+	.recv = st33zp24_recv,
+	.cancel = st33zp24_cancel,
+	.status = st33zp24_status,
+	.req_complete_mask = TPM_STS_DATA_AVAIL | TPM_STS_VALID,
+	.req_complete_val = TPM_STS_DATA_AVAIL | TPM_STS_VALID,
+	.req_canceled = st33zp24_req_canceled,
+};
+
+/*
+ * st33zp24_probe initialize the TPM device
+ * @param: client, the i2c_client drescription (TPM I2C description).
+ * @param: id, the i2c_device_id struct.
+ * @return: 0 in case of success.
+ *	 -1 in other case.
+ */
+int st33zp24_probe(void *phy_id, const struct st33zp24_phy_ops *ops,
+		   struct device *dev, int irq, int io_lpcpd)
+{
+	int ret;
+	u8 intmask = 0;
+	struct tpm_chip *chip;
+	struct st33zp24_dev *tpm_dev;
+
+	chip = tpmm_chip_alloc(dev, &st33zp24_tpm);
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+
+	tpm_dev = devm_kzalloc(dev, sizeof(struct st33zp24_dev),
+			       GFP_KERNEL);
+	if (!tpm_dev)
+		return -ENOMEM;
+
+	TPM_VPRIV(chip) = tpm_dev;
+	tpm_dev->phy_id = phy_id;
+	tpm_dev->ops = ops;
+
+	chip->vendor.timeout_a = msecs_to_jiffies(TIS_SHORT_TIMEOUT);
+	chip->vendor.timeout_b = msecs_to_jiffies(TIS_LONG_TIMEOUT);
+	chip->vendor.timeout_c = msecs_to_jiffies(TIS_SHORT_TIMEOUT);
+	chip->vendor.timeout_d = msecs_to_jiffies(TIS_SHORT_TIMEOUT);
+
+	chip->vendor.locality = LOCALITY0;
+
+	if (irq) {
+		/* INTERRUPT Setup */
+		init_waitqueue_head(&chip->vendor.read_queue);
+		tpm_dev->intrs = 0;
+
+		if (request_locality(chip) != LOCALITY0) {
+			ret = -ENODEV;
+			goto _tpm_clean_answer;
+		}
+
+		clear_interruption(tpm_dev);
+		ret = devm_request_irq(dev, irq, tpm_ioserirq_handler,
+				IRQF_TRIGGER_HIGH, "TPM SERIRQ management",
+				chip);
+		if (ret < 0) {
+			dev_err(&chip->dev , "TPM SERIRQ signals %d not available\n",
+				irq);
+			goto _tpm_clean_answer;
+		}
+
+		intmask |= TPM_INTF_CMD_READY_INT
+			|  TPM_INTF_STS_VALID_INT
+			|  TPM_INTF_DATA_AVAIL_INT;
+
+		ret = tpm_dev->ops->send(tpm_dev->phy_id, TPM_INT_ENABLE,
+					 &intmask, 1);
+		if (ret < 0)
+			goto _tpm_clean_answer;
+
+		intmask = TPM_GLOBAL_INT_ENABLE;
+		ret = tpm_dev->ops->send(tpm_dev->phy_id, (TPM_INT_ENABLE + 3),
+					 &intmask, 1);
+		if (ret < 0)
+			goto _tpm_clean_answer;
+
+		chip->vendor.irq = irq;
+
+		disable_irq_nosync(chip->vendor.irq);
+
+		tpm_gen_interrupt(chip);
+	}
+
+	tpm_get_timeouts(chip);
+	tpm_do_selftest(chip);
+
+	return tpm_chip_register(chip);
+_tpm_clean_answer:
+	dev_info(&chip->dev, "TPM initialization fail\n");
+	return ret;
+}
+
+/*
+ * st33zp24_remove remove the TPM device
+ * @param: tpm_data, the tpm phy.
+ * @return: 0 in case of success.
+ */
+int st33zp24_remove(struct tpm_chip *chip)
+{
+	tpm_chip_unregister(chip);
+	return 0;
+}
+
+
+#ifdef CONFIG_PM_SLEEP
+/*
+ * st33zp24_pm_suspend suspend the TPM device
+ * @param: tpm_data, the tpm phy.
+ * @param: mesg, the power management message.
+ * @return: 0 in case of success.
+ */
+int st33zp24_pm_suspend(struct device *dev)
+{
+	struct tpm_chip *chip = dev_get_drvdata(dev);
+	struct st33zp24_dev *tpm_dev;
+	int ret = 0;
+
+	tpm_dev = (struct st33zp24_dev *)TPM_VPRIV(chip);
+
+	if (gpio_is_valid(tpm_dev->io_lpcpd))
+		gpio_set_value(tpm_dev->io_lpcpd, 0);
+	else
+		ret = tpm_pm_suspend(dev);
+
+	return ret;
+} /* st33zp24_suspend() */
+
+/*
+ * st33zp24_pm_resume resume the TPM device
+ * @param: tpm_data, the tpm phy.
+ * @return: 0 in case of success.
+ */
+int st33zp24_pm_resume(struct device *dev)
+{
+	struct tpm_chip *chip = dev_get_drvdata(dev);
+	struct st33zp24_dev *tpm_dev;
+	int ret = 0;
+
+	tpm_dev = (struct st33zp24_dev *)TPM_VPRIV(chip);
+
+	if (gpio_is_valid(tpm_dev->io_lpcpd)) {
+		gpio_set_value(tpm_dev->io_lpcpd, 1);
+		ret = wait_for_stat(chip,
+				TPM_STS_VALID, chip->vendor.timeout_b,
+				&chip->vendor.read_queue, false);
+	} else {
+		ret = tpm_pm_resume(dev);
+		if (!ret)
+			tpm_do_selftest(chip);
+	}
+	return ret;
+} /* st33zp24_pm_resume() */
+#endif
diff --git a/drivers/char/tpm/st33zp24/st33zp24.h b/drivers/char/tpm/st33zp24/st33zp24.h
new file mode 100644
index 0000000..14d1a2f
--- /dev/null
+++ b/drivers/char/tpm/st33zp24/st33zp24.h
@@ -0,0 +1,32 @@
+/*
+ * STMicroelectronics TPM Linux driver for TPM ST33ZP24
+ * Copyright (C) 2009 - 2015  STMicroelectronics
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef __ST33ZP24_H__
+#define __ST33ZP24_H__
+
+struct st33zp24_phy_ops {
+	int (*send)(void *dev_id, u8 tpm_register, u8 *tpm_data, int tpm_size);
+	int (*recv)(void *dev_id, u8 tpm_register, u8 *tpm_data, int tpm_size);
+};
+
+int st33zp24_pm_suspend(struct device *dev);
+int st33zp24_pm_resume(struct device *dev);
+
+int st33zp24_probe(void *phy_id, const struct st33zp24_phy_ops *ops,
+		   struct device *dev, int irq, int io_lpcpd);
+int st33zp24_remove(struct tpm_chip *chip);
+#endif /* __ST33ZP24_H__ */
diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
deleted file mode 100644
index eeb4816..0000000
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ /dev/null
@@ -1,915 +0,0 @@
-/*
- * STMicroelectronics TPM I2C Linux driver for TPM ST33ZP24
- * Copyright (C) 2009, 2010, 2014  STMicroelectronics
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, see <http://www.gnu.org/licenses/>.
- *
- * STMicroelectronics version 1.2.1, Copyright (C) 2014
- * STMicroelectronics comes with ABSOLUTELY NO WARRANTY.
- * This is free software, and you are welcome to redistribute it
- * under certain conditions.
- *
- * @Author: Christophe RICARD tpmsupport-qxv4g6HH51o@public.gmane.org
- *
- * @File: tpm_stm_st33_i2c.c
- *
- * @Synopsis:
- *	09/15/2010:	First shot driver tpm_tis driver for
- *			 lpc is used as model.
- */
-
-#include <linux/pci.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/i2c.h>
-#include <linux/fs.h>
-#include <linux/miscdevice.h>
-#include <linux/kernel.h>
-#include <linux/delay.h>
-#include <linux/wait.h>
-#include <linux/freezer.h>
-#include <linux/string.h>
-#include <linux/interrupt.h>
-#include <linux/sysfs.h>
-#include <linux/gpio.h>
-#include <linux/sched.h>
-#include <linux/uaccess.h>
-#include <linux/io.h>
-#include <linux/slab.h>
-#include <linux/of_irq.h>
-#include <linux/of_gpio.h>
-
-#include <linux/platform_data/tpm_stm_st33.h>
-#include "tpm.h"
-
-#define TPM_ACCESS			0x0
-#define TPM_STS				0x18
-#define TPM_HASH_END			0x20
-#define TPM_DATA_FIFO			0x24
-#define TPM_HASH_DATA			0x24
-#define TPM_HASH_START			0x28
-#define TPM_INTF_CAPABILITY		0x14
-#define TPM_INT_STATUS			0x10
-#define TPM_INT_ENABLE			0x08
-
-#define TPM_DUMMY_BYTE			0xAA
-#define TPM_WRITE_DIRECTION		0x80
-#define TPM_HEADER_SIZE			10
-#define TPM_BUFSIZE			2048
-
-#define LOCALITY0		0
-
-
-enum stm33zp24_access {
-	TPM_ACCESS_VALID = 0x80,
-	TPM_ACCESS_ACTIVE_LOCALITY = 0x20,
-	TPM_ACCESS_REQUEST_PENDING = 0x04,
-	TPM_ACCESS_REQUEST_USE = 0x02,
-};
-
-enum stm33zp24_status {
-	TPM_STS_VALID = 0x80,
-	TPM_STS_COMMAND_READY = 0x40,
-	TPM_STS_GO = 0x20,
-	TPM_STS_DATA_AVAIL = 0x10,
-	TPM_STS_DATA_EXPECT = 0x08,
-};
-
-enum stm33zp24_int_flags {
-	TPM_GLOBAL_INT_ENABLE = 0x80,
-	TPM_INTF_CMD_READY_INT = 0x080,
-	TPM_INTF_FIFO_AVALAIBLE_INT = 0x040,
-	TPM_INTF_WAKE_UP_READY_INT = 0x020,
-	TPM_INTF_LOCALITY_CHANGE_INT = 0x004,
-	TPM_INTF_STS_VALID_INT = 0x002,
-	TPM_INTF_DATA_AVAIL_INT = 0x001,
-};
-
-enum tis_defaults {
-	TIS_SHORT_TIMEOUT = 750,
-	TIS_LONG_TIMEOUT = 2000,
-};
-
-struct tpm_stm_dev {
-	struct i2c_client *client;
-	struct tpm_chip *chip;
-	u8 buf[TPM_BUFSIZE + 1];
-	u32 intrs;
-	int io_lpcpd;
-};
-
-/*
- * write8_reg
- * Send byte to the TIS register according to the ST33ZP24 I2C protocol.
- * @param: tpm_register, the tpm tis register where the data should be written
- * @param: tpm_data, the tpm_data to write inside the tpm_register
- * @param: tpm_size, The length of the data
- * @return: Returns negative errno, or else the number of bytes written.
- */
-static int write8_reg(struct tpm_stm_dev *tpm_dev, u8 tpm_register,
-		      u8 *tpm_data, u16 tpm_size)
-{
-	tpm_dev->buf[0] = tpm_register;
-	memcpy(tpm_dev->buf + 1, tpm_data, tpm_size);
-	return i2c_master_send(tpm_dev->client, tpm_dev->buf, tpm_size + 1);
-} /* write8_reg() */
-
-/*
- * read8_reg
- * Recv byte from the TIS register according to the ST33ZP24 I2C protocol.
- * @param: tpm_register, the tpm tis register where the data should be read
- * @param: tpm_data, the TPM response
- * @param: tpm_size, tpm TPM response size to read.
- * @return: number of byte read successfully: should be one if success.
- */
-static int read8_reg(struct tpm_stm_dev *tpm_dev, u8 tpm_register,
-		    u8 *tpm_data, int tpm_size)
-{
-	u8 status = 0;
-	u8 data;
-
-	data = TPM_DUMMY_BYTE;
-	status = write8_reg(tpm_dev, tpm_register, &data, 1);
-	if (status == 2)
-		status = i2c_master_recv(tpm_dev->client, tpm_data, tpm_size);
-	return status;
-} /* read8_reg() */
-
-/*
- * I2C_WRITE_DATA
- * Send byte to the TIS register according to the ST33ZP24 I2C protocol.
- * @param: tpm_dev, the chip description
- * @param: tpm_register, the tpm tis register where the data should be written
- * @param: tpm_data, the tpm_data to write inside the tpm_register
- * @param: tpm_size, The length of the data
- * @return: number of byte written successfully: should be one if success.
- */
-#define I2C_WRITE_DATA(tpm_dev, tpm_register, tpm_data, tpm_size) \
-	(write8_reg(tpm_dev, tpm_register | \
-	TPM_WRITE_DIRECTION, tpm_data, tpm_size))
-
-/*
- * I2C_READ_DATA
- * Recv byte from the TIS register according to the ST33ZP24 I2C protocol.
- * @param: tpm_dev, the chip description
- * @param: tpm_register, the tpm tis register where the data should be read
- * @param: tpm_data, the TPM response
- * @param: tpm_size, tpm TPM response size to read.
- * @return: number of byte read successfully: should be one if success.
- */
-#define I2C_READ_DATA(tpm_dev, tpm_register, tpm_data, tpm_size) \
-	(read8_reg(tpm_dev, tpm_register, tpm_data, tpm_size))
-
-/*
- * clear_interruption
- * clear the TPM interrupt register.
- * @param: tpm, the chip description
- * @return: the TPM_INT_STATUS value
- */
-static u8 clear_interruption(struct tpm_stm_dev *tpm_dev)
-{
-	u8 interrupt;
-
-	I2C_READ_DATA(tpm_dev, TPM_INT_STATUS, &interrupt, 1);
-	I2C_WRITE_DATA(tpm_dev, TPM_INT_STATUS, &interrupt, 1);
-	return interrupt;
-} /* clear_interruption() */
-
-/*
- * tpm_stm_i2c_cancel, cancel is not implemented.
- * @param: chip, the tpm_chip description as specified in driver/char/tpm/tpm.h
- */
-static void tpm_stm_i2c_cancel(struct tpm_chip *chip)
-{
-	struct tpm_stm_dev *tpm_dev;
-	u8 data;
-
-	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
-
-	data = TPM_STS_COMMAND_READY;
-	I2C_WRITE_DATA(tpm_dev, TPM_STS, &data, 1);
-} /* tpm_stm_i2c_cancel() */
-
-/*
- * tpm_stm_spi_status return the TPM_STS register
- * @param: chip, the tpm chip description
- * @return: the TPM_STS register value.
- */
-static u8 tpm_stm_i2c_status(struct tpm_chip *chip)
-{
-	struct tpm_stm_dev *tpm_dev;
-	u8 data;
-
-	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
-
-	I2C_READ_DATA(tpm_dev, TPM_STS, &data, 1);
-	return data;
-} /* tpm_stm_i2c_status() */
-
-
-/*
- * check_locality if the locality is active
- * @param: chip, the tpm chip description
- * @return: the active locality or -EACCESS.
- */
-static int check_locality(struct tpm_chip *chip)
-{
-	struct tpm_stm_dev *tpm_dev;
-	u8 data;
-	u8 status;
-
-	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
-
-	status = I2C_READ_DATA(tpm_dev, TPM_ACCESS, &data, 1);
-	if (status && (data &
-		(TPM_ACCESS_ACTIVE_LOCALITY | TPM_ACCESS_VALID)) ==
-		(TPM_ACCESS_ACTIVE_LOCALITY | TPM_ACCESS_VALID))
-		return chip->vendor.locality;
-
-	return -EACCES;
-} /* check_locality() */
-
-/*
- * request_locality request the TPM locality
- * @param: chip, the chip description
- * @return: the active locality or EACCESS.
- */
-static int request_locality(struct tpm_chip *chip)
-{
-	unsigned long stop;
-	long ret;
-	struct tpm_stm_dev *tpm_dev;
-	u8 data;
-
-	if (check_locality(chip) == chip->vendor.locality)
-		return chip->vendor.locality;
-
-	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
-
-	data = TPM_ACCESS_REQUEST_USE;
-	ret = I2C_WRITE_DATA(tpm_dev, TPM_ACCESS, &data, 1);
-	if (ret < 0)
-		goto end;
-
-	stop = jiffies + chip->vendor.timeout_a;
-
-	/* Request locality is usually effective after the request */
-	do {
-		if (check_locality(chip) >= 0)
-			return chip->vendor.locality;
-		msleep(TPM_TIMEOUT);
-	} while (time_before(jiffies, stop));
-	ret = -EACCES;
-end:
-	return ret;
-} /* request_locality() */
-
-/*
- * release_locality release the active locality
- * @param: chip, the tpm chip description.
- */
-static void release_locality(struct tpm_chip *chip)
-{
-	struct tpm_stm_dev *tpm_dev;
-	u8 data;
-
-	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
-	data = TPM_ACCESS_ACTIVE_LOCALITY;
-
-	I2C_WRITE_DATA(tpm_dev, TPM_ACCESS, &data, 1);
-}
-
-/*
- * get_burstcount return the burstcount address 0x19 0x1A
- * @param: chip, the chip description
- * return: the burstcount.
- */
-static int get_burstcount(struct tpm_chip *chip)
-{
-	unsigned long stop;
-	int burstcnt, status;
-	u8 tpm_reg, temp;
-	struct tpm_stm_dev *tpm_dev;
-
-	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
-
-	stop = jiffies + chip->vendor.timeout_d;
-	do {
-		tpm_reg = TPM_STS + 1;
-		status = I2C_READ_DATA(tpm_dev, tpm_reg, &temp, 1);
-		if (status < 0)
-			goto end;
-
-		tpm_reg = tpm_reg + 1;
-		burstcnt = temp;
-		status = I2C_READ_DATA(tpm_dev, tpm_reg, &temp, 1);
-		if (status < 0)
-			goto end;
-
-		burstcnt |= temp << 8;
-		if (burstcnt)
-			return burstcnt;
-		msleep(TPM_TIMEOUT);
-	} while (time_before(jiffies, stop));
-
-end:
-	return -EBUSY;
-} /* get_burstcount() */
-
-static bool wait_for_tpm_stat_cond(struct tpm_chip *chip, u8 mask,
-				bool check_cancel, bool *canceled)
-{
-	u8 status = chip->ops->status(chip);
-
-	*canceled = false;
-	if ((status & mask) == mask)
-		return true;
-	if (check_cancel && chip->ops->req_canceled(chip, status)) {
-		*canceled = true;
-		return true;
-	}
-	return false;
-}
-
-/*
- * interrupt_to_status
- * @param: irq_mask, the irq mask value to wait
- * @return: the corresponding tpm_sts value
- */
-static u8 interrupt_to_status(u8 irq_mask)
-{
-	u8 status = 0;
-
-	if ((irq_mask & TPM_INTF_STS_VALID_INT) == TPM_INTF_STS_VALID_INT)
-		status |= TPM_STS_VALID;
-	if ((irq_mask & TPM_INTF_DATA_AVAIL_INT) == TPM_INTF_DATA_AVAIL_INT)
-		status |= TPM_STS_DATA_AVAIL;
-	if ((irq_mask & TPM_INTF_CMD_READY_INT) == TPM_INTF_CMD_READY_INT)
-		status |= TPM_STS_COMMAND_READY;
-
-	return status;
-} /* status_to_interrupt() */
-
-/*
- * wait_for_stat wait for a TPM_STS value
- * @param: chip, the tpm chip description
- * @param: mask, the value mask to wait
- * @param: timeout, the timeout
- * @param: queue, the wait queue.
- * @param: check_cancel, does the command can be cancelled ?
- * @return: the tpm status, 0 if success, -ETIME if timeout is reached.
- */
-static int wait_for_stat(struct tpm_chip *chip, u8 mask, unsigned long timeout,
-			wait_queue_head_t *queue, bool check_cancel)
-{
-	unsigned long stop;
-	int ret;
-	bool canceled = false;
-	bool condition;
-	u32 cur_intrs;
-	u8 interrupt, status;
-	struct tpm_stm_dev *tpm_dev;
-
-	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
-
-	/* check current status */
-	status = tpm_stm_i2c_status(chip);
-	if ((status & mask) == mask)
-		return 0;
-
-	stop = jiffies + timeout;
-
-	if (chip->vendor.irq) {
-		cur_intrs = tpm_dev->intrs;
-		interrupt = clear_interruption(tpm_dev);
-		enable_irq(chip->vendor.irq);
-
-again:
-		timeout = stop - jiffies;
-		if ((long) timeout <= 0)
-			return -1;
-
-		ret = wait_event_interruptible_timeout(*queue,
-					cur_intrs != tpm_dev->intrs, timeout);
-
-		interrupt |= clear_interruption(tpm_dev);
-		status = interrupt_to_status(interrupt);
-		condition = wait_for_tpm_stat_cond(chip, mask,
-						   check_cancel, &canceled);
-
-		if (ret >= 0 && condition) {
-			if (canceled)
-				return -ECANCELED;
-			return 0;
-		}
-		if (ret == -ERESTARTSYS && freezing(current)) {
-			clear_thread_flag(TIF_SIGPENDING);
-			goto again;
-		}
-		disable_irq_nosync(chip->vendor.irq);
-
-	} else {
-		do {
-			msleep(TPM_TIMEOUT);
-			status = chip->ops->status(chip);
-			if ((status & mask) == mask)
-				return 0;
-		} while (time_before(jiffies, stop));
-	}
-
-	return -ETIME;
-} /* wait_for_stat() */
-
-/*
- * recv_data receive data
- * @param: chip, the tpm chip description
- * @param: buf, the buffer where the data are received
- * @param: count, the number of data to receive
- * @return: the number of bytes read from TPM FIFO.
- */
-static int recv_data(struct tpm_chip *chip, u8 *buf, size_t count)
-{
-	int size = 0, burstcnt, len, ret;
-	struct tpm_stm_dev *tpm_dev;
-
-	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
-
-	while (size < count &&
-	       wait_for_stat(chip,
-			     TPM_STS_DATA_AVAIL | TPM_STS_VALID,
-			     chip->vendor.timeout_c,
-			     &chip->vendor.read_queue, true) == 0) {
-		burstcnt = get_burstcount(chip);
-		if (burstcnt < 0)
-			return burstcnt;
-		len = min_t(int, burstcnt, count - size);
-		ret = I2C_READ_DATA(tpm_dev, TPM_DATA_FIFO, buf + size, len);
-		if (ret < 0)
-			return ret;
-
-		size += len;
-	}
-	return size;
-}
-
-/*
- * tpm_ioserirq_handler the serirq irq handler
- * @param: irq, the tpm chip description
- * @param: dev_id, the description of the chip
- * @return: the status of the handler.
- */
-static irqreturn_t tpm_ioserirq_handler(int irq, void *dev_id)
-{
-	struct tpm_chip *chip = dev_id;
-	struct tpm_stm_dev *tpm_dev;
-
-	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
-
-	tpm_dev->intrs++;
-	wake_up_interruptible(&chip->vendor.read_queue);
-	disable_irq_nosync(chip->vendor.irq);
-
-	return IRQ_HANDLED;
-} /* tpm_ioserirq_handler() */
-
-
-/*
- * tpm_stm_i2c_send send TPM commands through the I2C bus.
- *
- * @param: chip, the tpm_chip description as specified in driver/char/tpm/tpm.h
- * @param: buf,	the buffer to send.
- * @param: count, the number of bytes to send.
- * @return: In case of success the number of bytes sent.
- *			In other case, a < 0 value describing the issue.
- */
-static int tpm_stm_i2c_send(struct tpm_chip *chip, unsigned char *buf,
-			    size_t len)
-{
-	u32 status, i, size;
-	int burstcnt = 0;
-	int ret;
-	u8 data;
-	struct i2c_client *client;
-	struct tpm_stm_dev *tpm_dev;
-
-	if (!chip)
-		return -EBUSY;
-	if (len < TPM_HEADER_SIZE)
-		return -EBUSY;
-
-	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
-	client = tpm_dev->client;
-
-	client->flags = 0;
-
-	ret = request_locality(chip);
-	if (ret < 0)
-		return ret;
-
-	status = tpm_stm_i2c_status(chip);
-	if ((status & TPM_STS_COMMAND_READY) == 0) {
-		tpm_stm_i2c_cancel(chip);
-		if (wait_for_stat
-		    (chip, TPM_STS_COMMAND_READY, chip->vendor.timeout_b,
-		     &chip->vendor.read_queue, false) < 0) {
-			ret = -ETIME;
-			goto out_err;
-		}
-	}
-
-	for (i = 0; i < len - 1;) {
-		burstcnt = get_burstcount(chip);
-		if (burstcnt < 0)
-			return burstcnt;
-		size = min_t(int, len - i - 1, burstcnt);
-		ret = I2C_WRITE_DATA(tpm_dev, TPM_DATA_FIFO, buf + i, size);
-		if (ret < 0)
-			goto out_err;
-
-		i += size;
-	}
-
-	status = tpm_stm_i2c_status(chip);
-	if ((status & TPM_STS_DATA_EXPECT) == 0) {
-		ret = -EIO;
-		goto out_err;
-	}
-
-	ret = I2C_WRITE_DATA(tpm_dev, TPM_DATA_FIFO, buf + len - 1, 1);
-	if (ret < 0)
-		goto out_err;
-
-	status = tpm_stm_i2c_status(chip);
-	if ((status & TPM_STS_DATA_EXPECT) != 0) {
-		ret = -EIO;
-		goto out_err;
-	}
-
-	data = TPM_STS_GO;
-	I2C_WRITE_DATA(tpm_dev, TPM_STS, &data, 1);
-
-	return len;
-out_err:
-	tpm_stm_i2c_cancel(chip);
-	release_locality(chip);
-	return ret;
-}
-
-/*
- * tpm_stm_i2c_recv received TPM response through the I2C bus.
- * @param: chip, the tpm_chip description as specified in driver/char/tpm/tpm.h.
- * @param: buf,	the buffer to store datas.
- * @param: count, the number of bytes to send.
- * @return: In case of success the number of bytes received.
- *	    In other case, a < 0 value describing the issue.
- */
-static int tpm_stm_i2c_recv(struct tpm_chip *chip, unsigned char *buf,
-			    size_t count)
-{
-	int size = 0;
-	int expected;
-
-	if (!chip)
-		return -EBUSY;
-
-	if (count < TPM_HEADER_SIZE) {
-		size = -EIO;
-		goto out;
-	}
-
-	size = recv_data(chip, buf, TPM_HEADER_SIZE);
-	if (size < TPM_HEADER_SIZE) {
-		dev_err(chip->pdev, "Unable to read header\n");
-		goto out;
-	}
-
-	expected = be32_to_cpu(*(__be32 *)(buf + 2));
-	if (expected > count) {
-		size = -EIO;
-		goto out;
-	}
-
-	size += recv_data(chip, &buf[TPM_HEADER_SIZE],
-			expected - TPM_HEADER_SIZE);
-	if (size < expected) {
-		dev_err(chip->pdev, "Unable to read remainder of result\n");
-		size = -ETIME;
-		goto out;
-	}
-
-out:
-	chip->ops->cancel(chip);
-	release_locality(chip);
-	return size;
-}
-
-static bool tpm_stm_i2c_req_canceled(struct tpm_chip *chip, u8 status)
-{
-	return (status == TPM_STS_COMMAND_READY);
-}
-
-static const struct tpm_class_ops st_i2c_tpm = {
-	.send = tpm_stm_i2c_send,
-	.recv = tpm_stm_i2c_recv,
-	.cancel = tpm_stm_i2c_cancel,
-	.status = tpm_stm_i2c_status,
-	.req_complete_mask = TPM_STS_DATA_AVAIL | TPM_STS_VALID,
-	.req_complete_val = TPM_STS_DATA_AVAIL | TPM_STS_VALID,
-	.req_canceled = tpm_stm_i2c_req_canceled,
-};
-
-#ifdef CONFIG_OF
-static int tpm_stm_i2c_of_request_resources(struct tpm_chip *chip)
-{
-	struct device_node *pp;
-	struct tpm_stm_dev *tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
-	struct i2c_client *client = tpm_dev->client;
-	int gpio;
-	int ret;
-
-	pp = client->dev.of_node;
-	if (!pp) {
-		dev_err(chip->pdev, "No platform data\n");
-		return -ENODEV;
-	}
-
-	/* Get GPIO from device tree */
-	gpio = of_get_named_gpio(pp, "lpcpd-gpios", 0);
-	if (gpio < 0) {
-		dev_err(chip->pdev, "Failed to retrieve lpcpd-gpios from dts.\n");
-		tpm_dev->io_lpcpd = -1;
-		/*
-		 * lpcpd pin is not specified. This is not an issue as
-		 * power management can be also managed by TPM specific
-		 * commands. So leave with a success status code.
-		 */
-		return 0;
-	}
-	/* GPIO request and configuration */
-	ret = devm_gpio_request_one(&client->dev, gpio,
-			GPIOF_OUT_INIT_HIGH, "TPM IO LPCPD");
-	if (ret) {
-		dev_err(chip->pdev, "Failed to request lpcpd pin\n");
-		return -ENODEV;
-	}
-	tpm_dev->io_lpcpd = gpio;
-
-	return 0;
-}
-#else
-static int tpm_stm_i2c_of_request_resources(struct tpm_chip *chip)
-{
-	return -ENODEV;
-}
-#endif
-
-static int tpm_stm_i2c_request_resources(struct i2c_client *client,
-					 struct tpm_chip *chip)
-{
-	struct st33zp24_platform_data *pdata;
-	struct tpm_stm_dev *tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
-	int ret;
-
-	pdata = client->dev.platform_data;
-	if (!pdata) {
-		dev_err(chip->pdev, "No platform data\n");
-		return -ENODEV;
-	}
-
-	/* store for late use */
-	tpm_dev->io_lpcpd = pdata->io_lpcpd;
-
-	if (gpio_is_valid(pdata->io_lpcpd)) {
-		ret = devm_gpio_request_one(&client->dev,
-				pdata->io_lpcpd, GPIOF_OUT_INIT_HIGH,
-				"TPM IO_LPCPD");
-		if (ret) {
-			dev_err(chip->pdev, "%s : reset gpio_request failed\n",
-				__FILE__);
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
-/*
- * tpm_stm_i2c_probe initialize the TPM device
- * @param: client, the i2c_client drescription (TPM I2C description).
- * @param: id, the i2c_device_id struct.
- * @return: 0 in case of success.
- *	 -1 in other case.
- */
-static int
-tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
-{
-	int ret;
-	u8 intmask = 0;
-	struct tpm_chip *chip;
-	struct st33zp24_platform_data *platform_data;
-	struct tpm_stm_dev *tpm_dev;
-
-	if (!client) {
-		pr_info("%s: i2c client is NULL. Device not accessible.\n",
-			__func__);
-		return -ENODEV;
-	}
-
-	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
-		dev_info(&client->dev, "client not i2c capable\n");
-		return -ENODEV;
-	}
-
-	tpm_dev = devm_kzalloc(&client->dev, sizeof(struct tpm_stm_dev),
-			       GFP_KERNEL);
-	if (!tpm_dev)
-		return -ENOMEM;
-
-	chip = tpmm_chip_alloc(&client->dev, &st_i2c_tpm);
-	if (IS_ERR(chip))
-		return PTR_ERR(chip);
-
-	TPM_VPRIV(chip) = tpm_dev;
-	tpm_dev->client = client;
-
-	platform_data = client->dev.platform_data;
-	if (!platform_data && client->dev.of_node) {
-		ret = tpm_stm_i2c_of_request_resources(chip);
-		if (ret)
-			goto _tpm_clean_answer;
-	} else if (platform_data) {
-		ret = tpm_stm_i2c_request_resources(client, chip);
-		if (ret)
-			goto _tpm_clean_answer;
-	}
-
-	chip->vendor.timeout_a = msecs_to_jiffies(TIS_SHORT_TIMEOUT);
-	chip->vendor.timeout_b = msecs_to_jiffies(TIS_LONG_TIMEOUT);
-	chip->vendor.timeout_c = msecs_to_jiffies(TIS_SHORT_TIMEOUT);
-	chip->vendor.timeout_d = msecs_to_jiffies(TIS_SHORT_TIMEOUT);
-
-	chip->vendor.locality = LOCALITY0;
-
-	if (client->irq) {
-		/* INTERRUPT Setup */
-		init_waitqueue_head(&chip->vendor.read_queue);
-		tpm_dev->intrs = 0;
-
-		if (request_locality(chip) != LOCALITY0) {
-			ret = -ENODEV;
-			goto _tpm_clean_answer;
-		}
-
-		clear_interruption(tpm_dev);
-		ret = devm_request_irq(&client->dev, client->irq,
-				tpm_ioserirq_handler,
-				IRQF_TRIGGER_HIGH,
-				"TPM SERIRQ management", chip);
-		if (ret < 0) {
-			dev_err(chip->pdev , "TPM SERIRQ signals %d not available\n",
-				client->irq);
-			goto _tpm_clean_answer;
-		}
-
-		intmask |= TPM_INTF_CMD_READY_INT
-			|  TPM_INTF_STS_VALID_INT
-			|  TPM_INTF_DATA_AVAIL_INT;
-
-		ret = I2C_WRITE_DATA(tpm_dev, TPM_INT_ENABLE, &intmask, 1);
-		if (ret < 0)
-			goto _tpm_clean_answer;
-
-		intmask = TPM_GLOBAL_INT_ENABLE;
-		ret = I2C_WRITE_DATA(tpm_dev, (TPM_INT_ENABLE + 3),
-				     &intmask, 1);
-		if (ret < 0)
-			goto _tpm_clean_answer;
-
-		chip->vendor.irq = client->irq;
-
-		disable_irq_nosync(chip->vendor.irq);
-
-		tpm_gen_interrupt(chip);
-	}
-
-	tpm_get_timeouts(chip);
-	tpm_do_selftest(chip);
-
-	return tpm_chip_register(chip);
-_tpm_clean_answer:
-	dev_info(chip->pdev, "TPM I2C initialisation fail\n");
-	return ret;
-}
-
-/*
- * tpm_stm_i2c_remove remove the TPM device
- * @param: client, the i2c_client description (TPM I2C description).
- * @return: 0 in case of success.
- */
-static int tpm_stm_i2c_remove(struct i2c_client *client)
-{
-	struct tpm_chip *chip =
-		(struct tpm_chip *) i2c_get_clientdata(client);
-
-	if (chip)
-		tpm_chip_unregister(chip);
-
-	return 0;
-}
-
-#ifdef CONFIG_PM_SLEEP
-/*
- * tpm_stm_i2c_pm_suspend suspend the TPM device
- * @param: client, the i2c_client drescription (TPM I2C description).
- * @param: mesg, the power management message.
- * @return: 0 in case of success.
- */
-static int tpm_stm_i2c_pm_suspend(struct device *dev)
-{
-	struct tpm_chip *chip = dev_get_drvdata(dev);
-	struct tpm_stm_dev *tpm_dev;
-	int ret = 0;
-
-	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
-
-	if (gpio_is_valid(tpm_dev->io_lpcpd))
-		gpio_set_value(tpm_dev->io_lpcpd, 0);
-	else
-		ret = tpm_pm_suspend(dev);
-
-	return ret;
-} /* tpm_stm_i2c_suspend() */
-
-/*
- * tpm_stm_i2c_pm_resume resume the TPM device
- * @param: client, the i2c_client drescription (TPM I2C description).
- * @return: 0 in case of success.
- */
-static int tpm_stm_i2c_pm_resume(struct device *dev)
-{
-	struct tpm_chip *chip = dev_get_drvdata(dev);
-	struct tpm_stm_dev *tpm_dev;
-	int ret = 0;
-
-	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
-
-	if (gpio_is_valid(pin_infos->io_lpcpd)) {
-		gpio_set_value(tpm_dev->io_lpcpd, 1);
-		ret = wait_for_stat(chip,
-				TPM_STS_VALID, chip->vendor.timeout_b,
-				&chip->vendor.read_queue, false);
-	} else {
-		ret = tpm_pm_resume(dev);
-		if (!ret)
-			tpm_do_selftest(chip);
-	}
-	return ret;
-} /* tpm_stm_i2c_pm_resume() */
-#endif
-
-static const struct i2c_device_id tpm_stm_i2c_id[] = {
-	{TPM_ST33_I2C, 0},
-	{}
-};
-MODULE_DEVICE_TABLE(i2c, tpm_stm_i2c_id);
-
-#ifdef CONFIG_OF
-static const struct of_device_id of_st33zp24_i2c_match[] = {
-	{ .compatible = "st,st33zp24-i2c", },
-	{}
-};
-MODULE_DEVICE_TABLE(of, of_st33zp24_i2c_match);
-#endif
-
-static SIMPLE_DEV_PM_OPS(tpm_stm_i2c_ops, tpm_stm_i2c_pm_suspend,
-			 tpm_stm_i2c_pm_resume);
-
-static struct i2c_driver tpm_stm_i2c_driver = {
-	.driver = {
-		.owner = THIS_MODULE,
-		.name = TPM_ST33_I2C,
-		.pm = &tpm_stm_i2c_ops,
-		.of_match_table = of_match_ptr(of_st33zp24_i2c_match),
-	},
-	.probe = tpm_stm_i2c_probe,
-	.remove = tpm_stm_i2c_remove,
-	.id_table = tpm_stm_i2c_id
-};
-
-module_i2c_driver(tpm_stm_i2c_driver);
-
-MODULE_AUTHOR("Christophe Ricard (tpmsupport-qxv4g6HH51o@public.gmane.org)");
-MODULE_DESCRIPTION("STM TPM I2C ST33 Driver");
-MODULE_VERSION("1.2.1");
-MODULE_LICENSE("GPL");
diff --git a/include/linux/platform_data/st33zp24.h b/include/linux/platform_data/st33zp24.h
new file mode 100644
index 0000000..031aa8b
--- /dev/null
+++ b/include/linux/platform_data/st33zp24.h
@@ -0,0 +1,28 @@
+/*
+ * STMicroelectronics TPM Linux driver for TPM 1.2 ST33ZP24
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
+#ifndef __STM_ST33_TPM_H__
+#define __STM_ST33_TPM_H__
+
+#define TPM_ST33_I2C			"st33zp24-i2c"
+#define TPM_ST33_SPI			"st33zp24-spi"
+
+struct st33zp24_platform_data {
+	int io_lpcpd;
+};
+
+#endif /* __STM_ST33_TPM_H__ */
diff --git a/include/linux/platform_data/tpm_stm_st33.h b/include/linux/platform_data/tpm_stm_st33.h
deleted file mode 100644
index ff75310..0000000
--- a/include/linux/platform_data/tpm_stm_st33.h
+++ /dev/null
@@ -1,39 +0,0 @@
-/*
- * STMicroelectronics TPM I2C Linux driver for TPM ST33ZP24
- * Copyright (C) 2009, 2010  STMicroelectronics
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, see <http://www.gnu.org/licenses/>.
- *
- * STMicroelectronics version 1.2.0, Copyright (C) 2010
- * STMicroelectronics comes with ABSOLUTELY NO WARRANTY.
- * This is free software, and you are welcome to redistribute it
- * under certain conditions.
- *
- * @Author: Christophe RICARD tpmsupport-qxv4g6HH51o@public.gmane.org
- *
- * @File: stm_st33_tpm.h
- *
- * @Date: 09/15/2010
- */
-#ifndef __STM_ST33_TPM_H__
-#define __STM_ST33_TPM_H__
-
-#define TPM_ST33_I2C			"st33zp24-i2c"
-#define TPM_ST33_SPI			"st33zp24-spi"
-
-struct st33zp24_platform_data {
-	int io_lpcpd;
-};
-
-#endif /* __STM_ST33_TPM_H__ */
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
