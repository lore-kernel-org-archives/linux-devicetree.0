From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 13/13] ARM: dts: sh73a0: Add clocks for CA9 CPU cores
Date: Thu, 12 Oct 2017 11:35:16 +0200
Message-ID: <1507800916-11509-14-git-send-email-geert+renesas@glider.be>
References: <1507800916-11509-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507800916-11509-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Improve hardware description by adding clocks properties to the device
nodes corresponding to the CA9 CPU cores.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
 arch/arm/boot/dts/sh73a0.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/sh73a0.dtsi b/arch/arm/boot/dts/sh73a0.dtsi
index f841895e5adc615a..a074106839a62e37 100644
--- a/arch/arm/boot/dts/sh73a0.dtsi
+++ b/arch/arm/boot/dts/sh73a0.dtsi
@@ -27,6 +27,7 @@
 			compatible = "arm,cortex-a9";
 			reg = <0>;
 			clock-frequency = <1196000000>;
+			clocks = <&cpg_clocks SH73A0_CLK_Z>;
 			power-domains = <&pd_a2sl>;
 			next-level-cache = <&L2>;
 		};
@@ -35,6 +36,7 @@
 			compatible = "arm,cortex-a9";
 			reg = <1>;
 			clock-frequency = <1196000000>;
+			clocks = <&cpg_clocks SH73A0_CLK_Z>;
 			power-domains = <&pd_a2sl>;
 			next-level-cache = <&L2>;
 		};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
