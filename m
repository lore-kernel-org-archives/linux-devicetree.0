From: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/4] ARM: dts: r7s72100: add mmcif to device tree
Date: Thu, 15 Sep 2016 15:34:03 -0400
Message-ID: <20160915193405.26943-3-chris.brandt@renesas.com>
References: <20160915193405.26943-1-chris.brandt@renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160915193405.26943-1-chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/r7s72100.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index e18d4e6..4054db3 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -450,4 +450,15 @@
 		#size-cells = <0>;
 		status = "disabled";
 	};
+
+	mmcif: mmc@e804c800 {
+		compatible = "renesas,mmcif-r7s72100", "renesas,sh-mmcif";
+		reg = <0xe804c800 0x80>;
+		interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp8_clks R7S72100_CLK_MMCIF>;
+		reg-io-width = <4>;
+		bus-width = <8>;
+		status = "disabled";
+	};
 };
-- 
2.9.2


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
