From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/6 v2] ARM: integrator: call common init function from machine
Date: Sat,  1 Sep 2012 05:55:53 +0200
Message-ID: <1346471760-23993-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There is currently a common integrator_init() function set up
to be called from an arch_initcall(). The problem is that it is
using machine_is_integrator() which is not working with device
tree, let's call this from respective machine initilization
function and add a parameter to tell whether it's the
Integrator/AP or Integrator/CP instead.

There are still machine_is*() calls in the Integrator
machines directory, but this one needs to be fixed lest we
don't even get a UART console on the Integrator/AP after a
Device Tree boot.

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/mach-integrator/common.h        | 1 +
 arch/arm/mach-integrator/core.c          | 6 ++----
 arch/arm/mach-integrator/integrator_ap.c | 2 ++
 arch/arm/mach-integrator/integrator_cp.c | 1 +
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-integrator/common.h b/arch/arm/mach-integrator/common.h
index 899561d..c4338e2 100644
--- a/arch/arm/mach-integrator/common.h
+++ b/arch/arm/mach-integrator/common.h
@@ -1,3 +1,4 @@
 void integrator_init_early(void);
+int integrator_init(bool is_cp);
 void integrator_reserve(void);
 void integrator_restart(char, const char *);
diff --git a/arch/arm/mach-integrator/core.c b/arch/arm/mach-integrator/core.c
index 3fa6c51..5ba4bc8 100644
--- a/arch/arm/mach-integrator/core.c
+++ b/arch/arm/mach-integrator/core.c
@@ -61,7 +61,7 @@ static struct amba_device *amba_devs[] __initdata = {
 	&kmi1_device,
 };
 
-static int __init integrator_init(void)
+int __init integrator_init(bool is_cp)
 {
 	int i;
 
@@ -70,7 +70,7 @@ static int __init integrator_init(void)
 	 * hard-code them. The Integator/CP and forward have proper cell IDs.
 	 * Else we leave them undefined to the bus driver can autoprobe them.
 	 */
-	if (machine_is_integrator()) {
+	if (!is_cp) {
 		rtc_device.periphid	= 0x00041030;
 		uart0_device.periphid	= 0x00041010;
 		uart1_device.periphid	= 0x00041010;
@@ -86,8 +86,6 @@ static int __init integrator_init(void)
 	return 0;
 }
 
-arch_initcall(integrator_init);
-
 /*
  * On the Integrator platform, the port RTS and DTR are provided by
  * bits in the following SC_CTRLS register bits:
diff --git a/arch/arm/mach-integrator/integrator_ap.c b/arch/arm/mach-integrator/integrator_ap.c
index 3b22675..ff966d8 100644
--- a/arch/arm/mach-integrator/integrator_ap.c
+++ b/arch/arm/mach-integrator/integrator_ap.c
@@ -312,6 +312,8 @@ static void __init ap_init(void)
 
 		lm_device_register(lmdev);
 	}
+
+	integrator_init(false);
 }
 
 /*
diff --git a/arch/arm/mach-integrator/integrator_cp.c b/arch/arm/mach-integrator/integrator_cp.c
index 82d5c83..2b40bc1 100644
--- a/arch/arm/mach-integrator/integrator_cp.c
+++ b/arch/arm/mach-integrator/integrator_cp.c
@@ -366,6 +366,7 @@ static void __init intcp_init(void)
 		struct amba_device *d = amba_devs[i];
 		amba_device_register(d, &iomem_resource);
 	}
+	integrator_init(true);
 }
 
 #define TIMER0_VA_BASE __io_address(INTEGRATOR_TIMER0_BASE)
-- 
1.7.11.4
