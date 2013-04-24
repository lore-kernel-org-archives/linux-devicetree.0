From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: [PATCH 2/3] ARM: at91: dt: add AIC pre-processor define
Date: Wed, 24 Apr 2013 16:58:07 +0200
Message-ID: <1366815488-27976-2-git-send-email-plagnioj@jcrosoft.com>
References: <20130424145627.GL4998@game.jcrosoft.org>
 <1366815488-27976-1-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1366815488-27976-1-git-send-email-plagnioj@jcrosoft.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, devicetree-discuss@lists.ozlabs.org, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
---
 arch/arm/boot/dts/at91-aic.h |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 arch/arm/boot/dts/at91-aic.h

diff --git a/arch/arm/boot/dts/at91-aic.h b/arch/arm/boot/dts/at91-aic.h
new file mode 100644
index 0000000..ed3f8be
--- /dev/null
+++ b/arch/arm/boot/dts/at91-aic.h
@@ -0,0 +1,19 @@
+/*
+ * This header provides constants for most at91 AIC bindings.
+ *
+ * Copyright (C) 2013 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
+ *
+ * GPLv2 only
+ */
+
+#ifndef __DT_BINDINGS_AT91_AIC_H__
+#define __DT_BINDINGS_AT91_AIC_H__
+
+#define AT91_AIC_LOW_TO_HIGH		(1 < 0)
+#define AT91_AIC_HIGH_TO_LOW		(1 < 1)
+#define AT91_AIC_HIGH			(1 < 2)
+#define AT91_AIC_LOW			(1 < 3)
+
+#define AT91_AIC_LOW_TO_HIGH_OR_HIGH_TO_LOW	(AT91_AIC_LOW_TO_HIGH | AT91_AIC_HIGH_TO_LOW)
+
+#endif /* __DT_BINDINGS_AT91_AIC_H__ */
-- 
1.7.10.4
