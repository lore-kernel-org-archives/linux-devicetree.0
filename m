From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] ARM: dts: rockchip: Remove unnecessary setting of UART0 SCLK rate on veyron
Date: Wed, 10 Apr 2019 11:30:10 -0700
Message-ID: <20190410183010.21307-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Some veyron devices have a Bluetooth controller connected on UART0.
The UART needs to operate at a high speed, however setting the clock
rate at initialization has no practical effect. During initialization
user space adjusts the UART baudrate multiple times, which ends up
changing the SCLK rate. After a successful initiatalization the clk
is running at the desired speed (48MHz).

Remove the unnecessary clock rate configuration from the DT.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 arch/arm/boot/dts/rk3288-veyron.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-veyron.dtsi b/arch/arm/boot/dts/rk3288-veyron.dtsi
index 0bc2409f6903..97e980383e25 100644
--- a/arch/arm/boot/dts/rk3288-veyron.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron.dtsi
@@ -378,10 +378,6 @@
 &uart0 {
 	status = "okay";
 
-	/* We need to go faster than 24MHz, so adjust clock parents / rates */
-	assigned-clocks = <&cru SCLK_UART0>;
-	assigned-clock-rates = <48000000>;
-
 	/* Pins don't include flow control by default; add that in */
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_xfer &uart0_cts &uart0_rts>;
-- 
2.21.0.392.gf8f6787159e-goog
