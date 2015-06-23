From: Paul Osmialowski <pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>
Subject: [PATCH 4/9] arm: allow copying of vector table to internal SRAM memory
Date: Tue, 23 Jun 2015 23:19:42 +0200
Message-ID: <1435094387-20146-5-git-send-email-pawelo__17394.814923364$1435096243$gmane$org@king.net.pl>
References: <1435094387-20146-1-git-send-email-pawelo@king.net.pl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435094387-20146-1-git-send-email-pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Nathan Lynch <nathan_lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Nicolas
Cc: Paul Osmialowski <pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>, Yuri Tikhonov <yur-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>, Sergei Poselenov <sposelenov-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>, Dmitry Cherkassov <d_cherkasov-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>, Alexander Potashev <aspotashev-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Based on part of the commit published on Emcraft git repo:

https://github.com/EmcraftSystems/linux-emcraft.git

2ce1841b590d014d8738215fb1ffe05f53c8d9f0 "some commit"

by: Dmitry Cherkassov <d_cherkasov-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>

The ARM v7M allows setting the vector table either in
the boot memory or in the internal SRAM memory, controlled
by Bit 29 in the Vector Table Base register. This implies
that the OS vector table needs to be copied to the internal RAM.

New option CONFIG_COPY_VECTOR_TABLE_TO_SRAM_ADDR allows specification
of the desired destination for the OS vector table.

Signed-off-by: Paul Osmialowski <pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
