From: Pawel Moll <pawel.moll@arm.com>
Subject: [PATCH v3 1/5] ARM: versatile: Add missing ENDPROC to headsmp.S
Date: Tue, 29 Nov 2011 15:11:09 +0000
Message-ID: <1322579473-8804-2-git-send-email-pawel.moll@arm.com>
References: <1322579473-8804-1-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1322579473-8804-1-git-send-email-pawel.moll@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Cc: Pawel Moll <pawel.moll@arm.com>
List-Id: devicetree@vger.kernel.org

Once the ENDPROC is in place, BSYM() in not longer necessary
to get correct pointer to versatile_secondary_startup().

Signed-off-by: Pawel Moll <pawel.moll@arm.com>
---
 arch/arm/mach-realview/platsmp.c  |    3 +--
 arch/arm/mach-vexpress/platsmp.c  |    4 +---
 arch/arm/plat-versatile/headsmp.S |    1 +
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-realview/platsmp.c b/arch/arm/mach-realview/platsmp.c
index e83c654..17c878d 100644
--- a/arch/arm/mach-realview/platsmp.c
+++ b/arch/arm/mach-realview/platsmp.c
@@ -17,7 +17,6 @@
 #include <asm/hardware/gic.h>
 #include <asm/mach-types.h>
 #include <asm/smp_scu.h>
-#include <asm/unified.h>
 
 #include <mach/board-eb.h>
 #include <mach/board-pb11mp.h>
@@ -75,6 +74,6 @@ void __init platform_smp_prepare_cpus(unsigned int max_cpus)
 	 * until it receives a soft interrupt, and then the
 	 * secondary CPU branches to this address.
 	 */
-	__raw_writel(BSYM(virt_to_phys(versatile_secondary_startup)),
+	__raw_writel(virt_to_phys(versatile_secondary_startup),
 		     __io_address(REALVIEW_SYS_FLAGSSET));
 }
diff --git a/arch/arm/mach-vexpress/platsmp.c b/arch/arm/mach-vexpress/platsmp.c
index 2b5f7ac..124ffb1 100644
--- a/arch/arm/mach-vexpress/platsmp.c
+++ b/arch/arm/mach-vexpress/platsmp.c
@@ -13,8 +13,6 @@
 #include <linux/smp.h>
 #include <linux/io.h>
 
-#include <asm/unified.h>
-
 #include <mach/motherboard.h>
 #define V2M_PA_CS7 0x10000000
 
@@ -46,6 +44,6 @@ void __init platform_smp_prepare_cpus(unsigned int max_cpus)
 	 * secondary CPU branches to this address.
 	 */
 	writel(~0, MMIO_P2V(V2M_SYS_FLAGSCLR));
-	writel(BSYM(virt_to_phys(versatile_secondary_startup)),
+	writel(virt_to_phys(versatile_secondary_startup),
 		MMIO_P2V(V2M_SYS_FLAGSSET));
 }
diff --git a/arch/arm/plat-versatile/headsmp.S b/arch/arm/plat-versatile/headsmp.S
index d397a1f..dd703ef 100644
--- a/arch/arm/plat-versatile/headsmp.S
+++ b/arch/arm/plat-versatile/headsmp.S
@@ -38,3 +38,4 @@ pen:	ldr	r7, [r6]
 	.align
 1:	.long	.
 	.long	pen_release
+ENDPROC(versatile_secondary_startup)
-- 
1.6.3.3
