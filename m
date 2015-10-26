From: Dongsheng Wang <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] arm/layerscape: add RCPM device tree support for ls1021a.
Date: Mon, 26 Oct 2015 14:53:12 +0800
Message-ID: <1445842392-7129-1-git-send-email-dongsheng.wang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jason.jin-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Signed-off-by: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
*v4*:
-Separate this patch from RCPM binding patchset.
-Change "rcpm-wakeup" to "fsl,rcpm-wakeup". 
*v3*: Add "fsl,#rcpm-wakeup-cells" for rcpm node.
*v2*: No change.

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index 973a496..b713cfc 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -139,6 +139,7 @@
 			sdhci,auto-cmd12;
 			big-endian;
 			bus-width = <4>;
+			fsl,rcpm-wakeup = <&rcpm 0x00000080 0x0>;
 			status = "disabled";
 		};
 
@@ -186,6 +187,12 @@
 			};
 		};
 
+		rcpm: rcpm@1ee2000 {
+			compatible = "fsl,ls1021a-rcpm", "fsl,qoriq-rcpm-2.1";
+			reg = <0x0 0x1ee2000 0x0 0x10000>;
+			fsl,#rcpm-wakeup-cells = <2>;
+		};
+
 		dspi0: dspi@2100000 {
 			compatible = "fsl,ls1021a-v1.0-dspi";
 			#address-cells = <1>;
@@ -287,6 +294,7 @@
 			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&sysclk>;
 			clock-names = "ipg";
+			fsl,rcpm-wakeup = <&rcpm 0x0 0x40000000>;
 			status = "disabled";
 		};
 
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
