From: Paul Osmialowski <pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>
Subject: [PATCH 3/9] arm: add call to CPU idle quirks handler
Date: Tue, 23 Jun 2015 23:19:41 +0200
Message-ID: <1435094387-20146-4-git-send-email-pawelo__9763.25668530098$1435096427$gmane$org@king.net.pl>
References: <1435094387-20146-1-git-send-email-pawelo@king.net.pl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435094387-20146-1-git-send-email-pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Nathan Lynch <nathan_lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Nicolas
Cc: Paul Osmialowski <pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>, Yuri Tikhonov <yur-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>, Sergei Poselenov <sposelenov-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>, Dmitry Cherkassov <d_cherkasov-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>, Alexander Potashev <aspotashev-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some SoCs need additional actions to be performed after arch idle,
e.g. Kinetis requires invalidation of the I/D bus cache.

Such handler could be held in provided <mach/idle.h> header file.

Signed-off-by: Paul Osmialowski <pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>
---
 arch/arm/Kconfig          | 7 +++++++
 arch/arm/kernel/process.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 8e3a833..8ef8f8f 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -98,6 +98,13 @@ config ARM_HAS_SG_CHAIN
 config NEED_SG_DMA_LENGTH
 	bool
 
+config NEED_MACH_IDLE_H
+	bool
+
+config ARM_CPU_IDLE_QUIRKS
+	bool
+	select NEED_MACH_IDLE_H
+
 config ARM_DMA_USE_IOMMU
 	bool
 	select ARM_HAS_SG_CHAIN
diff --git a/arch/arm/kernel/process.c b/arch/arm/kernel/process.c
index f192a2a..0033460 100644
--- a/arch/arm/kernel/process.c
+++ b/arch/arm/kernel/process.c
@@ -37,6 +37,10 @@
 #include <asm/tls.h>
 #include <asm/vdso.h>
 
+#ifdef CONFIG_NEED_MACH_IDLE_H
+#include <mach/idle.h>
+#endif
+
 #ifdef CONFIG_CC_STACKPROTECTOR
 #include <linux/stackprotector.h>
 unsigned long __stack_chk_guard __read_mostly;
@@ -70,6 +74,9 @@ void arch_cpu_idle(void)
 		arm_pm_idle();
 	else
 		cpu_do_idle();
+#ifdef CONFIG_ARM_CPU_IDLE_QUIRKS
+	handle_cpu_idle_quirks();
+#endif
 	local_irq_enable();
 }
 
-- 
2.3.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
