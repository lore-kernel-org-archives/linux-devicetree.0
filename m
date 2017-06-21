From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux 2/4] drivers/fsi/sbefifo: Add in-kernel API
Date: Wed, 21 Jun 2017 14:37:59 -0500
Message-ID: <1498073881-3207-3-git-send-email-eajames@linux.vnet.ibm.com>
References: <1498073881-3207-1-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1498073881-3207-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, bradleyb@fuzziesquirrel.com, jk@ozlabs.org, cbostic@linux.vnet.ibm.com, joel@jms.id.au, andrew@aj.id.au, eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
List-Id: devicetree@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Refactor the user interface of the SBEFIFO driver to allow for an
in-kernel read/write API. Add exported functions for other drivers to
call, and add an include file with those functions. Also parse the
device tree for child nodes and create child platform devices
accordingly.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-sbefifo.c   | 141 +++++++++++++++++++++++++++++++++++++-------
 include/linux/fsi-sbefifo.h |  30 ++++++++++
 2 files changed, 150 insertions(+), 21 deletions(-)
 create mode 100644 include/linux/fsi-sbefifo.h

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index fca277c..1038f6c 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -15,9 +15,12 @@
 #include <linux/errno.h>
 #include <linux/idr.h>
 #include <linux/fsi.h>
+#include <linux/fsi-sbefifo.h>
 #include <linux/list.h>
 #include <linux/miscdevice.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/poll.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
@@ -82,6 +85,7 @@ struct sbefifo_client {
 	struct list_head xfrs;
 	struct sbefifo *dev;
 	struct kref kref;
+	unsigned long f_flags;
 };
 
 static struct list_head sbefifo_fifos;
@@ -509,6 +513,7 @@ static int sbefifo_open(struct inode *inode, struct file *file)
 		return -ENOMEM;
 
 	file->private_data = client;
+	client->f_flags = file->f_flags;
 
 	return 0;
 }
@@ -533,19 +538,18 @@ static unsigned int sbefifo_poll(struct file *file, poll_table *wait)
 	return mask;
 }
 
-static ssize_t sbefifo_read(struct file *file, char __user *buf, size_t len,
-			    loff_t *offset)
+static ssize_t sbefifo_read_common(struct sbefifo_client *client,
+				   char __user *ubuf, char *kbuf, size_t len)
 {
-	struct sbefifo_client *client = file->private_data;
 	struct sbefifo *sbefifo = client->dev;
 	struct sbefifo_xfr *xfr;
-	ssize_t ret = 0;
 	size_t n;
+	ssize_t ret = 0;
 
 	if ((len >> 2) << 2 != len)
 		return -EINVAL;
 
-	if ((file->f_flags & O_NONBLOCK) && !sbefifo_xfr_rsp_pending(client))
+	if ((client->f_flags & O_NONBLOCK) && !sbefifo_xfr_rsp_pending(client))
 		return -EAGAIN;
 
 	sbefifo_get_client(client);
@@ -564,10 +568,13 @@ static ssize_t sbefifo_read(struct file *file, char __user *buf, size_t len,
 
 	n = min_t(size_t, n, len);
 
-	if (copy_to_user(buf, READ_ONCE(client->rbuf.rpos), n)) {
-		sbefifo_put_client(client);
-		return -EFAULT;
-	}
+	if (ubuf) {
+		if (copy_to_user(ubuf, READ_ONCE(client->rbuf.rpos), n)) {
+			sbefifo_put_client(client);
+			return -EFAULT;
+		}
+	} else
+		memcpy(kbuf, READ_ONCE(client->rbuf.rpos), n);
 
 	if (sbefifo_buf_readnb(&client->rbuf, n)) {
 		xfr = sbefifo_client_next_xfr(client);
@@ -590,10 +597,18 @@ static ssize_t sbefifo_read(struct file *file, char __user *buf, size_t len,
 	return n;
 }
 
-static ssize_t sbefifo_write(struct file *file, const char __user *buf,
-			     size_t len, loff_t *offset)
+static ssize_t sbefifo_read(struct file *file, char __user *buf, size_t len,
+			    loff_t *offset)
 {
 	struct sbefifo_client *client = file->private_data;
+
+	return sbefifo_read_common(client, buf, NULL, len);
+}
+
+static ssize_t sbefifo_write_common(struct sbefifo_client *client,
+				    const char __user *ubuf, const char *kbuf,
+				    size_t len)
+{
 	struct sbefifo *sbefifo = client->dev;
 	struct sbefifo_buf *wbuf = &client->wbuf;
 	struct sbefifo_xfr *xfr;
@@ -611,7 +626,7 @@ static ssize_t sbefifo_write(struct file *file, const char __user *buf,
 	spin_lock_irq(&sbefifo->lock);
 	xfr = sbefifo_next_xfr(sbefifo);
 
-	if ((file->f_flags & O_NONBLOCK) && xfr && n < len) {
+	if ((client->f_flags & O_NONBLOCK) && xfr && n < len) {
 		spin_unlock_irq(&sbefifo->lock);
 		return -EAGAIN;
 	}
@@ -650,18 +665,24 @@ static ssize_t sbefifo_write(struct file *file, const char __user *buf,
 
 		n = min_t(size_t, n, len);
 
-		if (copy_from_user(READ_ONCE(wbuf->wpos), buf, n)) {
-			set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
-			sbefifo_get(sbefifo);
-			if (mod_timer(&sbefifo->poll_timer, jiffies))
-				sbefifo_put(sbefifo);
-			sbefifo_put_client(client);
-			return -EFAULT;
+		if (ubuf) {
+			if (copy_from_user(READ_ONCE(wbuf->wpos), ubuf, n)) {
+				set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
+				sbefifo_get(sbefifo);
+				if (mod_timer(&sbefifo->poll_timer, jiffies))
+					sbefifo_put(sbefifo);
+				sbefifo_put_client(client);
+				return -EFAULT;
+			}
+
+			ubuf += n;
+		} else {
+			memcpy(READ_ONCE(wbuf->wpos), kbuf, n);
+			kbuf += n;
 		}
 
 		sbefifo_buf_wrotenb(wbuf, n);
 		len -= n;
-		buf += n;
 		ret += n;
 
 		/*
@@ -678,6 +699,14 @@ static ssize_t sbefifo_write(struct file *file, const char __user *buf,
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
@@ -697,12 +726,68 @@ static int sbefifo_release(struct inode *inode, struct file *file)
 	.release	= sbefifo_release,
 };
 
+struct sbefifo_client *sbefifo_drv_open(struct device *dev,
+					unsigned long flags)
+{
+	struct sbefifo_client *client = NULL;
+	struct sbefifo *sbefifo;
+	struct fsi_device *fsi_dev = to_fsi_dev(dev);
+
+	list_for_each_entry(sbefifo, &sbefifo_fifos, link) {
+		if (sbefifo->fsi_dev != fsi_dev)
+			continue;
+
+		client = sbefifo_new_client(sbefifo);
+		if (client)
+			client->f_flags = flags;
+	}
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
 static int sbefifo_probe(struct device *dev)
 {
 	struct fsi_device *fsi_dev = to_fsi_dev(dev);
 	struct sbefifo *sbefifo;
+	struct device_node *np;
+	struct platform_device *child;
+	char child_name[32];
 	u32 sts;
-	int ret;
+	int ret, child_idx = 0;
 
 	sbefifo = kzalloc(sizeof(*sbefifo), GFP_KERNEL);
 	if (!sbefifo)
@@ -749,6 +834,18 @@ static int sbefifo_probe(struct device *dev)
 
 	list_add(&sbefifo->link, &sbefifo_fifos);
 
+	if (dev->of_node) {
+		/* create platform devs for dts child nodes (occ, etc) */
+		for_each_child_of_node(dev->of_node, np) {
+			snprintf(child_name, sizeof(child_name), "%s-dev%d",
+				 sbefifo->name, child_idx++);
+			child = of_platform_device_create(np, child_name, dev);
+			if (!child)
+				dev_warn(&sbefifo->fsi_dev->dev,
+					 "failed to create child node dev\n");
+		}
+	}
+
 	return misc_register(&sbefifo->mdev);
 }
 
@@ -762,6 +859,8 @@ static int sbefifo_remove(struct device *dev)
 		if (sbefifo->fsi_dev != fsi_dev)
 			continue;
 
+		device_for_each_child(dev, NULL, sbefifo_unregister_child);
+
 		misc_deregister(&sbefifo->mdev);
 		list_del(&sbefifo->link);
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
