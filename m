From: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 3/3] ARM: dts: r7s72100: add USB device to device tree
Date: Fri,  5 Jan 2018 17:46:47 -0500
Message-ID: <20180105224647.42262-4-chris.brandt@renesas.com>
References: <20180105224647.42262-1-chris.brandt@renesas.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180105224647.42262-1-chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add USB device support.

Signed-off-by: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
v3:
 * Changed from "renesas,usbhs-r7s72100" to "renesas,rza1-usbhs"
v2:
 * Node name is now generic 'usb@'
 * GIC_SPI (73-32) is now just GIC_SPI 41
 * All hex number are lower case
 * Added Reviewed-by
---
 arch/arm/boot/dts/r7s72100.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index ab9645a42eca..d94431767913 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -667,4 +667,24 @@
 		power-domains = <&cpg_clocks>;
 		status = "disabled";
 	};
+
+	usbhs0: usb@e8010000 {
+		compatible = "renesas,rza1-usbhs";
+		reg = <0xe8010000 0x1a0>;
+		interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp7_clks R7S72100_CLK_USB0>;
+		renesas,buswait = <4>;
+		power-domains = <&cpg_clocks>;
+		status = "disabled";
+	};
+
+	usbhs1: usb@e8207000 {
+		compatible = "renesas,rza1-usbhs";
+		reg = <0xe8207000 0x1a0>;
+		interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp7_clks R7S72100_CLK_USB1>;
+		renesas,buswait = <4>;
+		power-domains = <&cpg_clocks>;
+		status = "disabled";
+	};
 };
-- 
2.15.1


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
