From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [RFC 1/7] ARM: vf610: add low level debug support for !MMU
Date: Sun, 12 Oct 2014 20:13:55 +0200
Message-ID: <331b5f06d72890ac348adcd8cce616db576eb10e.1413136383.git.stefan@agner.ch>
References: <cover.1413136383.git.stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1413136383.git.stefan-XLVq0VzYD2Y@public.gmane.org>
In-Reply-To: <cover.1413136383.git.stefan-XLVq0VzYD2Y@public.gmane.org>
References: <cover.1413136383.git.stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for !MMU low level debug required for the secondary
Cortex-M4 core in Vybrid.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
 arch/arm/include/debug/vf.S | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/include/debug/vf.S b/arch/arm/include/debug/vf.S
index b889338..63c7ef7 100644
--- a/arch/arm/include/debug/vf.S
+++ b/arch/arm/include/debug/vf.S
@@ -17,12 +17,22 @@
 
 #define VF_UART_VIRTUAL_BASE	0xfe000000
 
+#ifdef CONFIG_MMU
+
 	.macro	addruart, rp, rv, tmp
 	ldr	\rp, =VF_UART_PHYSICAL_BASE 	@ physical
 	and	\rv, \rp, #0xffffff		@ offset within 16MB section
 	add	\rv, \rv, #VF_UART_VIRTUAL_BASE
 	.endm
 
+#else /* !CONFIG_MMU */
+
+	.macro	addruart, rx, tmp
+	ldr	\rx, =(VF_UART_PHYSICAL_BASE)	@ physical
+	.endm
+
+#endif /* CONFIG_MMU */
+
 	.macro	senduart, rd, rx
 	strb	\rd, [\rx, #0x7]	@ Data Register
 	.endm
-- 
2.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
