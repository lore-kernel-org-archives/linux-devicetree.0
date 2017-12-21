From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: [PATCH] ARM: dts: ls1021a: fix incorrect clock references
Date: Thu, 21 Dec 2017 22:44:20 +0100
Message-ID: <20171221214432.3658852-1-arnd@arndb.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

dtc warns about two 'clocks' properties that have an extraneous '1'
at the end:

arch/arm/boot/dts/ls1021a-qds.dtb: Warning (clocks_property): arch/arm/boot/dts/ls1021a-twr.dtb: Warning (clocks_property): Property 'clocks', cell 1 is not a phandle reference in /soc/i2c@2180000/mux@77/i2c@4/sgtl5000@2a
arch/arm/boot/dts/ls1021a-qds.dtb: Warning (clocks_property): Missing property '#clock-cells' in node /soc/interrupt-controller@1400000 or bad phandle (referred from /soc/i2c@2180000/mux@77/i2c@4/sgtl5000@2a:clocks[1])
Property 'clocks', cell 1 is not a phandle reference in /soc/i2c@2190000/sgtl5000@a
arch/arm/boot/dts/ls1021a-twr.dtb: Warning (clocks_property): Missing property '#clock-cells' in node /soc/interrupt-controller@1400000 or bad phandle (referred from /soc/i2c@2190000/sgtl5000@a:clocks[1])

The clocks that get referenced here are fixed-rate, so they do not
take any argument, and dtc interprets the next cell as a phandle, which
is invalid.

Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
 arch/arm/boot/dts/ls1021a-qds.dts | 2 +-
 arch/arm/boot/dts/ls1021a-twr.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ls1021a-qds.dts b/arch/arm/boot/dts/ls1021a-qds.dts
index 940875316d0f..67b4de0e3439 100644
--- a/arch/arm/boot/dts/ls1021a-qds.dts
+++ b/arch/arm/boot/dts/ls1021a-qds.dts
@@ -215,7 +215,7 @@
 				reg = <0x2a>;
 				VDDA-supply = <&reg_3p3v>;
 				VDDIO-supply = <&reg_3p3v>;
-				clocks = <&sys_mclk 1>;
+				clocks = <&sys_mclk>;
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/ls1021a-twr.dts b/arch/arm/boot/dts/ls1021a-twr.dts
index a8b148ad1dd2..44715c8ef756 100644
--- a/arch/arm/boot/dts/ls1021a-twr.dts
+++ b/arch/arm/boot/dts/ls1021a-twr.dts
@@ -187,7 +187,7 @@
 		reg = <0x0a>;
 		VDDA-supply = <&reg_3p3v>;
 		VDDIO-supply = <&reg_3p3v>;
-		clocks = <&sys_mclk 1>;
+		clocks = <&sys_mclk>;
 	};
 };
 
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
