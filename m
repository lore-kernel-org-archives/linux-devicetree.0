From: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 04/18] drivers/fsi: Add fsi master definition
Date: Wed,  1 Feb 2017 10:53:44 -0600
Message-ID: <20170201165358.45415-5-cbostic@linux.vnet.ibm.com>
References: <20170201165358.45415-1-cbostic@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170201165358.45415-1-cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org
Cc: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Chris Bostic <cbostic-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>

Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Signed-off-by: Chris Bostic <cbostic-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
---
 drivers/fsi/fsi-core.c   | 28 ++++++++++++++++++++++++++++
 drivers/fsi/fsi-master.h | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 drivers/fsi/fsi-master.h

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 3d55bd5..c7469fe 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -16,6 +16,34 @@
 #include <linux/device.h>
 #include <linux/fsi.h>
 #include <linux/module.h>
+#include <linux/idr.h>
+
+#include "fsi-master.h"
+
+static DEFINE_IDA(master_ida);
+
+/* FSI master support */
+
+int fsi_master_register(struct fsi_master *master)
+{
+	if (!master || !master->dev)
+		return -EINVAL;
+
+	master->idx = ida_simple_get(&master_ida, 0, 0, GFP_KERNEL);
+	get_device(master->dev);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fsi_master_register);
+
+void fsi_master_unregister(struct fsi_master *master)
+{
+	if (!master || !master->dev)
+		return;
+
+	ida_simple_remove(&master_ida, master->idx);
+	put_device(master->dev);
+}
+EXPORT_SYMBOL_GPL(fsi_master_unregister);
 
 /* FSI core & Linux bus type definitions */
 
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
new file mode 100644
index 0000000..e75a810
--- /dev/null
+++ b/drivers/fsi/fsi-master.h
@@ -0,0 +1,37 @@
+/*
+ * FSI master definitions. These comprise the core <--> master interface,
+ * to allow the core to interact with the (hardware-specific) masters.
+ *
+ * Copyright (C) IBM Corporation 2016
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef DRIVERS_FSI_MASTER_H
+#define DRIVERS_FSI_MASTER_H
+
+#include <linux/device.h>
+
+struct fsi_master {
+	struct device	*dev;
+	int		idx;
+	int		n_links;
+	int		(*read)(struct fsi_master *, int link,
+				uint8_t slave, uint32_t addr,
+				void *val, size_t size);
+	int		(*write)(struct fsi_master *, int link,
+				uint8_t slave, uint32_t addr,
+				const void *val, size_t size);
+};
+
+extern int fsi_master_register(struct fsi_master *master);
+extern void fsi_master_unregister(struct fsi_master *master);
+
+#endif /* DRIVERS_FSI_MASTER_H */
-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
