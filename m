From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] xen/arm: remove duplicated include from enlighten.c
Date: Sat, 27 Apr 2013 15:45:30 +0800
Message-ID: <CAPgLHd95AtzEDXUMHryWmmVAkBfkh42hgeLKdSLFYwkO_JB-ZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stefano.stabellini@eu.citrix.com, linux@arm.linux.org.uk, grant.likely@linaro.org, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, xen-devel@lists.xensource.com, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Remove duplicated include.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 arch/arm/xen/enlighten.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 9a0a917..d30042e 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -10,7 +10,6 @@
 #include <xen/platform_pci.h>
 #include <xen/xenbus.h>
 #include <xen/page.h>
-#include <xen/xen.h>
 #include <xen/interface/sched.h>
 #include <xen/xen-ops.h>
 #include <asm/xen/hypervisor.h>
