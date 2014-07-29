From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 1/6] dt: bindings: Supply shared ST IRQ defines
Date: Tue, 29 Jul 2014 15:05:39 +0100
Message-ID: <1406642744-22589-2-git-send-email-lee.jones@linaro.org>
References: <1406642744-22589-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406642744-22589-1-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: lee.jones@linaro.org, kernel@stlinux.com, tglx@linutronix.de, jason@lakedaemon.net, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

These defines are used to allow values used for configuration to be
easily human readable and will lessen the chance of logical mistakes.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
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
+ *  Author: Lee Jones <lee.jones@linaro.org>
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
