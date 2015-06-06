From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: [PATCH 3/6] ARM: dts: pxa: add dma pxamci nodes to pxa3xx
Date: Sat,  6 Jun 2015 23:09:10 +0200
Message-ID: <1433624953-28165-3-git-send-email-robert.jarzmik@free.fr>
References: <1433624953-28165-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433624953-28165-1-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the 3 possible mmc controllers on pxa3xx SoCs to the devicetree
description. Add the dma and clocks to the device-tree description of
pxa27x and pxa3xx at the same time.

Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
---
 arch/arm/boot/dts/pxa2xx.dtsi |  4 ++++
 arch/arm/boot/dts/pxa3xx.dtsi | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/pxa2xx.dtsi b/arch/arm/boot/dts/pxa2xx.dtsi
index 71a0cd7..5e5af07 100644
--- a/arch/arm/boot/dts/pxa2xx.dtsi
+++ b/arch/arm/boot/dts/pxa2xx.dtsi
@@ -128,6 +128,10 @@
 			compatible = "marvell,pxa-mmc";
 			reg = <0x41100000 0x1000>;
 			interrupts = <23>;
+			clocks = <&clks CLK_MMC>;
+			dmas = <&pdma 21 3
+				&pdma 22 3>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
diff --git a/arch/arm/boot/dts/pxa3xx.dtsi b/arch/arm/boot/dts/pxa3xx.dtsi
index d90489b..29aeac5 100644
--- a/arch/arm/boot/dts/pxa3xx.dtsi
+++ b/arch/arm/boot/dts/pxa3xx.dtsi
@@ -53,6 +53,39 @@
 			interrupt-controller;
 			#interrupt-cells = <0x2>;
 		};
+
+		mmc0: mmc@41100000 {
+			compatible = "marvell,pxa-mmc";
+			reg = <0x41100000 0x1000>;
+			interrupts = <23>;
+			clocks = <&clks CLK_MMC>;
+			dmas = <&pdma 21 3
+				&pdma 22 3>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		mmc1: mmc@42000000 {
+			compatible = "marvell,pxa-mmc";
+			reg = <0x42000000 0x1000>;
+			interrupts = <41>;
+			clocks = <&clks CLK_MMC1>;
+			dmas = <&pdma 93 3
+				&pdma 94 3>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		mmc2: mmc@42500000 {
+			compatible = "marvell,pxa-mmc";
+			reg = <0x42500000 0x1000>;
+			interrupts = <55>;
+			clocks = <&clks CLK_MMC2>;
+			dmas = <&pdma 46 3
+				&pdma 47 3>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
 	};
 
 	clocks {
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
