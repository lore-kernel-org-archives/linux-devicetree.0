From: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 07/18] drivers/fsi: Add FSI crc calculators to library
Date: Wed,  1 Feb 2017 10:53:47 -0600
Message-ID: <20170201165358.45415-8-cbostic@linux.vnet.ibm.com>
References: <20170201165358.45415-1-cbostic@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170201165358.45415-1-cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org
Cc: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Chris Bostic <cbostic-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>

Add some helpers for the crc checks for the slave configuration table.
This works 4-bits-at-a-time, using a simple table approach.

We will need this in the FSI core code, as well as any master
implementations that need to calculate CRCs in software.

Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Signed-off-by: Chris Bostic <cbostic-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
---
 include/linux/crc-fsi.h | 29 +++++++++++++++++++++++++++++
 lib/Makefile            |  1 +
 lib/crc-fsi.c           | 39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+)
 create mode 100644 include/linux/crc-fsi.h
 create mode 100644 lib/crc-fsi.c

diff --git a/include/linux/crc-fsi.h b/include/linux/crc-fsi.h
new file mode 100644
index 0000000..e96d2f0
--- /dev/null
+++ b/include/linux/crc-fsi.h
@@ -0,0 +1,29 @@
+/*
+ * FSI CRC calculator
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
+ *
+ *
+ * Implements the standard FSI CRC:
+ *
+ *   Width 1 - 32
+ *   Poly  0x0017 (x^4 + x^2 + x^1 + x^0)
+ */
+
+#ifndef CRC_FSI_H
+#define CRC_FSI_H
+
+#include <linux/types.h>
+
+uint8_t crc_fsi(uint8_t c, uint64_t x, int bits);
+
+#endif /* CRC_FSI_H */
diff --git a/lib/Makefile b/lib/Makefile
index 50144a3..c840628 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -230,3 +230,4 @@ obj-$(CONFIG_UBSAN) += ubsan.o
 UBSAN_SANITIZE_ubsan.o := n
 
 obj-$(CONFIG_SBITMAP) += sbitmap.o
+obj-$(CONFIG_FSI) += crc-fsi.o
diff --git a/lib/crc-fsi.c b/lib/crc-fsi.c
new file mode 100644
index 0000000..55cfe9d
--- /dev/null
+++ b/lib/crc-fsi.c
@@ -0,0 +1,39 @@
+/*
+ * FSI CRC calculator
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
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/crc-fsi.h>
+
+/* crc helpers */
+static const uint8_t crc_fsi_tab[] = {
+	0x0, 0x7, 0xe, 0x9, 0xb, 0xc, 0x5, 0x2,
+	0x1, 0x6, 0xf, 0x8, 0xa, 0xd, 0x4, 0x3,
+};
+
+uint8_t crc_fsi(uint8_t c, uint64_t x, int bits)
+{
+	int i;
+
+	/* Align to 4-bits */
+	bits = (bits + 3) & ~0x3;
+
+	/* Calculate crc4 over four-bit nibbles, starting at the MSbit */
+	for (i = bits; i >= 0; i -= 4)
+		c = crc_fsi_tab[c ^ ((x >> i) & 0xf)];
+
+	return c;
+}
+EXPORT_SYMBOL_GPL(crc_fsi);
-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
