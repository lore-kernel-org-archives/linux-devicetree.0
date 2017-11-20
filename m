From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v5 8/8] drivers/fsi: occ: Add in-kernel API
Date: Mon, 20 Nov 2017 13:46:57 -0600
Message-ID: <1511207217-14075-9-git-send-email-eajames@linux.vnet.ibm.com>
References: <1511207217-14075-1-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1511207217-14075-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com, joel@jms.id.au, eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
List-Id: devicetree@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Add an in-kernel read/write API with exported functions. This is
necessary for other drivers which want to directly interact with the
OCC. Also add a child platform device node for the associated hwmon
device.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-occ.c   | 138 ++++++++++++++++++++++++++++++++++++++++--------
 include/linux/fsi-occ.h |  41 ++++++++++++++
 2 files changed, 157 insertions(+), 22 deletions(-)
 create mode 100644 include/linux/fsi-occ.h

diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index 1aeb67d..1713550 100644
--- a/drivers/fsi/fsi-occ.c
+++ b/drivers/fsi/fsi-occ.c
@@ -19,7 +19,9 @@
 #include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/fsi-occ.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
@@ -32,8 +34,6 @@
 #define OCC_CMD_DATA_BYTES	4090
 #define OCC_RESP_DATA_BYTES	4089
 
-#define OCC_RESP_CMD_IN_PRG    0xFF
-
 #define OCC_TIMEOUT_MS		1000
 #define OCC_CMD_IN_PRG_WAIT_MS	50
 
@@ -156,23 +156,34 @@ static void occ_put_client(struct occ_client *client)
 	kref_put(&client->kref, occ_client_release);
 }
 
-static int occ_open(struct inode *inode, struct file *file)
+static struct occ_client *occ_open_common(struct occ *occ, unsigned long flags)
 {
-	struct miscdevice *mdev = file->private_data;
-	struct occ *occ = to_occ(mdev);
 	struct occ_client *client = kzalloc(sizeof(*client), GFP_KERNEL);
 
 	if (!client)
-		return -ENOMEM;
+		return NULL;
 
 	client->occ = occ;
 	kref_init(&client->kref);
 	spin_lock_init(&client->lock);
 	init_waitqueue_head(&client->wait);
 
-	if (file->f_flags & O_NONBLOCK)
+	if (flags & O_NONBLOCK)
 		set_bit(CLIENT_NONBLOCKING, &client->flags);
 
+	return client;
+}
+
+static int occ_open(struct inode *inode, struct file *file)
+{
+	struct occ_client *client;
+	struct miscdevice *mdev = file->private_data;
+	struct occ *occ = to_occ(mdev);
+
+	client = occ_open_common(occ, file->f_flags);
+	if (!client)
+		return -ENOMEM;
+
 	file->private_data = client;
 
 	return 0;
@@ -184,15 +195,14 @@ static inline bool occ_read_ready(struct occ_xfr *xfr, struct occ *occ)
 		test_bit(XFR_CANCELED, &xfr->flags) || occ->cancel;
 }
 
-static ssize_t occ_read(struct file *file, char __user *buf, size_t len,
-			loff_t *offset)
+static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
+			       char *kbuf, size_t len)
 {
 	int rc;
 	unsigned long flags;
 	size_t bytes;
 	struct occ_xfr *xfr;
 	struct occ *occ;
-	struct occ_client *client = file->private_data;
 
 	if (!client)
 		return -ENODEV;
@@ -247,9 +257,14 @@ static ssize_t occ_read(struct file *file, char __user *buf, size_t len,
 	}
 
 	bytes = min(len, xfr->resp_data_length - client->read_offset);
-	if (copy_to_user(buf, &xfr->buf[client->read_offset], bytes)) {
-		rc = -EFAULT;
-		goto done;
+	if (ubuf) {
+		if (copy_to_user(ubuf, &xfr->buf[client->read_offset],
+				 bytes)) {
+			rc = -EFAULT;
+			goto done;
+		}
+	} else {
+		memcpy(kbuf, &xfr->buf[client->read_offset], bytes);
 	}
 
 	client->read_offset += bytes;
@@ -266,15 +281,23 @@ static ssize_t occ_read(struct file *file, char __user *buf, size_t len,
 	return rc;
 }
 
-static ssize_t occ_write(struct file *file, const char __user *buf,
-			 size_t len, loff_t *offset)
+static ssize_t occ_read(struct file *file, char __user *buf, size_t len,
+			loff_t *offset)
+{
+	struct occ_client *client = file->private_data;
+
+	return occ_read_common(client, buf, NULL, len);
+}
+
+static ssize_t occ_write_common(struct occ_client *client,
+				const char __user *ubuf, const char *kbuf,
+				size_t len)
 {
 	int rc;
 	unsigned long flags;
 	unsigned int i;
 	u16 data_length, checksum = 0;
 	struct occ_xfr *xfr;
-	struct occ_client *client = file->private_data;
 
 	if (!client)
 		return -ENODEV;
@@ -301,9 +324,13 @@ static ssize_t occ_write(struct file *file, const char __user *buf,
 	 * bytes 1-2: data length (msb first)
 	 * bytes 3-n: data
 	 */
-	if (copy_from_user(&xfr->buf[1], buf, len)) {
-		rc = -EFAULT;
-		goto done;
+	if (ubuf) {
+		if (copy_from_user(&xfr->buf[1], ubuf, len)) {
+			rc = -EFAULT;
+			goto done;
+		}
+	} else {
+		memcpy(&xfr->buf[1], kbuf, len);
 	}
 
 	data_length = (xfr->buf[2] << 8) + xfr->buf[3];
@@ -334,12 +361,19 @@ static ssize_t occ_write(struct file *file, const char __user *buf,
 	return rc;
 }
 
-static int occ_release(struct inode *inode, struct file *file)
+static ssize_t occ_write(struct file *file, const char __user *buf,
+			 size_t len, loff_t *offset)
+{
+	struct occ_client *client = file->private_data;
+
+	return occ_write_common(client, buf, NULL, len);
+}
+
+static int occ_release_common(struct occ_client *client)
 {
 	unsigned long flags;
 	struct occ *occ;
 	struct occ_xfr *xfr;
-	struct occ_client *client = file->private_data;
 
 	if (!client)
 		return -ENODEV;
@@ -372,6 +406,13 @@ static int occ_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
+static int occ_release(struct inode *inode, struct file *file)
+{
+	struct occ_client *client = file->private_data;
+
+	return occ_release_common(client);
+}
+
 static const struct file_operations occ_fops = {
 	.owner = THIS_MODULE,
 	.open = occ_open,
@@ -665,12 +706,55 @@ static void occ_worker(struct work_struct *work)
 		goto again;
 }
 
+struct occ_client *occ_drv_open(struct device *dev, unsigned long flags)
+{
+	struct occ *occ = dev_get_drvdata(dev);
+
+	if (!occ)
+		return NULL;
+
+	return occ_open_common(occ, flags);
+}
+EXPORT_SYMBOL_GPL(occ_drv_open);
+
+int occ_drv_read(struct occ_client *client, char *buf, size_t len)
+{
+	return occ_read_common(client, NULL, buf, len);
+}
+EXPORT_SYMBOL_GPL(occ_drv_read);
+
+int occ_drv_write(struct occ_client *client, const char *buf, size_t len)
+{
+	return occ_write_common(client, NULL, buf, len);
+}
+EXPORT_SYMBOL_GPL(occ_drv_write);
+
+void occ_drv_release(struct occ_client *client)
+{
+	occ_release_common(client);
+}
+EXPORT_SYMBOL_GPL(occ_drv_release);
+
+static int occ_unregister_child(struct device *dev, void *data)
+{
+	struct platform_device *child = to_platform_device(dev);
+
+	of_device_unregister(child);
+	if (dev->of_node)
+		of_node_clear_flag(dev->of_node, OF_POPULATED);
+
+	return 0;
+}
+
 static int occ_probe(struct platform_device *pdev)
 {
-	int rc;
+	int rc, child_idx = 0;
 	u32 reg;
 	struct occ *occ;
+	struct device_node *np;
+	struct platform_device *child;
 	struct device *dev = &pdev->dev;
+	char child_name[32];
 
 	occ = devm_kzalloc(dev, sizeof(*occ), GFP_KERNEL);
 	if (!occ)
@@ -712,6 +796,15 @@ static int occ_probe(struct platform_device *pdev)
 		return rc;
 	}
 
+	/* create platform devs for dts child nodes (hwmon, etc) */
+	for_each_available_child_of_node(dev->of_node, np) {
+		snprintf(child_name, sizeof(child_name), "occ%d-dev%d",
+			 occ->idx, child_idx++);
+		child = of_platform_device_create(np, child_name, dev);
+		if (!child)
+			dev_warn(dev, "failed to create child node dev\n");
+	}
+
 	platform_set_drvdata(pdev, occ);
 
 	return 0;
@@ -734,6 +827,7 @@ static int occ_remove(struct platform_device *pdev)
 	spin_unlock_irqrestore(&occ->list_lock, flags);
 
 	misc_deregister(&occ->mdev);
+	device_for_each_child(&pdev->dev, NULL, occ_unregister_child);
 
 	cancel_work_sync(&occ->work);
 
diff --git a/include/linux/fsi-occ.h b/include/linux/fsi-occ.h
new file mode 100644
index 0000000..0a4a54a
--- /dev/null
+++ b/include/linux/fsi-occ.h
@@ -0,0 +1,41 @@
+/*
+ * Copyright (C) IBM Corporation 2017
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERGCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef LINUX_FSI_OCC_H
+#define LINUX_FSI_OCC_H
+
+struct device;
+struct occ_client;
+
+#define OCC_RESP_CMD_IN_PRG		0xFF
+#define OCC_RESP_SUCCESS		0
+#define OCC_RESP_CMD_INVAL		0x11
+#define OCC_RESP_CMD_LEN_INVAL		0x12
+#define OCC_RESP_DATA_INVAL		0x13
+#define OCC_RESP_CHKSUM_ERR		0x14
+#define OCC_RESP_INT_ERR		0x15
+#define OCC_RESP_BAD_STATE		0x16
+#define OCC_RESP_CRIT_EXCEPT		0xE0
+#define OCC_RESP_CRIT_INIT		0xE1
+#define OCC_RESP_CRIT_WATCHDOG		0xE2
+#define OCC_RESP_CRIT_OCB		0xE3
+#define OCC_RESP_CRIT_HW		0xE4
+
+extern struct occ_client *occ_drv_open(struct device *dev,
+				       unsigned long flags);
+extern int occ_drv_read(struct occ_client *client, char *buf, size_t len);
+extern int occ_drv_write(struct occ_client *client, const char *buf,
+			 size_t len);
+extern void occ_drv_release(struct occ_client *client);
+
+#endif /* LINUX_FSI_OCC_H */
-- 
1.8.3.1
