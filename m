From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 RESEND 1/8] dt: bindings: Supply shared ST IRQ defines
Date: Thu, 22 Jan 2015 09:48:46 +0000
Message-ID: <1421920133-7914-2-git-send-email-lee.jones@linaro.org>
References: <1421920133-7914-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421920133-7914-1-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

These defines are used to allow values used for configuration to be
easily human readable and will lessen the chance of logical mistakes.

Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 include/dt-bindings/interrupt-controller/irq-st.h | 30 +++++++++++++++=
++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 include/dt-bindings/interrupt-controller/irq-st.h

diff --git a/include/dt-bindings/interrupt-controller/irq-st.h b/includ=
e/dt-bindings/interrupt-controller/irq-st.h
new file mode 100644
index 0000000..4c59ace
--- /dev/null
+++ b/include/dt-bindings/interrupt-controller/irq-st.h
@@ -0,0 +1,30 @@
+/*
+ *  include/linux/irqchip/irq-st.h
+ *
+ *  Copyright (C) 2014 STMicroelectronics =E2=80=93 All Rights Reserve=
d
+ *
+ *  Author: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_ST_H
+#define _DT_BINDINGS_INTERRUPT_CONTROLLER_ST_H
+
+#define ST_IRQ_SYSCFG_EXT_0		0
+#define ST_IRQ_SYSCFG_EXT_1		1
+#define ST_IRQ_SYSCFG_EXT_2		2
+#define ST_IRQ_SYSCFG_CTI_0		3
+#define ST_IRQ_SYSCFG_CTI_1		4
+#define ST_IRQ_SYSCFG_PMU_0		5
+#define ST_IRQ_SYSCFG_PMU_1		6
+#define ST_IRQ_SYSCFG_pl310_L2		7
+#define ST_IRQ_SYSCFG_DISABLED		0xFFFFFFFF
+
+#define ST_IRQ_SYSCFG_EXT_1_INV		0x1
+#define ST_IRQ_SYSCFG_EXT_2_INV		0x2
+#define ST_IRQ_SYSCFG_EXT_3_INV		0x4
+
+#endif
--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
