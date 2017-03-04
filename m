From: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v6 3/3] ARM: dts: r7s72100: Add watchdog timer
Date: Sat,  4 Mar 2017 17:37:37 -0500
Message-ID: <20170304223737.20419-4-chris.brandt@renesas.com>
References: <20170304223737.20419-1-chris.brandt@renesas.com>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170304223737.20419-1-chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add watchdog timer support for RZ/A1.
For the RZ/A1, the only way to do a reset is to overflow the WDT, so this
is useful even if you don't need the watchdog functionality.

Signed-off-by: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
v4:
* changed from timer@ to watchdog@
v3:
* added Reviewed-by
v2:
* changed "renesas,r7s72100-reset" to "renesas,r7s72100-wdt"
* changed "renesas,wdt-reset" to "renesas,rza-wdt"
* added interupt property (even though it is not used)
* added clocks property
---
 arch/arm/boot/dts/r7s72100.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index ed62e19..22f96b7 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -382,6 +382,13 @@
 		cache-level = <2>;
 	};
 
+	wdt: watchdog@fcfe0000 {
+		compatible = "renesas,r7s72100-wdt", "renesas,rza-wdt";
+		reg = <0xfcfe0000 0x6>;
+		interrupts = <GIC_SPI 106 IRQ_TYPE_EDGE_RISING>;
+		clocks = <&p0_clk>;
+	};
+
 	i2c0: i2c@fcfee000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.10.1


--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
