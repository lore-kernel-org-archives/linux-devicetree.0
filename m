From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v3 03/11] mfd: syscon: Add atmel-smc registers definition
Date: Mon,  1 Dec 2014 11:27:19 +0100
Message-ID: <1417429647-3419-4-git-send-email-boris.brezillon@free-electrons.com>
References: <1417429647-3419-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1417429647-3419-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Andrew Victor <linux@maxim.org.za>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Boris Brezillon <boris.brezillon@free-electrons.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Atmel AT91 SoCs have a memory range reserved for SMC (Static Memory
Controller) configuration.
Expose those registers so that drivers can make use of the smc syscon
declared in at91 DTs.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Acked-by: Lee Jones <lee.jones@linaro.org>
---
 include/linux/mfd/syscon/atmel-smc.h | 65 ++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 include/linux/mfd/syscon/atmel-smc.h

diff --git a/include/linux/mfd/syscon/atmel-smc.h b/include/linux/mfd/syscon/atmel-smc.h
new file mode 100644
index 0000000..80dc15b
--- /dev/null
+++ b/include/linux/mfd/syscon/atmel-smc.h
@@ -0,0 +1,65 @@
+/*
+ * Atmel SMC (Static Memory Controller) register offsets and bit definitions.
+ *
+ * Copyright (C) 2014 Atmel
+ * Copyright (C) 2014 Free Electrons
+ *
+ * Author: Boris Brezillon <boris.brezillon@free-electrons.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef _LINUX_MFD_SYSCON_ATMEL_SMC_H_
+#define _LINUX_MFD_SYSCON_ATMEL_SMC_H_
+
+#include <linux/regmap.h>
+
+#define AT91SAM9_SMC_GENERIC_OFFSET	0x00
+#define AT91SAM9_SMC_GENERIC_BLK_SZ	0x10
+
+#define SAMA5_SMC_GENERIC_OFFSET	0x600
+#define SAMA5_SMC_GENERIC_BLK_SZ	0x14
+
+#define AT91SAM9_SMC_SETUP(o)		((o) + 0x00)
+#define AT91SAM9_SMC_NWESETUP_SHFT	0
+#define AT91SAM9_SMC_NCS_WRSETUP_SHFT	8
+#define AT91SAM9_SMC_NRDSETUP_SHFT	16
+#define AT91SAM9_SMC_NCS_NRDSETUP_SHFT	24
+
+#define AT91SAM9_SMC_PULSE(o)		((o) + 0x04)
+
+#define AT91SAM9_SMC_CYCLE(o)		((o) + 0x08)
+
+#define AT91SAM9_SMC_MODE(o)		((o) + 0x0c)
+#define SAMA5_SMC_MODE(o)		((o) + 0x10)
+#define AT91_SMC_READMODE		BIT(0)
+#define AT91_SMC_READMODE_NCS		(0 << 0)
+#define AT91_SMC_READMODE_NRD		(1 << 0)
+#define AT91_SMC_WRITEMODE		BIT(1)
+#define AT91_SMC_WRITEMODE_NCS		(0 << 1)
+#define AT91_SMC_WRITEMODE_NWE		(1 << 1)
+#define AT91_SMC_EXNWMODE		GENMASK(5, 4)
+#define AT91_SMC_EXNWMODE_DISABLE	(0 << 4)
+#define AT91_SMC_EXNWMODE_FROZEN	(2 << 4)
+#define AT91_SMC_EXNWMODE_READY		(3 << 4)
+#define AT91_SMC_BAT			BIT(8)
+#define AT91_SMC_BAT_SELECT		(0 << 8)
+#define AT91_SMC_BAT_WRITE		(1 << 8)
+#define AT91_SMC_DBW			GENMASK(13, 12)
+#define AT91_SMC_DBW_8			(0 << 12)
+#define AT91_SMC_DBW_16			(1 << 12)
+#define AT91_SMC_DBW_32			(2 << 12)
+#define AT91_SMC_TDF			GENMASK(19, 16)
+#define AT91_SMC_TDF_(x)		(((x) << 16) & AT91_SMC_TDF)
+#define AT91_SMC_TDFMODE		BIT(20)
+#define AT91_SMC_TDFMODE_OPTIMIZED	(1 << 20)
+#define AT91_SMC_PMEN			BIT(24)
+#define AT91_SMC_PS			GENMASK(29, 28)
+#define AT91_SMC_PS_4			(0 << 28)
+#define AT91_SMC_PS_8			(1 << 28)
+#define AT91_SMC_PS_16			(2 << 28)
+#define AT91_SMC_PS_32			(3 << 28)
+
+#endif /* _LINUX_MFD_SYSCON_ATMEL_SMC_H_ */
-- 
1.9.1
