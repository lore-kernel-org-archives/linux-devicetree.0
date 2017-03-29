From: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v4 01/23] drivers/fsi: Add fsi master definition
Date: Wed, 29 Mar 2017 12:43:18 -0500
Message-ID: <20170329174340.89109-2-cbostic@linux.vnet.ibm.com>
References: <20170329174340.89109-1-cbostic@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170329174340.89109-1-cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, Chris Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>

Add a `struct fsi_master` to represent a FSI master controller.

FSI master drivers register one of these structs to provide
device-specific of the standard operations: read/write/term/break and
link control.

Includes changes from Edward A. James <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org> & Jeremy Kerr
<jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>.

Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Signed-off-by: Chris Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
---
 drivers/fsi/fsi-core.c   | 35 +++++++++++++++++++++++++++++++++++
 drivers/fsi/fsi-master.h | 41 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 drivers/fsi/fsi-master.h

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 3d55bd5..ca02913 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -15,8 +15,43 @@
 
 #include <linux/device.h>
 #include <linux/fsi.h>
+#include <linux/idr.h>
 #include <linux/module.h>
 
+#include "fsi-master.h"
+
+static DEFINE_IDA(master_ida);
+
+/* FSI master support */
+int fsi_master_register(struct fsi_master *master)
+{
+	int rc;
+
+	if (!master)
+		return -EINVAL;
+
+	master->idx = ida_simple_get(&master_ida, 0, INT_MAX, GFP_KERNEL);
+	dev_set_name(&master->dev, "fsi%d", master->idx);
+
+	rc = device_register(&master->dev);
+	if (rc)
+		ida_simple_remove(&master_ida, master->idx);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(fsi_master_register);
+
+void fsi_master_unregister(struct fsi_master *master)
+{
+	if (master->idx >= 0) {
+		ida_simple_remove(&master_ida, master->idx);
+		master->idx = -1;
+	}
+
+	device_unregister(&master->dev);
+}
+EXPORT_SYMBOL_GPL(fsi_master_unregister);
+
 /* FSI core & Linux bus type definitions */
 
 static int fsi_bus_match(struct device *dev, struct device_driver *drv)
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
new file mode 100644
index 0000000..7764b00
--- /dev/null
+++ b/drivers/fsi/fsi-master.h
@@ -0,0 +1,41 @@
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
+	struct device	dev;
+	int		idx;
+	int		n_links;
+	int		flags;
+	int		(*read)(struct fsi_master *, int link, uint8_t id,
+				uint32_t addr, void *val, size_t size);
+	int		(*write)(struct fsi_master *, int link, uint8_t id,
+				uint32_t addr, const void *val, size_t size);
+	int		(*term)(struct fsi_master *, int link, uint8_t id);
+	int		(*send_break)(struct fsi_master *, int link);
+	int		(*link_enable)(struct fsi_master *, int link);
+};
+
+#define dev_to_fsi_master(d) container_of(d, struct fsi_master, dev)
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
