From: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 01/18] drivers/fsi: Add empty fsi bus definitions
Date: Wed,  1 Feb 2017 10:53:41 -0600
Message-ID: <20170201165358.45415-2-cbostic@linux.vnet.ibm.com>
References: <20170201165358.45415-1-cbostic@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170201165358.45415-1-cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org
Cc: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Chris Bostic <cbostic-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>

This change adds the initial (empty) fsi bus definition, and introduces
drivers/fsi/.

Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Signed-off-by: Chris Bostic <cbostic-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
---
 drivers/Kconfig        |  2 ++
 drivers/Makefile       |  1 +
 drivers/fsi/Kconfig    | 12 ++++++++++++
 drivers/fsi/Makefile   |  2 ++
 drivers/fsi/fsi-core.c | 38 ++++++++++++++++++++++++++++++++++++++
 include/linux/fsi.h    | 22 ++++++++++++++++++++++
 6 files changed, 77 insertions(+)
 create mode 100644 drivers/fsi/Kconfig
 create mode 100644 drivers/fsi/Makefile
 create mode 100644 drivers/fsi/fsi-core.c
 create mode 100644 include/linux/fsi.h

diff --git a/drivers/Kconfig b/drivers/Kconfig
index e1e2066..117ca14c 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -202,4 +202,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
 
 source "drivers/fpga/Kconfig"
 
+source "drivers/fsi/Kconfig"
+
 endmenu
diff --git a/drivers/Makefile b/drivers/Makefile
index f0afdfb..126e109 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -173,3 +173,4 @@ obj-$(CONFIG_STM)		+= hwtracing/stm/
 obj-$(CONFIG_ANDROID)		+= android/
 obj-$(CONFIG_NVMEM)		+= nvmem/
 obj-$(CONFIG_FPGA)		+= fpga/
+obj-$(CONFIG_FSI)		+= fsi/
diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
new file mode 100644
index 0000000..04c1a0e
--- /dev/null
+++ b/drivers/fsi/Kconfig
@@ -0,0 +1,12 @@
+#
+# FSI subsystem
+#
+
+menu "FSI support"
+
+config FSI
+	tristate "FSI support"
+	---help---
+	  FSI - the FRU Support Interface - is a simple bus for low-level
+	  access to POWER-based hardware.
+endmenu
diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
new file mode 100644
index 0000000..db0e5e7
--- /dev/null
+++ b/drivers/fsi/Makefile
@@ -0,0 +1,2 @@
+
+obj-$(CONFIG_FSI) += fsi-core.o
diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
new file mode 100644
index 0000000..3e45306
--- /dev/null
+++ b/drivers/fsi/fsi-core.c
@@ -0,0 +1,38 @@
+/*
+ * FSI core driver
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
+#include <linux/device.h>
+#include <linux/fsi.h>
+#include <linux/module.h>
+
+/* FSI core & Linux bus type definitions */
+
+struct bus_type fsi_bus_type = {
+	.name		= "fsi",
+};
+EXPORT_SYMBOL_GPL(fsi_bus_type);
+
+static int fsi_init(void)
+{
+	return bus_register(&fsi_bus_type);
+}
+
+static void fsi_exit(void)
+{
+	bus_unregister(&fsi_bus_type);
+}
+
+module_init(fsi_init);
+module_exit(fsi_exit);
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
new file mode 100644
index 0000000..47aa181
--- /dev/null
+++ b/include/linux/fsi.h
@@ -0,0 +1,22 @@
+/* FSI device & driver interfaces
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
+#ifndef LINUX_FSI_H
+#define LINUX_FSI_H
+
+#include <linux/device.h>
+
+extern struct bus_type fsi_bus_type;
+
+#endif /* LINUX_FSI_H */
-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
