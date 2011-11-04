From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: [PATCHv4 09/13] ARM: u300: convert to MULTI_IRQ_HANDLER
Date: Fri,  4 Nov 2011 01:10:06 +0000
Message-ID: <1320369010-23428-10-git-send-email-jamie@jamieiles.com>
References: <1320369010-23428-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1320369010-23428-1-git-send-email-jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: viresh.kumar-qxv4g6HH51o@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, hsweeten-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org, rajeev-dlh.kumar-qxv4g6HH51o@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, rubini-9wsNiZum9E8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Now that there is a generic IRQ handler for multiple VIC devices use it
for u300 to help building multi platform kernels.

Cc: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Signed-off-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
---
 arch/arm/Kconfig                              |    1 +
 arch/arm/mach-u300/include/mach/entry-macro.S |   24 ------------------------
 arch/arm/mach-u300/u300.c                     |    2 ++
 3 files changed, 3 insertions(+), 24 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 46d0319..bb62f38 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -897,6 +897,7 @@ config ARCH_U300
 	select GENERIC_GPIO
 	select ARCH_REQUIRE_GPIOLIB
 	select NEED_MACH_MEMORY_H
+	select MULTI_IRQ_HANDLER
 	help
 	  Support for ST-Ericsson U300 series mobile platforms.
 
diff --git a/arch/arm/mach-u300/include/mach/entry-macro.S b/arch/arm/mach-u300/include/mach/entry-macro.S
index 20731ae..7181d6a 100644
--- a/arch/arm/mach-u300/include/mach/entry-macro.S
+++ b/arch/arm/mach-u300/include/mach/entry-macro.S
@@ -8,33 +8,9 @@
  * Low-level IRQ helper macros for ST-Ericsson U300
  * Author: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
  */
-#include <mach/hardware.h>
-#include <asm/hardware/vic.h>
 
 	.macro	disable_fiq
 	.endm
 
-	.macro  get_irqnr_preamble, base, tmp
-	.endm
-
 	.macro  arch_ret_to_user, tmp1, tmp2
 	.endm
-
-	.macro	get_irqnr_and_base, irqnr, irqstat, base, tmp
-	ldr	\base, = U300_AHB_PER_VIRT_BASE-U300_AHB_PER_PHYS_BASE+U300_INTCON0_BASE
-	ldr	\irqstat, [\base, #VIC_IRQ_STATUS] @ get masked status
-	mov	\irqnr, #0
-	teq	\irqstat, #0
-	bne	1002f
-1001:	ldr	\base, = U300_AHB_PER_VIRT_BASE-U300_AHB_PER_PHYS_BASE+U300_INTCON1_BASE
-	ldr	\irqstat, [\base, #VIC_IRQ_STATUS] @ get masked status
-	mov	\irqnr, #32
-	teq	\irqstat, #0
-	beq	1003f
-1002:	tst	\irqstat, #1
-	bne	1003f
-	add	\irqnr, \irqnr, #1
-	movs	\irqstat, \irqstat, lsr #1
-	bne	1002b
-1003:		/* EQ will be set if no irqs pending */
-	.endm
diff --git a/arch/arm/mach-u300/u300.c b/arch/arm/mach-u300/u300.c
index 89422ee..4a4fd33 100644
--- a/arch/arm/mach-u300/u300.c
+++ b/arch/arm/mach-u300/u300.c
@@ -19,6 +19,7 @@
 #include <linux/io.h>
 #include <mach/hardware.h>
 #include <mach/platform.h>
+#include <asm/hardware/vic.h>
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include <asm/memory.h>
@@ -49,6 +50,7 @@ MACHINE_START(U300, MACH_U300_STRING)
 	.atag_offset	= BOOT_PARAMS_OFFSET,
 	.map_io		= u300_map_io,
 	.init_irq	= u300_init_irq,
+	.handle_irq	= vic_handle_irq,
 	.timer		= &u300_timer,
 	.init_machine	= u300_init_machine,
 MACHINE_END
-- 
1.7.5.4
