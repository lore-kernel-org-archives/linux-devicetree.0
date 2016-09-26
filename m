From: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 1/2] ARM: dts: r7s72100: add sdhi to device tree
Date: Mon, 26 Sep 2016 16:40:31 -0400
Message-ID: <20160926204032.12260-2-chris.brandt@renesas.com>
References: <20160926204032.12260-1-chris.brandt@renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160926204032.12260-1-chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---
v2:
 * removed bus-width
---
 arch/arm/boot/dts/r7s72100.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index e97d6d1..53a38e3 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -458,4 +458,30 @@
 		#size-cells = <0>;
 		status = "disabled";
 	};
+
+	sdhi0: sd@e804e000 {
+		compatible = "renesas,sdhi-r7s72100";
+		reg = <0xe804e000 0x100>;
+		interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+
+		clocks = <&mstp12_clks R7S72100_CLK_SDHI0>;
+		cap-sd-highspeed;
+		cap-sdio-irq;
+		status = "disabled";
+	};
+
+	sdhi1: sd@e804e800 {
+		compatible = "renesas,sdhi-r7s72100";
+		reg = <0xe804e800 0x100>;
+		interrupts = <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>;
+
+		clocks = <&mstp12_clks R7S72100_CLK_SDHI1>;
+		cap-sd-highspeed;
+		cap-sdio-irq;
+		status = "disabled";
+	};
 };
-- 
2.9.2


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
