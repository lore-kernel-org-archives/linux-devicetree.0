From: Roy Pledge <roy.pledge@nxp.com>
Subject: [v5 11/12] soc/fsl/qbman: Add missing headers on ARM
Date: Mon, 18 Sep 2017 16:39:46 -0400
Message-ID: <1505767187-4596-12-git-send-email-roy.pledge@nxp.com>
References: <1505767187-4596-1-git-send-email-roy.pledge@nxp.com>
Reply-To: <roy.pledge@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1505767187-4596-1-git-send-email-roy.pledge@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: leoyang.li@nxp.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: oss@buserror.net, madalin.bucur@nxp.com, catalin.marinas@arm.com, linux@armlinux.org.uk, arnd@arndb.de, mark.rutland@arm.com, Claudiu Manoil <claudiu.manoil@nxp.com>, Roy Pledge <roy.pledge@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Claudiu Manoil <claudiu.manoil@nxp.com>

Unlike PPC builds, ARM builds need following headers
explicitly:
+#include <linux/io.h>		for ioread32be()
+#include <linux/delay.h>		for udelay()

Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
Signed-off-by: Roy Pledge <roy.pledge@nxp.com>
---
 drivers/soc/fsl/qbman/dpaa_sys.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/fsl/qbman/dpaa_sys.h b/drivers/soc/fsl/qbman/dpaa_sys.h
index 5a2c0af..9f37900 100644
--- a/drivers/soc/fsl/qbman/dpaa_sys.h
+++ b/drivers/soc/fsl/qbman/dpaa_sys.h
@@ -44,6 +44,8 @@
 #include <linux/prefetch.h>
 #include <linux/genalloc.h>
 #include <asm/cacheflush.h>
+#include <linux/io.h>
+#include <linux/delay.h>
 
 /* For 2-element tables related to cache-inhibited and cache-enabled mappings */
 #define DPAA_PORTAL_CE 0
-- 
2.7.4
