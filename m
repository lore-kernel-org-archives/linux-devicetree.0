From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v3 6/6] drivers: fsi: occ: Add in-kernel API
Date: Fri, 22 Sep 2017 16:06:02 -0500
Message-ID: <1506114362-492-7-git-send-email-eajames@linux.vnet.ibm.com>
References: <1506114362-492-1-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1506114362-492-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, bradleyb@fuzziesquirrel.com, jk@ozlabs.org, cbostic@linux.vnet.ibm.com, joel@jms.id.au, andrew@aj.id.au, eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
List-Id: devicetree@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Add an in-kernel read/write API with exported functions. This is
necessary for other drivers which want to directly interact with the
OCC. Also add a child platform device node for the associated hwmon
device.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-occ.c   | 143 ++++++++++++++++++++++++++++++++++++++++--------
 include/linux/fsi-occ.h |  41 ++++++++++++++
 2 files changed, 160 insertions(+), 24 deletions(-)
 create mode 100644 include/linux/fsi-occ.h

diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index 3a18f90..7b927bc 100644
--- a/drivers/fsi/fsi-occ.c
+++ b/drivers/fsi/fsi-occ.c
@@ -12,6 +12,7 @@
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/fs.h>
+#include <linux/fsi-occ.h>
 #include <linux/fsi-sbefifo.h>
 #include <linux/idr.h>
 #include <linux/kernel.h>
@@ -32,8 +33,6 @@
 #define OCC_CMD_DATA_BYTES	4090
 #define OCC_RESP_DATA_BYTES	4089
 
-#define OCC_RESP_CMD_IN_PRG	0xFF
-
 #define OCC_TIMEOUT_MS		1000
 #define OCC_CMD_IN_PRG_WAIT_MS	50
 
@@ -140,36 +139,43 @@ static int occ_enqueue_xfr(struct occ_xfr *xfr)
 	return 0;
 }
 
-static int occ_open(struct inode *inode, struct file *file)
+static struct occ_client *occ_open_common(struct occ *occ, unsigned long flags)
 {
-	struct miscdevice *mdev = file->private_data;
-	struct occ *occ = to_occ(mdev);
 	struct occ_client *client = kzalloc(sizeof(*client), GFP_KERNEL);
 
-	if (!client)
-		return -ENOMEM;
-
-	if (occ->cancel)
-		return -ECANCELED;
+	if (!client || occ->cancel)
+		return NULL;
 
 	client->occ = occ;
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
 }
 
-static ssize_t occ_read(struct file *file, char __user *buf, size_t len,
-			loff_t *offset)
+static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
+			       char *kbuf, size_t len)
 {
 	int rc;
 	size_t bytes;
-	struct occ_client *client = file->private_data;
 	struct occ_xfr *xfr = &client->xfr;
 	struct occ *occ = client->occ;
 
@@ -227,9 +233,15 @@ static ssize_t occ_read(struct file *file, char __user *buf, size_t len,
 		goto done;
 	}
 
-	if (copy_to_user(buf, &xfr->buf[client->read_offset], bytes)) {
-		rc = -EFAULT;
-		goto done;
+	bytes = min(len, xfr->resp_data_length - client->read_offset);
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
@@ -245,13 +257,21 @@ static ssize_t occ_read(struct file *file, char __user *buf, size_t len,
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
 	unsigned int i;
 	u16 data_length, checksum = 0;
-	struct occ_client *client = file->private_data;
 	struct occ_xfr *xfr = &client->xfr;
 
 	if (len > (OCC_CMD_DATA_BYTES + 3) || len < 3)
@@ -272,9 +292,13 @@ static ssize_t occ_write(struct file *file, const char __user *buf,
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
@@ -303,9 +327,16 @@ static ssize_t occ_write(struct file *file, const char __user *buf,
 	return rc;
 }
 
-static int occ_release(struct inode *inode, struct file *file)
+static ssize_t occ_write(struct file *file, const char __user *buf,
+			 size_t len, loff_t *offset)
 {
 	struct occ_client *client = file->private_data;
+
+	return occ_write_common(client, buf, NULL, len);
+}
+
+static int occ_release_common(struct occ_client *client)
+{
 	struct occ_xfr *xfr = &client->xfr;
 	struct occ *occ = client->occ;
 
@@ -346,6 +377,13 @@ static int occ_release(struct inode *inode, struct file *file)
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
@@ -643,12 +681,56 @@ static void occ_worker(struct work_struct *work)
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
+	platform_device_unregister(child);
+
+	return 0;
+}
+
 static int occ_probe(struct platform_device *pdev)
 {
 	int rc;
 	u32 reg;
 	struct occ *occ;
+	struct platform_device *child;
+	struct platform_device_info child_info;
 	struct device *dev = &pdev->dev;
+	struct property_entry child_properties[] = {
+		PROPERTY_ENTRY_STRING("compatible", "ibm,p9-occ-hwmon"),
+		{ }
+	};
 
 	occ = devm_kzalloc(dev, sizeof(*occ), GFP_KERNEL);
 	if (!occ)
@@ -659,8 +741,11 @@ static int occ_probe(struct platform_device *pdev)
 	spin_lock_init(&occ->list_lock);
 	mutex_init(&occ->occ_lock);
 	INIT_WORK(&occ->work, occ_worker);
+	memset(&child_info, 0, sizeof(child_info));
 
 	if (dev->of_node) {
+		child_info.fwnode = &dev->of_node->fwnode;
+
 		rc = of_property_read_u32(dev->of_node, "reg", &reg);
 		if (!rc) {
 			/* make sure we don't have a duplicate from dts */
@@ -690,6 +775,15 @@ static int occ_probe(struct platform_device *pdev)
 		return rc;
 	}
 
+	/* create device for hwmon driver */
+	child_info.id = occ->idx;
+	child_info.parent = dev;
+	child_info.name = "occ-hwmon";
+	child_info.properties = child_properties;
+	child = platform_device_register_full(&child_info);
+	if (!child)
+		dev_warn(dev, "failed to register %s dev\n", child_info.name);
+
 	platform_set_drvdata(pdev, occ);
 
 	return 0;
@@ -708,6 +802,7 @@ static int occ_remove(struct platform_device *pdev)
 	}
 
 	misc_deregister(&occ->mdev);
+	device_for_each_child(&pdev->dev, NULL, occ_unregister_child);
 
 	flush_work(&occ->work);
 
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
