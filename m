From: Jose Abreu <Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/2] arc: axs10x: Fix ARC PGU default clock frequency
Date: Wed, 22 Feb 2017 18:19:35 +0000
Message-ID: <16273b3a26ec770f8d169f04f7cb9eb2fac55909.1487787376.git.joabreu@synopsys.com>
References: <7ed6deaf1ae6d5819364c793835aa30316077a7e.1487787376.git.joabreu@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7ed6deaf1ae6d5819364c793835aa30316077a7e.1487787376.git.joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
In-Reply-To: <7ed6deaf1ae6d5819364c793835aa30316077a7e.1487787376.git.joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
References: <7ed6deaf1ae6d5819364c793835aa30316077a7e.1487787376.git.joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Jose Abreu <Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Carlos Palminha <CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Default clock frequency for ARC PGU does not match any
existing HDMI mode, instead the default value matches a
DVI mode. Change the clock frequency to 74.25MHz so that
it matches HDMI mode 1280x720@60Hz

Signed-off-by: Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Carlos Palminha <palminha-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Alexey Brodkin <abrodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 arch/arc/boot/dts/axs10x_mb.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index 9d882b1..41cfb29 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -51,7 +51,7 @@
 			pguclk: pguclk {
 				#clock-cells = <0>;
 				compatible = "fixed-clock";
-				clock-frequency = <74440000>;
+				clock-frequency = <74250000>;
 			};
 		};
 
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
