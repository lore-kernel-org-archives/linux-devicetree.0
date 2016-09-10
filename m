From: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Subject: [PATCH v5 2/5] arm64: dts: Add timer erratum property for LS2080A and LS1043A
Date: Fri,  9 Sep 2016 20:03:30 -0500
Message-ID: <1473469413-11019-2-git-send-email-oss@buserror.net>
References: <1473469413-11019-1-git-send-email-oss@buserror.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473469413-11019-1-git-send-email-oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, mike.caraman-3arQi8VN3Tc@public.gmane.org, Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
---
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 1 +
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index e669fbd..952531d 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -123,6 +123,7 @@
 			     <1 14 0x1>, /* Physical Non-Secure PPI */
 			     <1 11 0x1>, /* Virtual PPI */
 			     <1 10 0x1>; /* Hypervisor PPI */
+		fsl,erratum-a008585;
 	};
 
 	pmu {
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
index 21023a3..9d3ac19 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
@@ -195,6 +195,7 @@
 			     <1 14 0x8>, /* Physical Non-Secure PPI, active-low */
 			     <1 11 0x8>, /* Virtual PPI, active-low */
 			     <1 10 0x8>; /* Hypervisor PPI, active-low */
+		fsl,erratum-a008585;
 	};
 
 	pmu {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
