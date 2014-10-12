From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [RFC 6/7] ARM: vf610m4: HACK: get dtb pointer from SRC_GPR3
Date: Sun, 12 Oct 2014 20:14:00 +0200
Message-ID: <2bdc44912522eb02db2e4612738fe9f0545b36d9.1413136383.git.stefan@agner.ch>
References: <cover.1413136383.git.stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1413136383.git.stefan-XLVq0VzYD2Y@public.gmane.org>
In-Reply-To: <cover.1413136383.git.stefan-XLVq0VzYD2Y@public.gmane.org>
References: <cover.1413136383.git.stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Get DTB pointer (located in r2) from SRC_GPR3 (argument register
for secondary core)

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
This is clearly a hack but it works around the need of a boot loader
on the Cortex-M4. I guess there is no way neither its acceptable to
do this on machine level..? But then, this can also be done with a
minimal boot loader loaded just in front of the kernel by the m4boot
utility.

 arch/arm/kernel/head-nommu.S | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/kernel/head-nommu.S b/arch/arm/kernel/head-nommu.S
index cc176b6..0468683 100644
--- a/arch/arm/kernel/head-nommu.S
+++ b/arch/arm/kernel/head-nommu.S
@@ -37,6 +37,10 @@
  *
  */
 
+#define	SRC_BASE	0x4006e000
+#define SRC_GPR2	0x28
+#define SRC_GPR3	0x2c
+
 	__HEAD
 
 #ifdef CONFIG_CPU_THUMBONLY
@@ -57,6 +61,10 @@ ENTRY(stext)
 #if defined(CONFIG_CPU_CP15)
 	mrc	p15, 0, r9, c0, c0		@ get processor id
 #elif defined(CONFIG_CPU_V7M)
+
+	ldr	r0, =SRC_BASE
+	ldr	r1, =0xffffffff		@ Machine ID
+	ldr	r2, [r0, #SRC_GPR3 ] 	@ DT pointer from argument register
 	ldr	r9, =BASEADDR_V7M_SCB
 	ldr	r9, [r9, V7M_SCB_CPUID]
 #else
-- 
2.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
