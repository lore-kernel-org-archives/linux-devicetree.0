From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: [PATCH v3 3/6] arm: pxa: add clock pll selection bits
Date: Wed, 30 Jul 2014 22:51:01 +0200
Message-ID: <1406753464-15000-4-git-send-email-robert.jarzmik@free.fr>
References: <1406753464-15000-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406753464-15000-1-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add missing bits for CCCR and CCSR :
 - CPLL and PPLL selection, either full speed or 13MHz
 - CPSR masks

Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
---
 arch/arm/mach-pxa/include/mach/pxa2xx-regs.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/mach-pxa/include/mach/pxa2xx-regs.h b/arch/arm/mach-pxa/include/mach/pxa2xx-regs.h
index ee6ced1..f1dd629 100644
--- a/arch/arm/mach-pxa/include/mach/pxa2xx-regs.h
+++ b/arch/arm/mach-pxa/include/mach/pxa2xx-regs.h
@@ -143,6 +143,16 @@
 #define CCCR_M_MASK	0x0060	/* Memory Frequency to Run Mode Frequency Multiplier */
 #define CCCR_L_MASK	0x001f	/* Crystal Frequency to Memory Frequency Multiplier */
 
+#define CCCR_CPDIS_BIT	(31)
+#define CCCR_PPDIS_BIT	(30)
+#define CCCR_LCD_26_BIT	(27)
+#define CCCR_A_BIT	(25)
+
+#define CCSR_N2_MASK	CCCR_N_MASK
+#define CCSR_M_MASK	CCCR_M_MASK
+#define CCSR_L_MASK	CCCR_L_MASK
+#define CCSR_N2_SHIFT	7
+
 #define CKEN_AC97CONF   (31)    /* AC97 Controller Configuration */
 #define CKEN_CAMERA	(24)	/* Camera Interface Clock Enable */
 #define CKEN_SSP1	(23)	/* SSP1 Unit Clock Enable */
-- 
2.0.0.rc2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
