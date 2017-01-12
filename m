From: christopher.lee.bostic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH v2 08/18] drivers/fsi: Implement slave initialisation
Date: Thu, 12 Jan 2017 16:29:04 -0600
Message-ID: <1484260144-79428-1-git-send-email-christopher.lee.bostic@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org
Cc: Chris Bostic <cbostic-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>

Create fsi_slave devices during the master scan.

Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Signed-off-by: Chris Bostic <cbostic-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
---
 drivers/fsi/fsi-core.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 5f9f7a9..931bcba 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -17,10 +17,15 @@
 #include <linux/fsi.h>
 #include <linux/module.h>
 #include <linux/idr.h>
+#include <linux/crc-fsi.h>
+#include <linux/slab.h>
 
 #include "fsi-master.h"
 
 #define FSI_N_SLAVES	4
+#define FSI_SLAVE_CONF_CRC_SHIFT        4
+#define FSI_SLAVE_CONF_CRC_MASK         0x0000000f
+#define FSI_SLAVE_CONF_DATA_BITS        28
 
 static DEFINE_IDA(master_ida);
 
@@ -34,12 +39,59 @@ struct fsi_slave {
 #define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
 
 /* FSI slave support */
+
+static void fsi_slave_release(struct device *dev)
+{
+	struct fsi_slave *slave = to_fsi_slave(dev);
+
+	kfree(slave);
+}
+
 static int fsi_slave_init(struct fsi_master *master,
 		int link, uint8_t slave_id)
 {
-	/* todo: initialise slave device, perform engine scan */
+	struct fsi_slave *slave;
+	uint32_t chip_id;
+	int rc;
+	uint8_t crc;
+
+	rc = master->read(master, link, slave_id, 0, &chip_id, sizeof(chip_id));
+	if (rc) {
+		dev_warn(master->dev, "can't read slave %02x:%02x: %d\n",
+				link, slave_id, rc);
+		return -ENODEV;
+	}
+	crc = crc_fsi(0, chip_id >> FSI_SLAVE_CONF_CRC_SHIFT,
+			FSI_SLAVE_CONF_DATA_BITS);
+	if (crc != (chip_id & FSI_SLAVE_CONF_CRC_MASK)) {
+		dev_warn(master->dev, "slave %02x:%02x invalid chip id CRC!\n",
+				link, slave_id);
+		return -EIO;
+	}
+
+	pr_debug("fsi: found chip %08x at %02x:%02x:%02x\n",
+			master->idx, chip_id, link, slave_id);
+
+	/* we can communicate with a slave; create devices and scan */
+	slave = kzalloc(sizeof(*slave), GFP_KERNEL);
+	if (!slave)
+		return -ENOMEM;
+
+	slave->master = master;
+	slave->id = slave_id;
+	slave->dev.parent = master->dev;
+	slave->dev.release = fsi_slave_release;
+
+	dev_set_name(&slave->dev, "slave@%02x:%02x", link, slave_id);
+	rc = device_register(&slave->dev);
+	if (rc < 0) {
+		dev_warn(master->dev, "failed to create slave device: %d\n",
+				rc);
+		put_device(&slave->dev);
+		return rc;
+	}
 
-	return -ENODEV;
+	return rc;
 }
 
 /* FSI master support */
-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
