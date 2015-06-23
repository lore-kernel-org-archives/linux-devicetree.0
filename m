Return-Path: <newchief@king.net.pl>
From: Paul Osmialowski <pawelo@king.net.pl>
Subject: [PATCH 3/9] arm: add call to CPU idle quirks handler
Date: Tue, 23 Jun 2015 23:19:41 +0200
Message-Id: <1435094387-20146-4-git-send-email-pawelo@king.net.pl>
In-Reply-To: <1435094387-20146-1-git-send-email-pawelo@king.net.pl>
References: <1435094387-20146-1-git-send-email-pawelo@king.net.pl>
To: Andrew Morton <akpm@linux-foundation.org>, Anson Huang <b20788@freescale.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Bhupesh Sharma <bhupesh.sharma@freescale.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Frank Li <Frank.Li@freescale.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Haojian Zhuang <haojian.zhuang@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jingchang Lu <jingchang.lu@freescale.com>, Jiri Slaby <jslaby@suse.cz>, Kees Cook <keescook@chromium.org>, Kumar Gala <galak@codeaurora.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <damm+renesas@opensource.se>, Michael Turquette <mturquette@baylibre.com>, Nathan Lynch <nathan_lynch@mentor.com>, Nicolas Pitre <nico@linaro.org>, Maxime Coquelin stm32 <mcoquelin.stm32@gmail.com>, Olof Johansson <olof@lixom.net>, Paul Bolle <pebolle@tiscali.nl>, Rob Herring <r.herring@freescale.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Shawn Guo <shawn.guo@linaro.org>, Simon Horman <horms+renesas@verge.net.au>, Stefan Agner <stefan@agner.ch>, Stephen Boyd <sboyd@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, Dave Martin <Dave.Martin@arm.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org
Cc: Paul Osmialowski <pawelo@king.net.pl>, Yuri Tikhonov <yur@emcraft.com>, Sergei Poselenov <sposelenov@emcraft.com>, Dmitry Cherkassov <d_cherkasov@emcraft.com>, Alexander Potashev <aspotashev@emcraft.com>
List-ID: <devicetree@vger.kernel.org>

Some SoCs need additional actions to be performed after arch idle,
e.g. Kinetis requires invalidation of the I/D bus cache.

Such handler could be held in provided <mach/idle.h> header file.

Signed-off-by: Paul Osmialowski <pawelo@king.net.pl>
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
