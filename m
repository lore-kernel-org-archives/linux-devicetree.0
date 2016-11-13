From: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v5 1/3] soc: Support for NPS HW scheduling
Date: Sun, 13 Nov 2016 09:24:30 +0200
Message-ID: <1479021872-14237-2-git-send-email-noamca@mellanox.com>
References: <1479021872-14237-1-git-send-email-noamca@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479021872-14237-1-git-send-email-noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>

This new header file is for NPS400 SoC (part of ARC architecture).
The header file includes macros for save/restore of HW scheduling.
The control of HW scheduling is achieved by writing core registers.
This code was moved from arc/plat-eznps so it can be used
from drivers/clocksource/, available only for CONFIG_EZNPS_MTM_EXT.

Signed-off-by: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
---
 arch/arc/plat-eznps/include/plat/ctop.h |    2 -
 include/soc/nps/mtm.h                   |   59 +++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+), 2 deletions(-)
 create mode 100644 include/soc/nps/mtm.h

diff --git a/arch/arc/plat-eznps/include/plat/ctop.h b/arch/arc/plat-eznps/include/plat/ctop.h
index 9d6718c..ee2e32d 100644
--- a/arch/arc/plat-eznps/include/plat/ctop.h
+++ b/arch/arc/plat-eznps/include/plat/ctop.h
@@ -46,9 +46,7 @@
 #define CTOP_AUX_UDMC				(CTOP_AUX_BASE + 0x300)
 
 /* EZchip core instructions */
-#define CTOP_INST_HWSCHD_OFF_R3			0x3B6F00BF
 #define CTOP_INST_HWSCHD_OFF_R4			0x3C6F00BF
-#define CTOP_INST_HWSCHD_RESTORE_R3		0x3E6F70C3
 #define CTOP_INST_HWSCHD_RESTORE_R4		0x3E6F7103
 #define CTOP_INST_SCHD_RW			0x3E6F7004
 #define CTOP_INST_SCHD_RD			0x3E6F7084
diff --git a/include/soc/nps/mtm.h b/include/soc/nps/mtm.h
new file mode 100644
index 0000000..d2f5e7e
--- /dev/null
+++ b/include/soc/nps/mtm.h
@@ -0,0 +1,59 @@
+/*
+ * Copyright (c) 2016, Mellanox Technologies. All rights reserved.
+ *
+ * This software is available to you under a choice of one of two
+ * licenses.  You may choose to be licensed under the terms of the GNU
+ * General Public License (GPL) Version 2, available from the file
+ * COPYING in the main directory of this source tree, or the
+ * OpenIB.org BSD license below:
+ *
+ *     Redistribution and use in source and binary forms, with or
+ *     without modification, are permitted provided that the following
+ *     conditions are met:
+ *
+ *      - Redistributions of source code must retain the above
+ *        copyright notice, this list of conditions and the following
+ *        disclaimer.
+ *
+ *      - Redistributions in binary form must reproduce the above
+ *        copyright notice, this list of conditions and the following
+ *        disclaimer in the documentation and/or other materials
+ *        provided with the distribution.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
+ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
+ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ * SOFTWARE.
+ */
+
+#ifndef SOC_NPS_MTM_H
+#define SOC_NPS_MTM_H
+
+#define CTOP_INST_HWSCHD_OFF_R3                 0x3B6F00BF
+#define CTOP_INST_HWSCHD_RESTORE_R3             0x3E6F70C3
+
+static inline void hw_schd_save(unsigned int *flags)
+{
+	__asm__ __volatile__(
+	"       .word %1\n"
+	"       st r3,[%0]\n"
+	:
+	: "r"(flags), "i"(CTOP_INST_HWSCHD_OFF_R3)
+	: "r3", "memory");
+}
+
+static inline void hw_schd_restore(unsigned int flags)
+{
+	__asm__ __volatile__(
+	"       mov r3, %0\n"
+	"       .word %1\n"
+	:
+	: "r"(flags), "i"(CTOP_INST_HWSCHD_RESTORE_R3)
+	: "r3");
+}
+
+#endif /* SOC_NPS_MTM_H */
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
