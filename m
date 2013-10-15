From: Rostislav Lisovy <lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/4] ARM: dts: i.MX53: Internal keyboard controller
Date: Wed, 16 Oct 2013 00:03:27 +0200
Message-ID: <1381874609-14464-3-git-send-email-lisovy@gmail.com>
References: <1381874609-14464-1-git-send-email-lisovy@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381874609-14464-1-git-send-email-lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: pisa-/N2ztlQkxE7Ub/6JBqosbQ@public.gmane.org, Rostislav Lisovy <lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Rostislav Lisovy <lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

diff --git a/arch/arm/boot/dts/imx53.dtsi b/arch/arm/boot/dts/imx53.dtsi
index 55e83d1..362eca0 100644
--- a/arch/arm/boot/dts/imx53.dtsi
+++ b/arch/arm/boot/dts/imx53.dtsi
@@ -281,6 +281,14 @@
 				#interrupt-cells = <2>;
 			};
 
+			kpp: kpp@53f94000 {
+				compatible = "fsl,imx53-kpp", "fsl,imx21-kpp";
+				reg = <0x53f94000 0x4000>;
+				interrupts = <60>;
+				clocks = <&clks 0>;
+				status = "disabled";
+			};
+
 			wdog1: wdog@53f98000 {
 				compatible = "fsl,imx53-wdt", "fsl,imx21-wdt";
 				reg = <0x53f98000 0x4000>;
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
