From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 2/3] uapi: jnx: Export board types to user space
Date: Fri,  7 Oct 2016 18:15:24 +0300
Message-ID: <1475853325-21796-3-git-send-email-pantelis.antoniou@konsulko.com>
References: <1475853325-21796-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1475853325-21796-1-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Debjit Ghosh <dghosh@juniper.net>, Guenter Roeck <linux@roeck-us.net>, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, Mohammad Kamil <mkamil@juniper.net>, Rajat Jain <rajatjain@juniper.net>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Guenter Roeck <groeck@juniper.net>

Board type definitions are part of the kernel/user ABI and
thus need to be exported.

Signed-off-by: Guenter Roeck <groeck@juniper.net>
Signed-off-by: Mohammad Kamil <mkamil@juniper.net>
[Ported from Juniper kernel]
Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 include/uapi/linux/Kbuild           |  1 +
 include/uapi/linux/jnx/Kbuild       |  2 ++
 include/uapi/linux/jnx/jnx-subsys.h | 38 +++++++++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 include/uapi/linux/jnx/Kbuild
 create mode 100644 include/uapi/linux/jnx/jnx-subsys.h

diff --git a/include/uapi/linux/Kbuild b/include/uapi/linux/Kbuild
index d0352a9..3c83af1 100644
--- a/include/uapi/linux/Kbuild
+++ b/include/uapi/linux/Kbuild
@@ -8,6 +8,7 @@ header-y += hdlc/
 header-y += hsi/
 header-y += iio/
 header-y += isdn/
+header-y += jnx/
 header-y += mmc/
 header-y += nfsd/
 header-y += raid/
diff --git a/include/uapi/linux/jnx/Kbuild b/include/uapi/linux/jnx/Kbuild
new file mode 100644
index 0000000..bd1ddc6
--- /dev/null
+++ b/include/uapi/linux/jnx/Kbuild
@@ -0,0 +1,2 @@
+# UAPI Header export list
+header-y += jnx-subsys.h
diff --git a/include/uapi/linux/jnx/jnx-subsys.h b/include/uapi/linux/jnx/jnx-subsys.h
new file mode 100644
index 0000000..5bb9ea8
--- /dev/null
+++ b/include/uapi/linux/jnx/jnx-subsys.h
@@ -0,0 +1,38 @@
+/*
+ * Juniper board type definitions
+ *
+ * These definitions are needed by user-space applications.
+ *
+ * Copyright (C) 2012-2014 Juniper Networks. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _UAPI_JNX_SUBSYS_H
+#define _UAPI_JNX_SUBSYS_H
+
+/*
+ * Juniper Board Type Definitions
+ */
+#define JNX_BOARD_TYPE_UNKNOWN	0
+#define JNX_BOARD_TYPE_RE	1
+#define JNX_BOARD_TYPE_FPC	2
+#define JNX_BOARD_TYPE_SPMB	3
+#define JNX_BOARD_TYPE_CB	4
+#define JNX_BOARD_TYPE_PS	5
+#define JNX_BOARD_TYPE_FAN	6
+#define JNX_BOARD_TYPE_FPM	7
+#define JNX_BOARD_TYPE_CG	8
+#define JNX_BOARD_TYPE_MIDPLANE	9
+#define JNX_BOARD_TYPE_PIC	10
+#define JNX_BOARD_TYPE_SIB	11
+
+#endif /* _UAPI_JNX_SUBSYS_H */
-- 
1.9.1
