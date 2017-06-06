From: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v8 07/24] drivers/fsi: Implement slave initialisation
Date: Tue,  6 Jun 2017 16:08:42 -0500
Message-ID: <20170606210859.80431-8-cbostic@linux.vnet.ibm.com>
References: <20170606210859.80431-1-cbostic@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170606210859.80431-1-cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>

Implement fsi_slave_init: if we can read a chip ID, create fsi_slave
devices and register with the driver core.

Includes changes from Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>.

Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Signed-off-by: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
---
 drivers/fsi/Kconfig    |  1 +
 drivers/fsi/fsi-core.c | 67 ++++++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
index 04c1a0e..e1006c6 100644
--- a/drivers/fsi/Kconfig
+++ b/drivers/fsi/Kconfig
@@ -6,6 +6,7 @@ menu "FSI support"
 
 config FSI
 	tristate "FSI support"
+	select CRC4
 	---help---
 	  FSI - the FRU Support Interface - is a simple bus for low-level
 	  access to POWER-based hardware.
diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 235f17a..9d9adc1 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -13,13 +13,17 @@
  * GNU General Public License for more details.
  */
 
+#include <linux/crc4.h>
 #include <linux/device.h>
 #include <linux/fsi.h>
 #include <linux/idr.h>
 #include <linux/module.h>
+#include <linux/slab.h>
 
 #include "fsi-master.h"
 
+#define FSI_SLAVE_SIZE_23b		0x800000
+
 static DEFINE_IDA(master_ida);
 
 struct fsi_slave {
@@ -90,11 +94,70 @@ static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
 			addr, val, size);
 }
 
+static void fsi_slave_release(struct device *dev)
+{
+	struct fsi_slave *slave = to_fsi_slave(dev);
+
+	kfree(slave);
+}
+
 static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 {
-	/* todo: initialise slave device, perform engine scan */
+	struct fsi_slave *slave;
+	uint32_t chip_id;
+	uint8_t crc;
+	int rc;
+
+	/* Currently, we only support single slaves on a link, and use the
+	 * full 23-bit address range
+	 */
+	if (id != 0)
+		return -EINVAL;
+
+	rc = fsi_master_read(master, link, id, 0, &chip_id, sizeof(chip_id));
+	if (rc) {
+		dev_dbg(&master->dev, "can't read slave %02x:%02x %d\n",
+				link, id, rc);
+		return -ENODEV;
+	}
+	chip_id = be32_to_cpu(chip_id);
+
+	crc = crc4(0, chip_id, 32);
+	if (crc) {
+		dev_warn(&master->dev, "slave %02x:%02x invalid chip id CRC!\n",
+				link, id);
+		return -EIO;
+	}
+
+	dev_info(&master->dev, "fsi: found chip %08x at %02x:%02x:%02x\n",
+			chip_id, master->idx, link, id);
+
+	/* We can communicate with a slave; create the slave device and
+	 * register.
+	 */
+	slave = kzalloc(sizeof(*slave), GFP_KERNEL);
+	if (!slave)
+		return -ENOMEM;
+
+	slave->master = master;
+	slave->dev.parent = &master->dev;
+	slave->dev.release = fsi_slave_release;
+	slave->link = link;
+	slave->id = id;
+	slave->size = FSI_SLAVE_SIZE_23b;
+
+	dev_set_name(&slave->dev, "slave@%02x:%02x", link, id);
+	rc = device_register(&slave->dev);
+	if (rc < 0) {
+		dev_warn(&master->dev, "failed to create slave device: %d\n",
+				rc);
+		put_device(&slave->dev);
+		return rc;
+	}
+
+	/* todo: perform engine scan */
 
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
