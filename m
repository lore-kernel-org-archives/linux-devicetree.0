From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v6 6/7] drivers/i2c: Add I2C master locking to FSI algorithm
Date: Thu, 16 Nov 2017 13:53:51 -0600
Message-ID: <1510862032-12394-7-git-send-email-eajames@linux.vnet.ibm.com>
References: <1510862032-12394-1-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <1510862032-12394-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-i2c-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, wsa@the-dreams.de, robh+dt@kernel.org, joel@jms.id.au, eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
List-Id: devicetree@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Since there are many ports per master, each with it's own adapter and
chardev, we need some locking to prevent transfers from changing the
master state while other transfers are in progress.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 43 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 5c312ef..1751c44 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -20,7 +20,9 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/sched.h>
+#include <linux/semaphore.h>
 #include <linux/spinlock.h>
+#include <linux/wait.h>
 
 #define FSI_ENGID_I2C		0x7
 
@@ -144,6 +146,8 @@ struct fsi_i2c_master {
 	struct fsi_device	*fsi;
 	u8			fifo_size;
 	struct list_head	ports;
+	wait_queue_head_t	wait;
+	struct semaphore	lock;
 	spinlock_t		reset_lock;
 };
 
@@ -178,6 +182,29 @@ static int fsi_i2c_write_reg(struct fsi_device *fsi, unsigned int reg,
 	return fsi_device_write(fsi, reg, &data_be, sizeof(data_be));
 }
 
+static int fsi_i2c_lock_master(struct fsi_i2c_master *i2c, int timeout)
+{
+	int rc;
+
+	rc = down_trylock(&i2c->lock);
+	if (!rc)
+		return 0;
+
+	rc = wait_event_interruptible_timeout(i2c->wait,
+					      !down_trylock(&i2c->lock),
+					      timeout);
+	if (rc > 0)
+		return 0;
+
+	return -EBUSY;
+}
+
+static void fsi_i2c_unlock_master(struct fsi_i2c_master *i2c)
+{
+	up(&i2c->lock);
+	wake_up(&i2c->wait);
+}
+
 static int fsi_i2c_dev_init(struct fsi_i2c_master *i2c)
 {
 	int rc;
@@ -611,25 +638,31 @@ static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	struct fsi_i2c_port *port = adap->algo_data;
 	struct i2c_msg *msg;
 
-	rc = fsi_i2c_set_port(port);
+	rc = fsi_i2c_lock_master(port->master, adap->timeout);
 	if (rc)
 		return rc;
 
+	rc = fsi_i2c_set_port(port);
+	if (rc)
+		goto unlock;
+
 	for (i = 0; i < num; ++i) {
 		msg = msgs + i;
 		start_time = jiffies;
 
 		rc = fsi_i2c_start(port, msg, i == num - 1);
 		if (rc)
-			return rc;
+			goto unlock;
 
 		rc = fsi_i2c_wait(port, msg,
 				  adap->timeout - (jiffies - start_time));
 		if (rc)
-			return rc;
+			goto unlock;
 	}
 
-	return 0;
+unlock:
+	fsi_i2c_unlock_master(port->master);
+	return rc;
 }
 
 static u32 fsi_i2c_functionality(struct i2c_adapter *adap)
@@ -655,6 +688,8 @@ static int fsi_i2c_probe(struct device *dev)
 	if (!i2c)
 		return -ENOMEM;
 
+	init_waitqueue_head(&i2c->wait);
+	sema_init(&i2c->lock, 1);
 	spin_lock_init(&i2c->reset_lock);
 	i2c->fsi = to_fsi_dev(dev);
 	INIT_LIST_HEAD(&i2c->ports);
-- 
1.8.3.1
