From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 2/3] ARM: mxc: use ARCH_NR_GPIOS to define gpio number
Date: Thu, 7 Jul 2011 00:37:42 +0800
Message-ID: <1309970263-13239-3-git-send-email-shawn.guo@linaro.org>
References: <1309970263-13239-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1309970263-13239-1-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The patch removes MXC_GPIO_IRQS and instead uses ARCH_NR_GPIOS to
define gpio number.  This change is need when we change mxc gpio
driver to be device tree aware.  When migrating the driver to device
tree, pdev->id becomes unusable.  It requires driver get gpio range
from gpio core, which will dynamically allocates number from
ARCH_NR_GPIOS to 0.

As a bonus point, it removes lines of '#if' and make the code a
little bit cleaner.  The side effect is the waste of number.  But
this is not a point when we go single image.

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 arch/arm/plat-mxc/include/mach/irqs.h |   21 +++------------------
 1 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/arch/arm/plat-mxc/include/mach/irqs.h b/arch/arm/plat-mxc/include/mach/irqs.h
index 35c89bc..00e812b 100644
--- a/arch/arm/plat-mxc/include/mach/irqs.h
+++ b/arch/arm/plat-mxc/include/mach/irqs.h
@@ -11,6 +11,8 @@
 #ifndef __ASM_ARCH_MXC_IRQS_H__
 #define __ASM_ARCH_MXC_IRQS_H__
 
+#include <asm-generic/gpio.h>
+
 /*
  * SoCs with TZIC interrupt controller have 128 IRQs, those with AVIC have 64
  */
@@ -22,30 +24,13 @@
 
 #define MXC_GPIO_IRQ_START	MXC_INTERNAL_IRQS
 
-/* these are ordered by size to support multi-SoC kernels */
-#if defined CONFIG_SOC_IMX53
-#define MXC_GPIO_IRQS		(32 * 7)
-#elif defined CONFIG_ARCH_MX2
-#define MXC_GPIO_IRQS		(32 * 6)
-#elif defined CONFIG_SOC_IMX50
-#define MXC_GPIO_IRQS		(32 * 6)
-#elif defined CONFIG_ARCH_MX1
-#define MXC_GPIO_IRQS		(32 * 4)
-#elif defined CONFIG_ARCH_MX25
-#define MXC_GPIO_IRQS		(32 * 4)
-#elif defined CONFIG_SOC_IMX51
-#define MXC_GPIO_IRQS		(32 * 4)
-#elif defined CONFIG_ARCH_MX3
-#define MXC_GPIO_IRQS		(32 * 3)
-#endif
-
 /*
  * The next 16 interrupts are for board specific purposes.  Since
  * the kernel can only run on one machine at a time, we can re-use
  * these.  If you need more, increase MXC_BOARD_IRQS, but keep it
  * within sensible limits.
  */
-#define MXC_BOARD_IRQ_START	(MXC_INTERNAL_IRQS + MXC_GPIO_IRQS)
+#define MXC_BOARD_IRQ_START	(MXC_INTERNAL_IRQS + ARCH_NR_GPIOS)
 
 #ifdef CONFIG_MACH_MX31ADS_WM1133_EV1
 #define MXC_BOARD_IRQS  80
-- 
1.7.4.1
