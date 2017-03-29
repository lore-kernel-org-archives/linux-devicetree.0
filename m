From: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v4 15/23] drivers/fsi: expose direct-access slave API
Date: Wed, 29 Mar 2017 12:43:32 -0500
Message-ID: <20170329174340.89109-16-cbostic@linux.vnet.ibm.com>
References: <20170329174340.89109-1-cbostic@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170329174340.89109-1-cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, Chris Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>

Allow drivers to access the slave address ranges.

Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Signed-off-by: Chris Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
 drivers/fsi/fsi-core.c | 26 ++++++++++++++++++++------
 include/linux/fsi.h    | 12 ++++++++++++
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index f0f0556..f7e55e7 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -76,10 +76,6 @@ static int fsi_master_read(struct fsi_master *master, int link,
 		uint8_t slave_id, uint32_t addr, void *val, size_t size);
 static int fsi_master_write(struct fsi_master *master, int link,
 		uint8_t slave_id, uint32_t addr, const void *val, size_t size);
-static int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
-		void *val, size_t size);
-static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
-		const void *val, size_t size);
 
 /* FSI endpoint-device support */
 
@@ -181,7 +177,7 @@ static int fsi_slave_calc_addr(struct fsi_slave *slave, uint32_t *addrp,
 	return 0;
 }
 
-static int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
+int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
 			void *val, size_t size)
 {
 	uint8_t id = slave->id;
@@ -195,7 +191,7 @@ static int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
 			addr, val, size);
 }
 
-static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
+int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
 			const void *val, size_t size)
 {
 	uint8_t id = slave->id;
@@ -209,6 +205,24 @@ static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
 			addr, val, size);
 }
 
+extern int fsi_slave_claim_range(struct fsi_slave *slave,
+		uint32_t addr, uint32_t size)
+{
+	if (addr + size < addr)
+		return -EINVAL;
+
+	if (addr + size > slave->size)
+		return -EINVAL;
+
+	/* todo: check for overlapping claims */
+	return 0;
+}
+
+extern void fsi_slave_release_range(struct fsi_slave *slave,
+		uint32_t addr, uint32_t size)
+{
+}
+
 static int fsi_slave_scan(struct fsi_slave *slave)
 {
 	uint32_t engine_addr;
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index 34f1e9a..141fd38 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -66,6 +66,18 @@ struct fsi_driver {
 		module_driver(__fsi_driver, fsi_driver_register, \
 				fsi_driver_unregister)
 
+/* direct slave API */
+extern int fsi_slave_claim_range(struct fsi_slave *slave,
+		uint32_t addr, uint32_t size);
+extern void fsi_slave_release_range(struct fsi_slave *slave,
+		uint32_t addr, uint32_t size);
+extern int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
+		void *val, size_t size);
+extern int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
+		const void *val, size_t size);
+
+
+
 extern struct bus_type fsi_bus_type;
 
 #endif /* LINUX_FSI_H */
-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
