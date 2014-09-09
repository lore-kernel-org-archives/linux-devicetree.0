From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v8 4/5] ARM: dts: imx6sl: Add power-domain information to gpc node
Date: Tue,  9 Sep 2014 15:05:14 +0200
Message-ID: <1410267915-18126-5-git-send-email-p.zabel@pengutronix.de>
References: <1410267915-18126-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410267915-18126-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The PGC that is part of GPC controls isolation and power sequencing of the
power domains. The PU power domain will be handled by the generic pm domain
framework. It needs a phandle to the PU regulator to turn off power when
the domain is disabled and a list of clocks to be enabled during powerup
for reset propagation.

Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6sl.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index c75800c..7ae4847 100644
--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -581,6 +581,10 @@
 				compatible = "fsl,imx6sl-gpc", "fsl,imx6q-gpc";
 				reg = <0x020dc000 0x4000>;
 				interrupts = <0 89 IRQ_TYPE_LEVEL_HIGH>;
+				pu-supply = <&reg_pu>;
+				clocks = <&clks IMX6SL_CLK_GPU2D_OVG>,
+					 <&clks IMX6SL_CLK_GPU2D_PODF>;
+				#power-domain-cells = <1>;
 			};
 
 			gpr: iomuxc-gpr@020e0000 {
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
