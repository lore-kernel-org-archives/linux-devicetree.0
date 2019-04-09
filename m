From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] ARM: dts: rockchip: Add BT_EN to the power sequence for veyron
Date: Tue,  9 Apr 2019 16:14:05 -0700
Message-ID: <20190409231405.189335-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Add GPIO D5 (BT_ENABLE_L) as reset-GPIO to the power sequence for the
Bluetooth/WiFi module. On devices with a Broadcom module the signal
needs to be asserted to use Bluetooth.

Note that BT_ENABLE_L is a misnomer in the schematics, the signal
actually is active-high.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 arch/arm/boot/dts/rk3288-veyron.dtsi | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-veyron.dtsi b/arch/arm/boot/dts/rk3288-veyron.dtsi
index 0bc2409f6903..a4cd851dc313 100644
--- a/arch/arm/boot/dts/rk3288-veyron.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron.dtsi
@@ -62,12 +62,19 @@
 		pinctrl-0 = <&bt_enable_l>, <&wifi_enable_h>;
 
 		/*
-		 * On the module itself this is one of these (depending
-		 * on the actual card populated):
+		 * Depending on the actual card populated GPIO4 D4 and D5
+		 * correspond to one of these signals on the module:
+		 *
+		 * D4:
 		 * - SDIO_RESET_L_WL_REG_ON
 		 * - PDN (power down when low)
+		 *
+		 * D5:
+		 * - BT_I2S_WS_BT_RFDISABLE_L
+		 * - No connect
 		 */
-		reset-gpios = <&gpio4 RK_PD4 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&gpio4 RK_PD4 GPIO_ACTIVE_LOW>,
+			      <&gpio4 RK_PD5 GPIO_ACTIVE_LOW>;
 	};
 
 	vcc_5v: vcc-5v {
-- 
2.21.0.392.gf8f6787159e-goog
