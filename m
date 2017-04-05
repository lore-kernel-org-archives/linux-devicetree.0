From: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v5 08/23] drivers/fsi: Set slave SMODE to init communication
Date: Tue,  4 Apr 2017 21:05:52 -0500
Message-ID: <20170405020607.79939-9-cbostic@linux.vnet.ibm.com>
References: <20170405020607.79939-1-cbostic@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170405020607.79939-1-cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Chris Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Chris Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>

Set CFAM to appropriate ID so that the controlling master can manage
link memory ranges.  Add slave engine register definitions.

Includes changes from Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>.

Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Signed-off-by: Chris Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
---
 drivers/fsi/fsi-core.c | 75 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index c705ca2..b7b138b 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -21,6 +21,27 @@
 
 #include "fsi-master.h"
 
+#define FSI_SLAVE_BASE			0x800
+
+/*
+ * FSI slave engine control register offsets
+ */
+#define FSI_SMODE			0x0	/* R/W: Mode register */
+
+/*
+ * SMODE fields
+ */
+#define FSI_SMODE_WSC		0x80000000	/* Warm start done */
+#define FSI_SMODE_ECRC		0x20000000	/* Hw CRC check */
+#define FSI_SMODE_SID_SHIFT	24		/* ID shift */
+#define FSI_SMODE_SID_MASK	3		/* ID Mask */
+#define FSI_SMODE_ED_SHIFT	20		/* Echo delay shift */
+#define FSI_SMODE_ED_MASK	0xf		/* Echo delay mask */
+#define FSI_SMODE_SD_SHIFT	16		/* Send delay shift */
+#define FSI_SMODE_SD_MASK	0xf		/* Send delay mask */
+#define FSI_SMODE_LBCRR_SHIFT	8		/* Clk ratio shift */
+#define FSI_SMODE_LBCRR_MASK	0xf		/* Clk ratio mask */
+
 #define FSI_SLAVE_SIZE_23b		0x800000
 
 static DEFINE_IDA(master_ida);
@@ -117,6 +138,52 @@ static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
 			addr, val, size);
 }
 
+/* Encode slave local bus echo delay */
+static inline uint32_t fsi_smode_echodly(int x)
+{
+	return (x & FSI_SMODE_ED_MASK) << FSI_SMODE_ED_SHIFT;
+}
+
+/* Encode slave local bus send delay */
+static inline uint32_t fsi_smode_senddly(int x)
+{
+	return (x & FSI_SMODE_SD_MASK) << FSI_SMODE_SD_SHIFT;
+}
+
+/* Encode slave local bus clock rate ratio */
+static inline uint32_t fsi_smode_lbcrr(int x)
+{
+	return (x & FSI_SMODE_LBCRR_MASK) << FSI_SMODE_LBCRR_SHIFT;
+}
+
+/* Encode slave ID */
+static inline uint32_t fsi_smode_sid(int x)
+{
+	return (x & FSI_SMODE_SID_MASK) << FSI_SMODE_SID_SHIFT;
+}
+
+static const uint32_t fsi_slave_smode(int id)
+{
+	return FSI_SMODE_WSC | FSI_SMODE_ECRC
+		| fsi_smode_sid(id)
+		| fsi_smode_echodly(0xf) | fsi_smode_senddly(0xf)
+		| fsi_smode_lbcrr(0x8);
+}
+
+static int fsi_slave_set_smode(struct fsi_master *master, int link, int id)
+{
+	uint32_t smode;
+
+	/* set our smode register with the slave ID field to 0; this enables
+	 * extended slave addressing
+	 */
+	smode = fsi_slave_smode(id);
+	smode = cpu_to_be32(smode);
+
+	return fsi_master_write(master, link, id, FSI_SLAVE_BASE + FSI_SMODE,
+			&smode, sizeof(smode));
+}
+
 static void fsi_slave_release(struct device *dev)
 {
 	struct fsi_slave *slave = to_fsi_slave(dev);
@@ -155,6 +222,14 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 	dev_info(&master->dev, "fsi: found chip %08x at %02x:%02x:%02x\n",
 			chip_id, master->idx, link, id);
 
+	rc = fsi_slave_set_smode(master, link, id);
+	if (rc) {
+		dev_warn(&master->dev,
+				"can't set smode on slave:%02x:%02x %d\n",
+				link, id, rc);
+		return -ENODEV;
+	}
+
 	/* We can communicate with a slave; create the slave device and
 	 * register.
 	 */
-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
