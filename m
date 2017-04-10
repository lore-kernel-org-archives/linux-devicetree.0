From: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v6 05/23] drivers/fsi: Add slave & master read/write APIs
Date: Mon, 10 Apr 2017 14:46:48 -0500
Message-ID: <20170410194706.64280-6-cbostic@linux.vnet.ibm.com>
References: <20170410194706.64280-1-cbostic@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170410194706.64280-1-cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, Chris Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>

Introduce functions to perform reads/writes on the slave address space;
these simply pass the request on the slave's master with the correct
link and slave ID.

We implement these on top of similar helpers for the master.

Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Signed-off-by: Chris Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
 drivers/fsi/fsi-core.c | 92 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 4bbca95..32698ed 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -32,6 +32,11 @@ struct fsi_slave {
 
 #define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
 
+static int fsi_master_read(struct fsi_master *master, int link,
+		uint8_t slave_id, uint32_t addr, void *val, size_t size);
+static int fsi_master_write(struct fsi_master *master, int link,
+		uint8_t slave_id, uint32_t addr, const void *val, size_t size);
+
 /* crc helpers */
 static const uint8_t crc4_tab[] = {
 	0x0, 0x7, 0xe, 0x9, 0xb, 0xc, 0x5, 0x2,
@@ -57,6 +62,58 @@ uint8_t fsi_crc4(uint8_t c, uint64_t x, int bits)
 EXPORT_SYMBOL_GPL(fsi_crc4);
 
 /* FSI slave support */
+static int fsi_slave_calc_addr(struct fsi_slave *slave, uint32_t *addrp,
+		uint8_t *idp)
+{
+	uint32_t addr = *addrp;
+	uint8_t id = *idp;
+
+	if (addr > slave->size)
+		return -EINVAL;
+
+	/* For 23 bit addressing, we encode the extra two bits in the slave
+	 * id (and the slave's actual ID needs to be 0).
+	 */
+	if (addr > 0x1fffff) {
+		if (slave->id != 0)
+			return -EINVAL;
+		id = (addr >> 21) & 0x3;
+		addr &= 0x1fffff;
+	}
+
+	*addrp = addr;
+	*idp = id;
+	return 0;
+}
+
+static int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
+			void *val, size_t size)
+{
+	uint8_t id = slave->id;
+	int rc;
+
+	rc = fsi_slave_calc_addr(slave, &addr, &id);
+	if (rc)
+		return rc;
+
+	return fsi_master_read(slave->master, slave->link, id,
+			addr, val, size);
+}
+
+static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
+			const void *val, size_t size)
+{
+	uint8_t id = slave->id;
+	int rc;
+
+	rc = fsi_slave_calc_addr(slave, &addr, &id);
+	if (rc)
+		return rc;
+
+	return fsi_master_write(slave->master, slave->link, id,
+			addr, val, size);
+}
+
 static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 {
 	/* todo: initialise slave device, perform engine scan */
@@ -65,6 +122,41 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 }
 
 /* FSI master support */
+static int fsi_check_access(uint32_t addr, size_t size)
+{
+	if (size != 1 && size != 2 && size != 4)
+		return -EINVAL;
+
+	if ((addr & 0x3) != (size & 0x3))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int fsi_master_read(struct fsi_master *master, int link,
+		uint8_t slave_id, uint32_t addr, void *val, size_t size)
+{
+	int rc;
+
+	rc = fsi_check_access(addr, size);
+	if (rc)
+		return rc;
+
+	return master->read(master, link, slave_id, addr, val, size);
+}
+
+static int fsi_master_write(struct fsi_master *master, int link,
+		uint8_t slave_id, uint32_t addr, const void *val, size_t size)
+{
+	int rc;
+
+	rc = fsi_check_access(addr, size);
+	if (rc)
+		return rc;
+
+	return master->write(master, link, slave_id, addr, val, size);
+}
+
 static int fsi_master_scan(struct fsi_master *master)
 {
 	int link;
-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
