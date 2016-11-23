From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH] ARM: dts: imx7d: fix LCDIF clock assignment
Date: Tue, 22 Nov 2016 16:42:04 -0800
Message-ID: <20161123004204.10851-1-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: Ying.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The eLCDIF IP of the i.MX 7 SoC knows multiple clocks and lists them
separately:

Clock      Clock Root              Description
apb_clk    MAIN_AXI_CLK_ROOT       AXI clock
pix_clk    LCDIF_PIXEL_CLK_ROOT    Pixel clock
ipg_clk_s  MAIN_AXI_CLK_ROOT       Peripheral access clock

All of them are switched by a single gate, which is part of the
IMX7D_LCDIF_PIXEL_ROOT_CLK clock. Hence using that clock also for
the AXI bus clock (clock-name "axi") makes sure the gate gets
enabled when accessing registers.

There seem to be no separate AXI display clock, and the clock is
optional. Hence remove the dummy clock.

This fixes kernel freezes when starting the X-Server (which
disables/re-enables the display controller).

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
 arch/arm/boot/dts/imx7s.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index 0d7d5ac..2b6cb05 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -643,9 +643,8 @@
 				reg = <0x30730000 0x10000>;
 				interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX7D_LCDIF_PIXEL_ROOT_CLK>,
-					<&clks IMX7D_CLK_DUMMY>,
-					<&clks IMX7D_CLK_DUMMY>;
-				clock-names = "pix", "axi", "disp_axi";
+					<&clks IMX7D_LCDIF_PIXEL_ROOT_CLK>;
+				clock-names = "pix", "axi";
 				status = "disabled";
 			};
 		};
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
