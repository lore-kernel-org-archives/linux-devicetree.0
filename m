From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ARM: meson: Fix UART compatible
Date: Sun, 12 Oct 2014 21:20:24 +0200
Message-ID: <1413141624-8949-1-git-send-email-carlo@caione.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Fix the compatible for the UART to make it consistent with the other
compatibles for Meson6 and Meson8 and to avoid problems when the
meson8b will be introduced with a different UART driver.

Signed-off-by: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/meson.dtsi    | 8 ++++----
 drivers/tty/serial/meson_uart.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index e6539ea..a0d34ee 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -76,7 +76,7 @@
 		};
 
 		uart_AO: serial@c81004c0 {
-			compatible = "amlogic,meson-uart";
+			compatible = "amlogic,meson6-uart";
 			reg = <0xc81004c0 0x14>;
 			interrupts = <0 90 1>;
 			clocks = <&clk81>;
@@ -84,7 +84,7 @@
 		};
 
 		uart_A: serial@c81084c0 {
-			compatible = "amlogic,meson-uart";
+			compatible = "amlogic,meson6-uart";
 			reg = <0xc81084c0 0x14>;
 			interrupts = <0 90 1>;
 			clocks = <&clk81>;
@@ -92,7 +92,7 @@
 		};
 
 		uart_B: serial@c81084dc {
-			compatible = "amlogic,meson-uart";
+			compatible = "amlogic,meson6-uart";
 			reg = <0xc81084dc 0x14>;
 			interrupts = <0 90 1>;
 			clocks = <&clk81>;
@@ -100,7 +100,7 @@
 		};
 
 		uart_C: serial@c8108700 {
-			compatible = "amlogic,meson-uart";
+			compatible = "amlogic,meson6-uart";
 			reg = <0xc8108700 0x14>;
 			interrupts = <0 90 1>;
 			clocks = <&clk81>;
diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 15c7497..4c3de09 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -590,7 +590,7 @@ static int meson_uart_remove(struct platform_device *pdev)
 
 
 static const struct of_device_id meson_uart_dt_match[] = {
-	{ .compatible = "amlogic,meson-uart" },
+	{ .compatible = "amlogic,meson6-uart" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, meson_uart_dt_match);
@@ -600,7 +600,7 @@ static  struct platform_driver meson_uart_platform_driver = {
 	.remove		= meson_uart_remove,
 	.driver		= {
 		.owner		= THIS_MODULE,
-		.name		= "meson_uart",
+		.name		= "meson6_uart",
 		.of_match_table	= meson_uart_dt_match,
 	},
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
