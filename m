From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v4 4/4] drivers/fsi: sbefifo: Add in-kernel API
Date: Fri, 17 Nov 2017 13:34:34 -0600
Message-ID: <1510947274-7519-5-git-send-email-eajames@linux.vnet.ibm.com>
References: <1510947274-7519-1-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1510947274-7519-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com, joel@jms.id.au, eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
List-Id: devicetree@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Refactor the user interface of the SBEFIFO driver to allow for an
in-kernel read/write API. Add exported functions for other drivers to
call, and add an include file with those functions. Also parse the
device tree for child nodes and create child platform devices
accordingly.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-sbefifo.c   | 137 +++++++++++++++++++++++++++++++++++++-------
 include/linux/fsi-sbefifo.h |  30 ++++++++++
 2 files changed, 146 insertions(+), 21 deletions(-)
 create mode 100644 include/linux/fsi-sbefifo.h

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index 9970e2d..92947b0 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -15,12 +15,16 @@
 #include <linux/errno.h>
 #include <linux/fs.h>
 #include <linux/fsi.h>
+#include <linux/fsi-sbefifo.h>
 #include <linux/idr.h>
 #include <linux/kernel.h>
 #include <linux/kref.h>
 #include <linux/list.h>
 #include <linux/miscdevice.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/poll.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
@@ -92,6 +96,7 @@ struct sbefifo_client {
 	struct list_head xfrs;
 	struct sbefifo *dev;
 	struct kref kref;
+	unsigned long f_flags;
 };
 
 static DEFINE_IDA(sbefifo_ida);
@@ -540,6 +545,7 @@ static int sbefifo_open(struct inode *inode, struct file *file)
 		return -ENOMEM;
 
 	file->private_data = client;
+	client->f_flags = file->f_flags;
 
 	return 0;
 }
@@ -579,10 +585,9 @@ static bool sbefifo_read_ready(struct sbefifo *sbefifo,
 		(xfr && test_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags));
 }
 
-static ssize_t sbefifo_read(struct file *file, char __user *buf, size_t len,
-			    loff_t *offset)
+static ssize_t sbefifo_read_common(struct sbefifo_client *client,
+				   char __user *ubuf, char *kbuf, size_t len)
 {
-	struct sbefifo_client *client = file->private_data;
 	struct sbefifo *sbefifo = client->dev;
 	struct sbefifo_xfr *xfr;
 	size_t n;
@@ -591,7 +596,7 @@ static ssize_t sbefifo_read(struct file *file, char __user *buf, size_t len,
 	if ((len >> 2) << 2 != len)
 		return -EINVAL;
 
-	if ((file->f_flags & O_NONBLOCK) && !sbefifo_xfr_rsp_pending(client))
+	if ((client->f_flags & O_NONBLOCK) && !sbefifo_xfr_rsp_pending(client))
 		return -EAGAIN;
 
 	sbefifo_get_client(client);
@@ -609,9 +614,13 @@ static ssize_t sbefifo_read(struct file *file, char __user *buf, size_t len,
 
 	n = min_t(size_t, n, len);
 
-	if (copy_to_user(buf, READ_ONCE(client->rbuf.rpos), n)) {
-		ret = -EFAULT;
-		goto out;
+	if (ubuf) {
+		if (copy_to_user(ubuf, READ_ONCE(client->rbuf.rpos), n)) {
+			ret = -EFAULT;
+			goto out;
+		}
+	} else {
+		memcpy(kbuf, READ_ONCE(client->rbuf.rpos), n);
 	}
 
 	if (sbefifo_buf_readnb(&client->rbuf, n)) {
@@ -643,6 +652,14 @@ static ssize_t sbefifo_read(struct file *file, char __user *buf, size_t len,
 	return ret;
 }
 
+static ssize_t sbefifo_read(struct file *file, char __user *buf, size_t len,
+			    loff_t *offset)
+{
+	struct sbefifo_client *client = file->private_data;
+
+	return sbefifo_read_common(client, buf, NULL, len);
+}
+
 static bool sbefifo_write_ready(struct sbefifo *sbefifo,
 				struct sbefifo_xfr *xfr,
 				struct sbefifo_client *client, size_t *n)
@@ -655,10 +672,10 @@ static bool sbefifo_write_ready(struct sbefifo *sbefifo,
 	return READ_ONCE(sbefifo->rc) || (next == xfr && *n);
 }
 
-static ssize_t sbefifo_write(struct file *file, const char __user *buf,
-			     size_t len, loff_t *offset)
+static ssize_t sbefifo_write_common(struct sbefifo_client *client,
+				    const char __user *ubuf, const char *kbuf,
+				    size_t len)
 {
-	struct sbefifo_client *client = file->private_data;
 	struct sbefifo *sbefifo = client->dev;
 	struct sbefifo_xfr *xfr;
 	ssize_t ret = 0;
@@ -676,7 +693,7 @@ static ssize_t sbefifo_write(struct file *file, const char __user *buf,
 	spin_lock_irq(&sbefifo->lock);
 	xfr = sbefifo_next_xfr(sbefifo);	/* next xfr to be executed */
 
-	if ((file->f_flags & O_NONBLOCK) && xfr && n < len) {
+	if ((client->f_flags & O_NONBLOCK) && xfr && n < len) {
 		spin_unlock_irq(&sbefifo->lock);
 		ret = -EAGAIN;
 		goto out;
@@ -717,16 +734,22 @@ static ssize_t sbefifo_write(struct file *file, const char __user *buf,
 
 		n = min_t(size_t, n, len);
 
-		if (copy_from_user(READ_ONCE(client->wbuf.wpos), buf, n)) {
-			set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
-			sbefifo_get(sbefifo);
-			if (mod_timer(&sbefifo->poll_timer, jiffies))
-				sbefifo_put(sbefifo);
-			ret = -EFAULT;
-			goto out;
-		}
+		if (ubuf) {
+			if (copy_from_user(READ_ONCE(client->wbuf.wpos), ubuf,
+			    n)) {
+				set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
+				sbefifo_get(sbefifo);
+				if (mod_timer(&sbefifo->poll_timer, jiffies))
+					sbefifo_put(sbefifo);
+				ret = -EFAULT;
+				goto out;
+			}
 
-		buf += n;
+			ubuf += n;
+		} else {
+			memcpy(READ_ONCE(client->wbuf.wpos), kbuf, n);
+			kbuf += n;
+		}
 
 		sbefifo_buf_wrotenb(&client->wbuf, n);
 		len -= n;
@@ -750,6 +773,14 @@ static ssize_t sbefifo_write(struct file *file, const char __user *buf,
 	return ret;
 }
 
+static ssize_t sbefifo_write(struct file *file, const char __user *buf,
+			     size_t len, loff_t *offset)
+{
+	struct sbefifo_client *client = file->private_data;
+
+	return sbefifo_write_common(client, buf, NULL, len);
+}
+
 static int sbefifo_release(struct inode *inode, struct file *file)
 {
 	struct sbefifo_client *client = file->private_data;
@@ -769,6 +800,56 @@ static int sbefifo_release(struct inode *inode, struct file *file)
 	.release	= sbefifo_release,
 };
 
+struct sbefifo_client *sbefifo_drv_open(struct device *dev,
+					unsigned long flags)
+{
+	struct sbefifo_client *client;
+	struct sbefifo *sbefifo = dev_get_drvdata(dev);
+
+	if (!sbefifo)
+		return NULL;
+
+	client = sbefifo_new_client(sbefifo);
+	if (client)
+		client->f_flags = flags;
+
+	return client;
+}
+EXPORT_SYMBOL_GPL(sbefifo_drv_open);
+
+int sbefifo_drv_read(struct sbefifo_client *client, char *buf, size_t len)
+{
+	return sbefifo_read_common(client, NULL, buf, len);
+}
+EXPORT_SYMBOL_GPL(sbefifo_drv_read);
+
+int sbefifo_drv_write(struct sbefifo_client *client, const char *buf,
+		      size_t len)
+{
+	return sbefifo_write_common(client, NULL, buf, len);
+}
+EXPORT_SYMBOL_GPL(sbefifo_drv_write);
+
+void sbefifo_drv_release(struct sbefifo_client *client)
+{
+	if (!client)
+		return;
+
+	sbefifo_put_client(client);
+}
+EXPORT_SYMBOL_GPL(sbefifo_drv_release);
+
+static int sbefifo_unregister_child(struct device *dev, void *data)
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
 static int sbefifo_request_reset(struct sbefifo *sbefifo)
 {
 	int ret;
@@ -803,8 +884,11 @@ static int sbefifo_probe(struct device *dev)
 {
 	struct fsi_device *fsi_dev = to_fsi_dev(dev);
 	struct sbefifo *sbefifo;
+	struct device_node *np;
+	struct platform_device *child;
+	char child_name[32];
 	u32 up, down;
-	int ret;
+	int ret, child_idx = 0;
 
 	dev_dbg(dev, "Found sbefifo device\n");
 	sbefifo = kzalloc(sizeof(*sbefifo), GFP_KERNEL);
@@ -855,6 +939,16 @@ static int sbefifo_probe(struct device *dev)
 		return ret;
 	}
 
+	/* create platform devs for dts child nodes (occ, etc) */
+	for_each_available_child_of_node(dev->of_node, np) {
+		snprintf(child_name, sizeof(child_name), "%s-dev%d",
+			 sbefifo->name, child_idx++);
+		child = of_platform_device_create(np, child_name, dev);
+		if (!child)
+			dev_warn(dev, "failed to create child %s dev\n",
+				 child_name);
+	}
+
 	dev_set_drvdata(dev, sbefifo);
 
 	return 0;
@@ -880,6 +974,7 @@ static int sbefifo_remove(struct device *dev)
 	wake_up_all(&sbefifo->wait);
 
 	misc_deregister(&sbefifo->mdev);
+	device_for_each_child(dev, NULL, sbefifo_unregister_child);
 
 	ida_simple_remove(&sbefifo_ida, sbefifo->idx);
 
diff --git a/include/linux/fsi-sbefifo.h b/include/linux/fsi-sbefifo.h
new file mode 100644
index 0000000..8e55891
--- /dev/null
+++ b/include/linux/fsi-sbefifo.h
@@ -0,0 +1,30 @@
+/*
+ * SBEFIFO FSI Client device driver
+ *
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
+#ifndef LINUX_FSI_SBEFIFO_H
+#define LINUX_FSI_SBEFIFO_H
+
+struct device;
+struct sbefifo_client;
+
+extern struct sbefifo_client *sbefifo_drv_open(struct device *dev,
+					       unsigned long flags);
+extern int sbefifo_drv_read(struct sbefifo_client *client, char *buf,
+			    size_t len);
+extern int sbefifo_drv_write(struct sbefifo_client *client, const char *buf,
+			     size_t len);
+extern void sbefifo_drv_release(struct sbefifo_client *client);
+
+#endif /* LINUX_FSI_SBEFIFO_H */
-- 
1.8.3.1
