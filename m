From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 5/5] ARM: sun6i: Retire the smp field in A31 machine
Date: Fri, 18 Apr 2014 21:01:53 +0200
Message-ID: <1397847713-28418-6-git-send-email-maxime.ripard@free-electrons.com>
References: <1397847713-28418-1-git-send-email-maxime.ripard@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397847713-28418-1-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Now that we can rely on the enable-method, remove the smp field declaration
from A31 machine.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/mach-sunxi/common.h  | 19 -------------------
 arch/arm/mach-sunxi/platsmp.c |  2 --
 arch/arm/mach-sunxi/sunxi.c   |  3 ---
 3 files changed, 24 deletions(-)
 delete mode 100644 arch/arm/mach-sunxi/common.h

diff --git a/arch/arm/mach-sunxi/common.h b/arch/arm/mach-sunxi/common.h
deleted file mode 100644
index 9e5ac4756cbb..000000000000
--- a/arch/arm/mach-sunxi/common.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/*
- * Core functions for Allwinner SoCs
- *
- * Copyright (C) 2013 Maxime Ripard
- *
- * Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2.  This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
- */
-
-#ifndef __ARCH_SUNXI_COMMON_H_
-#define __ARCH_SUNXI_COMMON_H_
-
-void sun6i_secondary_startup(void);
-extern struct smp_operations sun6i_smp_ops;
-
-#endif /* __ARCH_SUNXI_COMMON_H_ */
diff --git a/arch/arm/mach-sunxi/platsmp.c b/arch/arm/mach-sunxi/platsmp.c
index 828f21126973..c53077bb8c3f 100644
--- a/arch/arm/mach-sunxi/platsmp.c
+++ b/arch/arm/mach-sunxi/platsmp.c
@@ -21,8 +21,6 @@
 #include <linux/of_address.h>
 #include <linux/smp.h>
 
-#include "common.h"
-
 #define CPUCFG_CPU_PWR_CLAMP_STATUS_REG(cpu)	((cpu) * 0x40 + 0x64)
 #define CPUCFG_CPU_RST_CTRL_REG(cpu)		(((cpu) + 1) * 0x40)
 #define CPUCFG_CPU_CTRL_REG(cpu)		(((cpu) + 1) * 0x40 + 0x04)
diff --git a/arch/arm/mach-sunxi/sunxi.c b/arch/arm/mach-sunxi/sunxi.c
index 460b5a4962ef..df906e3a8f91 100644
--- a/arch/arm/mach-sunxi/sunxi.c
+++ b/arch/arm/mach-sunxi/sunxi.c
@@ -25,8 +25,6 @@
 #include <asm/mach/map.h>
 #include <asm/system_misc.h>
 
-#include "common.h"
-
 #define SUN4I_WATCHDOG_CTRL_REG		0x00
 #define SUN4I_WATCHDOG_CTRL_RESTART		BIT(0)
 #define SUN4I_WATCHDOG_MODE_REG		0x04
@@ -149,7 +147,6 @@ DT_MACHINE_START(SUN6I_DT, "Allwinner sun6i (A31) Family")
 	.init_time	= sun6i_timer_init,
 	.dt_compat	= sun6i_board_dt_compat,
 	.restart	= sun6i_restart,
-	.smp		= smp_ops(sun6i_smp_ops),
 MACHINE_END
 
 static const char * const sun7i_board_dt_compat[] = {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
