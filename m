From: John Keeping <john-HooS5bfzL4hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/2] ARM: dts: rockchip: fix audio interrupts on rk3288
Date: Tue, 23 Feb 2016 13:41:00 +0000
Message-ID: <1456234860-18832-3-git-send-email-john@metanate.com>
References: <1456234860-18832-1-git-send-email-john@metanate.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456234860-18832-1-git-send-email-john-HooS5bfzL4hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, John Keeping <john-HooS5bfzL4hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

These must be translated from the values in the TRM by subtracting 32,
which has not been done.  The SPDIF interrupt is also off-by-one.

Signed-off-by: John Keeping <john-HooS5bfzL4hWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/rk3288.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 5597105..a82d4b1 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -758,7 +758,7 @@
 		clocks = <&cru HCLK_SPDIF8CH>, <&cru SCLK_SPDIF8CH>;
 		dmas = <&dmac_bus_s 3>;
 		dma-names = "tx";
-		interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&spdif_tx>;
 		rockchip,grf = <&grf>;
@@ -768,7 +768,7 @@
 	i2s: i2s@ff890000 {
 		compatible = "rockchip,rk3288-i2s", "rockchip,rk3066-i2s";
 		reg = <0xff890000 0x10000>;
-		interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 		dmas = <&dmac_bus_s 0>, <&dmac_bus_s 1>;
-- 
2.7.0.226.gfe986fe

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
