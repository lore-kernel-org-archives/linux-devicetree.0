From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v5 7/8] drivers/fsi: occ: Add miscdevice
Date: Mon, 20 Nov 2017 13:46:56 -0600
Message-ID: <1511207217-14075-8-git-send-email-eajames@linux.vnet.ibm.com>
References: <1511207217-14075-1-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1511207217-14075-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com, joel@jms.id.au, eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
List-Id: devicetree@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Add a miscdevice for the occ to allow userspace access through standard
file operations.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-occ.c | 264 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 264 insertions(+)

diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index 99dbfa3..1aeb67d 100644
--- a/drivers/fsi/fsi-occ.c
+++ b/drivers/fsi/fsi-occ.c
@@ -16,6 +16,7 @@
 #include <linux/idr.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
+#include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
@@ -40,6 +41,7 @@ struct occ {
 	struct device *sbefifo;
 	char name[32];
 	int idx;
+	struct miscdevice mdev;
 	struct list_head xfrs;
 	spinlock_t list_lock;		/* lock access to the xfrs list */
 	struct mutex occ_lock;		/* lock access to the hardware */
@@ -113,6 +115,29 @@ struct occ_client {
 
 static DEFINE_IDA(occ_ida);
 
+static int occ_enqueue_xfr(struct occ_xfr *xfr)
+{
+	int empty;
+	unsigned long flags;
+	struct occ_client *client = to_client(xfr);
+	struct occ *occ = client->occ;
+
+	if (occ->cancel)
+		return -ENODEV;
+
+	spin_lock_irqsave(&occ->list_lock, flags);
+
+	empty = list_empty(&occ->xfrs);
+	list_add_tail(&xfr->link, &occ->xfrs);
+
+	spin_unlock_irqrestore(&occ->list_lock, flags);
+
+	if (empty)
+		queue_work(occ_wq, &occ->work);
+
+	return 0;
+}
+
 static void occ_get_client(struct occ_client *client)
 {
 	kref_get(&client->kref);
@@ -131,6 +156,230 @@ static void occ_put_client(struct occ_client *client)
 	kref_put(&client->kref, occ_client_release);
 }
 
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
+	kref_init(&client->kref);
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
+static inline bool occ_read_ready(struct occ_xfr *xfr, struct occ *occ)
+{
+	return test_bit(XFR_COMPLETE, &xfr->flags) ||
+		test_bit(XFR_CANCELED, &xfr->flags) || occ->cancel;
+}
+
+static ssize_t occ_read(struct file *file, char __user *buf, size_t len,
+			loff_t *offset)
+{
+	int rc;
+	unsigned long flags;
+	size_t bytes;
+	struct occ_xfr *xfr;
+	struct occ *occ;
+	struct occ_client *client = file->private_data;
+
+	if (!client)
+		return -ENODEV;
+
+	if (len > OCC_SRAM_BYTES)
+		return -EINVAL;
+
+	occ_get_client(client);
+	xfr = &client->xfr;
+	occ = client->occ;
+
+	spin_lock_irqsave(&client->lock, flags);
+
+	if (!test_bit(CLIENT_XFR_PENDING, &client->flags)) {
+		/* we just finished reading all data, return 0 */
+		if (client->read_offset) {
+			rc = 0;
+			client->read_offset = 0;
+		} else {
+			rc = -ENOMSG;
+		}
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
+		spin_unlock_irqrestore(&client->lock, flags);
+
+		rc = wait_event_interruptible(client->wait,
+					      occ_read_ready(xfr, occ));
+
+		spin_lock_irqsave(&client->lock, flags);
+
+		if (!test_bit(XFR_COMPLETE, &xfr->flags)) {
+			if (occ->cancel || test_bit(XFR_CANCELED, &xfr->flags))
+				rc = -ENODEV;
+			else
+				rc = -EINTR;
+
+			goto done;
+		}
+	}
+
+	if (xfr->rc) {
+		rc = xfr->rc;
+		goto done;
+	}
+
+	bytes = min(len, xfr->resp_data_length - client->read_offset);
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
+	spin_unlock_irqrestore(&client->lock, flags);
+	occ_put_client(client);
+	return rc;
+}
+
+static ssize_t occ_write(struct file *file, const char __user *buf,
+			 size_t len, loff_t *offset)
+{
+	int rc;
+	unsigned long flags;
+	unsigned int i;
+	u16 data_length, checksum = 0;
+	struct occ_xfr *xfr;
+	struct occ_client *client = file->private_data;
+
+	if (!client)
+		return -ENODEV;
+
+	if (len > (OCC_CMD_DATA_BYTES + 3) || len < 3)
+		return -EINVAL;
+
+	occ_get_client(client);
+	xfr = &client->xfr;
+
+	spin_lock_irqsave(&client->lock, flags);
+
+	if (test_bit(CLIENT_XFR_PENDING, &client->flags)) {
+		rc = -EBUSY;
+		goto done;
+	}
+
+	memset(xfr, 0, sizeof(*xfr));	/* clear out the transfer */
+	xfr->buf[0] = 1;		/* occ sequence number */
+
+	/*
+	 * Assume user data follows the occ command format.
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
+
+	rc = occ_enqueue_xfr(xfr);
+	if (rc)
+		goto done;
+
+	set_bit(CLIENT_XFR_PENDING, &client->flags);
+	rc = len;
+
+done:
+	spin_unlock_irqrestore(&client->lock, flags);
+	occ_put_client(client);
+	return rc;
+}
+
+static int occ_release(struct inode *inode, struct file *file)
+{
+	unsigned long flags;
+	struct occ *occ;
+	struct occ_xfr *xfr;
+	struct occ_client *client = file->private_data;
+
+	if (!client)
+		return -ENODEV;
+
+	xfr = &client->xfr;
+	occ = client->occ;
+
+	spin_lock_irqsave(&client->lock, flags);
+
+	set_bit(XFR_CANCELED, &xfr->flags);
+	if (!test_bit(CLIENT_XFR_PENDING, &client->flags))
+		goto done;
+
+	spin_lock(&occ->list_lock);
+
+	if (!test_bit(XFR_IN_PROGRESS, &xfr->flags)) {
+		/* already deleted from list if complete */
+		if (!test_bit(XFR_COMPLETE, &xfr->flags))
+			list_del(&xfr->link);
+	}
+
+	spin_unlock(&occ->list_lock);
+
+	wake_up_all(&client->wait);
+
+done:
+	spin_unlock_irqrestore(&client->lock, flags);
+
+	occ_put_client(client);
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
 static int occ_write_sbefifo(struct sbefifo_client *client, const char *buf,
 			     ssize_t len)
 {
@@ -450,6 +699,19 @@ static int occ_probe(struct platform_device *pdev)
 		occ->idx = ida_simple_get(&occ_ida, 1, INT_MAX, GFP_KERNEL);
 	}
 
+	snprintf(occ->name, sizeof(occ->name), "occ%d", occ->idx);
+	occ->mdev.fops = &occ_fops;
+	occ->mdev.minor = MISC_DYNAMIC_MINOR;
+	occ->mdev.name = occ->name;
+	occ->mdev.parent = dev;
+
+	rc = misc_register(&occ->mdev);
+	if (rc) {
+		dev_err(dev, "failed to register miscdevice: %d\n", rc);
+		ida_simple_remove(&occ_ida, occ->idx);
+		return rc;
+	}
+
 	platform_set_drvdata(pdev, occ);
 
 	return 0;
@@ -471,6 +733,8 @@ static int occ_remove(struct platform_device *pdev)
 	}
 	spin_unlock_irqrestore(&occ->list_lock, flags);
 
+	misc_deregister(&occ->mdev);
+
 	cancel_work_sync(&occ->work);
 
 	ida_simple_remove(&occ_ida, occ->idx);
-- 
1.8.3.1
