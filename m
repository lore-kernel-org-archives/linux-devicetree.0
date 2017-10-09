From: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: dts: imx7d: Invert legacy PCI irq mapping
Date: Mon,  9 Oct 2017 11:43:44 -0700
Message-ID: <20171009184344.5839-1-andrew.smirnov@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

According to i.MX7D reference manual (Rev. 0.1, table 7-1, page 1221)
legacy PCI interrupt mapping is as follows:

 - PCIE INT A is IRQ 122
 - PCIE INT B is IRQ 123
 - PCIE INT C is IRQ 124
 - PCIE INT D is IRQ 125

Invert the mapping information in corresponding DT node to reflect
that.

Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Signed-off-by: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

Discovered by using custom build of QEMU[1] when using together with
"usb-ehci" which is, AFAIU, ICH4. A bit of a convoluted use-case, but
I thought it would still be worht fixing.

[1] https://github.com/ndreys/qemu/tree/imx7-support-upstreaming 

 arch/arm/boot/dts/imx7d.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
index f46814a7ea44..4d308d17f040 100644
--- a/arch/arm/boot/dts/imx7d.dtsi
+++ b/arch/arm/boot/dts/imx7d.dtsi
@@ -144,10 +144,10 @@
 		interrupt-names = "msi";
 		#interrupt-cells = <1>;
 		interrupt-map-mask = <0 0 0 0x7>;
-		interrupt-map = <0 0 0 1 &intc GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 0 2 &intc GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 0 3 &intc GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 0 4 &intc GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-map = <0 0 0 1 &intc GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 2 &intc GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 3 &intc GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 4 &intc GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&clks IMX7D_PCIE_CTRL_ROOT_CLK>,
 			 <&clks IMX7D_PLL_ENET_MAIN_100M_CLK>,
 			 <&clks IMX7D_PCIE_PHY_ROOT_CLK>;
-- 
2.13.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
