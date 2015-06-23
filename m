Return-Path: <newchief@king.net.pl>
From: Paul Osmialowski <pawelo@king.net.pl>
Subject: [PATCH 4/9] arm: allow copying of vector table to internal SRAM memory
Date: Tue, 23 Jun 2015 23:19:42 +0200
Message-Id: <1435094387-20146-5-git-send-email-pawelo@king.net.pl>
In-Reply-To: <1435094387-20146-1-git-send-email-pawelo@king.net.pl>
References: <1435094387-20146-1-git-send-email-pawelo@king.net.pl>
To: Andrew Morton <akpm@linux-foundation.org>, Anson Huang <b20788@freescale.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Bhupesh Sharma <bhupesh.sharma@freescale.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Frank Li <Frank.Li@freescale.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Haojian Zhuang <haojian.zhuang@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jingchang Lu <jingchang.lu@freescale.com>, Jiri Slaby <jslaby@suse.cz>, Kees Cook <keescook@chromium.org>, Kumar Gala <galak@codeaurora.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <damm+renesas@opensource.se>, Michael Turquette <mturquette@baylibre.com>, Nathan Lynch <nathan_lynch@mentor.com>, Nicolas Pitre <nico@linaro.org>, Maxime Coquelin stm32 <mcoquelin.stm32@gmail.com>, Olof Johansson <olof@lixom.net>, Paul Bolle <pebolle@tiscali.nl>, Rob Herring <r.herring@freescale.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Shawn Guo <shawn.guo@linaro.org>, Simon Horman <horms+renesas@verge.net.au>, Stefan Agner <stefan@agner.ch>, Stephen Boyd <sboyd@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, Dave Martin <Dave.Martin@arm.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org
Cc: Paul Osmialowski <pawelo@king.net.pl>, Yuri Tikhonov <yur@emcraft.com>, Sergei Poselenov <sposelenov@emcraft.com>, Dmitry Cherkassov <d_cherkasov@emcraft.com>, Alexander Potashev <aspotashev@emcraft.com>
List-ID: <devicetree@vger.kernel.org>

Based on part of the commit published on Emcraft git repo:

https://github.com/EmcraftSystems/linux-emcraft.git

2ce1841b590d014d8738215fb1ffe05f53c8d9f0 "some commit"

by: Dmitry Cherkassov <d_cherkasov@emcraft.com>

The ARM v7M allows setting the vector table either in
the boot memory or in the internal SRAM memory, controlled
by Bit 29 in the Vector Table Base register. This implies
that the OS vector table needs to be copied to the internal RAM.

New option CONFIG_COPY_VECTOR_TABLE_TO_SRAM_ADDR allows specification
of the desired destination for the OS vector table.

Signed-off-by: Paul Osmialowski <pawelo@king.net.pl>
---
 arch/arm/Kconfig-nommu      | 11 +++++++++++
 arch/arm/kernel/entry-v7m.S |  3 +++
 arch/arm/mm/proc-v7m.S      | 11 +++++++++++
 3 files changed, 25 insertions(+)

diff --git a/arch/arm/Kconfig-nommu b/arch/arm/Kconfig-nommu
index 965ca97..98220e8 100644
--- a/arch/arm/Kconfig-nommu
+++ b/arch/arm/Kconfig-nommu
@@ -66,3 +66,14 @@ config ARM_MPU
 config ZLIB_INFLATE_STACK_SAVING
 	bool 'Do not place huge encoder tables on stack' if ZLIB_INFLATE
 	depends on ZLIB_INFLATE
+
+config COPY_VECTOR_TABLE_TO_SRAM_ADDR
+	hex 'If non-zero, copy Vector Table to this SRAM Address' if CPU_V7M
+	default 0x00000000
+	depends on CPU_V7M
+	help
+	  The ARM v7M allows setting the vector table either in
+	  the boot memory or in the internal SRAM memory, controlled
+	  by Bit 29 in the Vector Table Base register.
+	  This implies that the OS vector table needs to be copied to
+	  the internal RAM.
diff --git a/arch/arm/kernel/entry-v7m.S b/arch/arm/kernel/entry-v7m.S
index b6c8bb9..114096e 100644
--- a/arch/arm/kernel/entry-v7m.S
+++ b/arch/arm/kernel/entry-v7m.S
@@ -146,3 +146,6 @@ ENTRY(vector_table)
 	.rept	CONFIG_CPU_V7M_NUM_IRQ
 	.long	__irq_entry		@ External Interrupts
 	.endr
+#if CONFIG_COPY_VECTOR_TABLE_TO_SRAM_ADDR > 0x00000000
+ENTRY(vector_table_end)
+#endif
diff --git a/arch/arm/mm/proc-v7m.S b/arch/arm/mm/proc-v7m.S
index 67d9209..ded9504 100644
--- a/arch/arm/mm/proc-v7m.S
+++ b/arch/arm/mm/proc-v7m.S
@@ -83,7 +83,18 @@ ENDPROC(cpu_v7m_do_resume)
 __v7m_setup:
 	@ Configure the vector table base address
 	ldr	r0, =BASEADDR_V7M_SCB
+#if CONFIG_COPY_VECTOR_TABLE_TO_SRAM_ADDR > 0x00000000
+	ldr	r12, =CONFIG_COPY_VECTOR_TABLE_TO_SRAM_ADDR
+	mov	r5, r12			@ Copy the kernel vector_table to
+	ldr	r6, =vector_table	@ the in-SRAM vector table
+	ldr	r4, =vector_table_end
+1:	ldr	r3, [r6], #4
+	str	r3, [r5], #4
+	cmp	r6, r4
+	bne	1b			@ End of the copy code
+#else
 	ldr	r12, =vector_table
+#endif
 	str	r12, [r0, V7M_SCB_VTOR]
 
 	@ enable UsageFault, BusFault and MemManage fault.
-- 
2.3.6
