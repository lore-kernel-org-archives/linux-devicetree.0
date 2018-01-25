From: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: [RFC 23/37] ARM: shmobile: rcar-gen2: Export shmobile_set_wdt_clock_status function
Date: Thu, 25 Jan 2018 18:02:57 +0000
Message-ID: <1516903391-30467-24-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1516903391-30467-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516903391-30467-1-git-send-email-fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch exposes a function to set the value of variable
"shmobile_wdt_clock_status" so that the watchdog driver may communicate
critical information to the SMP bring up assembly routine.

Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
---
 arch/arm/mach-shmobile/common.h       |  1 +
 arch/arm/mach-shmobile/pm-rcar-gen2.c | 16 +++++++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/common.h b/arch/arm/mach-shmobile/common.h
index a8fa4f7..e4ffca8 100644
--- a/arch/arm/mach-shmobile/common.h
+++ b/arch/arm/mach-shmobile/common.h
@@ -5,6 +5,7 @@
 extern void shmobile_init_cntvoff(void);
 extern void shmobile_init_delay(void);
 extern void shmobile_boot_vector(void);
+extern unsigned long shmobile_wdt_clock_status;
 extern unsigned long shmobile_boot_fn;
 extern unsigned long shmobile_boot_size;
 extern void shmobile_smp_boot(void);
diff --git a/arch/arm/mach-shmobile/pm-rcar-gen2.c b/arch/arm/mach-shmobile/pm-rcar-gen2.c
index e5f215c..cfdc3cd 100644
--- a/arch/arm/mach-shmobile/pm-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/pm-rcar-gen2.c
@@ -50,6 +50,16 @@ static inline u32 phys_to_sbar(phys_addr_t addr)
 #define SYSCIER 0x0c
 #define SYSCIMR 0x10
 
+static void __iomem *shmobile_boot_vector_start;
+static unsigned long clock_status;
+
+void shmobile_set_wdt_clock_status(unsigned long value)
+{
+	memcpy_toio(shmobile_boot_vector_start + clock_status,
+		    &value, sizeof(value));
+}
+EXPORT_SYMBOL(shmobile_set_wdt_clock_status);
+
 #if defined(CONFIG_SMP)
 
 static void __init rcar_gen2_sysc_init(u32 syscier)
@@ -120,8 +130,12 @@ void __init rcar_gen2_pm_init(void)
 	if (!p)
 		return;
 
+	shmobile_boot_vector_start = p;
+	clock_status = (&shmobile_wdt_clock_status -
+				(unsigned long *)shmobile_boot_vector) *
+				sizeof(shmobile_wdt_clock_status);
+
 	memcpy_toio(p, shmobile_boot_vector, shmobile_boot_size);
-	iounmap(p);
 
 	/* setup reset vectors */
 	p = ioremap_nocache(RST, 0x63);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
