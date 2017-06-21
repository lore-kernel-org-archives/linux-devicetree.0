From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux 4/4] drivers/fsi/occ: Add in-kernel API
Date: Wed, 21 Jun 2017 14:38:01 -0500
Message-ID: <1498073881-3207-5-git-send-email-eajames@linux.vnet.ibm.com>
References: <1498073881-3207-1-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1498073881-3207-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, bradleyb@fuzziesquirrel.com, jk@ozlabs.org, cbostic@linux.vnet.ibm.com, joel@jms.id.au, andrew@aj.id.au, eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
List-Id: devicetree@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Add an in-kernel read/write API with exported functions. This is
necessary for other drivers which want to directly interact with the
OCC. Also parse the OCC device tree node for child nodes and create
child platform devices accordingly.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 .../devicetree/bindings/fsi/ibm,p9-occ.txt         |   8 ++
 drivers/fsi/occ.c                                  | 140 +++++++++++++++++----
 include/linux/occ.h                                |  27 ++++
 3 files changed, 154 insertions(+), 21 deletions(-)
 create mode 100644 include/linux/occ.h

diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
index 88002b9..71afba3 100644
--- a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
+++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
@@ -6,10 +6,18 @@ Required properties:
 
 Optional properties:
  - reg = <processor index>;	: index for the processor this OCC device is on
+ - <child nodes>		: Drivers for devices which communicate with
+				  this OCC. Child nodes have no required or
+				  optional properties that the OCC driver will
+				  use.
 
 Examples:
 
     occ@1 {
         compatible = "ibm,p9-occ";
         reg = <1>;
+
+	occ-hwmon@1 {
+		compatible = "ibm,p9-occ-hwmon";
+	};
     };
diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
index a1e6e9b..c964d9e 100644
--- a/drivers/fsi/occ.c
+++ b/drivers/fsi/occ.c
@@ -16,6 +16,7 @@
 #include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/occ.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
@@ -131,33 +132,43 @@ static void occ_enqueue_xfr(struct occ_xfr *xfr)
 		queue_work(occ_wq, &occ->work);
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
 
 	if (len > OCC_SRAM_BYTES)
@@ -207,10 +218,15 @@ static ssize_t occ_read(struct file *file, char __user *buf, size_t len,
 		goto done;
 	}
 
-	if (copy_to_user(buf, &xfr->buf[client->read_offset], bytes)) {
-		rc = -EFAULT;
-		goto done;
-	}
+	bytes = min(len, xfr->resp_data_length - client->read_offset);
+	if (ubuf) {
+		if (copy_to_user(ubuf, &xfr->buf[client->read_offset],
+				 bytes)) {
+			rc = -EFAULT;
+			goto done;
+		}
+	} else
+		memcpy(kbuf, &xfr->buf[client->read_offset], bytes);
 
 	client->read_offset += bytes;
 
@@ -225,13 +241,21 @@ static ssize_t occ_read(struct file *file, char __user *buf, size_t len,
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
@@ -252,10 +276,13 @@ static ssize_t occ_write(struct file *file, const char __user *buf,
 	 * bytes 1-2: data length (msb first)
 	 * bytes 3-n: data
 	 */
-	if (copy_from_user(&xfr->buf[1], buf, len)) {
-		rc = -EFAULT;
-		goto done;
-	}
+	if (ubuf) {
+		if (copy_from_user(&xfr->buf[1], ubuf, len)) {
+			rc = -EFAULT;
+			goto done;
+		}
+	} else
+		memcpy(&xfr->buf[1], kbuf, len);
 
 	data_length = (xfr->buf[2] << 8) + xfr->buf[3];
 	if (data_length > OCC_CMD_DATA_BYTES) {
@@ -281,9 +308,16 @@ static ssize_t occ_write(struct file *file, const char __user *buf,
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
 
@@ -321,6 +355,13 @@ static int occ_release(struct inode *inode, struct file *file)
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
@@ -592,12 +633,55 @@ static void occ_worker(struct work_struct *work)
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
@@ -609,6 +693,9 @@ static int occ_probe(struct platform_device *pdev)
 	mutex_init(&occ->occ_lock);
 	INIT_WORK(&occ->work, occ_worker);
 
+	/* ensure NULL before we probe children, so they don't hang FSI */
+	platform_set_drvdata(pdev, NULL);
+
 	if (dev->of_node) {
 		rc = of_property_read_u32(dev->of_node, "reg", &reg);
 		if (!rc) {
@@ -621,6 +708,16 @@ static int occ_probe(struct platform_device *pdev)
 		} else
 			occ->idx = ida_simple_get(&occ_ida, 1, INT_MAX,
 						  GFP_KERNEL);
+
+		/* create platform devs for dts child nodes (hwmon, etc) */
+		for_each_child_of_node(dev->of_node, np) {
+			snprintf(child_name, sizeof(child_name), "occ%d-dev%d",
+				 occ->idx, child_idx++);
+			child = of_platform_device_create(np, child_name, dev);
+			if (!child)
+				dev_warn(dev,
+					 "failed to create child node dev\n");
+		}
 	} else
 		occ->idx = ida_simple_get(&occ_ida, 1, INT_MAX, GFP_KERNEL);
 
@@ -647,6 +744,7 @@ static int occ_remove(struct platform_device *pdev)
 
 	flush_work(&occ->work);
 	misc_deregister(&occ->mdev);
+	device_for_each_child(&pdev->dev, NULL, occ_unregister_child);
 	ida_simple_remove(&occ_ida, occ->idx);
 
 	return 0;
diff --git a/include/linux/occ.h b/include/linux/occ.h
new file mode 100644
index 0000000..bc588a8
--- /dev/null
+++ b/include/linux/occ.h
@@ -0,0 +1,27 @@
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
+#ifndef LINUX_OCC_H
+#define LINUX_OCC_H
+
+struct device;
+struct occ_client;
+
+extern struct occ_client *occ_drv_open(struct device *dev,
+				       unsigned long flags);
+extern int occ_drv_read(struct occ_client *client, char *buf, size_t len);
+extern int occ_drv_write(struct occ_client *client, const char *buf,
+			 size_t len);
+extern void occ_drv_release(struct occ_client *client);
+
+#endif /* LINUX_OCC_H */
-- 
1.8.3.1
