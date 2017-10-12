From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 08/13] ARM: dts: r8a7790: Add clocks for CA7 CPU cores
Date: Thu, 12 Oct 2017 11:35:11 +0200
Message-ID: <1507800916-11509-9-git-send-email-geert+renesas@glider.be>
References: <1507800916-11509-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507800916-11509-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Currently only the CPU cores in the CA15 cluster have clocks properties.
Add the missing clocks properties for the CPU cores in the CA7 cluster
to fix this.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
 arch/arm/boot/dts/r8a7790.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 7f86cb9f634fbed7..0a2cec636b10a3e1 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -101,6 +101,7 @@
 			compatible = "arm,cortex-a7";
 			reg = <0x100>;
 			clock-frequency = <780000000>;
+			clocks = <&cpg CPG_CORE R8A7790_CLK_Z2>;
 			power-domains = <&sysc R8A7790_PD_CA7_CPU0>;
 			next-level-cache = <&L2_CA7>;
 		};
@@ -110,6 +111,7 @@
 			compatible = "arm,cortex-a7";
 			reg = <0x101>;
 			clock-frequency = <780000000>;
+			clocks = <&cpg CPG_CORE R8A7790_CLK_Z2>;
 			power-domains = <&sysc R8A7790_PD_CA7_CPU1>;
 			next-level-cache = <&L2_CA7>;
 		};
@@ -119,6 +121,7 @@
 			compatible = "arm,cortex-a7";
 			reg = <0x102>;
 			clock-frequency = <780000000>;
+			clocks = <&cpg CPG_CORE R8A7790_CLK_Z2>;
 			power-domains = <&sysc R8A7790_PD_CA7_CPU2>;
 			next-level-cache = <&L2_CA7>;
 		};
@@ -128,6 +131,7 @@
 			compatible = "arm,cortex-a7";
 			reg = <0x103>;
 			clock-frequency = <780000000>;
+			clocks = <&cpg CPG_CORE R8A7790_CLK_Z2>;
 			power-domains = <&sysc R8A7790_PD_CA7_CPU3>;
 			next-level-cache = <&L2_CA7>;
 		};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
