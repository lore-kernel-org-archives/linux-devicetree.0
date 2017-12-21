From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: [PATCH] ARM: dts: tango4: remove bogus interrupt-controller property
Date: Thu, 21 Dec 2017 22:48:19 +0100
Message-ID: <20171221214831.3859194-1-arnd@arndb.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Gonzalez <marc_gonzalez-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

dtc points out that the parent node of the interrupt controllers is not
actually an interrupt controller itself, and lacks an #interrupt-cells
property:

arch/arm/boot/dts/tango4-vantage-1172.dtb: Warning (interrupts_property): Missing #interrupt-cells in interrupt-parent /soc/interrupt-controller@6e000

This removes the annotation.

Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
 arch/arm/boot/dts/tango4-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/tango4-common.dtsi b/arch/arm/boot/dts/tango4-common.dtsi
index 0ec1b0a317b4..ff72a8efb73d 100644
--- a/arch/arm/boot/dts/tango4-common.dtsi
+++ b/arch/arm/boot/dts/tango4-common.dtsi
@@ -156,7 +156,6 @@
 			reg = <0x6e000 0x400>;
 			ranges = <0 0x6e000 0x400>;
 			interrupt-parent = <&gic>;
-			interrupt-controller;
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
