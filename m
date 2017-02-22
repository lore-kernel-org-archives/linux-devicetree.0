From: thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Subject: [PATCHv2 2/5] dt-bindings: reset: a10sr: Add Arria10 SR Reset Controller offsets
Date: Wed, 22 Feb 2017 11:10:16 -0600
Message-ID: <1487783419-10912-3-git-send-email-thor.thayer@linux.intel.com>
References: <1487783419-10912-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487783419-10912-1-git-send-email-thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

The Arria10 System Resource Chip reset controller handles the
Arria10 peripheral PHYs. This patch adds the offsets for
these PHYs.

Signed-off-by: Thor Thayer <thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
v2  Add NUM_RESETs to altr,rst-mgr-a10sr.h for maximum count.
---
 MAINTAINERS                                    |  1 +
 include/dt-bindings/reset/altr,rst-mgr-a10sr.h | 33 ++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 include/dt-bindings/reset/altr,rst-mgr-a10sr.h

diff --git a/MAINTAINERS b/MAINTAINERS
index b9af886..4b714bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -654,6 +654,7 @@ S:	Maintained
 F:	drivers/gpio/gpio-altera-a10sr.c
 F:	drivers/mfd/altera-a10sr.c
 F:	include/linux/mfd/altera-a10sr.h
+F:	include/dt-bindings/reset/altr,rst-mgr-a10sr.h
 
 ALTERA TRIPLE SPEED ETHERNET DRIVER
 M:	Vince Bridgers <vbridger-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
diff --git a/include/dt-bindings/reset/altr,rst-mgr-a10sr.h b/include/dt-bindings/reset/altr,rst-mgr-a10sr.h
new file mode 100644
index 0000000..9855925
--- /dev/null
+++ b/include/dt-bindings/reset/altr,rst-mgr-a10sr.h
@@ -0,0 +1,33 @@
+/*
+ *  Copyright Intel Corporation (C) 2017. All Rights Reserved
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ *
+ * Reset binding definitions for Altera Arria10 MAX5 System Resource Chip
+ *
+ * Adapted from altr,rst-mgr-a10.h
+ */
+
+#ifndef _DT_BINDINGS_RESET_ALTR_RST_MGR_A10SR_H
+#define _DT_BINDINGS_RESET_ALTR_RST_MGR_A10SR_H
+
+/* Peripheral PHY resets */
+#define A10SR_RESET_ENET_HPS	0
+#define A10SR_RESET_PCIE	1
+#define A10SR_RESET_FILE	2
+#define A10SR_RESET_BQSPI	3
+#define A10SR_RESET_USB		4
+
+#define A10SR_RESET_NUM		5
+
+#endif
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
