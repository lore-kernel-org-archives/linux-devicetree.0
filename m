From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v5 1/3] mfd: atmel-flexcom: create include file with macros used by DT bindings
Date: Tue, 21 Jul 2015 16:21:36 +0200
Message-ID: <b72f0a5d9e26e79e61eb2ceb9b755919fe7f535b.1437483537.git.cyrille.pitchen@atmel.com>
References: <cover.1437483537.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1437483537.git.cyrille.pitchen@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com, alexandre.belloni@free-electrons.com, sameo@linux.intel.com, lee.jones@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>
List-Id: devicetree@vger.kernel.org

This patch defines some macros to be used as value for the
"atmel,flexcom-mode" DT property. This value is then written into
the Operating Mode (OPMODE) bit field of the Flexcom Mode Register.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 include/dt-bindings/mfd/atmel-flexcom.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 include/dt-bindings/mfd/atmel-flexcom.h

diff --git a/include/dt-bindings/mfd/atmel-flexcom.h b/include/dt-bindings/mfd/atmel-flexcom.h
new file mode 100644
index 000000000000..6728f2851b4d
--- /dev/null
+++ b/include/dt-bindings/mfd/atmel-flexcom.h
@@ -0,0 +1,16 @@
+/*
+ * This header provides macros for Atmel Flexcom DT bindings.
+ *
+ * Copyright (C) 2015 Cyrille Pitchen <cyrille.pitchen@atmel.com>
+ *
+ * GPLv2 only
+ */
+
+#ifndef __DT_BINDINGS_ATMEL_FLEXCOM_H__
+#define __DT_BINDINGS_ATMEL_FLEXCOM_H__
+
+#define ATMEL_FLEXCOM_MODE_USART	1
+#define ATMEL_FLEXCOM_MODE_SPI		2
+#define ATMEL_FLEXCOM_MODE_TWI		3
+
+#endif /* __DT_BINDINGS_ATMEL_FLEXCOM_H__ */
-- 
1.8.2.2
