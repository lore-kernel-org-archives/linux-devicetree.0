From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: [PATCH v6 24/41] ARM: dm644x: add new clock init using common clock framework
Date: Sat, 20 Jan 2018 11:14:03 -0600
Message-ID: <1516468460-4908-25-git-send-email-david@lechnology.com>
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516468460-4908-1-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Adam Ford <aford173-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the new board-specific clock init in mach-davinci/dm644x.c
using the new common clock framework drivers.

The #ifdefs are needed to prevent compile errors until the entire
ARCH_DAVINCI is converted.

Also clean up the #includes since we are adding some here.

Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
---

v6 changes:
- add blank lines between function calls

 arch/arm/mach-davinci/dm644x.c | 38 ++++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-davinci/dm644x.c b/arch/arm/mach-davinci/dm644x.c
index b409801..5b5de85 100644
--- a/arch/arm/mach-davinci/dm644x.c
+++ b/arch/arm/mach-davinci/dm644x.c
@@ -8,28 +8,34 @@
  * is licensed "as is" without any warranty of any kind, whether express
  * or implied.
  */
-#include <linux/init.h>
+#include <linux/clk-provider.h>
 #include <linux/clk.h>
-#include <linux/serial_8250.h>
+#include <linux/clk/davinci.h>
+#include <linux/clkdev.h>
 #include <linux/dmaengine.h>
-#include <linux/platform_device.h>
+#include <linux/init.h>
 #include <linux/platform_data/edma.h>
 #include <linux/platform_data/gpio-davinci.h>
+#include <linux/platform_device.h>
+#include <linux/serial_8250.h>
 
 #include <asm/mach/map.h>
 
+#include <mach/common.h>
 #include <mach/cputype.h>
 #include <mach/irqs.h>
-#include "psc.h"
 #include <mach/mux.h>
-#include <mach/time.h>
 #include <mach/serial.h>
-#include <mach/common.h>
+#include <mach/time.h>
 
+#include "asp.h"
 #include "davinci.h"
-#include "clock.h"
 #include "mux.h"
-#include "asp.h"
+
+#ifndef CONFIG_COMMON_CLK
+#include "clock.h"
+#include "psc.h"
+#endif
 
 /*
  * Device specific clocks
@@ -43,6 +49,7 @@
 #define DM644X_EMAC_CNTRL_RAM_OFFSET	0x2000
 #define DM644X_EMAC_CNTRL_RAM_SIZE	0x2000
 
+#ifndef CONFIG_COMMON_CLK
 static struct pll_data pll1_data = {
 	.num       = 1,
 	.phys_base = DAVINCI_PLL1_BASE,
@@ -326,6 +333,7 @@ static struct clk_lookup dm644x_clks[] = {
 	CLK("davinci-wdt", NULL, &timer2_clk),
 	CLK(NULL, NULL, NULL),
 };
+#endif
 
 static struct emac_platform_data dm644x_emac_pdata = {
 	.ctrl_reg_offset	= DM644X_EMAC_CNTRL_OFFSET,
@@ -934,7 +942,21 @@ void __init dm644x_init(void)
 
 void __init dm644x_init_time(void)
 {
+#ifdef CONFIG_COMMON_CLK
+	void __iomem *pll1, *pll2, *psc;
+
+	pll1 = ioremap(DAVINCI_PLL1_BASE, SZ_4K);
+	pll2 = ioremap(DAVINCI_PLL2_BASE, SZ_4K);
+	psc = ioremap(DAVINCI_PWR_SLEEP_CNTRL_BASE, SZ_4K);
+
+	clk_register_fixed_rate(NULL, "ref_clk", NULL, 0, DM644X_REF_FREQ);
+
+	dm644x_pll_clk_init(pll1, pll2);
+
+	dm644x_psc_clk_init(psc);
+#else
 	davinci_clk_init(dm644x_clks);
+#endif
 	davinci_timer_init();
 }
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
