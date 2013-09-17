From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: [PATCH v2] tpm: Add support for Atmel I2C TPMs
Date: Tue, 17 Sep 2013 17:40:59 -0600
Message-ID: <20130917234059.GB345@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter H?we <PeterHuewe-Mmb7MZpHnFY@public.gmane.org>
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Teddy Reed <teddy-KaFzXBG2u9Ng9hUCZPvPmw@public.gmane.org>, Teddy Reed <teddy.reed-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Leonidas Da Silva Barbosa <leosilva-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Ashley Lai <ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org>, Rajiv Andrade <mail-ZlhrYzitvtWsTnJN9+BGXg@public.gmane.org>, Peter Huewe <peter.huewe-d0qZbvYSIPpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is based on the work of Teddy Reed <teddy-KaFzXBG2u9Ng9hUCZPvPmw@public.gmane.org> published
on GitHub:
 https://github.com/theopolis/tpm-i2c-atmel.git
 34894b988b67e0ae55088d6388e77b0dbf10c07d

That driver was never merged, I have taken it as a starting port,
forward ported, tested and revised the driver:
 - Make it broadly textually similar to the Infineon and Nuvoton I2C
   driver
 - Place everything in a format suitable for mainline inclusion
 - Use high level I2C functions i2c_smbus_write_i2c_block_data and
   i2c_master_recv for data xfer
 - Use the timeout system from the core code, by faking out a status
   register
 - checkpatch cleanups
 - Testing on ARM Kirkwood, with this device tree, using a
   AT97SC3204T-X1A180
        tpm@29 {
                compatible = "atmel,at97sc3204t";
                reg = <0x29>;
        };

PENDING: Teddy will need to provide a public Signed-Off line for this
driver, although very little of his original text remained unchanged,
the work to discover the protocol is entirely his and he will need to
certify the Developer Certification of Origin that it is suitable for
mainline inclusion.

[jgg: revised and tested]
Signed-off-by: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
---
 .../devicetree/bindings/i2c/trivial-devices.txt    |   1 +
 drivers/char/tpm/Kconfig                           |   9 +
 drivers/char/tpm/Makefile                          |   1 +
 drivers/char/tpm/tpm_i2c_atmel.c                   | 285 +++++++++++++++++++++
 4 files changed, 296 insertions(+)
 create mode 100644 drivers/char/tpm/tpm_i2c_atmel.c

v2 changes:
 - Fix outgoing xfers of > 64 bytes by not using smbus
 - Greatly improve performance of incoming xfers by making the
   transfer be done in two stages. Testing shows that the chip
   retains the last reply and multiple reads are OK.
 - Rebase to v3.12-rc1
 - Testing on v3.12-rc1 on ARM kirkwood

diff --git a/Documentation/devicetree/bindings/i2c/trivial-devices.txt b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
index c389465..de6ceb5 100644
--- a/Documentation/devicetree/bindings/i2c/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
@@ -15,6 +15,7 @@ adi,adt7461		+/-1C TDM Extended Temp Range I.C
 adt7461			+/-1C TDM Extended Temp Range I.C
 at,24c08		i2c serial eeprom  (24cxx)
 atmel,24c02		i2c serial eeprom  (24cxx)
+atmel,at97sc3204t       i2c trusted platform module (TPM)
 catalyst,24c32		i2c serial eeprom
 dallas,ds1307		64 x 8, Serial, I2C Real-Time Clock
 dallas,ds1338		I2C RTC with 56-Byte NV RAM
diff --git a/drivers/char/tpm/Kconfig b/drivers/char/tpm/Kconfig
index 1512f39..690433b 100644
--- a/drivers/char/tpm/Kconfig
+++ b/drivers/char/tpm/Kconfig
@@ -33,6 +33,15 @@ config TCG_TIS
 	  from within Linux.  To compile this driver as a module, choose
 	  M here; the module will be called tpm_tis.
 
+config TCG_TIS_I2C_ATMEL
+	tristate "TPM Interface Specification 1.2 Interface (I2C - Atmel)"
+	depends on I2C
+	---help---
+	  If you have an Atmel I2C TPM security chip say Yes and it will be
+          accessible from within Linux.
+          To compile this driver as a module, choose M here; the module will
+	  be called tpm_tis_i2c_atmel.
+
 config TCG_TIS_I2C_INFINEON
 	tristate "TPM Interface Specification 1.2 Interface (I2C - Infineon)"
 	depends on I2C
diff --git a/drivers/char/tpm/Makefile b/drivers/char/tpm/Makefile
index 4e14079..7a570d6 100644
--- a/drivers/char/tpm/Makefile
+++ b/drivers/char/tpm/Makefile
@@ -12,6 +12,7 @@ ifdef CONFIG_TCG_IBMVTPM
 endif
 endif
 obj-$(CONFIG_TCG_TIS) += tpm_tis.o
+obj-$(CONFIG_TCG_TIS_I2C_ATMEL) += tpm_i2c_atmel.o
 obj-$(CONFIG_TCG_TIS_I2C_INFINEON) += tpm_i2c_infineon.o
 obj-$(CONFIG_TCG_TIS_I2C_NUVOTON) += tpm_i2c_nuvoton.o
 obj-$(CONFIG_TCG_NSC) += tpm_nsc.o
diff --git a/drivers/char/tpm/tpm_i2c_atmel.c b/drivers/char/tpm/tpm_i2c_atmel.c
new file mode 100644
index 0000000..692c201
--- /dev/null
+++ b/drivers/char/tpm/tpm_i2c_atmel.c
@@ -0,0 +1,285 @@
+/*
+ * ATMEL I2C TPM AT97SC3204T
+ *
+ * Copyright (C) 2012 V Lab Technologies
+ *  Teddy Reed <teddy-KaFzXBG2u9Ng9hUCZPvPmw@public.gmane.org>
+ * Copyright (C) 2013, Obsidian Research Corp.
+ *  Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
+ * Device driver for ATMEL I2C TPMs.
+ *
+ * Teddy Reed determined the basic I2C command flow, unlike other I2C TPM
+ * devices the raw TCG formatted TPM command data is written via I2C and then
+ * raw TCG formatted TPM command data is returned via I2C.
+ *
+ * TGC status/locality/etc functions seen in the LPC implementation do not
+ * seem to be present.
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see http://www.gnu.org/licenses/>.
+ */
+#define DEBUG
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/slab.h>
+#include <linux/i2c.h>
+#include "tpm.h"
+
+#define I2C_DRIVER_NAME "tpm_i2c_atmel"
+
+#define TPM_I2C_SHORT_TIMEOUT  750     /* ms */
+#define TPM_I2C_LONG_TIMEOUT   2000    /* 2 sec */
+
+#define ATMEL_STS_OK 1
+
+struct priv_data {
+	size_t len;
+	/* This is the amount we read on the first try. 25 was chosen to fit a
+	 * fair number of read responses in the buffer so a 2nd retry can be
+	 * avoided in small message cases. */
+	u8 buffer[sizeof(struct tpm_output_header) + 25];
+};
+
+static int i2c_atmel_send(struct tpm_chip *chip, u8 *buf, size_t len)
+{
+	struct priv_data *priv = chip->vendor.priv;
+	struct i2c_client *client = to_i2c_client(chip->dev);
+	s32 status;
+
+	priv->len = 0;
+
+	if (len <= 2)
+		return -EIO;
+
+	status = i2c_master_send(client, buf, len);
+
+	dev_dbg(chip->dev,
+		"%s(buf=%*ph len=%0zx) -> sts=%d\n", __func__,
+		(int)min_t(size_t, 64, len), buf, len, status);
+	return status;
+}
+
+static int i2c_atmel_recv(struct tpm_chip *chip, u8 *buf, size_t count)
+{
+	struct priv_data *priv = chip->vendor.priv;
+	struct i2c_client *client = to_i2c_client(chip->dev);
+	struct tpm_output_header *hdr =
+		(struct tpm_output_header *)priv->buffer;
+	unsigned int expected_len;
+	int rc;
+
+	if (priv->len == 0)
+		return -EIO;
+
+	/* Get the message size from the message header, if we didn't get the
+	 * whole message in read_status then we need to re-read the
+	 * message. */
+	expected_len = be32_to_cpu(hdr->length);
+	if (expected_len > count)
+		return -ENOMEM;
+
+	if (priv->len >= expected_len) {
+		dev_dbg(chip->dev,
+			"%s early(buf=%*ph count=%0zx) -> ret=%zd\n", __func__,
+			(int)min_t(size_t, 64, expected_len), buf, count,
+			expected_len);
+		memcpy(buf, priv->buffer, expected_len);
+		return expected_len;
+	}
+
+	rc = i2c_master_recv(client, buf, expected_len);
+	dev_dbg(chip->dev,
+		"%s reread(buf=%*ph count=%0zx) -> ret=%zd\n", __func__,
+		(int)min_t(size_t, 64, expected_len), buf, count,
+		expected_len);
+	return rc;
+}
+
+static void i2c_atmel_cancel(struct tpm_chip *chip)
+{
+	dev_err(chip->dev, "TPM operation cancellation was requested, but is not supported");
+}
+
+static u8 i2c_atmel_read_status(struct tpm_chip *chip)
+{
+	struct priv_data *priv = chip->vendor.priv;
+	struct i2c_client *client = to_i2c_client(chip->dev);
+	int rc;
+
+	/* The TPM fails the I2C read until it is ready, so we do the entire
+	 * transfer here and buffer it locally. This way the common code can
+	 * properly handle the timeouts. */
+	priv->len = 0;
+	memset(priv->buffer, 0, sizeof(priv->buffer));
+
+
+	/* Once the TPM has completed the command the command remains readable
+	 * until another command is issued. */
+	rc = i2c_master_recv(client, priv->buffer, sizeof(priv->buffer));
+	dev_dbg(chip->dev,
+		"%s: sts=%d", __func__, rc);
+	if (rc <= 0)
+		return 0;
+
+	priv->len = rc;
+
+	return ATMEL_STS_OK;
+}
+
+static const struct file_operations i2c_atmel_ops = {
+	.owner = THIS_MODULE,
+	.llseek = no_llseek,
+	.open = tpm_open,
+	.read = tpm_read,
+	.write = tpm_write,
+	.release = tpm_release,
+};
+
+static DEVICE_ATTR(pubek, S_IRUGO, tpm_show_pubek, NULL);
+static DEVICE_ATTR(pcrs, S_IRUGO, tpm_show_pcrs, NULL);
+static DEVICE_ATTR(enabled, S_IRUGO, tpm_show_enabled, NULL);
+static DEVICE_ATTR(active, S_IRUGO, tpm_show_active, NULL);
+static DEVICE_ATTR(owned, S_IRUGO, tpm_show_owned, NULL);
+static DEVICE_ATTR(temp_deactivated, S_IRUGO, tpm_show_temp_deactivated, NULL);
+static DEVICE_ATTR(caps, S_IRUGO, tpm_show_caps_1_2, NULL);
+static DEVICE_ATTR(cancel, S_IWUSR | S_IWGRP, NULL, tpm_store_cancel);
+static DEVICE_ATTR(durations, S_IRUGO, tpm_show_durations, NULL);
+static DEVICE_ATTR(timeouts, S_IRUGO, tpm_show_timeouts, NULL);
+
+static struct attribute *i2c_atmel_attrs[] = {
+	&dev_attr_pubek.attr,
+	&dev_attr_pcrs.attr,
+	&dev_attr_enabled.attr,
+	&dev_attr_active.attr,
+	&dev_attr_owned.attr,
+	&dev_attr_temp_deactivated.attr,
+	&dev_attr_caps.attr,
+	&dev_attr_cancel.attr,
+	&dev_attr_durations.attr,
+	&dev_attr_timeouts.attr,
+	NULL,
+};
+
+static struct attribute_group i2c_atmel_attr_grp = {
+	.attrs = i2c_atmel_attrs
+};
+
+static bool i2c_atmel_req_canceled(struct tpm_chip *chip, u8 status)
+{
+	return 0;
+}
+
+static const struct tpm_vendor_specific i2c_atmel = {
+	.status = i2c_atmel_read_status,
+	.recv = i2c_atmel_recv,
+	.send = i2c_atmel_send,
+	.cancel = i2c_atmel_cancel,
+	.req_complete_mask = ATMEL_STS_OK,
+	.req_complete_val = ATMEL_STS_OK,
+	.req_canceled = i2c_atmel_req_canceled,
+	.attr_group = &i2c_atmel_attr_grp,
+	.miscdev.fops = &i2c_atmel_ops,
+};
+
+static int i2c_atmel_probe(struct i2c_client *client,
+			   const struct i2c_device_id *id)
+{
+	int rc;
+	struct tpm_chip *chip;
+	struct device *dev = &client->dev;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+		return -ENODEV;
+
+	chip = tpm_register_hardware(dev, &i2c_atmel);
+	if (!chip) {
+		dev_err(dev, "%s() error in tpm_register_hardware\n", __func__);
+		return -ENODEV;
+	}
+
+	chip->vendor.priv = devm_kzalloc(dev, sizeof(struct priv_data),
+					 GFP_KERNEL);
+
+	/* Default timeouts */
+	chip->vendor.timeout_a = msecs_to_jiffies(TPM_I2C_SHORT_TIMEOUT);
+	chip->vendor.timeout_b = msecs_to_jiffies(TPM_I2C_LONG_TIMEOUT);
+	chip->vendor.timeout_c = msecs_to_jiffies(TPM_I2C_SHORT_TIMEOUT);
+	chip->vendor.timeout_d = msecs_to_jiffies(TPM_I2C_SHORT_TIMEOUT);
+	chip->vendor.irq = 0;
+
+	/* There is no known way to probe for this device, and all version
+	 * information seems to be read via TPM commands. Thus we rely on the
+	 * TPM startup process in the common code to detect the device. */
+	if (tpm_get_timeouts(chip)) {
+		rc = -ENODEV;
+		goto out_err;
+	}
+
+	if (tpm_do_selftest(chip)) {
+		rc = -ENODEV;
+		goto out_err;
+	}
+
+	return 0;
+
+out_err:
+	tpm_dev_vendor_release(chip);
+	tpm_remove_hardware(chip->dev);
+	return rc;
+}
+
+static int i2c_atmel_remove(struct i2c_client *client)
+{
+	struct device *dev = &(client->dev);
+	struct tpm_chip *chip = dev_get_drvdata(dev);
+
+	if (chip)
+		tpm_dev_vendor_release(chip);
+	tpm_remove_hardware(dev);
+	kfree(chip);
+	return 0;
+}
+
+static const struct i2c_device_id i2c_atmel_id[] = {
+	{I2C_DRIVER_NAME, 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, i2c_atmel_id);
+
+#ifdef CONFIG_OF
+static const struct of_device_id i2c_atmel_of_match[] = {
+	{.compatible = "atmel,at97sc3204t"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, i2c_atmel_of_match);
+#endif
+
+static SIMPLE_DEV_PM_OPS(i2c_atmel_pm_ops, tpm_pm_suspend, tpm_pm_resume);
+
+static struct i2c_driver i2c_atmel_driver = {
+	.id_table = i2c_atmel_id,
+	.probe = i2c_atmel_probe,
+	.remove = i2c_atmel_remove,
+	.driver = {
+		.name = I2C_DRIVER_NAME,
+		.owner = THIS_MODULE,
+		.pm = &i2c_atmel_pm_ops,
+		.of_match_table = of_match_ptr(i2c_atmel_of_match),
+	},
+};
+
+module_i2c_driver(i2c_atmel_driver);
+
+MODULE_AUTHOR("Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>");
+MODULE_DESCRIPTION("Atmel TPM I2C Driver");
+MODULE_LICENSE("GPL");
-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
