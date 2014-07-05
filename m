From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: [PATCH v2 4/4] arm: pxa: add non device-tree timer link to clocksource
Date: Sat,  5 Jul 2014 13:13:01 +0200
Message-ID: <1404558781-9537-4-git-send-email-robert.jarzmik@free.fr>
References: <1404558781-9537-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404558781-9537-1-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As clocksource pxa_timer was moved to clocksource framework, the
pxa_timer initialization needs to be a bit amended, to pass the
necessary informations to clocksource, ie :
 - the timer interrupt (mach specific)
 - the timer registers base (ditto)
 - the timer clockrate

Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
---
 arch/arm/mach-pxa/generic.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/mach-pxa/generic.c b/arch/arm/mach-pxa/generic.c
index 4225417..2dcded5 100644
--- a/arch/arm/mach-pxa/generic.c
+++ b/arch/arm/mach-pxa/generic.c
@@ -25,6 +25,7 @@
 #include <asm/mach/map.h>
 #include <asm/mach-types.h>
 
+#include <mach/irqs.h>
 #include <mach/reset.h>
 #include <mach/smemc.h>
 #include <mach/pxa3xx-regs.h>
@@ -57,6 +58,17 @@ unsigned long get_clock_tick_rate(void)
 EXPORT_SYMBOL(get_clock_tick_rate);
 
 /*
+ * For non device-tree builds, keep legacy timer init
+ */
+extern void pxa_timer_nodt_init(int irq, void __iomem *base,
+			   unsigned long clock_tick_rate);
+void pxa_timer_init(void)
+{
+	pxa_timer_nodt_init(IRQ_OST0, io_p2v(0x40a00000),
+			    get_clock_tick_rate());
+}
+
+/*
  * Get the clock frequency as reflected by CCCR and the turbo flag.
  * We assume these values have been applied via a fcs.
  * If info is not 0 we also display the current settings.
-- 
2.0.0.rc2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
