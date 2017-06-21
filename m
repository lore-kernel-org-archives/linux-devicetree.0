From: Eddie James <eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH linux 3/4] drivers/fsi: Add On-Chip Controller (OCC) driver
Date: Wed, 21 Jun 2017 14:38:00 -0500
Message-ID: <1498073881-3207-4-git-send-email-eajames@linux.vnet.ibm.com>
References: <1498073881-3207-1-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1498073881-3207-1-git-send-email-eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, bradleyb-r5pk2Da7Bxt8sGd51Jp2sdBPR1lH4CV8@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>

The OCC is a device embedded on a POWER processor that collects and
aggregates sensor data from the processor and system. The OCC can
provide the raw sensor data as well as perform thermal and power
management on the system.

This driver provides an atomic communications channel between a service
processor (e.g. a BMC) and the OCC. The driver is dependent on the FSI
SBEFIFO driver to get hardware access through the SBE to the OCC SRAM.
Commands are issued to the SBE to send or fetch data to the SRAM.

The format of communications to the OCC is writing a command to SRAM,
followed by a sending a "doorbell" or attention to the OCC, followed by
reading the response from OCC. All of this takes place atomically so
that multiple users don't collide in the SRAM.

Signed-off-by: Edward A. James <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/fsi/ibm,p9-occ.txt         |  15 +
 drivers/fsi/Kconfig                                |  10 +
 drivers/fsi/Makefile                               |   1 +
 drivers/fsi/occ.c                                  | 692 +++++++++++++++++++++
 4 files changed, 718 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
 create mode 100644 drivers/fsi/occ.c

diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
new file mode 100644
index 0000000..88002b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
@@ -0,0 +1,15 @@
+Device-tree bindings for FSI-based On-Chip Controller driver
+------------------------------------------------------------
+
+Required properties:
+ - compatible = "ibm,p9-occ";
+
+Optional properties:
+ - reg = <processor index>;	: index for the processor this OCC device is on
+
+Examples:
+
+    occ@1 {
+        compatible = "ibm,p9-occ";
+        reg = <1>;
+    };
diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
index 8c4d903..9d59276 100644
--- a/drivers/fsi/Kconfig
+++ b/drivers/fsi/Kconfig
@@ -40,6 +40,16 @@ config FSI_SBEFIFO
 	a pipe-like FSI device for communicating with the self boot engine
 	(SBE) on POWER processors.
 
+config OCCFIFO
+	tristate "OCC SBEFIFO client device driver"
+	depends on FSI_SBEFIFO
+	---help---
+	This option enables an SBEFIFO based On-Chip Controller (OCC) device
+	driver. The OCC is a device embedded on a POWER processor that collects
+	and aggregates sensor data from the processor and system. The OCC can
+	provide the raw sensor data as well as perform thermal and power
+	management on the system.
+
 endif
 
 endmenu
diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
index 851182e..7f5ca61 100644
--- a/drivers/fsi/Makefile
+++ b/drivers/fsi/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_FSI_MASTER_HUB) += fsi-master-hub.o
 obj-$(CONFIG_FSI_MASTER_GPIO) += fsi-master-gpio.o
 obj-$(CONFIG_FSI_SCOM) += fsi-scom.o
 obj-$(CONFIG_FSI_SBEFIFO) += fsi-sbefifo.o
+obj-$(CONFIG_OCCFIFO) += occ.o
diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
new file mode 100644
index 0000000..a1e6e9b
--- /dev/null
+++ b/drivers/fsi/occ.c
@@ -0,0 +1,692 @@
+/*
+ * Copyright 2017 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <asm/unaligned.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/fsi-sbefifo.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+#include <linux/wait.h>
+#include <linux/workqueue.h>
+
+#define OCC_SRAM_BYTES		4096
+#define OCC_CMD_DATA_BYTES	4090
+#define OCC_RESP_DATA_BYTES	4089
+
+struct occ {
+	struct device *sbefifo;
+	char name[32];
+	int idx;
+	struct miscdevice mdev;
+	struct list_head xfrs;
+	spinlock_t list_lock;
+	struct mutex occ_lock;
+	struct work_struct work;
+};
+
+#define to_occ(x)	container_of((x), struct occ, mdev)
+
+struct occ_command {
+	u8 seq_no;
+	u8 cmd_type;
+	u16 data_length;
+	u8 data[OCC_CMD_DATA_BYTES];
+	u16 checksum;
+} __packed;
+
+struct occ_response {
+	u8 seq_no;
+	u8 cmd_type;
+	u8 return_status;
+	u16 data_length;
+	u8 data[OCC_RESP_DATA_BYTES];
+	u16 checksum;
+} __packed;
+
+/*
+ * transfer flags are NOT mutually exclusive
+ *
+ * Initial flags are none; transfer is created and queued from write(). All
+ *  flags are cleared when the transfer is completed by closing the file or
+ *  reading all of the available response data.
+ * XFR_IN_PROGRESS is set when a transfer is started from occ_worker_putsram,
+ *  and cleared if the transfer fails or occ_worker_getsram completes.
+ * XFR_COMPLETE is set when a transfer fails or finishes occ_worker_getsram.
+ * XFR_CANCELED is set when the transfer's client is released.
+ * XFR_WAITING is set from read() if the transfer isn't complete and
+ *  O_NONBLOCK wasn't specified. Cleared in read() when transfer completes or
+ *  fails.
+ */
+enum {
+	XFR_IN_PROGRESS,
+	XFR_COMPLETE,
+	XFR_CANCELED,
+	XFR_WAITING,
+};
+
+struct occ_xfr {
+	struct list_head link;
+	int rc;
+	u8 buf[OCC_SRAM_BYTES];
+	size_t cmd_data_length;
+	size_t resp_data_length;
+	unsigned long flags;
+};
+
+/*
+ * client flags
+ *
+ * CLIENT_NONBLOCKING is set during open() if the file was opened with the
+ *  O_NONBLOCK flag.
+ * CLIENT_XFR_PENDING is set during write() and cleared when all data has been
+ *  read.
+ */
+enum {
+	CLIENT_NONBLOCKING,
+	CLIENT_XFR_PENDING,
+};
+
+struct occ_client {
+	struct occ *occ;
+	struct occ_xfr xfr;
+	spinlock_t lock;
+	wait_queue_head_t wait;
+	size_t read_offset;
+	unsigned long flags;
+};
+
+#define to_client(x)	container_of((x), struct occ_client, xfr)
+
+static struct workqueue_struct *occ_wq;
+
+static DEFINE_IDA(occ_ida);
+
+static void occ_enqueue_xfr(struct occ_xfr *xfr)
+{
+	int empty;
+	struct occ_client *client = to_client(xfr);
+	struct occ *occ = client->occ;
+
+	spin_lock_irq(&occ->list_lock);
+	empty = list_empty(&occ->xfrs);
+	list_add_tail(&xfr->link, &occ->xfrs);
+	spin_unlock(&occ->list_lock);
+
+	if (empty)
+		queue_work(occ_wq, &occ->work);
+}
+
+static int occ_open(struct inode *inode, struct file *file)
+{
+	struct miscdevice *mdev = file->private_data;
+	struct occ *occ = to_occ(mdev);
+	struct occ_client *client = kzalloc(sizeof(*client), GFP_KERNEL);
+
+	if (!client)
+		return -ENOMEM;
+
+	client->occ = occ;
+	spin_lock_init(&client->lock);
+	init_waitqueue_head(&client->wait);
+
+	if (file->f_flags & O_NONBLOCK)
+		set_bit(CLIENT_NONBLOCKING, &client->flags);
+
+	file->private_data = client;
+
+	return 0;
+}
+
+static ssize_t occ_read(struct file *file, char __user *buf, size_t len,
+			loff_t *offset)
+{
+	int rc;
+	size_t bytes;
+	struct occ_client *client = file->private_data;
+	struct occ_xfr *xfr = &client->xfr;
+
+	if (len > OCC_SRAM_BYTES)
+		return -EINVAL;
+
+	spin_lock_irq(&client->lock);
+	if (!test_bit(CLIENT_XFR_PENDING, &client->flags)) {
+		/* we just finished reading all data, return 0 */
+		if (client->read_offset) {
+			rc = 0;
+			client->read_offset = 0;
+		} else
+			rc = -ENOMSG;
+
+		goto done;
+	}
+
+	if (!test_bit(XFR_COMPLETE, &xfr->flags)) {
+		if (test_bit(CLIENT_NONBLOCKING, &client->flags)) {
+			rc = -EAGAIN;
+			goto done;
+		}
+
+		set_bit(XFR_WAITING, &xfr->flags);
+		spin_unlock(&client->lock);
+
+		rc = wait_event_interruptible(client->wait,
+			test_bit(XFR_COMPLETE, &xfr->flags) ||
+			test_bit(XFR_CANCELED, &xfr->flags));
+
+		spin_lock_irq(&client->lock);
+		if (test_bit(XFR_CANCELED, &xfr->flags)) {
+			spin_unlock(&client->lock);
+			kfree(client);
+			return -EBADFD;
+		}
+
+		clear_bit(XFR_WAITING, &xfr->flags);
+		if (!test_bit(XFR_COMPLETE, &xfr->flags)) {
+			rc = -EINTR;
+			goto done;
+		}
+	}
+
+	if (xfr->rc) {
+		rc = xfr->rc;
+		goto done;
+	}
+
+	if (copy_to_user(buf, &xfr->buf[client->read_offset], bytes)) {
+		rc = -EFAULT;
+		goto done;
+	}
+
+	client->read_offset += bytes;
+
+	/* xfr done */
+	if (client->read_offset == xfr->resp_data_length)
+		clear_bit(CLIENT_XFR_PENDING, &client->flags);
+
+	rc = bytes;
+
+done:
+	spin_unlock(&client->lock);
+	return rc;
+}
+
+static ssize_t occ_write(struct file *file, const char __user *buf,
+			 size_t len, loff_t *offset)
+{
+	int rc;
+	unsigned int i;
+	u16 data_length, checksum = 0;
+	struct occ_client *client = file->private_data;
+	struct occ_xfr *xfr = &client->xfr;
+
+	if (len > (OCC_CMD_DATA_BYTES + 3) || len < 3)
+		return -EINVAL;
+
+	spin_lock_irq(&client->lock);
+
+	if (test_bit(CLIENT_XFR_PENDING, &client->flags)) {
+		rc = -EBUSY;
+		goto done;
+	}
+
+	memset(xfr, 0, sizeof(*xfr));	/* clear out the transfer */
+	xfr->buf[0] = 1;		/* occ sequence number */
+
+	/* Assume user data follows the occ command format.
+	 * byte 0: command type
+	 * bytes 1-2: data length (msb first)
+	 * bytes 3-n: data
+	 */
+	if (copy_from_user(&xfr->buf[1], buf, len)) {
+		rc = -EFAULT;
+		goto done;
+	}
+
+	data_length = (xfr->buf[2] << 8) + xfr->buf[3];
+	if (data_length > OCC_CMD_DATA_BYTES) {
+		rc = -EINVAL;
+		goto done;
+	}
+
+	for (i = 0; i < data_length + 4; ++i)
+		checksum += xfr->buf[i];
+
+	xfr->buf[data_length + 4] = checksum >> 8;
+	xfr->buf[data_length + 5] = checksum & 0xFF;
+
+	xfr->cmd_data_length = data_length + 6;
+	client->read_offset = 0;
+	set_bit(CLIENT_XFR_PENDING, &client->flags);
+	occ_enqueue_xfr(xfr);
+
+	rc = len;
+
+done:
+	spin_unlock(&client->lock);
+	return rc;
+}
+
+static int occ_release(struct inode *inode, struct file *file)
+{
+	struct occ_client *client = file->private_data;
+	struct occ_xfr *xfr = &client->xfr;
+	struct occ *occ = client->occ;
+
+	spin_lock_irq(&client->lock);
+	if (!test_bit(CLIENT_XFR_PENDING, &client->flags)) {
+		spin_unlock(&client->lock);
+		kfree(client);
+		return 0;
+	}
+
+	spin_lock_irq(&occ->list_lock);
+	set_bit(XFR_CANCELED, &xfr->flags);
+	if (!test_bit(XFR_IN_PROGRESS, &xfr->flags)) {
+		/* already deleted from list if complete */
+		if (!test_bit(XFR_COMPLETE, &xfr->flags))
+			list_del(&xfr->link);
+
+		spin_unlock(&occ->list_lock);
+
+		if (test_bit(XFR_WAITING, &xfr->flags)) {
+			/* blocking read; let reader clean up */
+			wake_up_interruptible(&client->wait);
+			spin_unlock(&client->lock);
+			return 0;
+		}
+
+		spin_unlock(&client->lock);
+		kfree(client);
+		return 0;
+	}
+
+	/* operation is in progress; let worker clean up*/
+	spin_unlock(&occ->list_lock);
+	spin_unlock(&client->lock);
+	return 0;
+}
+
+static const struct file_operations occ_fops = {
+	.owner = THIS_MODULE,
+	.open = occ_open,
+	.read = occ_read,
+	.write = occ_write,
+	.release = occ_release,
+};
+
+static int occ_write_sbefifo(struct sbefifo_client *client, const char *buf,
+			     ssize_t len)
+{
+	int rc;
+	ssize_t total = 0;
+
+	do {
+		rc = sbefifo_drv_write(client, &buf[total], len - total);
+		if (rc < 0)
+			return rc;
+		else if (!rc)
+			break;
+
+		total += rc;
+	} while (total < len);
+
+	return (total == len) ? 0 : -EMSGSIZE;
+}
+
+static int occ_read_sbefifo(struct sbefifo_client *client, char *buf,
+			    ssize_t len)
+{
+	int rc;
+	ssize_t total = 0;
+
+	do {
+		rc = sbefifo_drv_read(client, &buf[total], len - total);
+		if (rc < 0)
+			return rc;
+		else if (!rc)
+			break;
+
+		total += rc;
+	} while (total < len);
+
+	return (total == len) ? 0 : -EMSGSIZE;
+}
+
+static int occ_getsram(struct device *sbefifo, u32 address, u8 *data,
+		       ssize_t len)
+{
+	int rc;
+	u8 *resp;
+	__be32 buf[5];
+	u32 data_len = ((len + 7) / 8) * 8;	/* must be multiples of 8 B */
+	struct sbefifo_client *client;
+
+	/* Magic sequence to do SBE getsram command. SBE will fetch data from
+	 * specified SRAM address.
+	 */
+	buf[0] = cpu_to_be32(0x5);
+	buf[1] = cpu_to_be32(0xa403);
+	buf[2] = cpu_to_be32(1);
+	buf[3] = cpu_to_be32(address);
+	buf[4] = cpu_to_be32(data_len);
+
+	client = sbefifo_drv_open(sbefifo, 0);
+	if (!client)
+		return -ENODEV;
+
+	rc = occ_write_sbefifo(client, (const char *)buf, sizeof(buf));
+	if (rc)
+		goto done;
+
+	resp = kzalloc(data_len, GFP_KERNEL);
+	if (!resp) {
+		rc = -ENOMEM;
+		goto done;
+	}
+
+	rc = occ_read_sbefifo(client, (char *)resp, data_len);
+	if (rc)
+		goto free;
+
+	/* check for good response */
+	rc = occ_read_sbefifo(client, (char *)buf, 8);
+	if (rc)
+		goto free;
+
+	if ((be32_to_cpu(buf[0]) == data_len) &&
+	    (be32_to_cpu(buf[1]) == 0xC0DEA403))
+		memcpy(data, resp, len);
+	else
+		rc = -EFAULT;
+
+free:
+	kfree(resp);
+
+done:
+	sbefifo_drv_release(client);
+	return rc;
+}
+
+static int occ_putsram(struct device *sbefifo, u32 address, u8 *data,
+		       ssize_t len)
+{
+	int rc;
+	__be32 *buf;
+	u32 data_len = ((len + 7) / 8) * 8;	/* must be multiples of 8 B */
+	size_t cmd_len = data_len + 20;
+	struct sbefifo_client *client;
+
+	buf = kzalloc(cmd_len, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	/* Magic sequence to do SBE putsram command. SBE will transfer
+	 * data to specified SRAM address.
+	 */
+	buf[0] = cpu_to_be32(0x5 + (data_len / 4));
+	buf[1] = cpu_to_be32(0xa404);
+	buf[2] = cpu_to_be32(1);
+	buf[3] = cpu_to_be32(address);
+	buf[4] = cpu_to_be32(data_len);
+
+	memcpy(&buf[5], data, len);
+
+	client = sbefifo_drv_open(sbefifo, 0);
+	if (!client) {
+		rc = -ENODEV;
+		goto free;
+	}
+
+	rc = occ_write_sbefifo(client, (const char *)buf, cmd_len);
+	if (rc)
+		goto done;
+
+	rc = occ_read_sbefifo(client, (char *)buf, 8);
+	if (rc)
+		goto done;
+
+	/* check for good response */
+	if ((be32_to_cpu(buf[0]) != data_len) ||
+	    (be32_to_cpu(buf[1]) != 0xC0DEA404))
+		rc = -EFAULT;
+
+done:
+	sbefifo_drv_release(client);
+free:
+	kfree(buf);
+	return rc;
+}
+
+static int occ_trigger_attn(struct device *sbefifo)
+{
+	int rc;
+	__be32 buf[6];
+	struct sbefifo_client *client;
+
+	/* Magic sequence to do SBE putscom command. SBE will write 8 bytes to
+	 * specified SCOM address.
+	 */
+	buf[0] = cpu_to_be32(0x6);
+	buf[1] = cpu_to_be32(0xa202);
+	buf[2] = 0;
+	buf[3] = cpu_to_be32(0x6D035);
+	buf[4] = cpu_to_be32(0x20010000);	/* trigger occ attention */
+	buf[5] = 0;
+
+	client = sbefifo_drv_open(sbefifo, 0);
+	if (!client)
+		return -ENODEV;
+
+	rc = occ_write_sbefifo(client, (const char *)buf, sizeof(buf));
+	if (rc)
+		goto done;
+
+	rc = occ_read_sbefifo(client, (char *)buf, 8);
+	if (rc)
+		goto done;
+
+	/* check for good response */
+	if ((be32_to_cpu(buf[0]) != 0xC0DEA202) ||
+	    (be32_to_cpu(buf[1]) & 0x0FFFFFFF))
+		rc = -EFAULT;
+
+done:
+	sbefifo_drv_release(client);
+
+	return rc;
+}
+
+static void occ_worker(struct work_struct *work)
+{
+	int rc = 0, empty, waiting, canceled;
+	u16 resp_data_length;
+	struct occ_xfr *xfr;
+	struct occ_client *client;
+	struct occ *occ = container_of(work, struct occ, work);
+	struct device *sbefifo = occ->sbefifo;
+
+again:
+	spin_lock_irq(&occ->list_lock);
+	xfr = list_first_entry(&occ->xfrs, struct occ_xfr, link);
+	if (!xfr) {
+		spin_unlock(&occ->list_lock);
+		return;
+	}
+
+	set_bit(XFR_IN_PROGRESS, &xfr->flags);
+
+	spin_unlock(&occ->list_lock);
+	mutex_lock(&occ->occ_lock);
+
+	/* write occ command */
+	rc = occ_putsram(sbefifo, 0xFFFBE000, xfr->buf,
+			 xfr->cmd_data_length);
+	if (rc)
+		goto done;
+
+	rc = occ_trigger_attn(sbefifo);
+	if (rc)
+		goto done;
+
+	/* read occ response */
+	rc = occ_getsram(sbefifo, 0xFFFBF000, xfr->buf, 8);
+	if (rc)
+		goto done;
+
+	resp_data_length = (xfr->buf[3] << 8) + xfr->buf[4];
+	if (resp_data_length > OCC_RESP_DATA_BYTES) {
+		rc = -EDOM;
+		goto done;
+	}
+
+	if (resp_data_length > 1) {
+		/* already got 3 bytes resp, also need 2 bytes checksum */
+		rc = occ_getsram(sbefifo, 0xFFFBF008, &xfr->buf[8],
+				 resp_data_length - 1);
+		if (rc)
+			goto done;
+	}
+
+	xfr->resp_data_length = resp_data_length + 7;
+
+done:
+	mutex_unlock(&occ->occ_lock);
+
+	xfr->rc = rc;
+	client = to_client(xfr);
+
+	/* lock client to prevent race with read() */
+	spin_lock_irq(&client->lock);
+	set_bit(XFR_COMPLETE, &xfr->flags);
+	waiting = test_bit(XFR_WAITING, &xfr->flags);
+	spin_unlock(&client->lock);
+
+	spin_lock_irq(&occ->list_lock);
+	clear_bit(XFR_IN_PROGRESS, &xfr->flags);
+	list_del(&xfr->link);
+	empty = list_empty(&occ->xfrs);
+	canceled = test_bit(XFR_CANCELED, &xfr->flags);
+	spin_unlock(&occ->list_lock);
+
+	if (waiting)
+		wake_up_interruptible(&client->wait);
+	else if (canceled)
+		kfree(client);
+
+	if (!empty)
+		goto again;
+}
+
+static int occ_probe(struct platform_device *pdev)
+{
+	int rc;
+	u32 reg;
+	struct occ *occ;
+	struct device *dev = &pdev->dev;
+
+	occ = devm_kzalloc(dev, sizeof(*occ), GFP_KERNEL);
+	if (!occ)
+		return -ENOMEM;
+
+	occ->sbefifo = dev->parent;
+	INIT_LIST_HEAD(&occ->xfrs);
+	spin_lock_init(&occ->list_lock);
+	mutex_init(&occ->occ_lock);
+	INIT_WORK(&occ->work, occ_worker);
+
+	if (dev->of_node) {
+		rc = of_property_read_u32(dev->of_node, "reg", &reg);
+		if (!rc) {
+			/* make sure we don't have a duplicate from dts */
+			occ->idx = ida_simple_get(&occ_ida, reg, reg + 1,
+						  GFP_KERNEL);
+			if (occ->idx < 0)
+				occ->idx = ida_simple_get(&occ_ida, 1, INT_MAX,
+							  GFP_KERNEL);
+		} else
+			occ->idx = ida_simple_get(&occ_ida, 1, INT_MAX,
+						  GFP_KERNEL);
+	} else
+		occ->idx = ida_simple_get(&occ_ida, 1, INT_MAX, GFP_KERNEL);
+
+	platform_set_drvdata(pdev, occ);
+
+	snprintf(occ->name, sizeof(occ->name), "occ%d", occ->idx);
+	occ->mdev.fops = &occ_fops;
+	occ->mdev.minor = MISC_DYNAMIC_MINOR;
+	occ->mdev.name = occ->name;
+	occ->mdev.parent = dev;
+
+	rc = misc_register(&occ->mdev);
+	if (rc) {
+		dev_err(dev, "failed to register miscdevice\n");
+		return rc;
+	}
+
+	return 0;
+}
+
+static int occ_remove(struct platform_device *pdev)
+{
+	struct occ *occ = platform_get_drvdata(pdev);
+
+	flush_work(&occ->work);
+	misc_deregister(&occ->mdev);
+	ida_simple_remove(&occ_ida, occ->idx);
+
+	return 0;
+}
+
+static const struct of_device_id occ_match[] = {
+	{ .compatible = "ibm,p9-occ" },
+	{ },
+};
+
+static struct platform_driver occ_driver = {
+	.driver = {
+		.name = "occ",
+		.of_match_table	= occ_match,
+	},
+	.probe	= occ_probe,
+	.remove = occ_remove,
+};
+
+static int occ_init(void)
+{
+	occ_wq = create_singlethread_workqueue("occ");
+	if (!occ_wq)
+		return -ENOMEM;
+
+	return platform_driver_register(&occ_driver);
+}
+
+static void occ_exit(void)
+{
+	destroy_workqueue(occ_wq);
+
+	platform_driver_unregister(&occ_driver);
+
+	ida_destroy(&occ_ida);
+}
+
+module_init(occ_init);
+module_exit(occ_exit);
+
+MODULE_AUTHOR("Eddie James <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>");
+MODULE_DESCRIPTION("BMC P9 OCC driver");
+MODULE_LICENSE("GPL");
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
