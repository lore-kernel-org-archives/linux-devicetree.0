Return-Path: <SRS0=hA68=MI=linaro.org=takahiro.akashi@kernel.org>
From: AKASHI Takahiro <takahiro.akashi@linaro.org>
Subject: [PATCH] lib: add missing files from libfdt
Date: Wed, 26 Sep 2018 14:58:03 +0900
Message-Id: <20180926055803.19071-1-takahiro.akashi@linaro.org>
To: robh+dt@kernel.org, frowand.list@gmail.com
Cc: devicetree@vger.kernel.org, AKASHI Takahiro <takahiro.akashi@linaro.org>
List-ID: <devicetree@vger.kernel.org>

There are two files that are part of dtc/libfdt, but don't appear
in lib. This patch fixes it.
Please note that strtoul() used in fdt_overlay.c is now faked using
kstrtoul() (not simple_strtoul() which is obsolute).

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
---
 lib/Makefile        |  2 +-
 lib/fdt_addresses.c |  3 +++
 lib/fdt_overlay.c   | 23 +++++++++++++++++++++++
 3 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 lib/fdt_addresses.c
 create mode 100644 lib/fdt_overlay.c

diff --git a/lib/Makefile b/lib/Makefile
index ca3f7ebb900d..444c82413a3c 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -202,7 +202,7 @@ KASAN_SANITIZE_stackdepot.o := n
 KCOV_INSTRUMENT_stackdepot.o := n
 
 libfdt_files = fdt.o fdt_ro.o fdt_wip.o fdt_rw.o fdt_sw.o fdt_strerror.o \
-	       fdt_empty_tree.o
+	       fdt_empty_tree.o fdt_addresses.o fdt_overlay.o
 $(foreach file, $(libfdt_files), \
 	$(eval CFLAGS_$(file) = -I$(src)/../scripts/dtc/libfdt))
 lib-$(CONFIG_LIBFDT) += $(libfdt_files)
diff --git a/lib/fdt_addresses.c b/lib/fdt_addresses.c
new file mode 100644
index 000000000000..241780d09882
--- /dev/null
+++ b/lib/fdt_addresses.c
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/libfdt_env.h>
+#include "../scripts/dtc/libfdt/fdt_addresses.c"
diff --git a/lib/fdt_overlay.c b/lib/fdt_overlay.c
new file mode 100644
index 000000000000..1def7268d313
--- /dev/null
+++ b/lib/fdt_overlay.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/kernel.h>
+#include <linux/libfdt_env.h>
+
+static unsigned long strtoul(const char *nptr, char **endptr, int base)
+{
+	unsigned long res;
+	int ret;
+
+	/*
+	 * FIXME: no way to return a correct value of endptr.
+	 * The values here would be still good for use in fdt_overlay
+	 */
+	*endptr = (char *)nptr;
+	ret = kstrtoul(nptr, base, &res);
+	if (ret < 0)
+		return ULONG_MAX;
+
+	(*endptr)++;
+	return res;
+}
+
+#include "../scripts/dtc/libfdt/fdt_overlay.c"
-- 
2.18.0
