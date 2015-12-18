From: Fan Chen <fan.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/4] soc: Mediatek: Create Mediatek SIP call
Date: Fri, 18 Dec 2015 10:42:28 +0800
Message-ID: <1450406551-1741-2-git-send-email-fan.chen@mediatek.com>
References: <1450406551-1741-1-git-send-email-fan.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1450406551-1741-1-git-send-email-fan.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Koro Chen <koro.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Weiyi Lu <weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "yt.lee" <yt.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Fan Chen <fan.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Create a generic interface for issuing SIP Service calls
which are specified in ARM SMC CALLING CONVENTION.

Signed-off-by: Fan Chen <fan.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/soc/mediatek/Kconfig         |    8 ++++++++
 drivers/soc/mediatek/Makefile        |    1 +
 drivers/soc/mediatek/mtk-sip.c       |   28 ++++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-sip.h |   17 +++++++++++++++++
 4 files changed, 54 insertions(+)
 create mode 100644 drivers/soc/mediatek/mtk-sip.c
 create mode 100644 include/linux/soc/mediatek/mtk-sip.h

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index 9d50682..65c1323 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -29,3 +29,11 @@ config MTK_SCPSYS
 	help
 	  Say yes here to add support for the MediaTek SCPSYS power domain
 	  driver.
+
+config MTK_SIP
+        bool "Mediatek SIP Support"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on HAVE_SMCCC
+	help
+	Say yes here to add support for the MediaTek SIP call.
+
diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
index 12998b0..67077dc 100644
--- a/drivers/soc/mediatek/Makefile
+++ b/drivers/soc/mediatek/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
 obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
 obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
+obj-$(CONFIG_MTK_SIP) += mtk-sip.o
diff --git a/drivers/soc/mediatek/mtk-sip.c b/drivers/soc/mediatek/mtk-sip.c
new file mode 100644
index 0000000..882617f
--- /dev/null
+++ b/drivers/soc/mediatek/mtk-sip.c
@@ -0,0 +1,28 @@
+/*
+ * Copyright (c) 2015 MediaTek Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/soc/mediatek/mtk-sip.h>
+
+int mtk_sip_simple_call(unsigned long func_id,
+			unsigned long a1,
+			unsigned long a2,
+			unsigned long a3)
+{
+	struct smccc_res res;
+
+	smccc_smc(func_id, a1, a2, a3, 0, 0, 0, 0, &res);
+
+	return res.a0;
+}
+
diff --git a/include/linux/soc/mediatek/mtk-sip.h b/include/linux/soc/mediatek/mtk-sip.h
new file mode 100644
index 0000000..dce1818
--- /dev/null
+++ b/include/linux/soc/mediatek/mtk-sip.h
@@ -0,0 +1,17 @@
+#ifndef __SOC_MEDIATEK_MTKSIP_H
+#define __SOC_MEDIATEK_MTKSIP_H
+
+#ifdef CONFIG_MTK_SIP
+int mtk_sip_simple_call(unsigned long func_id,
+			unsigned long a1,
+			unsigned long a2,
+			unsigned long a3);
+#else
+static inline int mtk_sip_simple_call(unsigned long func_id,
+				      unsigned long a1,
+				      unsigned long a2,
+				      unsigned long a3)
+{       return -EOPNOTSUPP; }
+#endif
+
+#endif /*__SOC_MEDIATEK_MTKSIP_H*/
-- 
1.7.9.5
