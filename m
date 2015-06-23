From: Paul Osmialowski <pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>
Subject: [PATCH 1/9] arm: select different compiler flags for ARM CortexM3
Date: Tue, 23 Jun 2015 23:19:39 +0200
Message-ID: <1435094387-20146-2-git-send-email-pawelo__9569.91829812086$1435096255$gmane$org@king.net.pl>
References: <1435094387-20146-1-git-send-email-pawelo@king.net.pl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435094387-20146-1-git-send-email-pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Nathan Lynch <nathan_lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Nicolas
Cc: Paul Osmialowski <pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>, Yuri Tikhonov <yur-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>, Sergei Poselenov <sposelenov-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>, Dmitry Cherkassov <d_cherkasov-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>, Alexander Potashev <aspotashev-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This one is inspired by two commits published on Emcraft git repo:

https://github.com/EmcraftSystems/linux-emcraft.git

1) 6302b692f570ff9d5645a6e72c11f87b0c1aa409
 RT #62654. Fixed kernel crashes while running httpd by enabling
 "-mfix-cortex-m3-ldrd" compiler option, which prevents compiler from
 generating code like 'ldrd Ra, Rb, [Ra, #Imm]' - according to the 602117
 Cortex-M3 Errata it may result in incorrect base register when interrupted
 or faulted.

by: Yuri Tikhonov <yur-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>

2) 359d3cda84c01c0f3fae1a519b97a31f318f57ab
 RT #62654. Removed "--march=..." leaving only "-mcpu=cortex-m3" to make
 sure only the correct instructions will be generated.

by: Sergei Poselenov <sposelenov-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>

I reworked these patches to make them less intrusive.

Signed-off-by: Paul Osmialowski <pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>
---
 arch/arm/Kconfig    |  2 +-
 arch/arm/Makefile   |  1 +
 arch/arm/mm/Kconfig | 11 ++++++++++-
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index a750c14..8e3a833 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -32,7 +32,7 @@ config ARM
 	select HANDLE_DOMAIN_IRQ
 	select HARDIRQS_SW_RESEND
 	select HAVE_ARCH_AUDITSYSCALL if (AEABI && !OABI_COMPAT)
-	select HAVE_ARCH_BITREVERSE if (CPU_32v7M || CPU_32v7) && !CPU_32v6
+	select HAVE_ARCH_BITREVERSE if (CPU_32v7M || CPU_32v7M3 || CPU_32v7) && !CPU_32v6
 	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL && !CPU_ENDIAN_BE32
 	select HAVE_ARCH_KGDB if !CPU_ENDIAN_BE32
 	select HAVE_ARCH_SECCOMP_FILTER if (AEABI && !OABI_COMPAT)
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 07ab3d2..a7e1007 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -58,6 +58,7 @@ endif
 # Note that GCC does not numerically define an architecture version
 # macro, but instead defines a whole series of macros which makes
 # testing for a specific architecture or later rather impossible.
+arch-$(CONFIG_CPU_32v7M3)	=-D__LINUX_ARM_ARCH__=7 -mcpu=cortex-m3 -Wa,-mcpu=cortex-m3
 arch-$(CONFIG_CPU_32v7M)	=-D__LINUX_ARM_ARCH__=7 -march=armv7-m -Wa,-march=armv7-m
 arch-$(CONFIG_CPU_32v7)		=-D__LINUX_ARM_ARCH__=7 $(call cc-option,-march=armv7-a,-march=armv5t -Wa$(comma)-march=armv7-a)
 arch-$(CONFIG_CPU_32v6)		=-D__LINUX_ARM_ARCH__=6 $(call cc-option,-march=armv6,-march=armv5t -Wa$(comma)-march=armv6)
diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index 7c6b976..d19cb4d 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -401,12 +401,18 @@ config CPU_V7
 # ARMv7M
 config CPU_V7M
 	bool
-	select CPU_32v7M
+	select CPU_32v7M if !CPU_CORTEXM3
+	select CPU_32v7M3 if CPU_CORTEXM3
 	select CPU_ABRT_NOMMU
 	select CPU_CACHE_NOP
 	select CPU_PABRT_LEGACY
 	select CPU_THUMBONLY
 
+# ARM CortexM3
+config CPU_CORTEXM3
+	bool
+	select CPU_V7M
+
 config CPU_THUMBONLY
 	bool
 	# There are no CPUs available with MMU that don't implement an ARM ISA:
@@ -457,6 +463,9 @@ config CPU_32v7
 config CPU_32v7M
 	bool
 
+config CPU_32v7M3
+	bool
+
 # The abort model
 config CPU_ABRT_NOMMU
 	bool
-- 
2.3.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
