From: Yuantian Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v2] arm64: dts: ls1088a: update the sata node
Date: Thu, 11 May 2017 16:01:19 +0800
Message-ID: <1494489680-9544-1-git-send-email-andy.tang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Yuantian Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

1. Sata ecc should be disabled due to a erratum.
Provide the ecc register address for driver to use.
2. Enable dma coherence operation

Signed-off-by: Tang Yuantian <andy.tang-3arQi8VN3Tc@public.gmane.org>
---
v2:
	- move dma-coherent property above status

 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index 2946fd7..caecd14 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -265,9 +265,12 @@
 
 		sata: sata@3200000 {
 			compatible = "fsl,ls1088a-ahci", "fsl,ls1043a-ahci";
-			reg = <0x0 0x3200000 0x0 0x10000>;
+			reg = <0x0 0x3200000 0x0 0x10000>,
+				<0x0 0x20140520 0x0 0x4>;
+			reg-names = "ahci", "sata-ecc";
 			interrupts = <0 133 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clockgen 4 3>;
+			dma-coherent;
 			status = "disabled";
 		};
 	};
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
