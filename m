From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: [PATCH 4/6] ARM: dts; pxa: add embedded pxa camera capture interface
Date: Sat,  6 Jun 2015 23:09:11 +0200
Message-ID: <1433624953-28165-4-git-send-email-robert.jarzmik@free.fr>
References: <1433624953-28165-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433624953-28165-1-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The pxa27x SoCs have an embedded camera host controller. Add the
description to the family description.

Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
---
 arch/arm/boot/dts/pxa27x.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.dtsi
index 506db86..9ebfd7f 100644
--- a/arch/arm/boot/dts/pxa27x.dtsi
+++ b/arch/arm/boot/dts/pxa27x.dtsi
@@ -77,6 +77,23 @@
 			clocks = <&clks CLK_KEYPAD>;
 			status = "disabled";
 		};
+
+		pxa_camera: pxa_camera@50000000 {
+			compatible = "marvell,pxa270-qci";
+			reg = <0x50000000 0x1000>;
+			interrupts = <33>;
+			dmas = <&pdma 68 0	/* Y channel */
+				&pdma 69 0	/* U channel */
+				&pdma 70 0>;	/* V channel */
+			dma-names = "CI_Y", "CI_U", "CI_V";
+
+			clocks = <&clks CLK_CAMERA>;
+			clock-names = "ciclk";
+			clock-frequency = <5000000>;
+			clock-output-names = "qci_mclk";
+
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
