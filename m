From: Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH] arm64: dts: update the DPAA QBMan nodes
Date: Tue, 3 Oct 2017 16:04:15 +0300
Message-ID: <1507035855-23068-1-git-send-email-madalin.bucur@nxp.com>
Reply-To: <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use constants in the interrupt description.

Signed-off-by: Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index d16b9cc..0f5e9fe 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -376,14 +376,14 @@
 		qman: qman@1880000 {
 			compatible = "fsl,qman";
 			reg = <0x0 0x1880000 0x0 0x10000>;
-			interrupts = <0 45 0x4>;
+			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
 			memory-region = <&qman_fqd &qman_pfdr>;
 		};
 
 		bman: bman@1890000 {
 			compatible = "fsl,bman";
 			reg = <0x0 0x1890000 0x0 0x10000>;
-			interrupts = <0 45 0x4>;
+			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
 			memory-region = <&bman_fbpr>;
 		};
 
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index c8ff0ba..eddee02 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -281,7 +281,7 @@
 		qman: qman@1880000 {
 			compatible = "fsl,qman";
 			reg = <0x0 0x1880000 0x0 0x10000>;
-			interrupts = <0 45 0x4>;
+			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
 			memory-region = <&qman_fqd &qman_pfdr>;
 
 		};
@@ -289,7 +289,7 @@
 		bman: bman@1890000 {
 			compatible = "fsl,bman";
 			reg = <0x0 0x1890000 0x0 0x10000>;
-			interrupts = <0 45 0x4>;
+			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
 			memory-region = <&bman_fbpr>;
 
 		};
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
