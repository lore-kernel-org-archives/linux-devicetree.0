From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: [PATCH v6 28/41] ARM: davinci: remove CONFIG_DAVINCI_RESET_CLOCKS
Date: Sat, 20 Jan 2018 11:14:07 -0600
Message-ID: <1516468460-4908-29-git-send-email-david@lechnology.com>
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516468460-4908-1-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Adam Ford <aford173-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The common clock framework will take care of disabling unused clocks when
we switch from the legacy davinci clocks and having this enabled will
cause compile errors after we switch, so remove it now.

Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
---

v6 changes:
- none

 arch/arm/mach-davinci/Kconfig               | 12 ------------
 arch/arm/mach-davinci/common.c              |  1 -
 arch/arm/mach-davinci/include/mach/common.h |  6 ------
 3 files changed, 19 deletions(-)

diff --git a/arch/arm/mach-davinci/Kconfig b/arch/arm/mach-davinci/Kconfig
index 05c3eecf..ba9912b 100644
--- a/arch/arm/mach-davinci/Kconfig
+++ b/arch/arm/mach-davinci/Kconfig
@@ -231,18 +231,6 @@ config DAVINCI_MUX_WARNINGS
 	  to change the pin multiplexing setup. When there are no warnings
 	  printed, it's safe to deselect DAVINCI_MUX for your product.
 
-config DAVINCI_RESET_CLOCKS
-	bool "Reset unused clocks during boot"
-	depends on ARCH_DAVINCI
-	help
-	  Say Y if you want to reset unused clocks during boot.
-	  This option saves power, but assumes all drivers are
-	  using the clock framework. Broken drivers that do not
-	  yet use clock framework may not work with this option.
-	  If you are booting from another operating system, you
-	  probably do not want this option enabled until your
-	  device drivers work properly.
-
 endmenu
 
 endif
diff --git a/arch/arm/mach-davinci/common.c b/arch/arm/mach-davinci/common.c
index bcb6a7b..e03f95c 100644
--- a/arch/arm/mach-davinci/common.c
+++ b/arch/arm/mach-davinci/common.c
@@ -118,5 +118,4 @@ void __init davinci_common_init(const struct davinci_soc_info *soc_info)
 void __init davinci_init_late(void)
 {
 	davinci_cpufreq_init();
-	davinci_clk_disable_unused();
 }
diff --git a/arch/arm/mach-davinci/include/mach/common.h b/arch/arm/mach-davinci/include/mach/common.h
index f0d5e858..c86a058 100644
--- a/arch/arm/mach-davinci/include/mach/common.h
+++ b/arch/arm/mach-davinci/include/mach/common.h
@@ -82,12 +82,6 @@ extern void davinci_common_init(const struct davinci_soc_info *soc_info);
 extern void davinci_init_ide(void);
 void davinci_init_late(void);
 
-#ifdef CONFIG_DAVINCI_RESET_CLOCKS
-int davinci_clk_disable_unused(void);
-#else
-static inline int davinci_clk_disable_unused(void) { return 0; }
-#endif
-
 #ifdef CONFIG_CPU_FREQ
 int davinci_cpufreq_init(void);
 #else
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
