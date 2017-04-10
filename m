From: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v6 11/23] drivers/fsi: Add master unscan
Date: Mon, 10 Apr 2017 14:46:54 -0500
Message-ID: <20170410194706.64280-12-cbostic@linux.vnet.ibm.com>
References: <20170410194706.64280-1-cbostic@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170410194706.64280-1-cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Chris Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Chris Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>

Allow a master to undo a previous scan.  Should a master scan a bus
twice it will need to ensure it doesn't double register any
previously detected device.

Signed-off-by: Chris Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
---
 drivers/fsi/fsi-core.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 4da0b030..75d2a88 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -69,6 +69,7 @@ struct fsi_slave {
 	uint32_t		size;	/* size of slave address space */
 };
 
+#define to_fsi_master(d) container_of(d, struct fsi_master, dev)
 #define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
 
 static int fsi_master_read(struct fsi_master *master, int link,
@@ -491,6 +492,37 @@ static int fsi_master_scan(struct fsi_master *master)
 	return 0;
 }
 
+static int __fsi_slave_remove_device(struct device *dev, void *arg)
+{
+	device_unregister(dev);
+	return 0;
+}
+
+static int __fsi_master_remove_slave(struct device *dev, void *arg)
+{
+	device_for_each_child(dev, NULL, __fsi_slave_remove_device);
+	device_unregister(dev);
+	return 0;
+}
+
+static void fsi_master_unscan(struct fsi_master *master)
+{
+	device_for_each_child(&master->dev, NULL, __fsi_master_remove_slave);
+}
+
+static ssize_t master_rescan_store(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t count)
+{
+	struct fsi_master *master = to_fsi_master(dev);
+
+	fsi_master_unscan(master);
+	fsi_master_scan(master);
+
+	return count;
+}
+
+static DEVICE_ATTR(rescan, 0200, NULL, master_rescan_store);
+
 int fsi_master_register(struct fsi_master *master)
 {
 	int rc;
@@ -507,7 +539,15 @@ int fsi_master_register(struct fsi_master *master)
 		return rc;
 	}
 
+	rc = device_create_file(&master->dev, &dev_attr_rescan);
+	if (rc) {
+		device_unregister(&master->dev);
+		ida_simple_remove(&master_ida, master->idx);
+		return rc;
+	}
+
 	fsi_master_scan(master);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(fsi_master_register);
-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
