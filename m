From: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 2/5] ARM64: dts: meson-axg: uart: drop legacy compatible name from EE UART
Date: Sat, 6 Jan 2018 08:10:41 +0800
Message-ID: <20180106001044.108163-3-yixun.lan@amlogic.com>
References: <20180106001044.108163-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180106001044.108163-1-yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

When update the clock info for the UART controller in the EE domain,
the driver explicitly require 'pclk' in order to work properly.

With current logic of the code, the driver will go for the legacy clock probe
routine[1] if it find current compatible string match to 'amlogic,meson-uart',
which result in not requesting the 'pclk' clock, thus break the driver in the end.

[1] drivers/tty/serial/meson_uart.c:685

        /* Use legacy way until all platforms switch to new bindings */
	if (of_device_is_compatible(pdev->dev.of_node, "amlogic,meson-uart"))
		ret = meson_uart_probe_clocks_legacy(pdev, port);
	else
		ret = meson_uart_probe_clocks(pdev, port);

Acked-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Signed-off-by: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 70c776ef7aa7..644d0f9eaf8c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -164,17 +164,21 @@
 			};
 
 			uart_A: serial@24000 {
-				compatible = "amlogic,meson-gx-uart", "amlogic,meson-uart";
+				compatible = "amlogic,meson-gx-uart";
 				reg = <0x0 0x24000 0x0 0x18>;
 				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
+				clocks = <&xtal>, <&clkc CLKID_UART0>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
 			};
 
 			uart_B: serial@23000 {
-				compatible = "amlogic,meson-gx-uart", "amlogic,meson-uart";
+				compatible = "amlogic,meson-gx-uart";
 				reg = <0x0 0x23000 0x0 0x18>;
 				interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
+				clocks = <&xtal>, <&clkc CLKID_UART1>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
 			};
 		};
 
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
