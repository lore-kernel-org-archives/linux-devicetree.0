From: Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 4/5] arm64: cputype info for Broadcom Vulcan
Date: Sat, 20 Feb 2016 19:49:23 +0530
Message-ID: <1455977964-8099-5-git-send-email-jchandra@broadcom.com>
References: <1455977964-8099-1-git-send-email-jchandra@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455977964-8099-1-git-send-email-jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
Cc: Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add Broadcom Vulcan implementor ID and part ID in cputype.h. This is
to document the values.

Signed-off-by: Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Acked-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Acked-by: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm64/include/asm/cputype.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 1a59493..3dcecdf 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -65,6 +65,7 @@
 #define ARM_CPU_IMP_ARM			0x41
 #define ARM_CPU_IMP_APM			0x50
 #define ARM_CPU_IMP_CAVIUM		0x43
+#define ARM_CPU_IMP_BRCM		0x42
 
 #define ARM_CPU_PART_AEM_V8		0xD0F
 #define ARM_CPU_PART_FOUNDATION		0xD00
@@ -75,6 +76,8 @@
 
 #define CAVIUM_CPU_PART_THUNDERX	0x0A1
 
+#define BRCM_CPU_PART_VULCAN		0x516
+
 #ifndef __ASSEMBLY__
 
 /*
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
