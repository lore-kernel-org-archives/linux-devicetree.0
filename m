From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v4 3/4] drivers/fsi: sbefifo: Add miscdevice
Date: Fri, 17 Nov 2017 13:34:33 -0600
Message-ID: <1510947274-7519-4-git-send-email-eajames@linux.vnet.ibm.com>
References: <1510947274-7519-1-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1510947274-7519-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com, joel@jms.id.au, eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
List-Id: devicetree@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Add a miscdevice for the sbefifo to allow userspace access through
standard file operations.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-sbefifo.c | 354 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 354 insertions(+)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index 2439958..9970e2d 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -19,6 +19,7 @@
 #include <linux/kernel.h>
 #include <linux/kref.h>
 #include <linux/list.h>
+#include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/poll.h>
 #include <linux/sched.h>
@@ -54,6 +55,7 @@
 struct sbefifo {
 	struct timer_list poll_timer;
 	struct fsi_device *fsi_dev;
+	struct miscdevice mdev;
 	wait_queue_head_t wait;
 	struct list_head xfrs;
 	struct kref kref;
@@ -256,6 +258,99 @@ static void sbefifo_put(struct sbefifo *sbefifo)
 	kref_put(&sbefifo->kref, sbefifo_free);
 }
 
+static struct sbefifo_xfr *sbefifo_enq_xfr(struct sbefifo_client *client)
+{
+	struct sbefifo *sbefifo = client->dev;
+	struct sbefifo_xfr *xfr;
+
+	if (READ_ONCE(sbefifo->rc))
+		return ERR_PTR(sbefifo->rc);
+
+	xfr = kzalloc(sizeof(*xfr), GFP_KERNEL);
+	if (!xfr)
+		return ERR_PTR(-ENOMEM);
+
+	xfr->rbuf = &client->rbuf;
+	xfr->wbuf = &client->wbuf;
+	list_add_tail(&xfr->xfrs, &sbefifo->xfrs);
+	list_add_tail(&xfr->client, &client->xfrs);
+
+	return xfr;
+}
+
+static bool sbefifo_xfr_rsp_pending(struct sbefifo_client *client)
+{
+	struct sbefifo_xfr *xfr = list_first_entry_or_null(&client->xfrs,
+							   struct sbefifo_xfr,
+							   client);
+
+	if (xfr && test_bit(SBEFIFO_XFR_RESP_PENDING, &xfr->flags))
+		return true;
+
+	return false;
+}
+
+static struct sbefifo_client *sbefifo_new_client(struct sbefifo *sbefifo)
+{
+	struct sbefifo_client *client;
+
+	client = kzalloc(sizeof(*client), GFP_KERNEL);
+	if (!client)
+		return NULL;
+
+	kref_init(&client->kref);
+	client->dev = sbefifo;
+	sbefifo_buf_init(&client->rbuf);
+	sbefifo_buf_init(&client->wbuf);
+	INIT_LIST_HEAD(&client->xfrs);
+
+	sbefifo_get(sbefifo);
+
+	return client;
+}
+
+static void sbefifo_client_release(struct kref *kref)
+{
+	struct sbefifo *sbefifo;
+	struct sbefifo_client *client;
+	struct sbefifo_xfr *xfr, *tmp;
+
+	client = container_of(kref, struct sbefifo_client, kref);
+	sbefifo = client->dev;
+
+	if (!READ_ONCE(sbefifo->rc)) {
+		list_for_each_entry_safe(xfr, tmp, &client->xfrs, client) {
+			if (test_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags)) {
+				list_del(&xfr->client);
+				kfree(xfr);
+				continue;
+			}
+
+			/*
+			 * The client left with pending or running xfrs.
+			 * Cancel them.
+			 */
+			set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
+			sbefifo_get(sbefifo);
+			if (mod_timer(&client->dev->poll_timer, jiffies))
+				sbefifo_put(sbefifo);
+		}
+	}
+
+	sbefifo_put(sbefifo);
+	kfree(client);
+}
+
+static void sbefifo_get_client(struct sbefifo_client *client)
+{
+	kref_get(&client->kref);
+}
+
+static void sbefifo_put_client(struct sbefifo_client *client)
+{
+	kref_put(&client->kref, sbefifo_client_release);
+}
+
 static struct sbefifo_xfr *sbefifo_next_xfr(struct sbefifo *sbefifo)
 {
 	struct sbefifo_xfr *xfr, *tmp;
@@ -429,6 +524,251 @@ static void sbefifo_poll_timer(unsigned long data)
 	spin_unlock(&sbefifo->lock);
 }
 
+static int sbefifo_open(struct inode *inode, struct file *file)
+{
+	struct sbefifo *sbefifo = container_of(file->private_data,
+					       struct sbefifo, mdev);
+	struct sbefifo_client *client;
+	int ret;
+
+	ret = READ_ONCE(sbefifo->rc);
+	if (ret)
+		return ret;
+
+	client = sbefifo_new_client(sbefifo);
+	if (!client)
+		return -ENOMEM;
+
+	file->private_data = client;
+
+	return 0;
+}
+
+static unsigned int sbefifo_poll(struct file *file, poll_table *wait)
+{
+	struct sbefifo_client *client = file->private_data;
+	struct sbefifo *sbefifo = client->dev;
+	unsigned int mask = 0;
+
+	poll_wait(file, &sbefifo->wait, wait);
+
+	if (READ_ONCE(sbefifo->rc))
+		mask |= POLLERR;
+
+	if (sbefifo_buf_nbreadable(&client->rbuf))
+		mask |= POLLIN;
+
+	if (sbefifo_buf_nbwriteable(&client->wbuf))
+		mask |= POLLOUT;
+
+	return mask;
+}
+
+static bool sbefifo_read_ready(struct sbefifo *sbefifo,
+			       struct sbefifo_client *client, size_t *n,
+			       size_t *ret)
+{
+	struct sbefifo_xfr *xfr = list_first_entry_or_null(&client->xfrs,
+							   struct sbefifo_xfr,
+							   client);
+
+	*n = sbefifo_buf_nbreadable(&client->rbuf);
+	*ret = READ_ONCE(sbefifo->rc);
+
+	return *ret || *n ||
+		(xfr && test_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags));
+}
+
+static ssize_t sbefifo_read(struct file *file, char __user *buf, size_t len,
+			    loff_t *offset)
+{
+	struct sbefifo_client *client = file->private_data;
+	struct sbefifo *sbefifo = client->dev;
+	struct sbefifo_xfr *xfr;
+	size_t n;
+	ssize_t ret = 0;
+
+	if ((len >> 2) << 2 != len)
+		return -EINVAL;
+
+	if ((file->f_flags & O_NONBLOCK) && !sbefifo_xfr_rsp_pending(client))
+		return -EAGAIN;
+
+	sbefifo_get_client(client);
+	if (wait_event_interruptible(sbefifo->wait,
+				     sbefifo_read_ready(sbefifo, client, &n,
+							&ret))) {
+		ret = -ERESTARTSYS;
+		goto out;
+	}
+
+	if (ret) {
+		INIT_LIST_HEAD(&client->xfrs);
+		goto out;
+	}
+
+	n = min_t(size_t, n, len);
+
+	if (copy_to_user(buf, READ_ONCE(client->rbuf.rpos), n)) {
+		ret = -EFAULT;
+		goto out;
+	}
+
+	if (sbefifo_buf_readnb(&client->rbuf, n)) {
+		xfr = list_first_entry_or_null(&client->xfrs,
+					       struct sbefifo_xfr, client);
+		if (!xfr) {
+			/* should be impossible to not have an xfr here */
+			WARN_ONCE(1, "no xfr in queue");
+			ret = -EPROTO;
+			goto out;
+		}
+
+		if (!test_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags)) {
+			/* Fill the read buffer back up. */
+			sbefifo_get(sbefifo);
+			if (mod_timer(&client->dev->poll_timer, jiffies))
+				sbefifo_put(sbefifo);
+		} else {
+			list_del(&xfr->client);
+			kfree(xfr);
+			wake_up_interruptible(&sbefifo->wait);
+		}
+	}
+
+	ret = n;
+
+out:
+	sbefifo_put_client(client);
+	return ret;
+}
+
+static bool sbefifo_write_ready(struct sbefifo *sbefifo,
+				struct sbefifo_xfr *xfr,
+				struct sbefifo_client *client, size_t *n)
+{
+	struct sbefifo_xfr *next = list_first_entry_or_null(&client->xfrs,
+							    struct sbefifo_xfr,
+							    client);
+
+	*n = sbefifo_buf_nbwriteable(&client->wbuf);
+	return READ_ONCE(sbefifo->rc) || (next == xfr && *n);
+}
+
+static ssize_t sbefifo_write(struct file *file, const char __user *buf,
+			     size_t len, loff_t *offset)
+{
+	struct sbefifo_client *client = file->private_data;
+	struct sbefifo *sbefifo = client->dev;
+	struct sbefifo_xfr *xfr;
+	ssize_t ret = 0;
+	size_t n;
+
+	if ((len >> 2) << 2 != len)
+		return -EINVAL;
+
+	if (!len)
+		return 0;
+
+	sbefifo_get_client(client);
+	n = sbefifo_buf_nbwriteable(&client->wbuf);
+
+	spin_lock_irq(&sbefifo->lock);
+	xfr = sbefifo_next_xfr(sbefifo);	/* next xfr to be executed */
+
+	if ((file->f_flags & O_NONBLOCK) && xfr && n < len) {
+		spin_unlock_irq(&sbefifo->lock);
+		ret = -EAGAIN;
+		goto out;
+	}
+
+	xfr = sbefifo_enq_xfr(client);		/* this xfr queued up */
+	if (IS_ERR(xfr)) {
+		spin_unlock_irq(&sbefifo->lock);
+		ret = PTR_ERR(xfr);
+		goto out;
+	}
+
+	spin_unlock_irq(&sbefifo->lock);
+
+	/*
+	 * Partial writes are not really allowed in that EOT is sent exactly
+	 * once per write.
+	 */
+	while (len) {
+		if (wait_event_interruptible(sbefifo->wait,
+					     sbefifo_write_ready(sbefifo, xfr,
+								 client,
+								 &n))) {
+			set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
+			sbefifo_get(sbefifo);
+			if (mod_timer(&sbefifo->poll_timer, jiffies))
+				sbefifo_put(sbefifo);
+
+			ret = -ERESTARTSYS;
+			goto out;
+		}
+
+		if (sbefifo->rc) {
+			INIT_LIST_HEAD(&client->xfrs);
+			ret = sbefifo->rc;
+			goto out;
+		}
+
+		n = min_t(size_t, n, len);
+
+		if (copy_from_user(READ_ONCE(client->wbuf.wpos), buf, n)) {
+			set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
+			sbefifo_get(sbefifo);
+			if (mod_timer(&sbefifo->poll_timer, jiffies))
+				sbefifo_put(sbefifo);
+			ret = -EFAULT;
+			goto out;
+		}
+
+		buf += n;
+
+		sbefifo_buf_wrotenb(&client->wbuf, n);
+		len -= n;
+		ret += n;
+
+		/*
+		 * Set this before starting timer to avoid race condition on
+		 * this flag with the timer function writer.
+		 */
+		if (!len)
+			set_bit(SBEFIFO_XFR_WRITE_DONE, &xfr->flags);
+
+		/* Drain the write buffer. */
+		sbefifo_get(sbefifo);
+		if (mod_timer(&client->dev->poll_timer, jiffies))
+			sbefifo_put(sbefifo);
+	}
+
+out:
+	sbefifo_put_client(client);
+	return ret;
+}
+
+static int sbefifo_release(struct inode *inode, struct file *file)
+{
+	struct sbefifo_client *client = file->private_data;
+	struct sbefifo *sbefifo = client->dev;
+
+	sbefifo_put_client(client);
+
+	return READ_ONCE(sbefifo->rc);
+}
+
+static const struct file_operations sbefifo_fops = {
+	.owner		= THIS_MODULE,
+	.open		= sbefifo_open,
+	.read		= sbefifo_read,
+	.write		= sbefifo_write,
+	.poll		= sbefifo_poll,
+	.release	= sbefifo_release,
+};
+
 static int sbefifo_request_reset(struct sbefifo *sbefifo)
 {
 	int ret;
@@ -503,6 +843,18 @@ static int sbefifo_probe(struct device *dev)
 	setup_timer(&sbefifo->poll_timer, sbefifo_poll_timer,
 		    (unsigned long)sbefifo);
 
+	sbefifo->mdev.minor = MISC_DYNAMIC_MINOR;
+	sbefifo->mdev.fops = &sbefifo_fops;
+	sbefifo->mdev.name = sbefifo->name;
+	sbefifo->mdev.parent = dev;
+	ret = misc_register(&sbefifo->mdev);
+	if (ret) {
+		dev_err(dev, "failed to register miscdevice: %d\n", ret);
+		ida_simple_remove(&sbefifo_ida, sbefifo->idx);
+		sbefifo_put(sbefifo);
+		return ret;
+	}
+
 	dev_set_drvdata(dev, sbefifo);
 
 	return 0;
@@ -527,6 +879,8 @@ static int sbefifo_remove(struct device *dev)
 
 	wake_up_all(&sbefifo->wait);
 
+	misc_deregister(&sbefifo->mdev);
+
 	ida_simple_remove(&sbefifo_ida, sbefifo->idx);
 
 	if (del_timer_sync(&sbefifo->poll_timer))
-- 
1.8.3.1
