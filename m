From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v8 05/11] ARM: Enable erratum 798181 for Broadcom Brahma-B15
Date: Mon, 21 Jul 2014 14:08:00 -0700
Message-ID: <1405976886-27807-6-git-send-email-computersforpeace@gmail.com>
References: <1405976886-27807-1-git-send-email-computersforpeace@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405976886-27807-1-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Broadcom Brahma-B15 (r0p0..r0p2) is also affected by Cortex-A15
erratum 798181, so enable the workaround for Brahma-B15.

Signed-off-by: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/kernel/smp_tlb.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm/kernel/smp_tlb.c b/arch/arm/kernel/smp_tlb.c
index 95d063620b76..2e72be4f623e 100644
--- a/arch/arm/kernel/smp_tlb.c
+++ b/arch/arm/kernel/smp_tlb.c
@@ -92,15 +92,19 @@ void erratum_a15_798181_init(void)
 	unsigned int midr = read_cpuid_id();
 	unsigned int revidr = read_cpuid(CPUID_REVIDR);
 
-	/* Cortex-A15 r0p0..r3p2 w/o ECO fix affected */
-	if ((midr & 0xff0ffff0) != 0x410fc0f0 || midr > 0x413fc0f2 ||
-	    (revidr & 0x210) == 0x210) {
-		return;
-	}
-	if (revidr & 0x10)
-		erratum_a15_798181_handler = erratum_a15_798181_partial;
-	else
+	/* Brahma-B15 r0p0..r0p2 affected
+	 * Cortex-A15 r0p0..r3p2 w/o ECO fix affected */
+	if ((midr & 0xff0ffff0) == 0x420f00f0 && midr <= 0x420f00f2)
 		erratum_a15_798181_handler = erratum_a15_798181_broadcast;
+	else if ((midr & 0xff0ffff0) == 0x410fc0f0 && midr <= 0x413fc0f2 &&
+		 (revidr & 0x210) != 0x210) {
+		if (revidr & 0x10)
+			erratum_a15_798181_handler =
+				erratum_a15_798181_partial;
+		else
+			erratum_a15_798181_handler =
+				erratum_a15_798181_broadcast;
+	}
 }
 #endif
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
