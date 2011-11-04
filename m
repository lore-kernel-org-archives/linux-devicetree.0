From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: [PATCHv4 12/13] ARM: picoxcell: convert to MULTI_IRQ_HANDLER
Date: Fri,  4 Nov 2011 01:10:09 +0000
Message-ID: <1320369010-23428-13-git-send-email-jamie@jamieiles.com>
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
for picoxcell to help building multi platform kernels.

Signed-off-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
---
 arch/arm/Kconfig                                   |    1 +
 arch/arm/mach-picoxcell/common.c                   |    9 ++++-----
 arch/arm/mach-picoxcell/include/mach/entry-macro.S |   11 ++++-------
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 76a379c..43bb172 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -651,6 +651,7 @@ config ARCH_PICOXCELL
 	select GENERIC_GPIO
 	select HAVE_SCHED_CLOCK
 	select HAVE_TCM
+	select MULTI_IRQ_HANDLER
 	select NO_IOPORT
 	select USE_OF
 	help
diff --git a/arch/arm/mach-picoxcell/common.c b/arch/arm/mach-picoxcell/common.c
index 34d0834..ad871bd 100644
--- a/arch/arm/mach-picoxcell/common.c
+++ b/arch/arm/mach-picoxcell/common.c
@@ -11,6 +11,7 @@
 #include <linux/irqdomain.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 
 #include <asm/mach/arch.h>
@@ -33,22 +34,20 @@ static const char *picoxcell_dt_match[] = {
 };
 
 static const struct of_device_id vic_of_match[] __initconst = {
-	{ .compatible = "arm,pl192-vic" },
+	{ .compatible = "arm,pl192-vic", .data = vic_of_init, },
 	{ /* Sentinel */ }
 };
 
 static void __init picoxcell_init_irq(void)
 {
-	vic_init(IO_ADDRESS(PICOXCELL_VIC0_BASE), 0, ~0, 0);
-	vic_init(IO_ADDRESS(PICOXCELL_VIC1_BASE), 32, ~0, 0);
-	irq_domain_generate_simple(vic_of_match, PICOXCELL_VIC0_BASE, 0);
-	irq_domain_generate_simple(vic_of_match, PICOXCELL_VIC1_BASE, 32);
+	of_irq_init(vic_of_match);
 }
 
 DT_MACHINE_START(PICOXCELL, "Picochip picoXcell")
 	.map_io		= picoxcell_map_io,
 	.nr_irqs	= ARCH_NR_IRQS,
 	.init_irq	= picoxcell_init_irq,
+	.handle_irq	= vic_handle_irq,
 	.timer		= &picoxcell_timer,
 	.init_machine	= picoxcell_init_machine,
 	.dt_compat	= picoxcell_dt_match,
diff --git a/arch/arm/mach-picoxcell/include/mach/entry-macro.S b/arch/arm/mach-picoxcell/include/mach/entry-macro.S
index a6b09f7..9b505ac 100644
--- a/arch/arm/mach-picoxcell/include/mach/entry-macro.S
+++ b/arch/arm/mach-picoxcell/include/mach/entry-macro.S
@@ -9,11 +9,8 @@
  * License version 2. This program is licensed "as is" without any
  * warranty of any kind, whether express or implied.
  */
-#include <mach/hardware.h>
-#include <mach/irqs.h>
-#include <mach/map.h>
+	.macro  disable_fiq
+	.endm
 
-#define VA_VIC0		IO_ADDRESS(PICOXCELL_VIC0_BASE)
-#define VA_VIC1		IO_ADDRESS(PICOXCELL_VIC1_BASE)
-
-#include <asm/entry-macro-vic2.S>
+	.macro  arch_ret_to_user, tmp1, tmp2
+	.endm
-- 
1.7.5.4
