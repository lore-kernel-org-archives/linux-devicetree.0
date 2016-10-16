From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH 2/2] ARM: dts: uniphier: increase register region size of sysctrl node
Date: Mon, 17 Oct 2016 00:42:43 +0900
Message-ID: <1476632563-7446-2-git-send-email-yamada.masahiro@socionext.com>
References: <1476632563-7446-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476632563-7446-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The System Control node has 0x10000 byte of registers.  The current
reg size must be expanded to use the cpufreq driver because the
registers controlling CPU frequency are located at offset 0x8000.

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---

 arch/arm/boot/dts/uniphier-common32.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/uniphier-common32.dtsi b/arch/arm/boot/dts/uniphier-common32.dtsi
index 8c8a851..d067f38 100644
--- a/arch/arm/boot/dts/uniphier-common32.dtsi
+++ b/arch/arm/boot/dts/uniphier-common32.dtsi
@@ -183,7 +183,7 @@
 		sysctrl@61840000 {
 			compatible = "socionext,uniphier-sysctrl",
 				     "simple-mfd", "syscon";
-			reg = <0x61840000 0x4000>;
+			reg = <0x61840000 0x10000>;
 
 			sys_clk: clock {
 				#clock-cells = <1>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
