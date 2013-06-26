From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] ARM: edma: remove duplicated include from edma.c
Date: Wed, 26 Jun 2013 09:58:16 +0800
Message-ID: <CAPgLHd_j_JmDOsGSwLO_eBZnWteMzLVKJa93fY2iaSe31Ozo_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@arm.linux.org.uk, grant.likely@linaro.org, rob.herring@calxeda.com, nsekhar@ti.com, mporter@ti.com, joelagnel@ti.com, arnd@arndb.de, prabhakar.csengg@gmail.com
Cc: yongjun_wei@trendmicro.com.cn, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Remove duplicated include.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 arch/arm/common/edma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/common/edma.c b/arch/arm/common/edma.c
index a432e6c..39ad030 100644
--- a/arch/arm/common/edma.c
+++ b/arch/arm/common/edma.c
@@ -26,7 +26,6 @@
 #include <linux/io.h>
 #include <linux/slab.h>
 #include <linux/edma.h>
-#include <linux/err.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/of_dma.h>
