Return-Path: <SRS0=+tgD=QP=bgdev.pl=brgl@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 22/33] irqchip: davinci-cp-intc: add a new config structure
Date: Fri,  8 Feb 2019 18:31:43 +0100
Message-Id: <20190208173154.4665-23-brgl@bgdev.pl>
In-Reply-To: <20190208173154.4665-1-brgl@bgdev.pl>
References: <20190208173154.4665-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner --to=David Lechner <tglx@linutronix.dedavid>, lechnology.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-ID: <devicetree@vger.kernel.org>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add a config structure that will be used by cp-intc-based platforms.
It contains the register range resource and the number of interrupts.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/linux/irqchip/irq-davinci-cp-intc.h | 23 +++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 include/linux/irqchip/irq-davinci-cp-intc.h

diff --git a/include/linux/irqchip/irq-davinci-cp-intc.h b/include/linux/irqchip/irq-davinci-cp-intc.h
new file mode 100644
index 000000000000..2270a6167b98
--- /dev/null
+++ b/include/linux/irqchip/irq-davinci-cp-intc.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2019 Texas Instruments
+ */
+
+#ifndef _LINUX_IRQ_DAVINCI_CP_INTC_
+#define _LINUX_IRQ_DAVINCI_CP_INTC_
+
+#include <linux/ioport.h>
+
+/**
+ * struct davinci_cp_intc_config - configuration data for davinci-cp-intc
+ *                                 driver.
+ *
+ * @reg: register range to map
+ * @num_irqs: number of HW interrupts supported by the controller
+ */
+struct davinci_cp_intc_config {
+	struct resource reg;
+	unsigned int num_irqs;
+};
+
+#endif /* _LINUX_IRQ_DAVINCI_CP_INTC_ */
-- 
2.20.1
