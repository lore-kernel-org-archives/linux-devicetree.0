From: Kever Yang <kever.yang@rock-chips.com>
Subject: [PATCH 3/4] ARM: dts: rockchip: use pin constants to describe IO in pinctrl
Date: Wed, 12 Apr 2017 15:10:43 +0800
Message-ID: <1491981044-24635-3-git-send-email-kever.yang@rock-chips.com>
References: <1491981044-24635-1-git-send-email-kever.yang@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1491981044-24635-1-git-send-email-kever.yang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, Kever Yang <kever.yang@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, Huibin Hong <huibin.hong@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>, Catalin Marinas <catalin.marinas@arm.com>, David Wu <david.wu@rock-chips.com>, Brian Norris <briannorris@chromium.org>, Jaehoon Chung <jh80.chung@samsung.com>, Douglas Anderson <dianders@chromium.org>, Will Deacon <will.deacon@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Jianqun Xu <jay.xu@rock-chips.com>, linux-kernel@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>, Caesar Wang <wxt@rock-chips.com>M
List-Id: devicetree@vger.kernel.org

Use command below to replace the IO naming in pinctrl:
sed -i -e 's/ 31 RK_FUNC_/ RK_PD7 RK_FUNC_/' arch/arm/boot/dts/rk*
sed -i -e 's/ 0 RK_FUNC_/ RK_PA0 RK_FUNC_/'
arch/arm64/boot/dts/rockchip/*

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

 arch/arm/boot/dts/rk3036-kylin.dts                 |  10 +-
 arch/arm/boot/dts/rk3036.dtsi                      | 132 ++++++------
 arch/arm/boot/dts/rk3066a-marsboard.dts            |   2 +-
 arch/arm/boot/dts/rk3066a-mk808.dts                |   8 +-
 arch/arm/boot/dts/rk3066a-rayeager.dts             |  26 +--
 arch/arm/boot/dts/rk3066a.dtsi                     | 180 ++++++++--------
 arch/arm/boot/dts/rk3188-px3-evb.dts               |   4 +-
 arch/arm/boot/dts/rk3188-radxarock.dts             |  12 +-
 arch/arm/boot/dts/rk3188.dtsi                      | 154 ++++++-------
 arch/arm/boot/dts/rk322x.dtsi                      | 144 ++++++-------
 arch/arm/boot/dts/rk3288-evb-act8846.dts           |   4 +-
 arch/arm/boot/dts/rk3288-evb.dtsi                  |  26 +--
 arch/arm/boot/dts/rk3288-fennec.dts                |  10 +-
 arch/arm/boot/dts/rk3288-firefly-beta.dts          |   4 +-
 arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi  |  10 +-
 arch/arm/boot/dts/rk3288-firefly-reload.dts        |  36 ++--
 arch/arm/boot/dts/rk3288-firefly.dts               |   4 +-
 arch/arm/boot/dts/rk3288-firefly.dtsi              |  38 ++--
 arch/arm/boot/dts/rk3288-miqi.dts                  |  28 +--
 arch/arm/boot/dts/rk3288-r89.dts                   |  14 +-
 arch/arm/boot/dts/rk3288-rock2-som.dtsi            |   4 +-
 arch/arm/boot/dts/rk3288-rock2-square.dts          |  16 +-
 arch/arm/boot/dts/rk3288-tinker.dts                |  30 +--
 arch/arm/boot/dts/rk3288-veyron-analog-audio.dtsi  |   8 +-
 arch/arm/boot/dts/rk3288-veyron-brain.dts          |   8 +-
 arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi    |  18 +-
 arch/arm/boot/dts/rk3288-veyron-jaq.dts            |  14 +-
 arch/arm/boot/dts/rk3288-veyron-jerry.dts          |  14 +-
 arch/arm/boot/dts/rk3288-veyron-mickey.dts         |   6 +-
 arch/arm/boot/dts/rk3288-veyron-minnie.dts         |  24 +--
 arch/arm/boot/dts/rk3288-veyron-pinky.dts          |   6 +-
 arch/arm/boot/dts/rk3288-veyron-sdmmc.dtsi         |  16 +-
 arch/arm/boot/dts/rk3288-veyron-speedy.dts         |  14 +-
 arch/arm/boot/dts/rk3288-veyron.dtsi               |  50 ++---
 arch/arm/boot/dts/rk3288.dtsi                      | 188 ++++++++--------
 arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi       |  34 +--
 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts    |   8 +-
 .../boot/dts/rockchip/rk3368-orion-r68-meta.dts    |  46 ++--
 arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dts    |   6 +-
 arch/arm64/boot/dts/rockchip/rk3368-r88.dts        |  36 ++--
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           | 238 ++++++++++-----------
 arch/arm64/boot/dts/rockchip/rk3399-evb.dts        |   6 +-
 arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts  |  10 +-
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi       |  68 +++---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           | 236 ++++++++++----------
 45 files changed, 975 insertions(+), 975 deletions(-)

diff --git a/arch/arm/boot/dts/rk3036-kylin.dts b/arch/arm/boot/dts/rk3036-kylin.dts
index 5726135..0393de7 100644
--- a/arch/arm/boot/dts/rk3036-kylin.dts
+++ b/arch/arm/boot/dts/rk3036-kylin.dts
@@ -404,31 +404,31 @@
 &pinctrl {
 	leds {
 		led_ctl: led-ctl {
-			rockchip,pins = <2 30 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <2 RK_PD6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	pmic {
 		pmic_int: pmic-int {
-			rockchip,pins = <2 2 RK_FUNC_GPIO &pcfg_pull_default>;
+			rockchip,pins = <2 RK_PA2 RK_FUNC_GPIO &pcfg_pull_default>;
 		};
 	};
 
 	sdio {
 		bt_wake_h: bt-wake-h {
-			rockchip,pins = <2 8 RK_FUNC_GPIO &pcfg_pull_default>;
+			rockchip,pins = <2 RK_PB0 RK_FUNC_GPIO &pcfg_pull_default>;
 		};
 	};
 
 	sdmmc {
 		sdmmc_pwr: sdmmc-pwr {
-			rockchip,pins = <2 28 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <2 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	sleep {
 		global_pwroff: global-pwroff {
-			rockchip,pins = <2 7 RK_FUNC_1 &pcfg_pull_none>;
+			rockchip,pins = <2 RK_PA7 RK_FUNC_1 &pcfg_pull_none>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk3036.dtsi
index ec91325..199afed 100644
--- a/arch/arm/boot/dts/rk3036.dtsi
+++ b/arch/arm/boot/dts/rk3036.dtsi
@@ -568,13 +568,13 @@
 
 		pwm0 {
 			pwm0_pin: pwm0-pin {
-				rockchip,pins = <0 0 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PA0 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		pwm1 {
 			pwm1_pin: pwm1-pin {
-				rockchip,pins = <0 1 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PA1 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
@@ -592,47 +592,47 @@
 
 		sdmmc {
 			sdmmc_clk: sdmmc-clk {
-				rockchip,pins = <1 16 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <1 RK_PC0 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			sdmmc_cmd: sdmmc-cmd {
-				rockchip,pins = <1 15 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <1 RK_PB7 RK_FUNC_1 &pcfg_pull_default>;
 			};
 
 			sdmmc_cd: sdmcc-cd {
-				rockchip,pins = <1 17 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <1 RK_PC1 RK_FUNC_1 &pcfg_pull_default>;
 			};
 
 			sdmmc_bus1: sdmmc-bus1 {
-				rockchip,pins = <1 18 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <1 RK_PC2 RK_FUNC_1 &pcfg_pull_default>;
 			};
 
 			sdmmc_bus4: sdmmc-bus4 {
-				rockchip,pins = <1 18 RK_FUNC_1 &pcfg_pull_default>,
-						<1 19 RK_FUNC_1 &pcfg_pull_default>,
-						<1 20 RK_FUNC_1 &pcfg_pull_default>,
-						<1 21 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <1 RK_PC2 RK_FUNC_1 &pcfg_pull_default>,
+						<1 RK_PC3 RK_FUNC_1 &pcfg_pull_default>,
+						<1 RK_PC4 RK_FUNC_1 &pcfg_pull_default>,
+						<1 RK_PC5 RK_FUNC_1 &pcfg_pull_default>;
 			};
 		};
 
 		sdio {
 			sdio_bus1: sdio-bus1 {
-				rockchip,pins = <0 11 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <0 RK_PB3 RK_FUNC_1 &pcfg_pull_default>;
 			};
 
 			sdio_bus4: sdio-bus4 {
-				rockchip,pins = <0 11 RK_FUNC_1 &pcfg_pull_default>,
-						<0 12 RK_FUNC_1 &pcfg_pull_default>,
-						<0 13 RK_FUNC_1 &pcfg_pull_default>,
-						<0 14 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <0 RK_PB3 RK_FUNC_1 &pcfg_pull_default>,
+						<0 RK_PB4 RK_FUNC_1 &pcfg_pull_default>,
+						<0 RK_PB5 RK_FUNC_1 &pcfg_pull_default>,
+						<0 RK_PB6 RK_FUNC_1 &pcfg_pull_default>;
 			};
 
 			sdio_cmd: sdio-cmd {
-				rockchip,pins = <0 8 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <0 RK_PB0 RK_FUNC_1 &pcfg_pull_default>;
 			};
 
 			sdio_clk: sdio-clk {
-				rockchip,pins = <0 9 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PB1 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
@@ -642,135 +642,135 @@
 			 * We also have external pulls, so disable the internal ones.
 			 */
 			emmc_clk: emmc-clk {
-				rockchip,pins = <2 4 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <2 RK_PA4 RK_FUNC_2 &pcfg_pull_none>;
 			};
 
 			emmc_cmd: emmc-cmd {
-				rockchip,pins = <2 1 RK_FUNC_2 &pcfg_pull_default>;
+				rockchip,pins = <2 RK_PA1 RK_FUNC_2 &pcfg_pull_default>;
 			};
 
 			emmc_bus8: emmc-bus8 {
-				rockchip,pins = <1 24 RK_FUNC_2 &pcfg_pull_default>,
-						<1 25 RK_FUNC_2 &pcfg_pull_default>,
-						<1 26 RK_FUNC_2 &pcfg_pull_default>,
-						<1 27 RK_FUNC_2 &pcfg_pull_default>,
-						<1 28 RK_FUNC_2 &pcfg_pull_default>,
-						<1 29 RK_FUNC_2 &pcfg_pull_default>,
-						<1 30 RK_FUNC_2 &pcfg_pull_default>,
-						<1 31 RK_FUNC_2 &pcfg_pull_default>;
+				rockchip,pins = <1 RK_PD0 RK_FUNC_2 &pcfg_pull_default>,
+						<1 RK_PD1 RK_FUNC_2 &pcfg_pull_default>,
+						<1 RK_PD2 RK_FUNC_2 &pcfg_pull_default>,
+						<1 RK_PD3 RK_FUNC_2 &pcfg_pull_default>,
+						<1 RK_PD4 RK_FUNC_2 &pcfg_pull_default>,
+						<1 RK_PD5 RK_FUNC_2 &pcfg_pull_default>,
+						<1 RK_PD6 RK_FUNC_2 &pcfg_pull_default>,
+						<1 RK_PD7 RK_FUNC_2 &pcfg_pull_default>;
 			};
 		};
 
 		emac {
 			emac_xfer: emac-xfer {
-				rockchip,pins = <2 10 RK_FUNC_1 &pcfg_pull_default>, /* crs_dvalid */
-						<2 13 RK_FUNC_1 &pcfg_pull_default>, /* tx_en */
-						<2 14 RK_FUNC_1 &pcfg_pull_default>, /* mac_clk */
-						<2 15 RK_FUNC_1 &pcfg_pull_default>, /* rx_err */
-						<2 16 RK_FUNC_1 &pcfg_pull_default>, /* rxd1 */
-						<2 17 RK_FUNC_1 &pcfg_pull_default>, /* rxd0 */
-						<2 18 RK_FUNC_1 &pcfg_pull_default>, /* txd1 */
-						<2 19 RK_FUNC_1 &pcfg_pull_default>; /* txd0 */
+				rockchip,pins = <2 RK_PB2 RK_FUNC_1 &pcfg_pull_default>, /* crs_dvalid */
+						<2 RK_PB5 RK_FUNC_1 &pcfg_pull_default>, /* tx_en */
+						<2 RK_PB6 RK_FUNC_1 &pcfg_pull_default>, /* mac_clk */
+						<2 RK_PB7 RK_FUNC_1 &pcfg_pull_default>, /* rx_err */
+						<2 RK_PC0 RK_FUNC_1 &pcfg_pull_default>, /* rxd1 */
+						<2 RK_PC1 RK_FUNC_1 &pcfg_pull_default>, /* rxd0 */
+						<2 RK_PC2 RK_FUNC_1 &pcfg_pull_default>, /* txd1 */
+						<2 RK_PC3 RK_FUNC_1 &pcfg_pull_default>; /* txd0 */
 			};
 
 			emac_mdio: emac-mdio {
-				rockchip,pins = <2 12 RK_FUNC_1 &pcfg_pull_default>, /* mac_md */
-						<2 25 RK_FUNC_1 &pcfg_pull_default>; /* mac_mdclk */
+				rockchip,pins = <2 RK_PB4 RK_FUNC_1 &pcfg_pull_default>, /* mac_md */
+						<2 RK_PD1 RK_FUNC_1 &pcfg_pull_default>; /* mac_mdclk */
 			};
 		};
 
 		i2c0 {
 			i2c0_xfer: i2c0-xfer {
-				rockchip,pins = <0 0 RK_FUNC_1 &pcfg_pull_none>,
-						<0 1 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PA0 RK_FUNC_1 &pcfg_pull_none>,
+						<0 RK_PA1 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2c1 {
 			i2c1_xfer: i2c1-xfer {
-				rockchip,pins = <0 2 RK_FUNC_1 &pcfg_pull_none>,
-						<0 3 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PA2 RK_FUNC_1 &pcfg_pull_none>,
+						<0 RK_PA3 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2c2 {
 			i2c2_xfer: i2c2-xfer {
-				rockchip,pins = <2 20 RK_FUNC_1 &pcfg_pull_none>,
-						<2 21 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <2 RK_PC4 RK_FUNC_1 &pcfg_pull_none>,
+						<2 RK_PC5 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2s {
 			i2s_bus: i2s-bus {
-				rockchip,pins = <1 0 RK_FUNC_1 &pcfg_pull_default>,
-						<1 1 RK_FUNC_1 &pcfg_pull_default>,
-						<1 2 RK_FUNC_1 &pcfg_pull_default>,
-						<1 3 RK_FUNC_1 &pcfg_pull_default>,
-						<1 4 RK_FUNC_1 &pcfg_pull_default>,
-						<1 5 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <1 RK_PA0 RK_FUNC_1 &pcfg_pull_default>,
+						<1 RK_PA1 RK_FUNC_1 &pcfg_pull_default>,
+						<1 RK_PA2 RK_FUNC_1 &pcfg_pull_default>,
+						<1 RK_PA3 RK_FUNC_1 &pcfg_pull_default>,
+						<1 RK_PA4 RK_FUNC_1 &pcfg_pull_default>,
+						<1 RK_PA5 RK_FUNC_1 &pcfg_pull_default>;
 			};
 		};
 
 		hdmi {
 			hdmi_ctl: hdmi-ctl {
-				rockchip,pins = <1 8  RK_FUNC_1 &pcfg_pull_none>,
-						<1 9  RK_FUNC_1 &pcfg_pull_none>,
-						<1 10 RK_FUNC_1 &pcfg_pull_none>,
-						<1 11 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <1 RK_PB0 RK_FUNC_1 &pcfg_pull_none>,
+						<1 RK_PB1 RK_FUNC_1 &pcfg_pull_none>,
+						<1 RK_PB2 RK_FUNC_1 &pcfg_pull_none>,
+						<1 RK_PB3 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		uart0 {
 			uart0_xfer: uart0-xfer {
-				rockchip,pins = <0 16 RK_FUNC_1 &pcfg_pull_default>,
-						<0 17 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PC0 RK_FUNC_1 &pcfg_pull_default>,
+						<0 RK_PC1 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			uart0_cts: uart0-cts {
-				rockchip,pins = <0 18 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <0 RK_PC2 RK_FUNC_1 &pcfg_pull_default>;
 			};
 
 			uart0_rts: uart0-rts {
-				rockchip,pins = <0 19 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PC3 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		uart1 {
 			uart1_xfer: uart1-xfer {
-				rockchip,pins = <2 22 RK_FUNC_1 &pcfg_pull_default>,
-						<2 23 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <2 RK_PC6 RK_FUNC_1 &pcfg_pull_default>,
+						<2 RK_PC7 RK_FUNC_1 &pcfg_pull_none>;
 			};
 			/* no rts / cts for uart1 */
 		};
 
 		uart2 {
 			uart2_xfer: uart2-xfer {
-				rockchip,pins = <1 18 RK_FUNC_2 &pcfg_pull_default>,
-						<1 19 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <1 RK_PC2 RK_FUNC_2 &pcfg_pull_default>,
+						<1 RK_PC3 RK_FUNC_2 &pcfg_pull_none>;
 			};
 			/* no rts / cts for uart2 */
 		};
 
 		spi {
 			spi_txd:spi-txd {
-				rockchip,pins = <1 29 RK_FUNC_3 &pcfg_pull_default>;
+				rockchip,pins = <1 RK_PD5 RK_FUNC_3 &pcfg_pull_default>;
 			};
 
 			spi_rxd:spi-rxd {
-				rockchip,pins = <1 28 RK_FUNC_3 &pcfg_pull_default>;
+				rockchip,pins = <1 RK_PD4 RK_FUNC_3 &pcfg_pull_default>;
 			};
 
 			spi_clk:spi-clk {
-				rockchip,pins = <2 0 RK_FUNC_2 &pcfg_pull_default>;
+				rockchip,pins = <2 RK_PA0 RK_FUNC_2 &pcfg_pull_default>;
 			};
 
 			spi_cs0:spi-cs0 {
-				rockchip,pins = <1 30 RK_FUNC_3 &pcfg_pull_default>;
+				rockchip,pins = <1 RK_PD6 RK_FUNC_3 &pcfg_pull_default>;
 
 			};
 
 			spi_cs1:spi-cs1 {
-				rockchip,pins = <1 31 RK_FUNC_3 &pcfg_pull_default>;
+				rockchip,pins = <1 RK_PD7 RK_FUNC_3 &pcfg_pull_default>;
 
 			};
 		};
diff --git a/arch/arm/boot/dts/rk3066a-marsboard.dts b/arch/arm/boot/dts/rk3066a-marsboard.dts
index c6d92c2..59c9df9 100644
--- a/arch/arm/boot/dts/rk3066a-marsboard.dts
+++ b/arch/arm/boot/dts/rk3066a-marsboard.dts
@@ -201,7 +201,7 @@
 &pinctrl {
 	lan8720a {
 		phy_int: phy-int {
-			rockchip,pins = <RK_GPIO1 26 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <RK_GPIO1 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3066a-mk808.dts b/arch/arm/boot/dts/rk3066a-mk808.dts
index 7ca1cf5..0e32a6b 100644
--- a/arch/arm/boot/dts/rk3066a-mk808.dts
+++ b/arch/arm/boot/dts/rk3066a-mk808.dts
@@ -151,25 +151,25 @@
 &pinctrl {
 	usb-host {
 		host_drv: host-drv {
-			rockchip,pins = <RK_GPIO0 6 RK_FUNC_GPIO &pcfg_pull_default>;
+			rockchip,pins = <RK_GPIO0 RK_PA6 RK_FUNC_GPIO &pcfg_pull_default>;
 		};
 	};
 
 	usb-otg {
 		otg_drv: otg-drv {
-			rockchip,pins = <RK_GPIO0 5 RK_FUNC_GPIO &pcfg_pull_default>;
+			rockchip,pins = <RK_GPIO0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_default>;
 		};
 	};
 
 	sdmmc {
 		sdmmc_pwr: sdmmc-pwr {
-			rockchip,pins = <RK_GPIO3 7 RK_FUNC_GPIO &pcfg_pull_default>;
+			rockchip,pins = <RK_GPIO3 RK_PA7 RK_FUNC_GPIO &pcfg_pull_default>;
 		};
 	};
 
 	sdio {
 		wifi_pwr: wifi-pwr {
-			rockchip,pins = <RK_GPIO3 24 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <RK_GPIO3 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3066a-rayeager.dts b/arch/arm/boot/dts/rk3066a-rayeager.dts
index 8907dea..983518f 100644
--- a/arch/arm/boot/dts/rk3066a-rayeager.dts
+++ b/arch/arm/boot/dts/rk3066a-rayeager.dts
@@ -363,71 +363,71 @@
 
 	ak8963 {
 		comp_int: comp-int {
-			rockchip,pins = <4 17 RK_FUNC_GPIO &pcfg_pull_default>;
+			rockchip,pins = <4 RK_PC1 RK_FUNC_GPIO &pcfg_pull_default>;
 		};
 	};
 
 	emac {
 		rmii_rst: rmii-rst {
-			rockchip,pins = <1 30 RK_FUNC_GPIO &pcfg_output_high>;
+			rockchip,pins = <1 RK_PD6 RK_FUNC_GPIO &pcfg_output_high>;
 		};
 	};
 
 	ir {
 		ir_int: ir-int {
-			rockchip,pins = <6 1 RK_FUNC_GPIO &pcfg_pull_default>;
+			rockchip,pins = <6 RK_PA1 RK_FUNC_GPIO &pcfg_pull_default>;
 		};
 	};
 
 	keys {
 		pwr_key: pwr-key {
-			rockchip,pins = <6 2 RK_FUNC_GPIO &pcfg_pull_default>;
+			rockchip,pins = <6 RK_PA2 RK_FUNC_GPIO &pcfg_pull_default>;
 		};
 	};
 
 	mma8452 {
 		gsensor_int: gsensor-int {
-			rockchip,pins = <4 16 RK_FUNC_GPIO &pcfg_pull_default>;
+			rockchip,pins = <4 RK_PC0 RK_FUNC_GPIO &pcfg_pull_default>;
 		};
 	};
 
 	mmc {
 		sdmmc_pwr: sdmmc-pwr {
-			rockchip,pins = <3 7 RK_FUNC_GPIO &pcfg_pull_default>;
+			rockchip,pins = <3 RK_PA7 RK_FUNC_GPIO &pcfg_pull_default>;
 		};
 	};
 
 	usb_host {
 		host_drv: host-drv {
-			rockchip,pins = <0 6 RK_FUNC_GPIO &pcfg_pull_default>;
+			rockchip,pins = <0 RK_PA6 RK_FUNC_GPIO &pcfg_pull_default>;
 		};
 
 		hub_rst: hub-rst {
-			rockchip,pins = <1 31 RK_FUNC_GPIO &pcfg_output_high>;
+			rockchip,pins = <1 RK_PD7 RK_FUNC_GPIO &pcfg_output_high>;
 		};
 
 		sata_pwr: sata-pwr {
-			rockchip,pins = <4 22 RK_FUNC_GPIO &pcfg_pull_default>;
+			rockchip,pins = <4 RK_PC6 RK_FUNC_GPIO &pcfg_pull_default>;
 		};
 
 		sata_reset: sata-reset {
-			rockchip,pins = <0 13 RK_FUNC_GPIO &pcfg_output_high>;
+			rockchip,pins = <0 RK_PB5 RK_FUNC_GPIO &pcfg_output_high>;
 		};
 	};
 
 	usb_otg {
 		otg_drv: otg-drv {
-			rockchip,pins = <0 5 RK_FUNC_GPIO &pcfg_pull_default>;
+			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_default>;
 		};
 	};
 
 	tps {
 		pmic_int: pmic-int {
-			rockchip,pins = <6 4 RK_FUNC_GPIO &pcfg_pull_default>;
+			rockchip,pins = <6 RK_PA4 RK_FUNC_GPIO &pcfg_pull_default>;
 		};
 
 		pwr_hold: pwr-hold {
-			rockchip,pins = <6 8 RK_FUNC_GPIO &pcfg_output_high>;
+			rockchip,pins = <6 RK_PB0 RK_FUNC_GPIO &pcfg_output_high>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3066a.dtsi b/arch/arm/boot/dts/rk3066a.dtsi
index f50481f..e339ee53 100644
--- a/arch/arm/boot/dts/rk3066a.dtsi
+++ b/arch/arm/boot/dts/rk3066a.dtsi
@@ -329,33 +329,33 @@
 
 		emac {
 			emac_xfer: emac-xfer {
-				rockchip,pins = <RK_GPIO1 16 RK_FUNC_2 &pcfg_pull_none>, /* mac_clk */
-						<RK_GPIO1 17 RK_FUNC_2 &pcfg_pull_none>, /* tx_en */
-						<RK_GPIO1 18 RK_FUNC_2 &pcfg_pull_none>, /* txd1 */
-						<RK_GPIO1 19 RK_FUNC_2 &pcfg_pull_none>, /* txd0 */
-						<RK_GPIO1 20 RK_FUNC_2 &pcfg_pull_none>, /* rx_err */
-						<RK_GPIO1 21 RK_FUNC_2 &pcfg_pull_none>, /* crs_dvalid */
-						<RK_GPIO1 22 RK_FUNC_2 &pcfg_pull_none>, /* rxd1 */
-						<RK_GPIO1 23 RK_FUNC_2 &pcfg_pull_none>; /* rxd0 */
+				rockchip,pins = <RK_GPIO1 RK_PC0 RK_FUNC_2 &pcfg_pull_none>, /* mac_clk */
+						<RK_GPIO1 RK_PC1 RK_FUNC_2 &pcfg_pull_none>, /* tx_en */
+						<RK_GPIO1 RK_PC2 RK_FUNC_2 &pcfg_pull_none>, /* txd1 */
+						<RK_GPIO1 RK_PC3 RK_FUNC_2 &pcfg_pull_none>, /* txd0 */
+						<RK_GPIO1 RK_PC4 RK_FUNC_2 &pcfg_pull_none>, /* rx_err */
+						<RK_GPIO1 RK_PC5 RK_FUNC_2 &pcfg_pull_none>, /* crs_dvalid */
+						<RK_GPIO1 RK_PC6 RK_FUNC_2 &pcfg_pull_none>, /* rxd1 */
+						<RK_GPIO1 RK_PC7 RK_FUNC_2 &pcfg_pull_none>; /* rxd0 */
 			};
 
 			emac_mdio: emac-mdio {
-				rockchip,pins = <RK_GPIO1 24 RK_FUNC_2 &pcfg_pull_none>, /* mac_md */
-						<RK_GPIO1 25 RK_FUNC_2 &pcfg_pull_none>; /* mac_mdclk */
+				rockchip,pins = <RK_GPIO1 RK_PD0 RK_FUNC_2 &pcfg_pull_none>, /* mac_md */
+						<RK_GPIO1 RK_PD1 RK_FUNC_2 &pcfg_pull_none>; /* mac_mdclk */
 			};
 		};
 
 		emmc {
 			emmc_clk: emmc-clk {
-				rockchip,pins = <RK_GPIO3 31 RK_FUNC_2 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO3 RK_PD7 RK_FUNC_2 &pcfg_pull_default>;
 			};
 
 			emmc_cmd: emmc-cmd {
-				rockchip,pins = <RK_GPIO4 9 RK_FUNC_2 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO4 RK_PB1 RK_FUNC_2 &pcfg_pull_default>;
 			};
 
 			emmc_rst: emmc-rst {
-				rockchip,pins = <RK_GPIO4 10 RK_FUNC_2 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO4 RK_PB2 RK_FUNC_2 &pcfg_pull_default>;
 			};
 
 			/*
@@ -368,243 +368,243 @@
 
 		i2c0 {
 			i2c0_xfer: i2c0-xfer {
-				rockchip,pins = <RK_GPIO2 28 RK_FUNC_1 &pcfg_pull_none>,
-						<RK_GPIO2 29 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO2 RK_PD4 RK_FUNC_1 &pcfg_pull_none>,
+						<RK_GPIO2 RK_PD5 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2c1 {
 			i2c1_xfer: i2c1-xfer {
-				rockchip,pins = <RK_GPIO2 30 RK_FUNC_1 &pcfg_pull_none>,
-						<RK_GPIO2 31 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO2 RK_PD6 RK_FUNC_1 &pcfg_pull_none>,
+						<RK_GPIO2 RK_PD7 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2c2 {
 			i2c2_xfer: i2c2-xfer {
-				rockchip,pins = <RK_GPIO3 0 RK_FUNC_1 &pcfg_pull_none>,
-						<RK_GPIO3 1 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO3 RK_PA0 RK_FUNC_1 &pcfg_pull_none>,
+						<RK_GPIO3 RK_PA1 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2c3 {
 			i2c3_xfer: i2c3-xfer {
-				rockchip,pins = <RK_GPIO3 2 RK_FUNC_2 &pcfg_pull_none>,
-						<RK_GPIO3 3 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO3 RK_PA2 RK_FUNC_2 &pcfg_pull_none>,
+						<RK_GPIO3 RK_PA3 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		i2c4 {
 			i2c4_xfer: i2c4-xfer {
-				rockchip,pins = <RK_GPIO3 4 RK_FUNC_1 &pcfg_pull_none>,
-						<RK_GPIO3 5 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO3 RK_PA4 RK_FUNC_1 &pcfg_pull_none>,
+						<RK_GPIO3 RK_PA5 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		pwm0 {
 			pwm0_out: pwm0-out {
-				rockchip,pins = <RK_GPIO0 3 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO0 RK_PA3 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		pwm1 {
 			pwm1_out: pwm1-out {
-				rockchip,pins = <RK_GPIO0 4 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO0 RK_PA4 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		pwm2 {
 			pwm2_out: pwm2-out {
-				rockchip,pins = <RK_GPIO0 30 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO0 RK_PD6 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		pwm3 {
 			pwm3_out: pwm3-out {
-				rockchip,pins = <RK_GPIO0 31 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO0 RK_PD7 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		spi0 {
 			spi0_clk: spi0-clk {
-				rockchip,pins = <RK_GPIO1 5 RK_FUNC_2 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO1 RK_PA5 RK_FUNC_2 &pcfg_pull_default>;
 			};
 			spi0_cs0: spi0-cs0 {
-				rockchip,pins = <RK_GPIO1 4 RK_FUNC_2 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO1 RK_PA4 RK_FUNC_2 &pcfg_pull_default>;
 			};
 			spi0_tx: spi0-tx {
-				rockchip,pins = <RK_GPIO1 7 RK_FUNC_2 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO1 RK_PA7 RK_FUNC_2 &pcfg_pull_default>;
 			};
 			spi0_rx: spi0-rx {
-				rockchip,pins = <RK_GPIO1 6 RK_FUNC_2 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO1 RK_PA6 RK_FUNC_2 &pcfg_pull_default>;
 			};
 			spi0_cs1: spi0-cs1 {
-				rockchip,pins = <RK_GPIO4 15 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO4 RK_PB7 RK_FUNC_1 &pcfg_pull_default>;
 			};
 		};
 
 		spi1 {
 			spi1_clk: spi1-clk {
-				rockchip,pins = <RK_GPIO2 19 RK_FUNC_2 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO2 RK_PC3 RK_FUNC_2 &pcfg_pull_default>;
 			};
 			spi1_cs0: spi1-cs0 {
-				rockchip,pins = <RK_GPIO2 20 RK_FUNC_2 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO2 RK_PC4 RK_FUNC_2 &pcfg_pull_default>;
 			};
 			spi1_rx: spi1-rx {
-				rockchip,pins = <RK_GPIO2 22 RK_FUNC_2 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO2 RK_PC6 RK_FUNC_2 &pcfg_pull_default>;
 			};
 			spi1_tx: spi1-tx {
-				rockchip,pins = <RK_GPIO2 21 RK_FUNC_2 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO2 RK_PC5 RK_FUNC_2 &pcfg_pull_default>;
 			};
 			spi1_cs1: spi1-cs1 {
-				rockchip,pins = <RK_GPIO2 23 RK_FUNC_2 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO2 RK_PC7 RK_FUNC_2 &pcfg_pull_default>;
 			};
 		};
 
 		uart0 {
 			uart0_xfer: uart0-xfer {
-				rockchip,pins = <RK_GPIO1 0 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO1 1 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO1 RK_PA0 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO1 RK_PA1 RK_FUNC_1 &pcfg_pull_default>;
 			};
 
 			uart0_cts: uart0-cts {
-				rockchip,pins = <RK_GPIO1 2 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO1 RK_PA2 RK_FUNC_1 &pcfg_pull_default>;
 			};
 
 			uart0_rts: uart0-rts {
-				rockchip,pins = <RK_GPIO1 3 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO1 RK_PA3 RK_FUNC_1 &pcfg_pull_default>;
 			};
 		};
 
 		uart1 {
 			uart1_xfer: uart1-xfer {
-				rockchip,pins = <RK_GPIO1 4 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO1 5 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO1 RK_PA4 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO1 RK_PA5 RK_FUNC_1 &pcfg_pull_default>;
 			};
 
 			uart1_cts: uart1-cts {
-				rockchip,pins = <RK_GPIO1 6 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO1 RK_PA6 RK_FUNC_1 &pcfg_pull_default>;
 			};
 
 			uart1_rts: uart1-rts {
-				rockchip,pins = <RK_GPIO1 7 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO1 RK_PA7 RK_FUNC_1 &pcfg_pull_default>;
 			};
 		};
 
 		uart2 {
 			uart2_xfer: uart2-xfer {
-				rockchip,pins = <RK_GPIO1 8 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO1 9 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO1 RK_PB0 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO1 RK_PB1 RK_FUNC_1 &pcfg_pull_default>;
 			};
 			/* no rts / cts for uart2 */
 		};
 
 		uart3 {
 			uart3_xfer: uart3-xfer {
-				rockchip,pins = <RK_GPIO3 27 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO3 28 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO3 RK_PD3 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO3 RK_PD4 RK_FUNC_1 &pcfg_pull_default>;
 			};
 
 			uart3_cts: uart3-cts {
-				rockchip,pins = <RK_GPIO3 29 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO3 RK_PD5 RK_FUNC_1 &pcfg_pull_default>;
 			};
 
 			uart3_rts: uart3-rts {
-				rockchip,pins = <RK_GPIO3 30 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO3 RK_PD6 RK_FUNC_1 &pcfg_pull_default>;
 			};
 		};
 
 		sd0 {
 			sd0_clk: sd0-clk {
-				rockchip,pins = <RK_GPIO3 8 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO3 RK_PB0 RK_FUNC_1 &pcfg_pull_default>;
 			};
 
 			sd0_cmd: sd0-cmd {
-				rockchip,pins = <RK_GPIO3 9 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO3 RK_PB1 RK_FUNC_1 &pcfg_pull_default>;
 			};
 
 			sd0_cd: sd0-cd {
-				rockchip,pins = <RK_GPIO3 14 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO3 RK_PB6 RK_FUNC_1 &pcfg_pull_default>;
 			};
 
 			sd0_wp: sd0-wp {
-				rockchip,pins = <RK_GPIO3 15 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO3 RK_PB7 RK_FUNC_1 &pcfg_pull_default>;
 			};
 
 			sd0_bus1: sd0-bus-width1 {
-				rockchip,pins = <RK_GPIO3 10 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO3 RK_PB2 RK_FUNC_1 &pcfg_pull_default>;
 			};
 
 			sd0_bus4: sd0-bus-width4 {
-				rockchip,pins = <RK_GPIO3 10 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO3 11 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO3 12 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO3 13 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO3 RK_PB2 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO3 RK_PB3 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO3 RK_PB4 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO3 RK_PB5 RK_FUNC_1 &pcfg_pull_default>;
 			};
 		};
 
 		sd1 {
 			sd1_clk: sd1-clk {
-				rockchip,pins = <RK_GPIO3 21 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO3 RK_PC5 RK_FUNC_1 &pcfg_pull_default>;
 			};
 
 			sd1_cmd: sd1-cmd {
-				rockchip,pins = <RK_GPIO3 16 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO3 RK_PC0 RK_FUNC_1 &pcfg_pull_default>;
 			};
 
 			sd1_cd: sd1-cd {
-				rockchip,pins = <RK_GPIO3 22 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO3 RK_PC6 RK_FUNC_1 &pcfg_pull_default>;
 			};
 
 			sd1_wp: sd1-wp {
-				rockchip,pins = <RK_GPIO3 23 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO3 RK_PC7 RK_FUNC_1 &pcfg_pull_default>;
 			};
 
 			sd1_bus1: sd1-bus-width1 {
-				rockchip,pins = <RK_GPIO3 17 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO3 RK_PC1 RK_FUNC_1 &pcfg_pull_default>;
 			};
 
 			sd1_bus4: sd1-bus-width4 {
-				rockchip,pins = <RK_GPIO3 17 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO3 18 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO3 19 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO3 20 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO3 RK_PC1 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO3 RK_PC2 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO3 RK_PC3 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO3 RK_PC4 RK_FUNC_1 &pcfg_pull_default>;
 			};
 		};
 
 		i2s0 {
 			i2s0_bus: i2s0-bus {
-				rockchip,pins = <RK_GPIO0 7 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO0 8 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO0 9 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO0 10 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO0 11 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO0 12 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO0 13 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO0 14 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO0 15 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO0 RK_PA7 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO0 RK_PB0 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO0 RK_PB1 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO0 RK_PB2 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO0 RK_PB3 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO0 RK_PB4 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO0 RK_PB5 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO0 RK_PB6 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO0 RK_PB7 RK_FUNC_1 &pcfg_pull_default>;
 			};
 		};
 
 		i2s1 {
 			i2s1_bus: i2s1-bus {
-				rockchip,pins = <RK_GPIO0 16 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO0 17 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO0 18 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO0 19 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO0 20 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO0 21 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO0 RK_PC0 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO0 RK_PC1 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO0 RK_PC2 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO0 RK_PC3 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO0 RK_PC4 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO0 RK_PC5 RK_FUNC_1 &pcfg_pull_default>;
 			};
 		};
 
 		i2s2 {
 			i2s2_bus: i2s2-bus {
-				rockchip,pins = <RK_GPIO0 24 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO0 25 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO0 26 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO0 27 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO0 28 RK_FUNC_1 &pcfg_pull_default>,
-						<RK_GPIO0 29 RK_FUNC_1 &pcfg_pull_default>;
+				rockchip,pins = <RK_GPIO0 RK_PD0 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO0 RK_PD1 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO0 RK_PD2 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO0 RK_PD3 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO0 RK_PD4 RK_FUNC_1 &pcfg_pull_default>,
+						<RK_GPIO0 RK_PD5 RK_FUNC_1 &pcfg_pull_default>;
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/rk3188-px3-evb.dts b/arch/arm/boot/dts/rk3188-px3-evb.dts
index 5b2a0b6..e97d95d 100644
--- a/arch/arm/boot/dts/rk3188-px3-evb.dts
+++ b/arch/arm/boot/dts/rk3188-px3-evb.dts
@@ -275,10 +275,10 @@
 
 	usb {
 		host_vbus_drv: host-vbus-drv {
-			rockchip,pins = <0 3 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 		otg_vbus_drv: otg-vbus-drv {
-			rockchip,pins = <2 31 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <2 RK_PD7 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3188-radxarock.dts b/arch/arm/boot/dts/rk3188-radxarock.dts
index ca0a1c4..fe1393c 100644
--- a/arch/arm/boot/dts/rk3188-radxarock.dts
+++ b/arch/arm/boot/dts/rk3188-radxarock.dts
@@ -327,34 +327,34 @@
 
 	act8846 {
 		act8846_dvs0_ctl: act8846-dvs0-ctl {
-			rockchip,pins = <RK_GPIO3 27 RK_FUNC_GPIO &pcfg_output_low>;
+			rockchip,pins = <RK_GPIO3 RK_PD3 RK_FUNC_GPIO &pcfg_output_low>;
 		};
 	};
 
 	hym8563 {
 		rtc_int: rtc-int {
-			rockchip,pins = <RK_GPIO0 0 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <RK_GPIO0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	lan8720a  {
 		phy_int: phy-int {
-			rockchip,pins = <RK_GPIO3 26 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <RK_GPIO3 RK_PD2 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	ir-receiver {
 		ir_recv_pin: ir-recv-pin {
-			rockchip,pins = <RK_GPIO0 10 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <RK_GPIO0 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	usb {
 		host_vbus_drv: host-vbus-drv {
-			rockchip,pins = <0 3 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 		otg_vbus_drv: otg-vbus-drv {
-			rockchip,pins = <2 31 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <2 RK_PD7 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3188.dtsi b/arch/arm/boot/dts/rk3188.dtsi
index fa1bdb8..d417156 100644
--- a/arch/arm/boot/dts/rk3188.dtsi
+++ b/arch/arm/boot/dts/rk3188.dtsi
@@ -258,15 +258,15 @@
 
 		emmc {
 			emmc_clk: emmc-clk {
-				rockchip,pins = <RK_GPIO0 24 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO0 RK_PD0 RK_FUNC_2 &pcfg_pull_none>;
 			};
 
 			emmc_cmd: emmc-cmd {
-				rockchip,pins = <RK_GPIO0 26 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <RK_GPIO0 RK_PD2 RK_FUNC_2 &pcfg_pull_up>;
 			};
 
 			emmc_rst: emmc-rst {
-				rockchip,pins = <RK_GPIO0 27 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO0 RK_PD3 RK_FUNC_2 &pcfg_pull_none>;
 			};
 
 			/*
@@ -279,246 +279,246 @@
 
 		emac {
 			emac_xfer: emac-xfer {
-				rockchip,pins = <RK_GPIO3 16 RK_FUNC_2 &pcfg_pull_none>, /* tx_en */
-						<RK_GPIO3 17 RK_FUNC_2 &pcfg_pull_none>, /* txd1 */
-						<RK_GPIO3 18 RK_FUNC_2 &pcfg_pull_none>, /* txd0 */
-						<RK_GPIO3 19 RK_FUNC_2 &pcfg_pull_none>, /* rxd0 */
-						<RK_GPIO3 20 RK_FUNC_2 &pcfg_pull_none>, /* rxd1 */
-						<RK_GPIO3 21 RK_FUNC_2 &pcfg_pull_none>, /* mac_clk */
-						<RK_GPIO3 22 RK_FUNC_2 &pcfg_pull_none>, /* rx_err */
-						<RK_GPIO3 23 RK_FUNC_2 &pcfg_pull_none>; /* crs_dvalid */
+				rockchip,pins = <RK_GPIO3 RK_PC0 RK_FUNC_2 &pcfg_pull_none>, /* tx_en */
+						<RK_GPIO3 RK_PC1 RK_FUNC_2 &pcfg_pull_none>, /* txd1 */
+						<RK_GPIO3 RK_PC2 RK_FUNC_2 &pcfg_pull_none>, /* txd0 */
+						<RK_GPIO3 RK_PC3 RK_FUNC_2 &pcfg_pull_none>, /* rxd0 */
+						<RK_GPIO3 RK_PC4 RK_FUNC_2 &pcfg_pull_none>, /* rxd1 */
+						<RK_GPIO3 RK_PC5 RK_FUNC_2 &pcfg_pull_none>, /* mac_clk */
+						<RK_GPIO3 RK_PC6 RK_FUNC_2 &pcfg_pull_none>, /* rx_err */
+						<RK_GPIO3 RK_PC7 RK_FUNC_2 &pcfg_pull_none>; /* crs_dvalid */
 			};
 
 			emac_mdio: emac-mdio {
-				rockchip,pins = <RK_GPIO3 24 RK_FUNC_2 &pcfg_pull_none>,
-						<RK_GPIO3 25 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO3 RK_PD0 RK_FUNC_2 &pcfg_pull_none>,
+						<RK_GPIO3 RK_PD1 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		i2c0 {
 			i2c0_xfer: i2c0-xfer {
-				rockchip,pins = <RK_GPIO1 24 RK_FUNC_1 &pcfg_pull_none>,
-						<RK_GPIO1 25 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO1 RK_PD0 RK_FUNC_1 &pcfg_pull_none>,
+						<RK_GPIO1 RK_PD1 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2c1 {
 			i2c1_xfer: i2c1-xfer {
-				rockchip,pins = <RK_GPIO1 26 RK_FUNC_1 &pcfg_pull_none>,
-						<RK_GPIO1 27 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO1 RK_PD2 RK_FUNC_1 &pcfg_pull_none>,
+						<RK_GPIO1 RK_PD3 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2c2 {
 			i2c2_xfer: i2c2-xfer {
-				rockchip,pins = <RK_GPIO1 28 RK_FUNC_1 &pcfg_pull_none>,
-						<RK_GPIO1 29 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO1 RK_PD4 RK_FUNC_1 &pcfg_pull_none>,
+						<RK_GPIO1 RK_PD5 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2c3 {
 			i2c3_xfer: i2c3-xfer {
-				rockchip,pins = <RK_GPIO3 14 RK_FUNC_2 &pcfg_pull_none>,
-						<RK_GPIO3 15 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO3 RK_PB6 RK_FUNC_2 &pcfg_pull_none>,
+						<RK_GPIO3 RK_PB7 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		i2c4 {
 			i2c4_xfer: i2c4-xfer {
-				rockchip,pins = <RK_GPIO1 30 RK_FUNC_1 &pcfg_pull_none>,
-						<RK_GPIO1 31 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO1 RK_PD6 RK_FUNC_1 &pcfg_pull_none>,
+						<RK_GPIO1 RK_PD7 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		pwm0 {
 			pwm0_out: pwm0-out {
-				rockchip,pins = <RK_GPIO3 27 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO3 RK_PD3 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		pwm1 {
 			pwm1_out: pwm1-out {
-				rockchip,pins = <RK_GPIO3 28 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO3 RK_PD4 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		pwm2 {
 			pwm2_out: pwm2-out {
-				rockchip,pins = <RK_GPIO3 29 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO3 RK_PD5 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		pwm3 {
 			pwm3_out: pwm3-out {
-				rockchip,pins = <RK_GPIO3 30 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO3 RK_PD6 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		spi0 {
 			spi0_clk: spi0-clk {
-				rockchip,pins = <RK_GPIO1 6 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <RK_GPIO1 RK_PA6 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi0_cs0: spi0-cs0 {
-				rockchip,pins = <RK_GPIO1 7 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <RK_GPIO1 RK_PA7 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi0_tx: spi0-tx {
-				rockchip,pins = <RK_GPIO1 5 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <RK_GPIO1 RK_PA5 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi0_rx: spi0-rx {
-				rockchip,pins = <RK_GPIO1 4 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <RK_GPIO1 RK_PA4 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi0_cs1: spi0-cs1 {
-				rockchip,pins = <RK_GPIO1 15 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <RK_GPIO1 RK_PB7 RK_FUNC_1 &pcfg_pull_up>;
 			};
 		};
 
 		spi1 {
 			spi1_clk: spi1-clk {
-				rockchip,pins = <RK_GPIO0 30 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <RK_GPIO0 RK_PD6 RK_FUNC_1 &pcfg_pull_up>;
 			};
 			spi1_cs0: spi1-cs0 {
-				rockchip,pins = <RK_GPIO0 31 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <RK_GPIO0 RK_PD7 RK_FUNC_1 &pcfg_pull_up>;
 			};
 			spi1_rx: spi1-rx {
-				rockchip,pins = <RK_GPIO0 28 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <RK_GPIO0 RK_PD4 RK_FUNC_1 &pcfg_pull_up>;
 			};
 			spi1_tx: spi1-tx {
-				rockchip,pins = <RK_GPIO0 29 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <RK_GPIO0 RK_PD5 RK_FUNC_1 &pcfg_pull_up>;
 			};
 			spi1_cs1: spi1-cs1 {
-				rockchip,pins = <RK_GPIO1 14 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <RK_GPIO1 RK_PB6 RK_FUNC_2 &pcfg_pull_up>;
 			};
 		};
 
 		uart0 {
 			uart0_xfer: uart0-xfer {
-				rockchip,pins = <RK_GPIO1 0 RK_FUNC_1 &pcfg_pull_up>,
-						<RK_GPIO1 1 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO1 RK_PA0 RK_FUNC_1 &pcfg_pull_up>,
+						<RK_GPIO1 RK_PA1 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			uart0_cts: uart0-cts {
-				rockchip,pins = <RK_GPIO1 2 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO1 RK_PA2 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			uart0_rts: uart0-rts {
-				rockchip,pins = <RK_GPIO1 3 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO1 RK_PA3 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		uart1 {
 			uart1_xfer: uart1-xfer {
-				rockchip,pins = <RK_GPIO1 4 RK_FUNC_1 &pcfg_pull_up>,
-						<RK_GPIO1 5 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO1 RK_PA4 RK_FUNC_1 &pcfg_pull_up>,
+						<RK_GPIO1 RK_PA5 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			uart1_cts: uart1-cts {
-				rockchip,pins = <RK_GPIO1 6 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO1 RK_PA6 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			uart1_rts: uart1-rts {
-				rockchip,pins = <RK_GPIO1 7 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO1 RK_PA7 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		uart2 {
 			uart2_xfer: uart2-xfer {
-				rockchip,pins = <RK_GPIO1 8 RK_FUNC_1 &pcfg_pull_up>,
-						<RK_GPIO1 9 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO1 RK_PB0 RK_FUNC_1 &pcfg_pull_up>,
+						<RK_GPIO1 RK_PB1 RK_FUNC_1 &pcfg_pull_none>;
 			};
 			/* no rts / cts for uart2 */
 		};
 
 		uart3 {
 			uart3_xfer: uart3-xfer {
-				rockchip,pins = <RK_GPIO1 10 RK_FUNC_1 &pcfg_pull_up>,
-						<RK_GPIO1 11 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO1 RK_PB2 RK_FUNC_1 &pcfg_pull_up>,
+						<RK_GPIO1 RK_PB3 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			uart3_cts: uart3-cts {
-				rockchip,pins = <RK_GPIO1 12 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO1 RK_PB4 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			uart3_rts: uart3-rts {
-				rockchip,pins = <RK_GPIO1 13 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO1 RK_PB5 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		sd0 {
 			sd0_clk: sd0-clk {
-				rockchip,pins = <RK_GPIO3 2 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO3 RK_PA2 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			sd0_cmd: sd0-cmd {
-				rockchip,pins = <RK_GPIO3 3 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO3 RK_PA3 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			sd0_cd: sd0-cd {
-				rockchip,pins = <RK_GPIO3 8 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO3 RK_PB0 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			sd0_wp: sd0-wp {
-				rockchip,pins = <RK_GPIO3 9 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO3 RK_PB1 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			sd0_pwr: sd0-pwr {
-				rockchip,pins = <RK_GPIO3 1 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO3 RK_PA1 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			sd0_bus1: sd0-bus-width1 {
-				rockchip,pins = <RK_GPIO3 4 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO3 RK_PA4 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			sd0_bus4: sd0-bus-width4 {
-				rockchip,pins = <RK_GPIO3 4 RK_FUNC_1 &pcfg_pull_none>,
-						<RK_GPIO3 5 RK_FUNC_1 &pcfg_pull_none>,
-						<RK_GPIO3 6 RK_FUNC_1 &pcfg_pull_none>,
-						<RK_GPIO3 7 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO3 RK_PA4 RK_FUNC_1 &pcfg_pull_none>,
+						<RK_GPIO3 RK_PA5 RK_FUNC_1 &pcfg_pull_none>,
+						<RK_GPIO3 RK_PA6 RK_FUNC_1 &pcfg_pull_none>,
+						<RK_GPIO3 RK_PA7 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		sd1 {
 			sd1_clk: sd1-clk {
-				rockchip,pins = <RK_GPIO3 21 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO3 RK_PC5 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			sd1_cmd: sd1-cmd {
-				rockchip,pins = <RK_GPIO3 16 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO3 RK_PC0 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			sd1_cd: sd1-cd {
-				rockchip,pins = <RK_GPIO3 22 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO3 RK_PC6 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			sd1_wp: sd1-wp {
-				rockchip,pins = <RK_GPIO3 23 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO3 RK_PC7 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			sd1_bus1: sd1-bus-width1 {
-				rockchip,pins = <RK_GPIO3 17 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO3 RK_PC1 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			sd1_bus4: sd1-bus-width4 {
-				rockchip,pins = <RK_GPIO3 17 RK_FUNC_1 &pcfg_pull_none>,
-						<RK_GPIO3 18 RK_FUNC_1 &pcfg_pull_none>,
-						<RK_GPIO3 19 RK_FUNC_1 &pcfg_pull_none>,
-						<RK_GPIO3 20 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO3 RK_PC1 RK_FUNC_1 &pcfg_pull_none>,
+						<RK_GPIO3 RK_PC2 RK_FUNC_1 &pcfg_pull_none>,
+						<RK_GPIO3 RK_PC3 RK_FUNC_1 &pcfg_pull_none>,
+						<RK_GPIO3 RK_PC4 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2s0 {
 			i2s0_bus: i2s0-bus {
-				rockchip,pins = <RK_GPIO1 16 RK_FUNC_1 &pcfg_pull_none>,
-						<RK_GPIO1 17 RK_FUNC_1 &pcfg_pull_none>,
-						<RK_GPIO1 18 RK_FUNC_1 &pcfg_pull_none>,
-						<RK_GPIO1 19 RK_FUNC_1 &pcfg_pull_none>,
-						<RK_GPIO1 20 RK_FUNC_1 &pcfg_pull_none>,
-						<RK_GPIO1 21 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO1 RK_PC0 RK_FUNC_1 &pcfg_pull_none>,
+						<RK_GPIO1 RK_PC1 RK_FUNC_1 &pcfg_pull_none>,
+						<RK_GPIO1 RK_PC2 RK_FUNC_1 &pcfg_pull_none>,
+						<RK_GPIO1 RK_PC3 RK_FUNC_1 &pcfg_pull_none>,
+						<RK_GPIO1 RK_PC4 RK_FUNC_1 &pcfg_pull_none>,
+						<RK_GPIO1 RK_PC5 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		spdif {
 			spdif_tx: spdif-tx {
-				rockchip,pins = <RK_GPIO1 14 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO1 RK_PB6 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
index 7cc3446..fe800bd 100644
--- a/arch/arm/boot/dts/rk322x.dtsi
+++ b/arch/arm/boot/dts/rk322x.dtsi
@@ -528,181 +528,181 @@
 
 		emmc {
 			emmc_clk: emmc-clk {
-				rockchip,pins = <2 7 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <2 RK_PA7 RK_FUNC_2 &pcfg_pull_none>;
 			};
 
 			emmc_cmd: emmc-cmd {
-				rockchip,pins = <1 22 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <1 RK_PC6 RK_FUNC_2 &pcfg_pull_none>;
 			};
 
 			emmc_bus8: emmc-bus8 {
-				rockchip,pins = <1 24 RK_FUNC_2 &pcfg_pull_none>,
-						<1 25 RK_FUNC_2 &pcfg_pull_none>,
-						<1 26 RK_FUNC_2 &pcfg_pull_none>,
-						<1 27 RK_FUNC_2 &pcfg_pull_none>,
-						<1 28 RK_FUNC_2 &pcfg_pull_none>,
-						<1 29 RK_FUNC_2 &pcfg_pull_none>,
-						<1 30 RK_FUNC_2 &pcfg_pull_none>,
-						<1 31 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <1 RK_PD0 RK_FUNC_2 &pcfg_pull_none>,
+						<1 RK_PD1 RK_FUNC_2 &pcfg_pull_none>,
+						<1 RK_PD2 RK_FUNC_2 &pcfg_pull_none>,
+						<1 RK_PD3 RK_FUNC_2 &pcfg_pull_none>,
+						<1 RK_PD4 RK_FUNC_2 &pcfg_pull_none>,
+						<1 RK_PD5 RK_FUNC_2 &pcfg_pull_none>,
+						<1 RK_PD6 RK_FUNC_2 &pcfg_pull_none>,
+						<1 RK_PD7 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		gmac {
 			rgmii_pins: rgmii-pins {
-				rockchip,pins = <2 14 RK_FUNC_1 &pcfg_pull_none>,
-						<2 12 RK_FUNC_1 &pcfg_pull_none>,
-						<2 25 RK_FUNC_1 &pcfg_pull_none>,
-						<2 19 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
-						<2 18 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
-						<2 22 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
-						<2 23 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
-						<2 9 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
-						<2 13 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
-						<2 17 RK_FUNC_1 &pcfg_pull_none>,
-						<2 16 RK_FUNC_1 &pcfg_pull_none>,
-						<2 21 RK_FUNC_2 &pcfg_pull_none>,
-						<2 20 RK_FUNC_2 &pcfg_pull_none>,
-						<2 11 RK_FUNC_1 &pcfg_pull_none>,
-						<2 8 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <2 RK_PB6 RK_FUNC_1 &pcfg_pull_none>,
+						<2 RK_PB4 RK_FUNC_1 &pcfg_pull_none>,
+						<2 RK_PD1 RK_FUNC_1 &pcfg_pull_none>,
+						<2 RK_PC3 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
+						<2 RK_PC2 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
+						<2 RK_PC6 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
+						<2 RK_PC7 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
+						<2 RK_PB1 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
+						<2 RK_PB5 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
+						<2 RK_PC1 RK_FUNC_1 &pcfg_pull_none>,
+						<2 RK_PC0 RK_FUNC_1 &pcfg_pull_none>,
+						<2 RK_PC5 RK_FUNC_2 &pcfg_pull_none>,
+						<2 RK_PC4 RK_FUNC_2 &pcfg_pull_none>,
+						<2 RK_PB3 RK_FUNC_1 &pcfg_pull_none>,
+						<2 RK_PB0 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			rmii_pins: rmii-pins {
-				rockchip,pins = <2 14 RK_FUNC_1 &pcfg_pull_none>,
-						<2 12 RK_FUNC_1 &pcfg_pull_none>,
-						<2 25 RK_FUNC_1 &pcfg_pull_none>,
-						<2 19 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
-						<2 18 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
-						<2 13 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
-						<2 17 RK_FUNC_1 &pcfg_pull_none>,
-						<2 16 RK_FUNC_1 &pcfg_pull_none>,
-						<2 8 RK_FUNC_1 &pcfg_pull_none>,
-						<2 15 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <2 RK_PB6 RK_FUNC_1 &pcfg_pull_none>,
+						<2 RK_PB4 RK_FUNC_1 &pcfg_pull_none>,
+						<2 RK_PD1 RK_FUNC_1 &pcfg_pull_none>,
+						<2 RK_PC3 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
+						<2 RK_PC2 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
+						<2 RK_PB5 RK_FUNC_1 &pcfg_pull_none_drv_12ma>,
+						<2 RK_PC1 RK_FUNC_1 &pcfg_pull_none>,
+						<2 RK_PC0 RK_FUNC_1 &pcfg_pull_none>,
+						<2 RK_PB0 RK_FUNC_1 &pcfg_pull_none>,
+						<2 RK_PB7 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			phy_pins: phy-pins {
-				rockchip,pins = <2 14 RK_FUNC_2 &pcfg_pull_none>,
-						<2 8 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <2 RK_PB6 RK_FUNC_2 &pcfg_pull_none>,
+						<2 RK_PB0 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		i2c0 {
 			i2c0_xfer: i2c0-xfer {
-				rockchip,pins = <0 0 RK_FUNC_1 &pcfg_pull_none>,
-						<0 1 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PA0 RK_FUNC_1 &pcfg_pull_none>,
+						<0 RK_PA1 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2c1 {
 			i2c1_xfer: i2c1-xfer {
-				rockchip,pins = <0 2 RK_FUNC_1 &pcfg_pull_none>,
-						<0 3 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PA2 RK_FUNC_1 &pcfg_pull_none>,
+						<0 RK_PA3 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2c2 {
 			i2c2_xfer: i2c2-xfer {
-				rockchip,pins = <2 20 RK_FUNC_1 &pcfg_pull_none>,
-						<2 21 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <2 RK_PC4 RK_FUNC_1 &pcfg_pull_none>,
+						<2 RK_PC5 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2c3 {
 			i2c3_xfer: i2c3-xfer {
-				rockchip,pins = <0 6 RK_FUNC_1 &pcfg_pull_none>,
-						<0 7 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PA6 RK_FUNC_1 &pcfg_pull_none>,
+						<0 RK_PA7 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2s1 {
 			i2s1_bus: i2s1-bus {
-				rockchip,pins = <0 8 RK_FUNC_1 &pcfg_pull_none>,
-						<0 9 RK_FUNC_1 &pcfg_pull_none>,
-						<0 11 RK_FUNC_1 &pcfg_pull_none>,
-						<0 12 RK_FUNC_1 &pcfg_pull_none>,
-						<0 13 RK_FUNC_1 &pcfg_pull_none>,
-						<0 14 RK_FUNC_1 &pcfg_pull_none>,
-						<1 2 RK_FUNC_1 &pcfg_pull_none>,
-						<1 4 RK_FUNC_1 &pcfg_pull_none>,
-						<1 5 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PB0 RK_FUNC_1 &pcfg_pull_none>,
+						<0 RK_PB1 RK_FUNC_1 &pcfg_pull_none>,
+						<0 RK_PB3 RK_FUNC_1 &pcfg_pull_none>,
+						<0 RK_PB4 RK_FUNC_1 &pcfg_pull_none>,
+						<0 RK_PB5 RK_FUNC_1 &pcfg_pull_none>,
+						<0 RK_PB6 RK_FUNC_1 &pcfg_pull_none>,
+						<1 RK_PA2 RK_FUNC_1 &pcfg_pull_none>,
+						<1 RK_PA4 RK_FUNC_1 &pcfg_pull_none>,
+						<1 RK_PA5 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		pwm0 {
 			pwm0_pin: pwm0-pin {
-				rockchip,pins = <3 21 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <3 RK_PC5 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		pwm1 {
 			pwm1_pin: pwm1-pin {
-				rockchip,pins = <0 30 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PD6 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		pwm2 {
 			pwm2_pin: pwm2-pin {
-				rockchip,pins = <1 12 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <1 RK_PB4 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		pwm3 {
 			pwm3_pin: pwm3-pin {
-				rockchip,pins = <1 11 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <1 RK_PB3 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		tsadc {
 			otp_gpio: otp-gpio {
-				rockchip,pins = <0 24 RK_FUNC_GPIO &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
 			};
 
 			otp_out: otp-out {
-				rockchip,pins = <0 24 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PD0 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		uart0 {
 			uart0_xfer: uart0-xfer {
-				rockchip,pins = <2 26 RK_FUNC_1 &pcfg_pull_none>,
-						<2 27 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <2 RK_PD2 RK_FUNC_1 &pcfg_pull_none>,
+						<2 RK_PD3 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			uart0_cts: uart0-cts {
-				rockchip,pins = <2 29 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <2 RK_PD5 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			uart0_rts: uart0-rts {
-				rockchip,pins = <0 17 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PC1 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		uart1 {
 			uart1_xfer: uart1-xfer {
-				rockchip,pins = <1 9 RK_FUNC_1 &pcfg_pull_none>,
-						<1 10 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <1 RK_PB1 RK_FUNC_1 &pcfg_pull_none>,
+						<1 RK_PB2 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			uart1_cts: uart1-cts {
-				rockchip,pins = <1 8 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <1 RK_PB0 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			uart1_rts: uart1-rts {
-				rockchip,pins = <1 11 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <1 RK_PB3 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		uart2 {
 			uart2_xfer: uart2-xfer {
-				rockchip,pins = <1 18 RK_FUNC_2 &pcfg_pull_none>,
-						<1 19 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <1 RK_PC2 RK_FUNC_2 &pcfg_pull_none>,
+						<1 RK_PC3 RK_FUNC_2 &pcfg_pull_none>;
 			};
 
 			uart2_cts: uart2-cts {
-				rockchip,pins = <0 25 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PD1 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			uart2_rts: uart2-rts {
-				rockchip,pins = <0 24 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PD0 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/rk3288-evb-act8846.dts b/arch/arm/boot/dts/rk3288-evb-act8846.dts
index b9418d1..28c0690 100644
--- a/arch/arm/boot/dts/rk3288-evb-act8846.dts
+++ b/arch/arm/boot/dts/rk3288-evb-act8846.dts
@@ -213,13 +213,13 @@
 &pinctrl {
 	lcd {
 		lcd_en: lcd-en  {
-			rockchip,pins = <7 3 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	wifi {
 		wifi_pwr: wifi-pwr {
-			rockchip,pins = <7 9 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3288-evb.dtsi b/arch/arm/boot/dts/rk3288-evb.dtsi
index 0dec94c..bee91dc 100644
--- a/arch/arm/boot/dts/rk3288-evb.dtsi
+++ b/arch/arm/boot/dts/rk3288-evb.dtsi
@@ -307,25 +307,25 @@
 
 	backlight {
 		bl_en: bl-en {
-			rockchip,pins = <7 2 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	buttons {
 		pwrbtn: pwrbtn {
-			rockchip,pins = <0 5 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	lcd {
 		lcd_cs: lcd-cs {
-			rockchip,pins = <7 4 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	pmic {
 		pmic_int: pmic-int {
-			rockchip,pins = <RK_GPIO0 4 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <RK_GPIO0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
@@ -335,34 +335,34 @@
 		 * high-speed mode on EVB board so bump up to 8ma.
 		 */
 		sdmmc_bus4: sdmmc-bus4 {
-			rockchip,pins = <6 16 RK_FUNC_1 &pcfg_pull_up_drv_8ma>,
-					<6 17 RK_FUNC_1 &pcfg_pull_up_drv_8ma>,
-					<6 18 RK_FUNC_1 &pcfg_pull_up_drv_8ma>,
-					<6 19 RK_FUNC_1 &pcfg_pull_up_drv_8ma>;
+			rockchip,pins = <6 RK_PC0 RK_FUNC_1 &pcfg_pull_up_drv_8ma>,
+					<6 RK_PC1 RK_FUNC_1 &pcfg_pull_up_drv_8ma>,
+					<6 RK_PC2 RK_FUNC_1 &pcfg_pull_up_drv_8ma>,
+					<6 RK_PC3 RK_FUNC_1 &pcfg_pull_up_drv_8ma>;
 		};
 
 		sdmmc_clk: sdmmc-clk {
-			rockchip,pins = <6 20 RK_FUNC_1 &pcfg_pull_none_drv_8ma>;
+			rockchip,pins = <6 RK_PC4 RK_FUNC_1 &pcfg_pull_none_drv_8ma>;
 		};
 
 		sdmmc_cmd: sdmmc-cmd {
-			rockchip,pins = <6 21 RK_FUNC_1 &pcfg_pull_up_drv_8ma>;
+			rockchip,pins = <6 RK_PC5 RK_FUNC_1 &pcfg_pull_up_drv_8ma>;
 		};
 
 		sdmmc_pwr: sdmmc-pwr {
-			rockchip,pins = <7 11 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	usb {
 		host_vbus_drv: host-vbus-drv {
-			rockchip,pins = <0 14 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	eth_phy {
 		eth_phy_pwr: eth-phy-pwr {
-			rockchip,pins = <0 6 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3288-fennec.dts b/arch/arm/boot/dts/rk3288-fennec.dts
index 61d1c10..4d5b5df 100644
--- a/arch/arm/boot/dts/rk3288-fennec.dts
+++ b/arch/arm/boot/dts/rk3288-fennec.dts
@@ -313,27 +313,27 @@
 
 	gmac {
 		phy_int: phy-int {
-			rockchip,pins = <0 9 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PB1 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 
 		phy_pmeb: phy-pmeb {
-			rockchip,pins = <0 8 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 
 		phy_rst: phy-rst {
-			rockchip,pins = <4 8 RK_FUNC_GPIO &pcfg_output_high>;
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_output_high>;
 		};
 	};
 
 	pmic {
 		pmic_int: pmic-int {
-			rockchip,pins = <RK_GPIO0 4 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <RK_GPIO0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	usbphy {
 		host_drv: host-drv {
-			rockchip,pins = <0 14 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3288-firefly-beta.dts b/arch/arm/boot/dts/rk3288-firefly-beta.dts
index 0195d97..5403251 100644
--- a/arch/arm/boot/dts/rk3288-firefly-beta.dts
+++ b/arch/arm/boot/dts/rk3288-firefly-beta.dts
@@ -55,13 +55,13 @@
 &pinctrl {
 	act8846 {
 		pmic_vsel: pmic-vsel {
-			rockchip,pins = <7 1 RK_FUNC_GPIO &pcfg_output_low>;
+			rockchip,pins = <7 RK_PA1 RK_FUNC_GPIO &pcfg_output_low>;
 		};
 	};
 
 	ir {
 		ir_int: ir-int {
-			rockchip,pins = <7 5 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <7 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi b/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
index 8134966..55c568e 100644
--- a/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
+++ b/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
@@ -260,25 +260,25 @@
 
 	act8846 {
 		pwr_hold: pwr-hold {
-			rockchip,pins = <0 1 RK_FUNC_GPIO &pcfg_output_high>;
+			rockchip,pins = <0 RK_PA1 RK_FUNC_GPIO &pcfg_output_high>;
 		};
 
 		pmic_vsel: pmic-vsel {
-			rockchip,pins = <7 14 RK_FUNC_GPIO &pcfg_output_low>;
+			rockchip,pins = <7 RK_PB6 RK_FUNC_GPIO &pcfg_output_low>;
 		};
 	};
 
 	gmac {
 		phy_int: phy-int {
-			rockchip,pins = <0 9 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PB1 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 
 		phy_pmeb: phy-pmeb {
-			rockchip,pins = <0 8 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 
 		phy_rst: phy-rst {
-			rockchip,pins = <4 8 RK_FUNC_GPIO &pcfg_output_high>;
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_output_high>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3288-firefly-reload.dts b/arch/arm/boot/dts/rk3288-firefly-reload.dts
index d0b3204a..eadd1d8f 100644
--- a/arch/arm/boot/dts/rk3288-firefly-reload.dts
+++ b/arch/arm/boot/dts/rk3288-firefly-reload.dts
@@ -318,39 +318,39 @@
 &pinctrl {
 	ir {
 		ir_int: ir-int {
-			rockchip,pins = <7 0 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <7 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	dvp {
 		dvp_pwr: dvp-pwr {
-			rockchip,pins = <0 11 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
 		cif_pwr: cif-pwr {
-			rockchip,pins = <7 12 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	hym8563 {
 		rtc_int: rtc-int {
-			rockchip,pins = <7 4 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <7 RK_PA4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	keys {
 		pwr_key: pwr-key {
-			rockchip,pins = <0 5 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	leds {
 		power_led: power-led {
-			rockchip,pins = <8 2 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <8 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
 		work_led: work-led {
-			rockchip,pins = <8 1 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <8 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
@@ -360,44 +360,44 @@
 		 * high-speed mode on firefly board so bump up to 12ma.
 		 */
 		sdmmc_bus4: sdmmc-bus4 {
-			rockchip,pins = <6 16 RK_FUNC_1 &pcfg_pull_up_drv_12ma>,
-					<6 17 RK_FUNC_1 &pcfg_pull_up_drv_12ma>,
-					<6 18 RK_FUNC_1 &pcfg_pull_up_drv_12ma>,
-					<6 19 RK_FUNC_1 &pcfg_pull_up_drv_12ma>;
+			rockchip,pins = <6 RK_PC0 RK_FUNC_1 &pcfg_pull_up_drv_12ma>,
+					<6 RK_PC1 RK_FUNC_1 &pcfg_pull_up_drv_12ma>,
+					<6 RK_PC2 RK_FUNC_1 &pcfg_pull_up_drv_12ma>,
+					<6 RK_PC3 RK_FUNC_1 &pcfg_pull_up_drv_12ma>;
 		};
 
 		sdmmc_clk: sdmmc-clk {
-			rockchip,pins = <6 20 RK_FUNC_1 &pcfg_pull_none_12ma>;
+			rockchip,pins = <6 RK_PC4 RK_FUNC_1 &pcfg_pull_none_12ma>;
 		};
 
 		sdmmc_cmd: sdmmc-cmd {
-			rockchip,pins = <6 21 RK_FUNC_1 &pcfg_pull_up_drv_12ma>;
+			rockchip,pins = <6 RK_PC5 RK_FUNC_1 &pcfg_pull_up_drv_12ma>;
 		};
 
 		sdmmc_pwr: sdmmc-pwr {
-			rockchip,pins = <7 11 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	sdio {
 		wifi_enable: wifi-enable {
-			rockchip,pins = <4 28 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <4 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	usb_host {
 		host_vbus_drv: host-vbus-drv {
-			rockchip,pins = <0 14 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
 		usbhub_rst: usbhub-rst {
-			rockchip,pins = <8 3 RK_FUNC_GPIO &pcfg_output_high>;
+			rockchip,pins = <8 RK_PA3 RK_FUNC_GPIO &pcfg_output_high>;
 		};
 	};
 
 	usb_otg {
 		otg_vbus_drv: otg-vbus-drv {
-			rockchip,pins = <0 12 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3288-firefly.dts b/arch/arm/boot/dts/rk3288-firefly.dts
index 14271be..22185b3 100644
--- a/arch/arm/boot/dts/rk3288-firefly.dts
+++ b/arch/arm/boot/dts/rk3288-firefly.dts
@@ -55,13 +55,13 @@
 &pinctrl {
 	act8846 {
 		pmic_vsel: pmic-vsel {
-			rockchip,pins = <7 14 RK_FUNC_GPIO &pcfg_output_low>;
+			rockchip,pins = <7 RK_PB6 RK_FUNC_GPIO &pcfg_output_low>;
 		};
 	};
 
 	ir {
 		ir_int: ir-int {
-			rockchip,pins = <7 0 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <7 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3288-firefly.dtsi b/arch/arm/boot/dts/rk3288-firefly.dtsi
index 10793ac..a099f98 100644
--- a/arch/arm/boot/dts/rk3288-firefly.dtsi
+++ b/arch/arm/boot/dts/rk3288-firefly.dtsi
@@ -412,49 +412,49 @@
 
 	act8846 {
 		pwr_hold: pwr-hold {
-			rockchip,pins = <0 1 RK_FUNC_GPIO &pcfg_output_high>;
+			rockchip,pins = <0 RK_PA1 RK_FUNC_GPIO &pcfg_output_high>;
 		};
 	};
 
 	dvp {
 		dvp_pwr: dvp-pwr {
-			rockchip,pins = <0 11 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	gmac {
 		phy_int: phy-int {
-			rockchip,pins = <0 9 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PB1 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 
 		phy_pmeb: phy-pmeb {
-			rockchip,pins = <0 8 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 
 		phy_rst: phy-rst {
-			rockchip,pins = <4 8 RK_FUNC_GPIO &pcfg_output_high>;
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_output_high>;
 		};
 	};
 
 	hym8563 {
 		rtc_int: rtc-int {
-			rockchip,pins = <7 4 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <7 RK_PA4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	keys {
 		pwr_key: pwr-key {
-			rockchip,pins = <0 5 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	leds {
 		power_led: power-led {
-			rockchip,pins = <8 2 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <8 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
 		work_led: work-led {
-			rockchip,pins = <8 1 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <8 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
@@ -464,38 +464,38 @@
 		 * high-speed mode on firefly board so bump up to 12ma.
 		 */
 		sdmmc_bus4: sdmmc-bus4 {
-			rockchip,pins = <6 16 RK_FUNC_1 &pcfg_pull_up_drv_12ma>,
-					<6 17 RK_FUNC_1 &pcfg_pull_up_drv_12ma>,
-					<6 18 RK_FUNC_1 &pcfg_pull_up_drv_12ma>,
-					<6 19 RK_FUNC_1 &pcfg_pull_up_drv_12ma>;
+			rockchip,pins = <6 RK_PC0 RK_FUNC_1 &pcfg_pull_up_drv_12ma>,
+					<6 RK_PC1 RK_FUNC_1 &pcfg_pull_up_drv_12ma>,
+					<6 RK_PC2 RK_FUNC_1 &pcfg_pull_up_drv_12ma>,
+					<6 RK_PC3 RK_FUNC_1 &pcfg_pull_up_drv_12ma>;
 		};
 
 		sdmmc_clk: sdmmc-clk {
-			rockchip,pins = <6 20 RK_FUNC_1 &pcfg_pull_none_12ma>;
+			rockchip,pins = <6 RK_PC4 RK_FUNC_1 &pcfg_pull_none_12ma>;
 		};
 
 		sdmmc_cmd: sdmmc-cmd {
-			rockchip,pins = <6 21 RK_FUNC_1 &pcfg_pull_up_drv_12ma>;
+			rockchip,pins = <6 RK_PC5 RK_FUNC_1 &pcfg_pull_up_drv_12ma>;
 		};
 
 		sdmmc_pwr: sdmmc-pwr {
-			rockchip,pins = <7 11 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	usb_host {
 		host_vbus_drv: host-vbus-drv {
-			rockchip,pins = <0 14 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
 		usbhub_rst: usbhub-rst {
-			rockchip,pins = <8 3 RK_FUNC_GPIO &pcfg_output_high>;
+			rockchip,pins = <8 RK_PA3 RK_FUNC_GPIO &pcfg_output_high>;
 		};
 	};
 
 	usb_otg {
 		otg_vbus_drv: otg-vbus-drv {
-			rockchip,pins = <0 12 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3288-miqi.dts b/arch/arm/boot/dts/rk3288-miqi.dts
index 30e93f6..3067102 100644
--- a/arch/arm/boot/dts/rk3288-miqi.dts
+++ b/arch/arm/boot/dts/rk3288-miqi.dts
@@ -335,29 +335,29 @@
 
 	act8846 {
 		pmic_int: pmic-int {
-			rockchip,pins = <0 4 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 
 		pmic_sleep: pmic-sleep {
-			rockchip,pins = <0 0 RK_FUNC_GPIO &pcfg_output_low>;
+			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_output_low>;
 		};
 
 		pmic_vsel: pmic-vsel {
-			rockchip,pins = <7 1 RK_FUNC_GPIO &pcfg_output_low>;
+			rockchip,pins = <7 RK_PA1 RK_FUNC_GPIO &pcfg_output_low>;
 		};
 	};
 
 	gmac {
 		phy_int: phy-int {
-			rockchip,pins = <0 9 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PB1 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 
 		phy_pmeb: phy-pmeb {
-			rockchip,pins = <0 8 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 
 		phy_rst: phy-rst {
-			rockchip,pins = <4 8 RK_FUNC_GPIO &pcfg_output_high>;
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_output_high>;
 		};
 	};
 
@@ -367,28 +367,28 @@
 		 * high-speed mode on firefly board so bump up to 12ma.
 		 */
 		sdmmc_bus4: sdmmc-bus4 {
-			rockchip,pins = <6 16 RK_FUNC_1 &pcfg_pull_up_drv_12ma>,
-					<6 17 RK_FUNC_1 &pcfg_pull_up_drv_12ma>,
-					<6 18 RK_FUNC_1 &pcfg_pull_up_drv_12ma>,
-					<6 19 RK_FUNC_1 &pcfg_pull_up_drv_12ma>;
+			rockchip,pins = <6 RK_PC0 RK_FUNC_1 &pcfg_pull_up_drv_12ma>,
+					<6 RK_PC1 RK_FUNC_1 &pcfg_pull_up_drv_12ma>,
+					<6 RK_PC2 RK_FUNC_1 &pcfg_pull_up_drv_12ma>,
+					<6 RK_PC3 RK_FUNC_1 &pcfg_pull_up_drv_12ma>;
 		};
 
 		sdmmc_clk: sdmmc-clk {
-			rockchip,pins = <6 20 RK_FUNC_1 &pcfg_pull_none_12ma>;
+			rockchip,pins = <6 RK_PC4 RK_FUNC_1 &pcfg_pull_none_12ma>;
 		};
 
 		sdmmc_cmd: sdmmc-cmd {
-			rockchip,pins = <6 21 RK_FUNC_1 &pcfg_pull_up_drv_12ma>;
+			rockchip,pins = <6 RK_PC5 RK_FUNC_1 &pcfg_pull_up_drv_12ma>;
 		};
 
 		sdmmc_pwr: sdmmc-pwr {
-			rockchip,pins = <7 11 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	usb_host {
 		host_vbus_drv: host-vbus-drv {
-			rockchip,pins = <0 14 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3288-r89.dts b/arch/arm/boot/dts/rk3288-r89.dts
index 1145b62..d23cf23 100644
--- a/arch/arm/boot/dts/rk3288-r89.dts
+++ b/arch/arm/boot/dts/rk3288-r89.dts
@@ -302,39 +302,39 @@
 
 	act8846 {
 		pmic_vsel: pmic-vsel {
-			rockchip,pins = <7 1 RK_FUNC_GPIO &pcfg_output_low>;
+			rockchip,pins = <7 RK_PA1 RK_FUNC_GPIO &pcfg_output_low>;
 		};
 
 		pwr_hold: pwr-hold {
-			rockchip,pins = <0 6 RK_FUNC_GPIO &pcfg_output_high>;
+			rockchip,pins = <0 RK_PA6 RK_FUNC_GPIO &pcfg_output_high>;
 		};
 	};
 
 	buttons {
 		pwrbtn: pwrbtn {
-			rockchip,pins = <0 5 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	ir {
 		ir_int: ir-int {
-			rockchip,pins = <7 0 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <7 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	pmic {
 		pmic_int: pmic-int {
-			rockchip,pins = <RK_GPIO0 4 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <RK_GPIO0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	usb {
 		host_vbus_drv: host-vbus-drv {
-			rockchip,pins = <0 14 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
 		otg_vbus_drv: otg-vbus-drv {
-			rockchip,pins = <0 12 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3288-rock2-som.dtsi b/arch/arm/boot/dts/rk3288-rock2-som.dtsi
index f0778a4..c81968b 100644
--- a/arch/arm/boot/dts/rk3288-rock2-som.dtsi
+++ b/arch/arm/boot/dts/rk3288-rock2-som.dtsi
@@ -265,13 +265,13 @@
 
 	emmc {
 			emmc_reset: emmc-reset {
-				rockchip,pins = <3 9 RK_FUNC_GPIO &pcfg_pull_none>;
+				rockchip,pins = <3 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
 			};
 	};
 
 	gmac {
 		phy_rst: phy-rst {
-			rockchip,pins = <4 8 RK_FUNC_GPIO  &pcfg_output_high>;
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO  &pcfg_output_high>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3288-rock2-square.dts b/arch/arm/boot/dts/rk3288-rock2-square.dts
index a23a948..2c76e4d 100644
--- a/arch/arm/boot/dts/rk3288-rock2-square.dts
+++ b/arch/arm/boot/dts/rk3288-rock2-square.dts
@@ -222,47 +222,47 @@
 &pinctrl {
 	ir {
 		ir_int: ir-int {
-			rockchip,pins = <8 1 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <8 RK_PA1 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	pmic {
 		pmic_int: pmic-int {
-			rockchip,pins = <0 4 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	headphone {
 		hp_det: hp-det {
-			rockchip,pins = <7 7 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PA7 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
 		phone_ctl: phone-ctl {
-			rockchip,pins = <8 0 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <8 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	usb {
 		host_vbus_drv: host-vbus-drv {
-			rockchip,pins = <0 14 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	sata {
 		sata_pwr_en: sata-pwr-en {
-			rockchip,pins = <0 13 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	sdmmc {
 		sdmmc_pwr: sdmmc-pwr {
-			rockchip,pins = <7 11 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	sdio {
 		wifi_enable: wifi-enable {
-			rockchip,pins = <4 28 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <4 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3288-tinker.dts b/arch/arm/boot/dts/rk3288-tinker.dts
index f601c78..0ef6832 100644
--- a/arch/arm/boot/dts/rk3288-tinker.dts
+++ b/arch/arm/boot/dts/rk3288-tinker.dts
@@ -384,68 +384,68 @@
 
 	backlight {
 		bl_en: bl-en {
-			rockchip,pins = <7 2 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	buttons {
 		pwrbtn: pwrbtn {
-			rockchip,pins = <0 5 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	eth_phy {
 		eth_phy_pwr: eth-phy-pwr {
-			rockchip,pins = <0 6 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	pmic {
 		pmic_int: pmic-int {
-			rockchip,pins = <RK_GPIO0 4 RK_FUNC_GPIO \
+			rockchip,pins = <RK_GPIO0 RK_PA4 RK_FUNC_GPIO \
 					&pcfg_pull_up>;
 		};
 
 		dvs_1: dvs-1 {
-			rockchip,pins = <RK_GPIO0 11 RK_FUNC_GPIO \
+			rockchip,pins = <RK_GPIO0 RK_PB3 RK_FUNC_GPIO \
 					&pcfg_pull_down>;
 		};
 
 		dvs_2: dvs-2 {
-			rockchip,pins = <RK_GPIO0 12 RK_FUNC_GPIO \
+			rockchip,pins = <RK_GPIO0 RK_PB4 RK_FUNC_GPIO \
 					&pcfg_pull_down>;
 		};
 	};
 
 	sdmmc {
 		sdmmc_bus4: sdmmc-bus4 {
-			rockchip,pins = <6 16 RK_FUNC_1 &pcfg_pull_up_drv_8ma>,
-					<6 17 RK_FUNC_1 &pcfg_pull_up_drv_8ma>,
-					<6 18 RK_FUNC_1 &pcfg_pull_up_drv_8ma>,
-					<6 19 RK_FUNC_1 &pcfg_pull_up_drv_8ma>;
+			rockchip,pins = <6 RK_PC0 RK_FUNC_1 &pcfg_pull_up_drv_8ma>,
+					<6 RK_PC1 RK_FUNC_1 &pcfg_pull_up_drv_8ma>,
+					<6 RK_PC2 RK_FUNC_1 &pcfg_pull_up_drv_8ma>,
+					<6 RK_PC3 RK_FUNC_1 &pcfg_pull_up_drv_8ma>;
 		};
 
 		sdmmc_clk: sdmmc-clk {
-			rockchip,pins = <6 20 RK_FUNC_1 \
+			rockchip,pins = <6 RK_PC4 RK_FUNC_1 \
 					&pcfg_pull_none_drv_8ma>;
 		};
 
 		sdmmc_cmd: sdmmc-cmd {
-			rockchip,pins = <6 21 RK_FUNC_1 &pcfg_pull_up_drv_8ma>;
+			rockchip,pins = <6 RK_PC5 RK_FUNC_1 &pcfg_pull_up_drv_8ma>;
 		};
 
 		sdmmc_pwr: sdmmc-pwr {
-			rockchip,pins = <7 11 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	usb {
 		host_vbus_drv: host-vbus-drv {
-			rockchip,pins = <0 14 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
 		pwr_3g: pwr-3g {
-			rockchip,pins = <7 8 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3288-veyron-analog-audio.dtsi b/arch/arm/boot/dts/rk3288-veyron-analog-audio.dtsi
index 280acea..bc2c114 100644
--- a/arch/arm/boot/dts/rk3288-veyron-analog-audio.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron-analog-audio.dtsi
@@ -76,7 +76,7 @@
 &pinctrl {
 	codec {
 		hp_det: hp-det {
-			rockchip,pins = <6 5 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <6 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 
 		/*
@@ -85,17 +85,17 @@
 		 * we've got a ts3a227e chip but the driver requires it.
 		 */
 		int_codec: int-codec {
-			rockchip,pins = <6 7 RK_FUNC_GPIO &pcfg_pull_down>;
+			rockchip,pins = <6 RK_PA7 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 
 		mic_det: mic-det {
-			rockchip,pins = <6 11 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <6 RK_PB3 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	headset {
 		ts3a227e_int_l: ts3a227e-int-l {
-			rockchip,pins = <0 3 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3288-veyron-brain.dts b/arch/arm/boot/dts/rk3288-veyron-brain.dts
index ed42552..677b899 100644
--- a/arch/arm/boot/dts/rk3288-veyron-brain.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-brain.dts
@@ -79,23 +79,23 @@
 &pinctrl {
 	hdmi {
 		vcc50_hdmi_en: vcc50-hdmi-en {
-			rockchip,pins = <7 2 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	pmic {
 		dvs_1: dvs-1 {
-			rockchip,pins = <7 11 RK_FUNC_GPIO &pcfg_pull_down>;
+			rockchip,pins = <7 RK_PB3 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 
 		dvs_2: dvs-2 {
-			rockchip,pins = <7 15 RK_FUNC_GPIO &pcfg_pull_down>;
+			rockchip,pins = <7 RK_PB7 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 	};
 
 	usb-host {
 		usb2_pwr_en: usb2-pwr-en {
-			rockchip,pins = <0 12 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi b/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
index d752a31..dd6e36d 100644
--- a/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
@@ -281,51 +281,51 @@
 
 	backlight {
 		bl_en: bl-en {
-			rockchip,pins = <7 2 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	buttons {
 		ap_lid_int_l: ap-lid-int-l {
-			rockchip,pins = <0 6 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PA6 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	charger {
 		ac_present_ap: ac-present-ap {
-			rockchip,pins = <0 8 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	cros-ec {
 		ec_int: ec-int {
-			rockchip,pins = <7 7 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PA7 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	suspend {
 		suspend_l_wake: suspend-l-wake {
-			rockchip,pins = <0 17 RK_FUNC_GPIO &pcfg_output_low>;
+			rockchip,pins = <0 RK_PC1 RK_FUNC_GPIO &pcfg_output_low>;
 		};
 
 		suspend_l_sleep: suspend-l-sleep {
-			rockchip,pins = <0 17 RK_FUNC_GPIO &pcfg_output_high>;
+			rockchip,pins = <0 RK_PC1 RK_FUNC_GPIO &pcfg_output_high>;
 		};
 	};
 
 	trackpad {
 		trackpad_int: trackpad-int {
-			rockchip,pins = <7 3 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <7 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	usb-host {
 		host1_pwr_en: host1-pwr-en {
-			rockchip,pins = <0 11 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
 		usbotg_pwren_h: usbotg-pwren-h {
-			rockchip,pins = <0 12 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3288-veyron-jaq.dts b/arch/arm/boot/dts/rk3288-veyron-jaq.dts
index d33f576..5d3884d 100644
--- a/arch/arm/boot/dts/rk3288-veyron-jaq.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-jaq.dts
@@ -175,39 +175,39 @@
 &pinctrl {
 	backlight {
 		bl_pwr_en: bl_pwr_en {
-			rockchip,pins = <2 12 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	buck-5v {
 		drv_5v: drv-5v {
-			rockchip,pins = <7 21 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	hdmi {
 		vcc50_hdmi_en: vcc50-hdmi-en {
-			rockchip,pins = <5 19 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <5 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	lcd {
 		lcd_enable_h: lcd-en {
-			rockchip,pins = <7 14 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
 		avdd_1v8_disp_en: avdd-1v8-disp-en {
-			rockchip,pins = <2 13 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <2 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	pmic {
 		dvs_1: dvs-1 {
-			rockchip,pins = <7 12 RK_FUNC_GPIO &pcfg_pull_down>;
+			rockchip,pins = <7 RK_PB4 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 
 		dvs_2: dvs-2 {
-			rockchip,pins = <7 15 RK_FUNC_GPIO &pcfg_pull_down>;
+			rockchip,pins = <7 RK_PB7 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3288-veyron-jerry.dts b/arch/arm/boot/dts/rk3288-veyron-jerry.dts
index cdea751..d3977ee 100644
--- a/arch/arm/boot/dts/rk3288-veyron-jerry.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-jerry.dts
@@ -138,39 +138,39 @@
 &pinctrl {
 	backlight {
 		bl_pwr_en: bl_pwr_en {
-			rockchip,pins = <2 12 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	buck-5v {
 		drv_5v: drv-5v {
-			rockchip,pins = <7 21 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	hdmi {
 		vcc50_hdmi_en: vcc50-hdmi-en {
-			rockchip,pins = <5 19 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <5 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	lcd {
 		lcd_enable_h: lcd-en {
-			rockchip,pins = <7 14 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
 		avdd_1v8_disp_en: avdd-1v8-disp-en {
-			rockchip,pins = <2 13 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <2 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	pmic {
 		dvs_1: dvs-1 {
-			rockchip,pins = <7 12 RK_FUNC_GPIO &pcfg_pull_down>;
+			rockchip,pins = <7 RK_PB4 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 
 		dvs_2: dvs-2 {
-			rockchip,pins = <7 15 RK_FUNC_GPIO &pcfg_pull_down>;
+			rockchip,pins = <7 RK_PB7 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3288-veyron-mickey.dts b/arch/arm/boot/dts/rk3288-veyron-mickey.dts
index f0994f0..d83f877 100644
--- a/arch/arm/boot/dts/rk3288-veyron-mickey.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-mickey.dts
@@ -219,17 +219,17 @@
 &pinctrl {
 	hdmi {
 		power_hdmi_on: power-hdmi-on {
-			rockchip,pins = <7 11 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	pmic {
 		dvs_1: dvs-1 {
-			rockchip,pins = <7 12 RK_FUNC_GPIO &pcfg_pull_down>;
+			rockchip,pins = <7 RK_PB4 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 
 		dvs_2: dvs-2 {
-			rockchip,pins = <7 15 RK_FUNC_GPIO &pcfg_pull_down>;
+			rockchip,pins = <7 RK_PB7 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3288-veyron-minnie.dts b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
index 544de60..d8ffb26 100644
--- a/arch/arm/boot/dts/rk3288-veyron-minnie.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
@@ -226,65 +226,65 @@
 &pinctrl {
 	backlight {
 		bl_pwr_en: bl_pwr_en {
-			rockchip,pins = <2 12 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	buck-5v {
 		drv_5v: drv-5v {
-			rockchip,pins = <7 21 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	buttons {
 		volum_down_l: volum-down-l {
-			rockchip,pins = <5 11 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <5 RK_PB3 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 
 		volum_up_l: volum-up-l {
-			rockchip,pins = <5 10 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <5 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	hdmi {
 		vcc50_hdmi_en: vcc50-hdmi-en {
-			rockchip,pins = <5 19 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <5 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	lcd {
 		lcd_enable_h: lcd-en {
-			rockchip,pins = <7 14 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
 		avdd_1v8_disp_en: avdd-1v8-disp-en {
-			rockchip,pins = <2 13 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <2 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	pmic {
 		dvs_1: dvs-1 {
-			rockchip,pins = <7 12 RK_FUNC_GPIO &pcfg_pull_down>;
+			rockchip,pins = <7 RK_PB4 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 
 		dvs_2: dvs-2 {
-			rockchip,pins = <7 15 RK_FUNC_GPIO &pcfg_pull_down>;
+			rockchip,pins = <7 RK_PB7 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 	};
 
 	prochot {
 		gpio_prochot: gpio-prochot {
-			rockchip,pins = <2 8 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <2 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	touchscreen {
 		touch_int: touch-int {
-			rockchip,pins = <2 14 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <2 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
 		touch_rst: touch-rst {
-			rockchip,pins = <2 15 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <2 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3288-veyron-pinky.dts b/arch/arm/boot/dts/rk3288-veyron-pinky.dts
index 995cff4..6491af8 100644
--- a/arch/arm/boot/dts/rk3288-veyron-pinky.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-pinky.dts
@@ -92,19 +92,19 @@
 &pinctrl {
 	buttons {
 		pwr_key_h: pwr-key-h {
-			rockchip,pins = <0 5 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	emmc {
 		emmc_reset: emmc-reset {
-			rockchip,pins = <7 12 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <7 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	sdmmc {
 		sdmmc_wp_gpio: sdmmc-wp-gpio {
-			rockchip,pins = <7 10 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <7 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3288-veyron-sdmmc.dtsi b/arch/arm/boot/dts/rk3288-veyron-sdmmc.dtsi
index aef0710..c740c11 100644
--- a/arch/arm/boot/dts/rk3288-veyron-sdmmc.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron-sdmmc.dtsi
@@ -53,18 +53,18 @@
 		 * We also have external pulls, so disable the internal ones.
 		 */
 		sdmmc_bus4: sdmmc-bus4 {
-			rockchip,pins = <6 16 RK_FUNC_1 &pcfg_pull_none_drv_8ma>,
-					<6 17 RK_FUNC_1 &pcfg_pull_none_drv_8ma>,
-					<6 18 RK_FUNC_1 &pcfg_pull_none_drv_8ma>,
-					<6 19 RK_FUNC_1 &pcfg_pull_none_drv_8ma>;
+			rockchip,pins = <6 RK_PC0 RK_FUNC_1 &pcfg_pull_none_drv_8ma>,
+					<6 RK_PC1 RK_FUNC_1 &pcfg_pull_none_drv_8ma>,
+					<6 RK_PC2 RK_FUNC_1 &pcfg_pull_none_drv_8ma>,
+					<6 RK_PC3 RK_FUNC_1 &pcfg_pull_none_drv_8ma>;
 		};
 
 		sdmmc_clk: sdmmc-clk {
-			rockchip,pins = <6 20 RK_FUNC_1 &pcfg_pull_none_drv_8ma>;
+			rockchip,pins = <6 RK_PC4 RK_FUNC_1 &pcfg_pull_none_drv_8ma>;
 		};
 
 		sdmmc_cmd: sdmmc-cmd {
-			rockchip,pins = <6 21 RK_FUNC_1 &pcfg_pull_none_drv_8ma>;
+			rockchip,pins = <6 RK_PC5 RK_FUNC_1 &pcfg_pull_none_drv_8ma>;
 		};
 
 		/*
@@ -74,12 +74,12 @@
 		 * think there's a card inserted
 		 */
 		sdmmc_cd_disabled: sdmmc-cd-disabled {
-			rockchip,pins = <6 22 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <6 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
 		/* This is where we actually hook up CD */
 		sdmmc_cd_gpio: sdmmc-cd-gpio {
-			rockchip,pins = <7 5 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3288-veyron-speedy.dts b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
index cc0b78c..b4a1653 100644
--- a/arch/arm/boot/dts/rk3288-veyron-speedy.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
@@ -141,39 +141,39 @@
 &pinctrl {
 	backlight {
 		bl_pwr_en: bl_pwr_en {
-			rockchip,pins = <2 12 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	buck-5v {
 		drv_5v: drv-5v {
-			rockchip,pins = <7 21 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	hdmi {
 		vcc50_hdmi_en: vcc50-hdmi-en {
-			rockchip,pins = <5 19 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <5 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	lcd {
 		lcd_enable_h: lcd-en {
-			rockchip,pins = <7 14 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
 		avdd_1v8_disp_en: avdd-1v8-disp-en {
-			rockchip,pins = <2 13 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <2 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	pmic {
 		dvs_1: dvs-1 {
-			rockchip,pins = <7 12 RK_FUNC_GPIO &pcfg_pull_down>;
+			rockchip,pins = <7 RK_PB4 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 
 		dvs_2: dvs-2 {
-			rockchip,pins = <7 15 RK_FUNC_GPIO &pcfg_pull_down>;
+			rockchip,pins = <7 RK_PB7 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3288-veyron.dtsi b/arch/arm/boot/dts/rk3288-veyron.dtsi
index 5d1eb0a..49bc880 100644
--- a/arch/arm/boot/dts/rk3288-veyron.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron.dtsi
@@ -482,13 +482,13 @@
 
 	buttons {
 		pwr_key_l: pwr-key-l {
-			rockchip,pins = <0 5 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	emmc {
 		emmc_reset: emmc-reset {
-			rockchip,pins = <2 9 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <2 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
 		/*
@@ -496,51 +496,51 @@
 		 * We also have external pulls, so disable the internal ones.
 		 */
 		emmc_clk: emmc-clk {
-			rockchip,pins = <3 18 RK_FUNC_2 &pcfg_pull_none_drv_8ma>;
+			rockchip,pins = <3 RK_PC2 RK_FUNC_2 &pcfg_pull_none_drv_8ma>;
 		};
 
 		emmc_cmd: emmc-cmd {
-			rockchip,pins = <3 16 RK_FUNC_2 &pcfg_pull_none_drv_8ma>;
+			rockchip,pins = <3 RK_PC0 RK_FUNC_2 &pcfg_pull_none_drv_8ma>;
 		};
 
 		emmc_bus8: emmc-bus8 {
-			rockchip,pins = <3 0 RK_FUNC_2 &pcfg_pull_none_drv_8ma>,
-					<3 1 RK_FUNC_2 &pcfg_pull_none_drv_8ma>,
-					<3 2 RK_FUNC_2 &pcfg_pull_none_drv_8ma>,
-					<3 3 RK_FUNC_2 &pcfg_pull_none_drv_8ma>,
-					<3 4 RK_FUNC_2 &pcfg_pull_none_drv_8ma>,
-					<3 5 RK_FUNC_2 &pcfg_pull_none_drv_8ma>,
-					<3 6 RK_FUNC_2 &pcfg_pull_none_drv_8ma>,
-					<3 7 RK_FUNC_2 &pcfg_pull_none_drv_8ma>;
+			rockchip,pins = <3 RK_PA0 RK_FUNC_2 &pcfg_pull_none_drv_8ma>,
+					<3 RK_PA1 RK_FUNC_2 &pcfg_pull_none_drv_8ma>,
+					<3 RK_PA2 RK_FUNC_2 &pcfg_pull_none_drv_8ma>,
+					<3 RK_PA3 RK_FUNC_2 &pcfg_pull_none_drv_8ma>,
+					<3 RK_PA4 RK_FUNC_2 &pcfg_pull_none_drv_8ma>,
+					<3 RK_PA5 RK_FUNC_2 &pcfg_pull_none_drv_8ma>,
+					<3 RK_PA6 RK_FUNC_2 &pcfg_pull_none_drv_8ma>,
+					<3 RK_PA7 RK_FUNC_2 &pcfg_pull_none_drv_8ma>;
 		};
 	};
 
 	pmic {
 		pmic_int_l: pmic-int-l {
-			rockchip,pins = <RK_GPIO0 4 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <RK_GPIO0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	reboot {
 		ap_warm_reset_h: ap-warm-reset-h {
-			rockchip,pins = <RK_GPIO0 13 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <RK_GPIO0 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	recovery-switch {
 		rec_mode_l: rec-mode-l {
-			rockchip,pins = <0 9 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PB1 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	sdio0 {
 		wifi_enable_h: wifienable-h {
-			rockchip,pins = <4 28 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <4 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
 		/* NOTE: mislabelled on schematic; should be bt_enable_h */
 		bt_enable_l: bt-enable-l {
-			rockchip,pins = <4 29 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <4 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
 		/*
@@ -548,30 +548,30 @@
 		 * We also have external pulls, so disable the internal ones.
 		 */
 		sdio0_bus4: sdio0-bus4 {
-			rockchip,pins = <4 20 RK_FUNC_1 &pcfg_pull_none_drv_8ma>,
-					<4 21 RK_FUNC_1 &pcfg_pull_none_drv_8ma>,
-					<4 22 RK_FUNC_1 &pcfg_pull_none_drv_8ma>,
-					<4 23 RK_FUNC_1 &pcfg_pull_none_drv_8ma>;
+			rockchip,pins = <4 RK_PC4 RK_FUNC_1 &pcfg_pull_none_drv_8ma>,
+					<4 RK_PC5 RK_FUNC_1 &pcfg_pull_none_drv_8ma>,
+					<4 RK_PC6 RK_FUNC_1 &pcfg_pull_none_drv_8ma>,
+					<4 RK_PC7 RK_FUNC_1 &pcfg_pull_none_drv_8ma>;
 		};
 
 		sdio0_cmd: sdio0-cmd {
-			rockchip,pins = <4 24 RK_FUNC_1 &pcfg_pull_none_drv_8ma>;
+			rockchip,pins = <4 RK_PD0 RK_FUNC_1 &pcfg_pull_none_drv_8ma>;
 		};
 
 		sdio0_clk: sdio0-clk {
-			rockchip,pins = <4 25 RK_FUNC_1 &pcfg_pull_none_drv_8ma>;
+			rockchip,pins = <4 RK_PD1 RK_FUNC_1 &pcfg_pull_none_drv_8ma>;
 		};
 	};
 
 	tpm {
 		tpm_int_h: tpm-int-h {
-			rockchip,pins = <7 4 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	write-protect {
 		fw_wp_ap: fw-wp-ap {
-			rockchip,pins = <7 6 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <7 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index ad5d602..ad1895f 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -1348,8 +1348,8 @@
 
 		hdmi {
 			hdmi_ddc: hdmi-ddc {
-				rockchip,pins = <7 19 RK_FUNC_2 &pcfg_pull_none>,
-						<7 20 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <7 RK_PC3 RK_FUNC_2 &pcfg_pull_none>,
+						<7 RK_PC4 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
@@ -1372,144 +1372,144 @@
 
 		sleep {
 			global_pwroff: global-pwroff {
-				rockchip,pins = <0 0 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PA0 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			ddrio_pwroff: ddrio-pwroff {
-				rockchip,pins = <0 1 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PA1 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			ddr0_retention: ddr0-retention {
-				rockchip,pins = <0 2 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <0 RK_PA2 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			ddr1_retention: ddr1-retention {
-				rockchip,pins = <0 3 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <0 RK_PA3 RK_FUNC_1 &pcfg_pull_up>;
 			};
 		};
 
 		edp {
 			edp_hpd: edp-hpd {
-				rockchip,pins = <7 11 RK_FUNC_2 &pcfg_pull_down>;
+				rockchip,pins = <7 RK_PB3 RK_FUNC_2 &pcfg_pull_down>;
 			};
 		};
 
 		i2c0 {
 			i2c0_xfer: i2c0-xfer {
-				rockchip,pins = <0 15 RK_FUNC_1 &pcfg_pull_none>,
-						<0 16 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PB7 RK_FUNC_1 &pcfg_pull_none>,
+						<0 RK_PC0 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2c1 {
 			i2c1_xfer: i2c1-xfer {
-				rockchip,pins = <8 4 RK_FUNC_1 &pcfg_pull_none>,
-						<8 5 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <8 RK_PA4 RK_FUNC_1 &pcfg_pull_none>,
+						<8 RK_PA5 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2c2 {
 			i2c2_xfer: i2c2-xfer {
-				rockchip,pins = <6 9 RK_FUNC_1 &pcfg_pull_none>,
-						<6 10 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <6 RK_PB1 RK_FUNC_1 &pcfg_pull_none>,
+						<6 RK_PB2 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2c3 {
 			i2c3_xfer: i2c3-xfer {
-				rockchip,pins = <2 16 RK_FUNC_1 &pcfg_pull_none>,
-						<2 17 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <2 RK_PC0 RK_FUNC_1 &pcfg_pull_none>,
+						<2 RK_PC1 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2c4 {
 			i2c4_xfer: i2c4-xfer {
-				rockchip,pins = <7 17 RK_FUNC_1 &pcfg_pull_none>,
-						<7 18 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <7 RK_PC1 RK_FUNC_1 &pcfg_pull_none>,
+						<7 RK_PC2 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2c5 {
 			i2c5_xfer: i2c5-xfer {
-				rockchip,pins = <7 19 RK_FUNC_1 &pcfg_pull_none>,
-						<7 20 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <7 RK_PC3 RK_FUNC_1 &pcfg_pull_none>,
+						<7 RK_PC4 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2s0 {
 			i2s0_bus: i2s0-bus {
-				rockchip,pins = <6 0 RK_FUNC_1 &pcfg_pull_none>,
-						<6 1 RK_FUNC_1 &pcfg_pull_none>,
-						<6 2 RK_FUNC_1 &pcfg_pull_none>,
-						<6 3 RK_FUNC_1 &pcfg_pull_none>,
-						<6 4 RK_FUNC_1 &pcfg_pull_none>,
-						<6 8 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <6 RK_PA0 RK_FUNC_1 &pcfg_pull_none>,
+						<6 RK_PA1 RK_FUNC_1 &pcfg_pull_none>,
+						<6 RK_PA2 RK_FUNC_1 &pcfg_pull_none>,
+						<6 RK_PA3 RK_FUNC_1 &pcfg_pull_none>,
+						<6 RK_PA4 RK_FUNC_1 &pcfg_pull_none>,
+						<6 RK_PB0 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		sdmmc {
 			sdmmc_clk: sdmmc-clk {
-				rockchip,pins = <6 20 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <6 RK_PC4 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			sdmmc_cmd: sdmmc-cmd {
-				rockchip,pins = <6 21 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <6 RK_PC5 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			sdmmc_cd: sdmmc-cd {
-				rockchip,pins = <6 22 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <6 RK_PC6 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			sdmmc_bus1: sdmmc-bus1 {
-				rockchip,pins = <6 16 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <6 RK_PC0 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			sdmmc_bus4: sdmmc-bus4 {
-				rockchip,pins = <6 16 RK_FUNC_1 &pcfg_pull_up>,
-						<6 17 RK_FUNC_1 &pcfg_pull_up>,
-						<6 18 RK_FUNC_1 &pcfg_pull_up>,
-						<6 19 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <6 RK_PC0 RK_FUNC_1 &pcfg_pull_up>,
+						<6 RK_PC1 RK_FUNC_1 &pcfg_pull_up>,
+						<6 RK_PC2 RK_FUNC_1 &pcfg_pull_up>,
+						<6 RK_PC3 RK_FUNC_1 &pcfg_pull_up>;
 			};
 		};
 
 		sdio0 {
 			sdio0_bus1: sdio0-bus1 {
-				rockchip,pins = <4 20 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <4 RK_PC4 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			sdio0_bus4: sdio0-bus4 {
-				rockchip,pins = <4 20 RK_FUNC_1 &pcfg_pull_up>,
-						<4 21 RK_FUNC_1 &pcfg_pull_up>,
-						<4 22 RK_FUNC_1 &pcfg_pull_up>,
-						<4 23 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <4 RK_PC4 RK_FUNC_1 &pcfg_pull_up>,
+						<4 RK_PC5 RK_FUNC_1 &pcfg_pull_up>,
+						<4 RK_PC6 RK_FUNC_1 &pcfg_pull_up>,
+						<4 RK_PC7 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			sdio0_cmd: sdio0-cmd {
-				rockchip,pins = <4 24 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <4 RK_PD0 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			sdio0_clk: sdio0-clk {
-				rockchip,pins = <4 25 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <4 RK_PD1 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			sdio0_cd: sdio0-cd {
-				rockchip,pins = <4 26 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <4 RK_PD2 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			sdio0_wp: sdio0-wp {
-				rockchip,pins = <4 27 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <4 RK_PD3 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			sdio0_pwr: sdio0-pwr {
-				rockchip,pins = <4 28 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <4 RK_PD4 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			sdio0_bkpwr: sdio0-bkpwr {
-				rockchip,pins = <4 29 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <4 RK_PD5 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			sdio0_int: sdio0-int {
-				rockchip,pins = <4 30 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <4 RK_PD6 RK_FUNC_1 &pcfg_pull_up>;
 			};
 		};
 
@@ -1556,140 +1556,140 @@
 
 		emmc {
 			emmc_clk: emmc-clk {
-				rockchip,pins = <3 18 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <3 RK_PC2 RK_FUNC_2 &pcfg_pull_none>;
 			};
 
 			emmc_cmd: emmc-cmd {
-				rockchip,pins = <3 16 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <3 RK_PC0 RK_FUNC_2 &pcfg_pull_up>;
 			};
 
 			emmc_pwr: emmc-pwr {
-				rockchip,pins = <3 9 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <3 RK_PB1 RK_FUNC_2 &pcfg_pull_up>;
 			};
 
 			emmc_bus1: emmc-bus1 {
-				rockchip,pins = <3 0 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <3 RK_PA0 RK_FUNC_2 &pcfg_pull_up>;
 			};
 
 			emmc_bus4: emmc-bus4 {
-				rockchip,pins = <3 0 RK_FUNC_2 &pcfg_pull_up>,
-						<3 1 RK_FUNC_2 &pcfg_pull_up>,
-						<3 2 RK_FUNC_2 &pcfg_pull_up>,
-						<3 3 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <3 RK_PA0 RK_FUNC_2 &pcfg_pull_up>,
+						<3 RK_PA1 RK_FUNC_2 &pcfg_pull_up>,
+						<3 RK_PA2 RK_FUNC_2 &pcfg_pull_up>,
+						<3 RK_PA3 RK_FUNC_2 &pcfg_pull_up>;
 			};
 
 			emmc_bus8: emmc-bus8 {
-				rockchip,pins = <3 0 RK_FUNC_2 &pcfg_pull_up>,
-						<3 1 RK_FUNC_2 &pcfg_pull_up>,
-						<3 2 RK_FUNC_2 &pcfg_pull_up>,
-						<3 3 RK_FUNC_2 &pcfg_pull_up>,
-						<3 4 RK_FUNC_2 &pcfg_pull_up>,
-						<3 5 RK_FUNC_2 &pcfg_pull_up>,
-						<3 6 RK_FUNC_2 &pcfg_pull_up>,
-						<3 7 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <3 RK_PA0 RK_FUNC_2 &pcfg_pull_up>,
+						<3 RK_PA1 RK_FUNC_2 &pcfg_pull_up>,
+						<3 RK_PA2 RK_FUNC_2 &pcfg_pull_up>,
+						<3 RK_PA3 RK_FUNC_2 &pcfg_pull_up>,
+						<3 RK_PA4 RK_FUNC_2 &pcfg_pull_up>,
+						<3 RK_PA5 RK_FUNC_2 &pcfg_pull_up>,
+						<3 RK_PA6 RK_FUNC_2 &pcfg_pull_up>,
+						<3 RK_PA7 RK_FUNC_2 &pcfg_pull_up>;
 			};
 		};
 
 		spi0 {
 			spi0_clk: spi0-clk {
-				rockchip,pins = <5 12 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <5 RK_PB4 RK_FUNC_1 &pcfg_pull_up>;
 			};
 			spi0_cs0: spi0-cs0 {
-				rockchip,pins = <5 13 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <5 RK_PB5 RK_FUNC_1 &pcfg_pull_up>;
 			};
 			spi0_tx: spi0-tx {
-				rockchip,pins = <5 14 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <5 RK_PB6 RK_FUNC_1 &pcfg_pull_up>;
 			};
 			spi0_rx: spi0-rx {
-				rockchip,pins = <5 15 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <5 RK_PB7 RK_FUNC_1 &pcfg_pull_up>;
 			};
 			spi0_cs1: spi0-cs1 {
-				rockchip,pins = <5 16 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <5 RK_PC0 RK_FUNC_1 &pcfg_pull_up>;
 			};
 		};
 		spi1 {
 			spi1_clk: spi1-clk {
-				rockchip,pins = <7 12 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <7 RK_PB4 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi1_cs0: spi1-cs0 {
-				rockchip,pins = <7 13 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <7 RK_PB5 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi1_rx: spi1-rx {
-				rockchip,pins = <7 14 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <7 RK_PB6 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi1_tx: spi1-tx {
-				rockchip,pins = <7 15 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <7 RK_PB7 RK_FUNC_2 &pcfg_pull_up>;
 			};
 		};
 
 		spi2 {
 			spi2_cs1: spi2-cs1 {
-				rockchip,pins = <8 3 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <8 RK_PA3 RK_FUNC_1 &pcfg_pull_up>;
 			};
 			spi2_clk: spi2-clk {
-				rockchip,pins = <8 6 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <8 RK_PA6 RK_FUNC_1 &pcfg_pull_up>;
 			};
 			spi2_cs0: spi2-cs0 {
-				rockchip,pins = <8 7 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <8 RK_PA7 RK_FUNC_1 &pcfg_pull_up>;
 			};
 			spi2_rx: spi2-rx {
-				rockchip,pins = <8 8 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <8 RK_PB0 RK_FUNC_1 &pcfg_pull_up>;
 			};
 			spi2_tx: spi2-tx {
-				rockchip,pins = <8 9 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <8 RK_PB1 RK_FUNC_1 &pcfg_pull_up>;
 			};
 		};
 
 		uart0 {
 			uart0_xfer: uart0-xfer {
-				rockchip,pins = <4 16 RK_FUNC_1 &pcfg_pull_up>,
-						<4 17 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <4 RK_PC0 RK_FUNC_1 &pcfg_pull_up>,
+						<4 RK_PC1 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			uart0_cts: uart0-cts {
-				rockchip,pins = <4 18 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <4 RK_PC2 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			uart0_rts: uart0-rts {
-				rockchip,pins = <4 19 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <4 RK_PC3 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		uart1 {
 			uart1_xfer: uart1-xfer {
-				rockchip,pins = <5 8 RK_FUNC_1 &pcfg_pull_up>,
-						<5 9 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <5 RK_PB0 RK_FUNC_1 &pcfg_pull_up>,
+						<5 RK_PB1 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			uart1_cts: uart1-cts {
-				rockchip,pins = <5 10 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <5 RK_PB2 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			uart1_rts: uart1-rts {
-				rockchip,pins = <5 11 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <5 RK_PB3 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		uart2 {
 			uart2_xfer: uart2-xfer {
-				rockchip,pins = <7 22 RK_FUNC_1 &pcfg_pull_up>,
-						<7 23 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <7 RK_PC6 RK_FUNC_1 &pcfg_pull_up>,
+						<7 RK_PC7 RK_FUNC_1 &pcfg_pull_none>;
 			};
 			/* no rts / cts for uart2 */
 		};
 
 		uart3 {
 			uart3_xfer: uart3-xfer {
-				rockchip,pins = <7 7 RK_FUNC_1 &pcfg_pull_up>,
-						<7 8 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <7 RK_PA7 RK_FUNC_1 &pcfg_pull_up>,
+						<7 RK_PB0 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			uart3_cts: uart3-cts {
-				rockchip,pins = <7 9 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <7 RK_PB1 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			uart3_rts: uart3-rts {
-				rockchip,pins = <7 10 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <7 RK_PB2 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
@@ -1710,23 +1710,23 @@
 
 		tsadc {
 			otp_gpio: otp-gpio {
-				rockchip,pins = <0 10 RK_FUNC_GPIO &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
 			};
 
 			otp_out: otp-out {
-				rockchip,pins = <0 10 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PB2 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		pwm0 {
 			pwm0_pin: pwm0-pin {
-				rockchip,pins = <7 0 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <7 RK_PA0 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		pwm1 {
 			pwm1_pin: pwm1-pin {
-				rockchip,pins = <7 1 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <7 RK_PA1 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
@@ -1777,7 +1777,7 @@
 
 		spdif {
 			spdif_tx: spdif-tx {
-				rockchip,pins = <RK_GPIO6 11 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <RK_GPIO6 RK_PB3 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi b/arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi
index 4772917..678fbbf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi
@@ -193,60 +193,60 @@
 
 	backlight {
 		bl_en: bl-en {
-			rockchip,pins = <0 20 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	emmc {
 		emmc_bus8: emmc-bus8 {
-			rockchip,pins = <1 18 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
-					<1 19 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
-					<1 20 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
-					<1 21 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
-					<1 22 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
-					<1 23 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
-					<1 24 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
-					<1 25 RK_FUNC_2 &pcfg_pull_up_drv_8ma>;
+			rockchip,pins = <1 RK_PC2 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+					<1 RK_PC3 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+					<1 RK_PC4 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+					<1 RK_PC5 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+					<1 RK_PC6 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+					<1 RK_PC7 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+					<1 RK_PD0 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+					<1 RK_PD1 RK_FUNC_2 &pcfg_pull_up_drv_8ma>;
 		};
 
 		emmc-clk {
-			rockchip,pins = <2 4 RK_FUNC_2 &pcfg_pull_none_drv_8ma>;
+			rockchip,pins = <2 RK_PA4 RK_FUNC_2 &pcfg_pull_none_drv_8ma>;
 		};
 
 		emmc-cmd {
-			rockchip,pins = <1 26 RK_FUNC_2 &pcfg_pull_up_drv_8ma>;
+			rockchip,pins = <1 RK_PD2 RK_FUNC_2 &pcfg_pull_up_drv_8ma>;
 		};
 
 		emmc_reset: emmc-reset {
-			rockchip,pins = <2 3 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <2 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	keys {
 		pwr_key: pwr-key {
-			rockchip,pins = <0 2 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	pmic {
 		pmic_int: pmic-int {
-			rockchip,pins = <0 1 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PA1 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	sdio {
 		wifi_reg_on: wifi-reg-on {
-			rockchip,pins = <3 4 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <3 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
 		bt_rst: bt-rst {
-			rockchip,pins = <3 5 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <3 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	usb {
 		host_vbus_drv: host-vbus-drv {
-			rockchip,pins = <0 4 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
index e631d42..7205909 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
@@ -272,23 +272,23 @@
 &pinctrl {
 	ir {
 		ir_int: ir-int {
-			rockchip,pins = <3 30 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <3 RK_PD6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	keys {
 		pwr_key: pwr-key {
-			rockchip,pins = <0 2 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	pmic {
 		pmic_sleep: pmic-sleep {
-			rockchip,pins = <0 0 RK_FUNC_2 &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PA0 RK_FUNC_2 &pcfg_pull_none>;
 		};
 
 		pmic_int: pmic-int {
-			rockchip,pins = <0 5 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts b/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts
index fac116a..f0d4015 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dts
@@ -265,73 +265,73 @@
 
 	emmc {
 		emmc_bus8: emmc-bus8 {
-			rockchip,pins = <1 18 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
-					<1 19 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
-					<1 20 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
-					<1 21 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
-					<1 22 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
-					<1 23 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
-					<1 24 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
-					<1 25 RK_FUNC_2 &pcfg_pull_up_drv_8ma>;
+			rockchip,pins = <1 RK_PC2 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+					<1 RK_PC3 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+					<1 RK_PC4 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+					<1 RK_PC5 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+					<1 RK_PC6 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+					<1 RK_PC7 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+					<1 RK_PD0 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+					<1 RK_PD1 RK_FUNC_2 &pcfg_pull_up_drv_8ma>;
 		};
 
 		emmc-clk {
-			rockchip,pins = <2 4 RK_FUNC_2 &pcfg_pull_none_drv_8ma>;
+			rockchip,pins = <2 RK_PA4 RK_FUNC_2 &pcfg_pull_none_drv_8ma>;
 		};
 
 		emmc-cmd {
-			rockchip,pins = <1 26 RK_FUNC_2 &pcfg_pull_up_drv_8ma>;
+			rockchip,pins = <1 RK_PD2 RK_FUNC_2 &pcfg_pull_up_drv_8ma>;
 		};
 
 		emmc_reset: emmc-reset {
-			rockchip,pins = <2 3 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <2 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	keys {
 		pwr_key: pwr-key {
-			rockchip,pins = <0 5 RK_FUNC_GPIO &pcfg_pull_down>;
+			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 	};
 
 	leds {
 		stby_pwren: stby-pwren {
-			rockchip,pins = <0 12 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
 		led_ctl: led-ctl {
-			rockchip,pins = <3 29 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <3 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	sdmmc {
 		sdmmc_clk: sdmmc-clk {
-			rockchip,pins = <2 9 RK_FUNC_1 &pcfg_pull_none_drv_8ma>;
+			rockchip,pins = <2 RK_PB1 RK_FUNC_1 &pcfg_pull_none_drv_8ma>;
 		};
 
 		sdmmc_cmd: sdmmc-cmd {
-			rockchip,pins = <2 10 RK_FUNC_1 &pcfg_pull_up_drv_8ma>;
+			rockchip,pins = <2 RK_PB2 RK_FUNC_1 &pcfg_pull_up_drv_8ma>;
 		};
 
 		sdmmc_cd: sdmmc-cd {
-			rockchip,pins = <2 11 RK_FUNC_1 &pcfg_pull_up_drv_8ma>;
+			rockchip,pins = <2 RK_PB3 RK_FUNC_1 &pcfg_pull_up_drv_8ma>;
 		};
 
 		sdmmc_bus1: sdmmc-bus1 {
-			rockchip,pins = <2 5 RK_FUNC_1 &pcfg_pull_up_drv_8ma>;
+			rockchip,pins = <2 RK_PA5 RK_FUNC_1 &pcfg_pull_up_drv_8ma>;
 		};
 
 		sdmmc_bus4: sdmmc-bus4 {
-			rockchip,pins = <2 5 RK_FUNC_1 &pcfg_pull_up_drv_8ma>,
-					<2 6 RK_FUNC_1 &pcfg_pull_up_drv_8ma>,
-					<2 7 RK_FUNC_1 &pcfg_pull_up_drv_8ma>,
-					<2 8 RK_FUNC_1 &pcfg_pull_up_drv_8ma>;
+			rockchip,pins = <2 RK_PA5 RK_FUNC_1 &pcfg_pull_up_drv_8ma>,
+					<2 RK_PA6 RK_FUNC_1 &pcfg_pull_up_drv_8ma>,
+					<2 RK_PA7 RK_FUNC_1 &pcfg_pull_up_drv_8ma>,
+					<2 RK_PB0 RK_FUNC_1 &pcfg_pull_up_drv_8ma>;
 		};
 	};
 
 	usb {
 		host_vbus_drv: host-vbus-drv {
-			rockchip,pins = <0 4 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dts b/arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dts
index 8cdb3bf..f7c6520 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dts
@@ -258,17 +258,17 @@
 &pinctrl {
 	keys {
 		pwr_key: pwr-key {
-			rockchip,pins = <0 2 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	pmic {
 		pmic_sleep: pmic-sleep {
-			rockchip,pins = <0 0 RK_FUNC_2 &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PA0 RK_FUNC_2 &pcfg_pull_none>;
 		};
 
 		pmic_int: pmic-int {
-			rockchip,pins = <0 5 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3368-r88.dts b/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
index 7134181..e724177 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
@@ -275,64 +275,64 @@
 
 	emmc {
 		emmc_bus8: emmc-bus8 {
-			rockchip,pins = <1 18 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
-					<1 19 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
-					<1 20 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
-					<1 21 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
-					<1 22 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
-					<1 23 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
-					<1 24 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
-					<1 25 RK_FUNC_2 &pcfg_pull_up_drv_8ma>;
+			rockchip,pins = <1 RK_PC2 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+					<1 RK_PC3 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+					<1 RK_PC4 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+					<1 RK_PC5 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+					<1 RK_PC6 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+					<1 RK_PC7 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+					<1 RK_PD0 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+					<1 RK_PD1 RK_FUNC_2 &pcfg_pull_up_drv_8ma>;
 		};
 
 		emmc-clk {
-			rockchip,pins = <2 4 RK_FUNC_2 &pcfg_pull_none_drv_8ma>;
+			rockchip,pins = <2 RK_PA4 RK_FUNC_2 &pcfg_pull_none_drv_8ma>;
 		};
 
 		emmc-cmd {
-			rockchip,pins = <1 26 RK_FUNC_2 &pcfg_pull_up_drv_8ma>;
+			rockchip,pins = <1 RK_PD2 RK_FUNC_2 &pcfg_pull_up_drv_8ma>;
 		};
 
 		emmc_reset: emmc-reset {
-			rockchip,pins = <2 3 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <2 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	ir {
 		ir_int: ir-int {
-			rockchip,pins = <3 30 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <3 RK_PD6 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	keys {
 		pwr_key: pwr-key {
-			rockchip,pins = <0 2 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	leds {
 		stby_pwren: stby-pwren {
-			rockchip,pins = <0 12 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
 		led_ctl: led-ctl {
-			rockchip,pins = <3 29 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <3 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	sdio {
 		wifi_reg_on: wifi-reg-on {
-			rockchip,pins = <3 4 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <3 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
 		bt_rst: bt-rst {
-			rockchip,pins = <3 5 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <3 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	usb {
 		host_vbus_drv: host-vbus-drv {
-			rockchip,pins = <0 4 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 6d5dc05..eb9101c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -817,339 +817,339 @@
 
 		emmc {
 			emmc_clk: emmc-clk {
-				rockchip,pins = <2 4 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <2 RK_PA4 RK_FUNC_2 &pcfg_pull_none>;
 			};
 
 			emmc_cmd: emmc-cmd {
-				rockchip,pins = <1 26 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <1 RK_PD2 RK_FUNC_2 &pcfg_pull_up>;
 			};
 
 			emmc_pwr: emmc-pwr {
-				rockchip,pins = <1 27 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <1 RK_PD3 RK_FUNC_2 &pcfg_pull_up>;
 			};
 
 			emmc_bus1: emmc-bus1 {
-				rockchip,pins = <1 18 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <1 RK_PC2 RK_FUNC_2 &pcfg_pull_up>;
 			};
 
 			emmc_bus4: emmc-bus4 {
-				rockchip,pins = <1 18 RK_FUNC_2 &pcfg_pull_up>,
-						<1 19 RK_FUNC_2 &pcfg_pull_up>,
-						<1 20 RK_FUNC_2 &pcfg_pull_up>,
-						<1 21 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <1 RK_PC2 RK_FUNC_2 &pcfg_pull_up>,
+						<1 RK_PC3 RK_FUNC_2 &pcfg_pull_up>,
+						<1 RK_PC4 RK_FUNC_2 &pcfg_pull_up>,
+						<1 RK_PC5 RK_FUNC_2 &pcfg_pull_up>;
 			};
 
 			emmc_bus8: emmc-bus8 {
-				rockchip,pins = <1 18 RK_FUNC_2 &pcfg_pull_up>,
-						<1 19 RK_FUNC_2 &pcfg_pull_up>,
-						<1 20 RK_FUNC_2 &pcfg_pull_up>,
-						<1 21 RK_FUNC_2 &pcfg_pull_up>,
-						<1 22 RK_FUNC_2 &pcfg_pull_up>,
-						<1 23 RK_FUNC_2 &pcfg_pull_up>,
-						<1 24 RK_FUNC_2 &pcfg_pull_up>,
-						<1 25 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <1 RK_PC2 RK_FUNC_2 &pcfg_pull_up>,
+						<1 RK_PC3 RK_FUNC_2 &pcfg_pull_up>,
+						<1 RK_PC4 RK_FUNC_2 &pcfg_pull_up>,
+						<1 RK_PC5 RK_FUNC_2 &pcfg_pull_up>,
+						<1 RK_PC6 RK_FUNC_2 &pcfg_pull_up>,
+						<1 RK_PC7 RK_FUNC_2 &pcfg_pull_up>,
+						<1 RK_PD0 RK_FUNC_2 &pcfg_pull_up>,
+						<1 RK_PD1 RK_FUNC_2 &pcfg_pull_up>;
 			};
 		};
 
 		gmac {
 			rgmii_pins: rgmii-pins {
-				rockchip,pins =	<3 22 RK_FUNC_1 &pcfg_pull_none>,
-						<3 24 RK_FUNC_1 &pcfg_pull_none>,
-						<3 19 RK_FUNC_1 &pcfg_pull_none>,
-						<3 8 RK_FUNC_1 &pcfg_pull_none_12ma>,
-						<3 9 RK_FUNC_1 &pcfg_pull_none_12ma>,
-						<3 10 RK_FUNC_1 &pcfg_pull_none_12ma>,
-						<3 14 RK_FUNC_1 &pcfg_pull_none_12ma>,
-						<3 28 RK_FUNC_1 &pcfg_pull_none_12ma>,
-						<3 13 RK_FUNC_1 &pcfg_pull_none_12ma>,
-						<3 15 RK_FUNC_1 &pcfg_pull_none>,
-						<3 16 RK_FUNC_1 &pcfg_pull_none>,
-						<3 17 RK_FUNC_1 &pcfg_pull_none>,
-						<3 18 RK_FUNC_1 &pcfg_pull_none>,
-						<3 25 RK_FUNC_1 &pcfg_pull_none>,
-						<3 20 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins =	<3 RK_PC6 RK_FUNC_1 &pcfg_pull_none>,
+						<3 RK_PD0 RK_FUNC_1 &pcfg_pull_none>,
+						<3 RK_PC3 RK_FUNC_1 &pcfg_pull_none>,
+						<3 RK_PB0 RK_FUNC_1 &pcfg_pull_none_12ma>,
+						<3 RK_PB1 RK_FUNC_1 &pcfg_pull_none_12ma>,
+						<3 RK_PB2 RK_FUNC_1 &pcfg_pull_none_12ma>,
+						<3 RK_PB6 RK_FUNC_1 &pcfg_pull_none_12ma>,
+						<3 RK_PD4 RK_FUNC_1 &pcfg_pull_none_12ma>,
+						<3 RK_PB5 RK_FUNC_1 &pcfg_pull_none_12ma>,
+						<3 RK_PB7 RK_FUNC_1 &pcfg_pull_none>,
+						<3 RK_PC0 RK_FUNC_1 &pcfg_pull_none>,
+						<3 RK_PC1 RK_FUNC_1 &pcfg_pull_none>,
+						<3 RK_PC2 RK_FUNC_1 &pcfg_pull_none>,
+						<3 RK_PD1 RK_FUNC_1 &pcfg_pull_none>,
+						<3 RK_PC4 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			rmii_pins: rmii-pins {
-				rockchip,pins =	<3 22 RK_FUNC_1 &pcfg_pull_none>,
-						<3 24 RK_FUNC_1 &pcfg_pull_none>,
-						<3 19 RK_FUNC_1 &pcfg_pull_none>,
-						<3 8 RK_FUNC_1 &pcfg_pull_none_12ma>,
-						<3 9 RK_FUNC_1 &pcfg_pull_none_12ma>,
-						<3 13 RK_FUNC_1 &pcfg_pull_none_12ma>,
-						<3 15 RK_FUNC_1 &pcfg_pull_none>,
-						<3 16 RK_FUNC_1 &pcfg_pull_none>,
-						<3 20 RK_FUNC_1 &pcfg_pull_none>,
-						<3 21 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins =	<3 RK_PC6 RK_FUNC_1 &pcfg_pull_none>,
+						<3 RK_PD0 RK_FUNC_1 &pcfg_pull_none>,
+						<3 RK_PC3 RK_FUNC_1 &pcfg_pull_none>,
+						<3 RK_PB0 RK_FUNC_1 &pcfg_pull_none_12ma>,
+						<3 RK_PB1 RK_FUNC_1 &pcfg_pull_none_12ma>,
+						<3 RK_PB5 RK_FUNC_1 &pcfg_pull_none_12ma>,
+						<3 RK_PB7 RK_FUNC_1 &pcfg_pull_none>,
+						<3 RK_PC0 RK_FUNC_1 &pcfg_pull_none>,
+						<3 RK_PC4 RK_FUNC_1 &pcfg_pull_none>,
+						<3 RK_PC5 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2c0 {
 			i2c0_xfer: i2c0-xfer {
-				rockchip,pins = <0 6 RK_FUNC_1 &pcfg_pull_none>,
-						<0 7 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PA6 RK_FUNC_1 &pcfg_pull_none>,
+						<0 RK_PA7 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2c1 {
 			i2c1_xfer: i2c1-xfer {
-				rockchip,pins = <2 21 RK_FUNC_1 &pcfg_pull_none>,
-						<2 22 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <2 RK_PC5 RK_FUNC_1 &pcfg_pull_none>,
+						<2 RK_PC6 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2c2 {
 			i2c2_xfer: i2c2-xfer {
-				rockchip,pins = <0 9 RK_FUNC_2 &pcfg_pull_none>,
-						<3 31 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PB1 RK_FUNC_2 &pcfg_pull_none>,
+						<3 RK_PD7 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		i2c3 {
 			i2c3_xfer: i2c3-xfer {
-				rockchip,pins = <1 16 RK_FUNC_1 &pcfg_pull_none>,
-						<1 17 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <1 RK_PC0 RK_FUNC_1 &pcfg_pull_none>,
+						<1 RK_PC1 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2c4 {
 			i2c4_xfer: i2c4-xfer {
-				rockchip,pins = <3 24 RK_FUNC_2 &pcfg_pull_none>,
-						<3 25 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <3 RK_PD0 RK_FUNC_2 &pcfg_pull_none>,
+						<3 RK_PD1 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		i2c5 {
 			i2c5_xfer: i2c5-xfer {
-				rockchip,pins = <3 26 RK_FUNC_2 &pcfg_pull_none>,
-						<3 27 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <3 RK_PD2 RK_FUNC_2 &pcfg_pull_none>,
+						<3 RK_PD3 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		i2s {
 			i2s_8ch_bus: i2s-8ch-bus {
-				rockchip,pins = <2 12 RK_FUNC_1 &pcfg_pull_none>,
-						<2 13 RK_FUNC_1 &pcfg_pull_none>,
-						<2 14 RK_FUNC_1 &pcfg_pull_none>,
-						<2 15 RK_FUNC_1 &pcfg_pull_none>,
-						<2 16 RK_FUNC_1 &pcfg_pull_none>,
-						<2 17 RK_FUNC_1 &pcfg_pull_none>,
-						<2 18 RK_FUNC_1 &pcfg_pull_none>,
-						<2 19 RK_FUNC_1 &pcfg_pull_none>,
-						<2 20 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <2 RK_PB4 RK_FUNC_1 &pcfg_pull_none>,
+						<2 RK_PB5 RK_FUNC_1 &pcfg_pull_none>,
+						<2 RK_PB6 RK_FUNC_1 &pcfg_pull_none>,
+						<2 RK_PB7 RK_FUNC_1 &pcfg_pull_none>,
+						<2 RK_PC0 RK_FUNC_1 &pcfg_pull_none>,
+						<2 RK_PC1 RK_FUNC_1 &pcfg_pull_none>,
+						<2 RK_PC2 RK_FUNC_1 &pcfg_pull_none>,
+						<2 RK_PC3 RK_FUNC_1 &pcfg_pull_none>,
+						<2 RK_PC4 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		pwm0 {
 			pwm0_pin: pwm0-pin {
-				rockchip,pins = <3 8 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <3 RK_PB0 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		pwm1 {
 			pwm1_pin: pwm1-pin {
-				rockchip,pins = <0 8 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PB0 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		pwm3 {
 			pwm3_pin: pwm3-pin {
-				rockchip,pins = <3 29 RK_FUNC_3 &pcfg_pull_none>;
+				rockchip,pins = <3 RK_PD5 RK_FUNC_3 &pcfg_pull_none>;
 			};
 		};
 
 		sdio0 {
 			sdio0_bus1: sdio0-bus1 {
-				rockchip,pins = <2 28 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <2 RK_PD4 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			sdio0_bus4: sdio0-bus4 {
-				rockchip,pins = <2 28 RK_FUNC_1 &pcfg_pull_up>,
-						<2 29 RK_FUNC_1 &pcfg_pull_up>,
-						<2 30 RK_FUNC_1 &pcfg_pull_up>,
-						<2 31 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <2 RK_PD4 RK_FUNC_1 &pcfg_pull_up>,
+						<2 RK_PD5 RK_FUNC_1 &pcfg_pull_up>,
+						<2 RK_PD6 RK_FUNC_1 &pcfg_pull_up>,
+						<2 RK_PD7 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			sdio0_cmd: sdio0-cmd {
-				rockchip,pins = <3 0 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <3 RK_PA0 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			sdio0_clk: sdio0-clk {
-				rockchip,pins = <3 1 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <3 RK_PA1 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			sdio0_cd: sdio0-cd {
-				rockchip,pins = <3 2 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <3 RK_PA2 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			sdio0_wp: sdio0-wp {
-				rockchip,pins = <3 3 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <3 RK_PA3 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			sdio0_pwr: sdio0-pwr {
-				rockchip,pins = <3 4 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <3 RK_PA4 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			sdio0_bkpwr: sdio0-bkpwr {
-				rockchip,pins = <3 5 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <3 RK_PA5 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			sdio0_int: sdio0-int {
-				rockchip,pins = <3 6 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <3 RK_PA6 RK_FUNC_1 &pcfg_pull_up>;
 			};
 		};
 
 		sdmmc {
 			sdmmc_clk: sdmmc-clk {
-				rockchip,pins = <2 9 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <2 RK_PB1 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			sdmmc_cmd: sdmmc-cmd {
-				rockchip,pins = <2 10 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <2 RK_PB2 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			sdmmc_cd: sdmmc-cd {
-				rockchip,pins = <2 11 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <2 RK_PB3 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			sdmmc_bus1: sdmmc-bus1 {
-				rockchip,pins = <2 5 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <2 RK_PA5 RK_FUNC_1 &pcfg_pull_up>;
 			};
 
 			sdmmc_bus4: sdmmc-bus4 {
-				rockchip,pins = <2 5 RK_FUNC_1 &pcfg_pull_up>,
-						<2 6 RK_FUNC_1 &pcfg_pull_up>,
-						<2 7 RK_FUNC_1 &pcfg_pull_up>,
-						<2 8 RK_FUNC_1 &pcfg_pull_up>;
+				rockchip,pins = <2 RK_PA5 RK_FUNC_1 &pcfg_pull_up>,
+						<2 RK_PA6 RK_FUNC_1 &pcfg_pull_up>,
+						<2 RK_PA7 RK_FUNC_1 &pcfg_pull_up>,
+						<2 RK_PB0 RK_FUNC_1 &pcfg_pull_up>;
 			};
 		};
 
 		spi0 {
 			spi0_clk: spi0-clk {
-				rockchip,pins = <1 29 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <1 RK_PD5 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi0_cs0: spi0-cs0 {
-				rockchip,pins = <1 24 RK_FUNC_3 &pcfg_pull_up>;
+				rockchip,pins = <1 RK_PD0 RK_FUNC_3 &pcfg_pull_up>;
 			};
 			spi0_cs1: spi0-cs1 {
-				rockchip,pins = <1 25 RK_FUNC_3 &pcfg_pull_up>;
+				rockchip,pins = <1 RK_PD1 RK_FUNC_3 &pcfg_pull_up>;
 			};
 			spi0_tx: spi0-tx {
-				rockchip,pins = <1 23 RK_FUNC_3 &pcfg_pull_up>;
+				rockchip,pins = <1 RK_PC7 RK_FUNC_3 &pcfg_pull_up>;
 			};
 			spi0_rx: spi0-rx {
-				rockchip,pins = <1 22 RK_FUNC_3 &pcfg_pull_up>;
+				rockchip,pins = <1 RK_PC6 RK_FUNC_3 &pcfg_pull_up>;
 			};
 		};
 
 		spi1 {
 			spi1_clk: spi1-clk {
-				rockchip,pins = <1 14 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <1 RK_PB6 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi1_cs0: spi1-cs0 {
-				rockchip,pins = <1 15 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <1 RK_PB7 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi1_cs1: spi1-cs1 {
-				rockchip,pins = <3 28 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <3 RK_PD4 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi1_rx: spi1-rx {
-				rockchip,pins = <1 16 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <1 RK_PC0 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi1_tx: spi1-tx {
-				rockchip,pins = <1 17 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <1 RK_PC1 RK_FUNC_2 &pcfg_pull_up>;
 			};
 		};
 
 		spi2 {
 			spi2_clk: spi2-clk {
-				rockchip,pins = <0 12 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <0 RK_PB4 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi2_cs0: spi2-cs0 {
-				rockchip,pins = <0 13 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <0 RK_PB5 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi2_rx: spi2-rx {
-				rockchip,pins = <0 10 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <0 RK_PB2 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi2_tx: spi2-tx {
-				rockchip,pins = <0 11 RK_FUNC_2 &pcfg_pull_up>;
+				rockchip,pins = <0 RK_PB3 RK_FUNC_2 &pcfg_pull_up>;
 			};
 		};
 
 		tsadc {
 			otp_gpio: otp-gpio {
-				rockchip,pins = <0 3 RK_FUNC_GPIO &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
 			};
 
 			otp_out: otp-out {
-				rockchip,pins = <0 3 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PA3 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		uart0 {
 			uart0_xfer: uart0-xfer {
-				rockchip,pins = <2 24 RK_FUNC_1 &pcfg_pull_up>,
-						<2 25 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <2 RK_PD0 RK_FUNC_1 &pcfg_pull_up>,
+						<2 RK_PD1 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			uart0_cts: uart0-cts {
-				rockchip,pins = <2 26 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <2 RK_PD2 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			uart0_rts: uart0-rts {
-				rockchip,pins = <2 27 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <2 RK_PD3 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		uart1 {
 			uart1_xfer: uart1-xfer {
-				rockchip,pins = <0 20 RK_FUNC_3 &pcfg_pull_up>,
-						<0 21 RK_FUNC_3 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PC4 RK_FUNC_3 &pcfg_pull_up>,
+						<0 RK_PC5 RK_FUNC_3 &pcfg_pull_none>;
 			};
 
 			uart1_cts: uart1-cts {
-				rockchip,pins = <0 22 RK_FUNC_3 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PC6 RK_FUNC_3 &pcfg_pull_none>;
 			};
 
 			uart1_rts: uart1-rts {
-				rockchip,pins = <0 23 RK_FUNC_3 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PC7 RK_FUNC_3 &pcfg_pull_none>;
 			};
 		};
 
 		uart2 {
 			uart2_xfer: uart2-xfer {
-				rockchip,pins = <2 6 RK_FUNC_2 &pcfg_pull_up>,
-						<2 5 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <2 RK_PA6 RK_FUNC_2 &pcfg_pull_up>,
+						<2 RK_PA5 RK_FUNC_2 &pcfg_pull_none>;
 			};
 			/* no rts / cts for uart2 */
 		};
 
 		uart3 {
 			uart3_xfer: uart3-xfer {
-				rockchip,pins = <3 29 RK_FUNC_2 &pcfg_pull_up>,
-						<3 30 RK_FUNC_3 &pcfg_pull_none>;
+				rockchip,pins = <3 RK_PD5 RK_FUNC_2 &pcfg_pull_up>,
+						<3 RK_PD6 RK_FUNC_3 &pcfg_pull_none>;
 			};
 
 			uart3_cts: uart3-cts {
-				rockchip,pins = <3 16 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <3 RK_PC0 RK_FUNC_2 &pcfg_pull_none>;
 			};
 
 			uart3_rts: uart3-rts {
-				rockchip,pins = <3 17 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <3 RK_PC1 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		uart4 {
 			uart4_xfer: uart4-xfer {
-				rockchip,pins = <0 27 RK_FUNC_3 &pcfg_pull_up>,
-						<0 26 RK_FUNC_3 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PD3 RK_FUNC_3 &pcfg_pull_up>,
+						<0 RK_PD2 RK_FUNC_3 &pcfg_pull_none>;
 			};
 
 			uart4_cts: uart4-cts {
-				rockchip,pins = <0 24 RK_FUNC_3 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PD0 RK_FUNC_3 &pcfg_pull_none>;
 			};
 
 			uart4_rts: uart4-rts {
-				rockchip,pins = <0 25 RK_FUNC_3 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PD1 RK_FUNC_3 &pcfg_pull_none>;
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-evb.dts b/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
index 42033bc..d95d3bf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
@@ -245,19 +245,19 @@
 	pmic {
 		pmic_int_l: pmic-int-l {
 			rockchip,pins =
-				<1 21 RK_FUNC_GPIO &pcfg_pull_up>;
+				<1 RK_PC5 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 
 		pmic_dvs2: pmic-dvs2 {
 			rockchip,pins =
-				<1 18 RK_FUNC_GPIO &pcfg_pull_down>;
+				<1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 	};
 
 	usb2 {
 		vcc5v0_host_en: vcc5v0-host-en {
 			rockchip,pins =
-				<4 25 RK_FUNC_GPIO &pcfg_pull_none>;
+				<4 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
index 658bb9d..8279801 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
@@ -277,30 +277,30 @@ ap_i2c_dig: &i2c2 {
 	digitizer {
 		/* Has external pullup */
 		cpu1_dig_irq_l: cpu1-dig-irq-l {
-			rockchip,pins = <2 4 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <2 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
 		/* Has external pullup */
 		cpu1_dig_pdct_l: cpu1-dig-pdct-l {
-			rockchip,pins = <2 5 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <2 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	discrete-regulators {
 		cpu3_pen_pwr_en: cpu3-pen-pwr-en {
-			rockchip,pins = <4 30 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <4 RK_PD6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	pen {
 		cpu1_pen_eject: cpu1-pen-eject {
-			rockchip,pins = <0 13 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PB5 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	wifi {
 		wlan_host_wake_l: wlan-host-wake-l {
-			rockchip,pins = <0 8 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
index 0d960b7..35af9d0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
@@ -919,54 +919,54 @@ ap_i2c_audio: &i2c8 {
 
 	backlight-enable {
 		bl_en: bl-en {
-			rockchip,pins = <1 17 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <1 RK_PC1 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	cros-ec {
 		ec_ap_int_l: ec-ap-int-l {
-			rockchip,pins = <RK_GPIO0 1 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <RK_GPIO0 RK_PA1 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	discrete-regulators {
 		pp1500_en: pp1500-en {
-			rockchip,pins = <RK_GPIO0 10 RK_FUNC_GPIO
+			rockchip,pins = <RK_GPIO0 RK_PB2 RK_FUNC_GPIO
 					 &pcfg_pull_none>;
 		};
 
 		pp1800_audio_en: pp1800-audio-en {
-			rockchip,pins = <RK_GPIO0 2 RK_FUNC_GPIO
+			rockchip,pins = <RK_GPIO0 RK_PA2 RK_FUNC_GPIO
 					 &pcfg_pull_down>;
 		};
 
 		pp3300_disp_en: pp3300-disp-en {
-			rockchip,pins = <RK_GPIO4 27 RK_FUNC_GPIO
+			rockchip,pins = <RK_GPIO4 RK_PD3 RK_FUNC_GPIO
 					 &pcfg_pull_none>;
 		};
 
 		pp3000_en: pp3000-en {
-			rockchip,pins = <RK_GPIO0 12 RK_FUNC_GPIO
+			rockchip,pins = <RK_GPIO0 RK_PB4 RK_FUNC_GPIO
 					 &pcfg_pull_none>;
 		};
 
 		sd_io_pwr_en: sd-io-pwr-en {
-			rockchip,pins = <RK_GPIO2 2 RK_FUNC_GPIO
+			rockchip,pins = <RK_GPIO2 RK_PA2 RK_FUNC_GPIO
 					 &pcfg_pull_none>;
 		};
 
 		sd_pwr_1800_sel: sd-pwr-1800-sel {
-			rockchip,pins = <RK_GPIO2 28 RK_FUNC_GPIO
+			rockchip,pins = <RK_GPIO2 RK_PD4 RK_FUNC_GPIO
 					 &pcfg_pull_none>;
 		};
 
 		sd_slot_pwr_en: sd-slot-pwr-en {
-			rockchip,pins = <RK_GPIO4 29 RK_FUNC_GPIO
+			rockchip,pins = <RK_GPIO4 RK_PD5 RK_FUNC_GPIO
 					 &pcfg_pull_none>;
 		};
 
 		wlan_module_pd_l: wlan-module-pd-l {
-			rockchip,pins = <RK_GPIO0 4 RK_FUNC_GPIO
+			rockchip,pins = <RK_GPIO0 RK_PA4 RK_FUNC_GPIO
 					 &pcfg_pull_down>;
 		};
 	};
@@ -974,17 +974,17 @@ ap_i2c_audio: &i2c8 {
 	codec {
 		/* Has external pullup */
 		headset_int_l: headset-int-l {
-			rockchip,pins = <1 23 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <1 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
 		mic_int: mic-int {
-			rockchip,pins = <1 13 RK_FUNC_GPIO &pcfg_pull_down>;
+			rockchip,pins = <1 RK_PB5 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 	};
 
 	max98357a {
 		sdmode_en: sdmode-en {
-			rockchip,pins = <1 2 RK_FUNC_GPIO &pcfg_pull_down>;
+			rockchip,pins = <1 RK_PA2 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 	};
 
@@ -995,7 +995,7 @@ ap_i2c_audio: &i2c8 {
 			 * to hack this as gpio, so the EP could be able to
 			 * de-assert it along and make ClockPM(CPM) work.
 			 */
-			rockchip,pins = <2 26 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <2 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
@@ -1006,20 +1006,20 @@ ap_i2c_audio: &i2c8 {
 		 */
 		sdmmc_bus4: sdmmc-bus4 {
 			rockchip,pins =
-				<4 8 RK_FUNC_1 &pcfg_pull_none_8ma>,
-				<4 9 RK_FUNC_1 &pcfg_pull_none_8ma>,
-				<4 10 RK_FUNC_1 &pcfg_pull_none_8ma>,
-				<4 11 RK_FUNC_1 &pcfg_pull_none_8ma>;
+				<4 RK_PB0 RK_FUNC_1 &pcfg_pull_none_8ma>,
+				<4 RK_PB1 RK_FUNC_1 &pcfg_pull_none_8ma>,
+				<4 RK_PB2 RK_FUNC_1 &pcfg_pull_none_8ma>,
+				<4 RK_PB3 RK_FUNC_1 &pcfg_pull_none_8ma>;
 		};
 
 		sdmmc_clk: sdmmc-clk {
 			rockchip,pins =
-				<4 12 RK_FUNC_1 &pcfg_pull_none_8ma>;
+				<4 RK_PB4 RK_FUNC_1 &pcfg_pull_none_8ma>;
 		};
 
 		sdmmc_cmd: sdmmc-cmd {
 			rockchip,pins =
-				<4 13 RK_FUNC_1 &pcfg_pull_none_8ma>;
+				<4 RK_PB5 RK_FUNC_1 &pcfg_pull_none_8ma>;
 		};
 
 		/*
@@ -1033,12 +1033,12 @@ ap_i2c_audio: &i2c8 {
 		 */
 		sdmmc_cd: sdmcc-cd {
 			rockchip,pins =
-				<0 7 RK_FUNC_1 &pcfg_pull_none>;
+				<0 RK_PA7 RK_FUNC_1 &pcfg_pull_none>;
 		};
 
 		/* This is where we actually hook up CD; has external pull */
 		sdmmc_cd_gpio: sdmmc-cd-gpio {
-			rockchip,pins = <4 24 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <4 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
@@ -1048,36 +1048,36 @@ ap_i2c_audio: &i2c8 {
 			 * Pull down SPI1 CLK/CS/RX/TX during suspend, to
 			 * prevent leakage.
 			 */
-			rockchip,pins = <1 9 RK_FUNC_GPIO &pcfg_pull_down>,
-					<1 10 RK_FUNC_GPIO &pcfg_pull_down>,
-					<1 7 RK_FUNC_GPIO &pcfg_pull_down>,
-					<1 8 RK_FUNC_GPIO &pcfg_pull_down>;
+			rockchip,pins = <1 RK_PB1 RK_FUNC_GPIO &pcfg_pull_down>,
+					<1 RK_PB2 RK_FUNC_GPIO &pcfg_pull_down>,
+					<1 RK_PA7 RK_FUNC_GPIO &pcfg_pull_down>,
+					<1 RK_PB0 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 	};
 
 	touchscreen {
 		touch_int_l: touch-int-l {
-			rockchip,pins = <3 13 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <3 RK_PB5 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 
 		touch_reset_l: touch-reset-l {
-			rockchip,pins = <4 26 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <4 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
 	trackpad {
 		ap_i2c_tp_pu_en: ap-i2c-tp-pu-en {
-			rockchip,pins = <3 12 RK_FUNC_GPIO &pcfg_output_high>;
+			rockchip,pins = <3 RK_PB4 RK_FUNC_GPIO &pcfg_output_high>;
 		};
 
 		trackpad_int_l: trackpad-int-l {
-			rockchip,pins = <1 4 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <1 RK_PA4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	wifi {
 		wifi_perst_l: wifi-perst-l {
-			rockchip,pins = <2 27 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <2 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
 		wlan_module_reset_l: wlan-module-reset-l {
@@ -1086,18 +1086,18 @@ ap_i2c_audio: &i2c8 {
 			 * Possible), to avoid leakage through the powered-down
 			 * WiFi.
 			 */
-			rockchip,pins = <1 11 RK_FUNC_GPIO &pcfg_output_low>;
+			rockchip,pins = <1 RK_PB3 RK_FUNC_GPIO &pcfg_output_low>;
 		};
 
 		bt_host_wake_l: bt-host-wake-l {
 			/* Kevin has an external pull up, but Gru does not */
-			rockchip,pins = <0 3 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
 	write-protect {
 		ap_fw_wp: ap-fw-wp {
-			rockchip,pins = <1 18 RK_FUNC_GPIO &pcfg_pull_up>;
+			rockchip,pins = <1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 9d44c19..54a5340 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1568,14 +1568,14 @@
 
 		clock {
 			clk_32k: clk-32k {
-				rockchip,pins = <0 0 RK_FUNC_2 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PA0 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		edp {
 			edp_hpd: edp-hpd {
 				rockchip,pins =
-					<4 23 RK_FUNC_2 &pcfg_pull_none>;
+					<4 RK_PC7 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
@@ -1583,443 +1583,443 @@
 			rgmii_pins: rgmii-pins {
 				rockchip,pins =
 					/* mac_txclk */
-					<3 17 RK_FUNC_1 &pcfg_pull_none_13ma>,
+					<3 RK_PC1 RK_FUNC_1 &pcfg_pull_none_13ma>,
 					/* mac_rxclk */
-					<3 14 RK_FUNC_1 &pcfg_pull_none>,
+					<3 RK_PB6 RK_FUNC_1 &pcfg_pull_none>,
 					/* mac_mdio */
-					<3 13 RK_FUNC_1 &pcfg_pull_none>,
+					<3 RK_PB5 RK_FUNC_1 &pcfg_pull_none>,
 					/* mac_txen */
-					<3 12 RK_FUNC_1 &pcfg_pull_none_13ma>,
+					<3 RK_PB4 RK_FUNC_1 &pcfg_pull_none_13ma>,
 					/* mac_clk */
-					<3 11 RK_FUNC_1 &pcfg_pull_none>,
+					<3 RK_PB3 RK_FUNC_1 &pcfg_pull_none>,
 					/* mac_rxdv */
-					<3 9 RK_FUNC_1 &pcfg_pull_none>,
+					<3 RK_PB1 RK_FUNC_1 &pcfg_pull_none>,
 					/* mac_mdc */
-					<3 8 RK_FUNC_1 &pcfg_pull_none>,
+					<3 RK_PB0 RK_FUNC_1 &pcfg_pull_none>,
 					/* mac_rxd1 */
-					<3 7 RK_FUNC_1 &pcfg_pull_none>,
+					<3 RK_PA7 RK_FUNC_1 &pcfg_pull_none>,
 					/* mac_rxd0 */
-					<3 6 RK_FUNC_1 &pcfg_pull_none>,
+					<3 RK_PA6 RK_FUNC_1 &pcfg_pull_none>,
 					/* mac_txd1 */
-					<3 5 RK_FUNC_1 &pcfg_pull_none_13ma>,
+					<3 RK_PA5 RK_FUNC_1 &pcfg_pull_none_13ma>,
 					/* mac_txd0 */
-					<3 4 RK_FUNC_1 &pcfg_pull_none_13ma>,
+					<3 RK_PA4 RK_FUNC_1 &pcfg_pull_none_13ma>,
 					/* mac_rxd3 */
-					<3 3 RK_FUNC_1 &pcfg_pull_none>,
+					<3 RK_PA3 RK_FUNC_1 &pcfg_pull_none>,
 					/* mac_rxd2 */
-					<3 2 RK_FUNC_1 &pcfg_pull_none>,
+					<3 RK_PA2 RK_FUNC_1 &pcfg_pull_none>,
 					/* mac_txd3 */
-					<3 1 RK_FUNC_1 &pcfg_pull_none_13ma>,
+					<3 RK_PA1 RK_FUNC_1 &pcfg_pull_none_13ma>,
 					/* mac_txd2 */
-					<3 0 RK_FUNC_1 &pcfg_pull_none_13ma>;
+					<3 RK_PA0 RK_FUNC_1 &pcfg_pull_none_13ma>;
 			};
 
 			rmii_pins: rmii-pins {
 				rockchip,pins =
 					/* mac_mdio */
-					<3 13 RK_FUNC_1 &pcfg_pull_none>,
+					<3 RK_PB5 RK_FUNC_1 &pcfg_pull_none>,
 					/* mac_txen */
-					<3 12 RK_FUNC_1 &pcfg_pull_none_13ma>,
+					<3 RK_PB4 RK_FUNC_1 &pcfg_pull_none_13ma>,
 					/* mac_clk */
-					<3 11 RK_FUNC_1 &pcfg_pull_none>,
+					<3 RK_PB3 RK_FUNC_1 &pcfg_pull_none>,
 					/* mac_rxer */
-					<3 10 RK_FUNC_1 &pcfg_pull_none>,
+					<3 RK_PB2 RK_FUNC_1 &pcfg_pull_none>,
 					/* mac_rxdv */
-					<3 9 RK_FUNC_1 &pcfg_pull_none>,
+					<3 RK_PB1 RK_FUNC_1 &pcfg_pull_none>,
 					/* mac_mdc */
-					<3 8 RK_FUNC_1 &pcfg_pull_none>,
+					<3 RK_PB0 RK_FUNC_1 &pcfg_pull_none>,
 					/* mac_rxd1 */
-					<3 7 RK_FUNC_1 &pcfg_pull_none>,
+					<3 RK_PA7 RK_FUNC_1 &pcfg_pull_none>,
 					/* mac_rxd0 */
-					<3 6 RK_FUNC_1 &pcfg_pull_none>,
+					<3 RK_PA6 RK_FUNC_1 &pcfg_pull_none>,
 					/* mac_txd1 */
-					<3 5 RK_FUNC_1 &pcfg_pull_none_13ma>,
+					<3 RK_PA5 RK_FUNC_1 &pcfg_pull_none_13ma>,
 					/* mac_txd0 */
-					<3 4 RK_FUNC_1 &pcfg_pull_none_13ma>;
+					<3 RK_PA4 RK_FUNC_1 &pcfg_pull_none_13ma>;
 			};
 		};
 
 		i2c0 {
 			i2c0_xfer: i2c0-xfer {
 				rockchip,pins =
-					<1 15 RK_FUNC_2 &pcfg_pull_none>,
-					<1 16 RK_FUNC_2 &pcfg_pull_none>;
+					<1 RK_PB7 RK_FUNC_2 &pcfg_pull_none>,
+					<1 RK_PC0 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		i2c1 {
 			i2c1_xfer: i2c1-xfer {
 				rockchip,pins =
-					<4 2 RK_FUNC_1 &pcfg_pull_none>,
-					<4 1 RK_FUNC_1 &pcfg_pull_none>;
+					<4 RK_PA2 RK_FUNC_1 &pcfg_pull_none>,
+					<4 RK_PA1 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2c2 {
 			i2c2_xfer: i2c2-xfer {
 				rockchip,pins =
-					<2 1 RK_FUNC_2 &pcfg_pull_none_12ma>,
-					<2 0 RK_FUNC_2 &pcfg_pull_none_12ma>;
+					<2 RK_PA1 RK_FUNC_2 &pcfg_pull_none_12ma>,
+					<2 RK_PA0 RK_FUNC_2 &pcfg_pull_none_12ma>;
 			};
 		};
 
 		i2c3 {
 			i2c3_xfer: i2c3-xfer {
 				rockchip,pins =
-					<4 17 RK_FUNC_1 &pcfg_pull_none>,
-					<4 16 RK_FUNC_1 &pcfg_pull_none>;
+					<4 RK_PC1 RK_FUNC_1 &pcfg_pull_none>,
+					<4 RK_PC0 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2c4 {
 			i2c4_xfer: i2c4-xfer {
 				rockchip,pins =
-					<1 12 RK_FUNC_1 &pcfg_pull_none>,
-					<1 11 RK_FUNC_1 &pcfg_pull_none>;
+					<1 RK_PB4 RK_FUNC_1 &pcfg_pull_none>,
+					<1 RK_PB3 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2c5 {
 			i2c5_xfer: i2c5-xfer {
 				rockchip,pins =
-					<3 11 RK_FUNC_2 &pcfg_pull_none>,
-					<3 10 RK_FUNC_2 &pcfg_pull_none>;
+					<3 RK_PB3 RK_FUNC_2 &pcfg_pull_none>,
+					<3 RK_PB2 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		i2c6 {
 			i2c6_xfer: i2c6-xfer {
 				rockchip,pins =
-					<2 10 RK_FUNC_2 &pcfg_pull_none>,
-					<2 9 RK_FUNC_2 &pcfg_pull_none>;
+					<2 RK_PB2 RK_FUNC_2 &pcfg_pull_none>,
+					<2 RK_PB1 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		i2c7 {
 			i2c7_xfer: i2c7-xfer {
 				rockchip,pins =
-					<2 8 RK_FUNC_2 &pcfg_pull_none>,
-					<2 7 RK_FUNC_2 &pcfg_pull_none>;
+					<2 RK_PB0 RK_FUNC_2 &pcfg_pull_none>,
+					<2 RK_PA7 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		i2c8 {
 			i2c8_xfer: i2c8-xfer {
 				rockchip,pins =
-					<1 21 RK_FUNC_1 &pcfg_pull_none>,
-					<1 20 RK_FUNC_1 &pcfg_pull_none>;
+					<1 RK_PC5 RK_FUNC_1 &pcfg_pull_none>,
+					<1 RK_PC4 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2s0 {
 			i2s0_8ch_bus: i2s0-8ch-bus {
 				rockchip,pins =
-					<3 24 RK_FUNC_1 &pcfg_pull_none>,
-					<3 25 RK_FUNC_1 &pcfg_pull_none>,
-					<3 26 RK_FUNC_1 &pcfg_pull_none>,
-					<3 27 RK_FUNC_1 &pcfg_pull_none>,
-					<3 28 RK_FUNC_1 &pcfg_pull_none>,
-					<3 29 RK_FUNC_1 &pcfg_pull_none>,
-					<3 30 RK_FUNC_1 &pcfg_pull_none>,
-					<3 31 RK_FUNC_1 &pcfg_pull_none>,
-					<4 0 RK_FUNC_1 &pcfg_pull_none>;
+					<3 RK_PD0 RK_FUNC_1 &pcfg_pull_none>,
+					<3 RK_PD1 RK_FUNC_1 &pcfg_pull_none>,
+					<3 RK_PD2 RK_FUNC_1 &pcfg_pull_none>,
+					<3 RK_PD3 RK_FUNC_1 &pcfg_pull_none>,
+					<3 RK_PD4 RK_FUNC_1 &pcfg_pull_none>,
+					<3 RK_PD5 RK_FUNC_1 &pcfg_pull_none>,
+					<3 RK_PD6 RK_FUNC_1 &pcfg_pull_none>,
+					<3 RK_PD7 RK_FUNC_1 &pcfg_pull_none>,
+					<4 RK_PA0 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		i2s1 {
 			i2s1_2ch_bus: i2s1-2ch-bus {
 				rockchip,pins =
-					<4 3 RK_FUNC_1 &pcfg_pull_none>,
-					<4 4 RK_FUNC_1 &pcfg_pull_none>,
-					<4 5 RK_FUNC_1 &pcfg_pull_none>,
-					<4 6 RK_FUNC_1 &pcfg_pull_none>,
-					<4 7 RK_FUNC_1 &pcfg_pull_none>;
+					<4 RK_PA3 RK_FUNC_1 &pcfg_pull_none>,
+					<4 RK_PA4 RK_FUNC_1 &pcfg_pull_none>,
+					<4 RK_PA5 RK_FUNC_1 &pcfg_pull_none>,
+					<4 RK_PA6 RK_FUNC_1 &pcfg_pull_none>,
+					<4 RK_PA7 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		sleep {
 			ap_pwroff: ap-pwroff {
-				rockchip,pins = <1 5 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <1 RK_PA5 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			ddrio_pwroff: ddrio-pwroff {
-				rockchip,pins = <0 1 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <0 RK_PA1 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		spdif {
 			spdif_bus: spdif-bus {
 				rockchip,pins =
-					<4 21 RK_FUNC_1 &pcfg_pull_none>;
+					<4 RK_PC5 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		spi0 {
 			spi0_clk: spi0-clk {
 				rockchip,pins =
-					<3 6 RK_FUNC_2 &pcfg_pull_up>;
+					<3 RK_PA6 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi0_cs0: spi0-cs0 {
 				rockchip,pins =
-					<3 7 RK_FUNC_2 &pcfg_pull_up>;
+					<3 RK_PA7 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi0_cs1: spi0-cs1 {
 				rockchip,pins =
-					<3 8 RK_FUNC_2 &pcfg_pull_up>;
+					<3 RK_PB0 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi0_tx: spi0-tx {
 				rockchip,pins =
-					<3 5 RK_FUNC_2 &pcfg_pull_up>;
+					<3 RK_PA5 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi0_rx: spi0-rx {
 				rockchip,pins =
-					<3 4 RK_FUNC_2 &pcfg_pull_up>;
+					<3 RK_PA4 RK_FUNC_2 &pcfg_pull_up>;
 			};
 		};
 
 		spi1 {
 			spi1_clk: spi1-clk {
 				rockchip,pins =
-					<1 9 RK_FUNC_2 &pcfg_pull_up>;
+					<1 RK_PB1 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi1_cs0: spi1-cs0 {
 				rockchip,pins =
-					<1 10 RK_FUNC_2 &pcfg_pull_up>;
+					<1 RK_PB2 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi1_rx: spi1-rx {
 				rockchip,pins =
-					<1 7 RK_FUNC_2 &pcfg_pull_up>;
+					<1 RK_PA7 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi1_tx: spi1-tx {
 				rockchip,pins =
-					<1 8 RK_FUNC_2 &pcfg_pull_up>;
+					<1 RK_PB0 RK_FUNC_2 &pcfg_pull_up>;
 			};
 		};
 
 		spi2 {
 			spi2_clk: spi2-clk {
 				rockchip,pins =
-					<2 11 RK_FUNC_1 &pcfg_pull_up>;
+					<2 RK_PB3 RK_FUNC_1 &pcfg_pull_up>;
 			};
 			spi2_cs0: spi2-cs0 {
 				rockchip,pins =
-					<2 12 RK_FUNC_1 &pcfg_pull_up>;
+					<2 RK_PB4 RK_FUNC_1 &pcfg_pull_up>;
 			};
 			spi2_rx: spi2-rx {
 				rockchip,pins =
-					<2 9 RK_FUNC_1 &pcfg_pull_up>;
+					<2 RK_PB1 RK_FUNC_1 &pcfg_pull_up>;
 			};
 			spi2_tx: spi2-tx {
 				rockchip,pins =
-					<2 10 RK_FUNC_1 &pcfg_pull_up>;
+					<2 RK_PB2 RK_FUNC_1 &pcfg_pull_up>;
 			};
 		};
 
 		spi3 {
 			spi3_clk: spi3-clk {
 				rockchip,pins =
-					<1 17 RK_FUNC_1 &pcfg_pull_up>;
+					<1 RK_PC1 RK_FUNC_1 &pcfg_pull_up>;
 			};
 			spi3_cs0: spi3-cs0 {
 				rockchip,pins =
-					<1 18 RK_FUNC_1 &pcfg_pull_up>;
+					<1 RK_PC2 RK_FUNC_1 &pcfg_pull_up>;
 			};
 			spi3_rx: spi3-rx {
 				rockchip,pins =
-					<1 15 RK_FUNC_1 &pcfg_pull_up>;
+					<1 RK_PB7 RK_FUNC_1 &pcfg_pull_up>;
 			};
 			spi3_tx: spi3-tx {
 				rockchip,pins =
-					<1 16 RK_FUNC_1 &pcfg_pull_up>;
+					<1 RK_PC0 RK_FUNC_1 &pcfg_pull_up>;
 			};
 		};
 
 		spi4 {
 			spi4_clk: spi4-clk {
 				rockchip,pins =
-					<3 2 RK_FUNC_2 &pcfg_pull_up>;
+					<3 RK_PA2 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi4_cs0: spi4-cs0 {
 				rockchip,pins =
-					<3 3 RK_FUNC_2 &pcfg_pull_up>;
+					<3 RK_PA3 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi4_rx: spi4-rx {
 				rockchip,pins =
-					<3 0 RK_FUNC_2 &pcfg_pull_up>;
+					<3 RK_PA0 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi4_tx: spi4-tx {
 				rockchip,pins =
-					<3 1 RK_FUNC_2 &pcfg_pull_up>;
+					<3 RK_PA1 RK_FUNC_2 &pcfg_pull_up>;
 			};
 		};
 
 		spi5 {
 			spi5_clk: spi5-clk {
 				rockchip,pins =
-					<2 22 RK_FUNC_2 &pcfg_pull_up>;
+					<2 RK_PC6 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi5_cs0: spi5-cs0 {
 				rockchip,pins =
-					<2 23 RK_FUNC_2 &pcfg_pull_up>;
+					<2 RK_PC7 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi5_rx: spi5-rx {
 				rockchip,pins =
-					<2 20 RK_FUNC_2 &pcfg_pull_up>;
+					<2 RK_PC4 RK_FUNC_2 &pcfg_pull_up>;
 			};
 			spi5_tx: spi5-tx {
 				rockchip,pins =
-					<2 21 RK_FUNC_2 &pcfg_pull_up>;
+					<2 RK_PC5 RK_FUNC_2 &pcfg_pull_up>;
 			};
 		};
 
 		tsadc {
 			otp_gpio: otp-gpio {
-				rockchip,pins = <1 6 RK_FUNC_GPIO &pcfg_pull_none>;
+				rockchip,pins = <1 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
 			};
 
 			otp_out: otp-out {
-				rockchip,pins = <1 6 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <1 RK_PA6 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		uart0 {
 			uart0_xfer: uart0-xfer {
 				rockchip,pins =
-					<2 16 RK_FUNC_1 &pcfg_pull_up>,
-					<2 17 RK_FUNC_1 &pcfg_pull_none>;
+					<2 RK_PC0 RK_FUNC_1 &pcfg_pull_up>,
+					<2 RK_PC1 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			uart0_cts: uart0-cts {
 				rockchip,pins =
-					<2 18 RK_FUNC_1 &pcfg_pull_none>;
+					<2 RK_PC2 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			uart0_rts: uart0-rts {
 				rockchip,pins =
-					<2 19 RK_FUNC_1 &pcfg_pull_none>;
+					<2 RK_PC3 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		uart1 {
 			uart1_xfer: uart1-xfer {
 				rockchip,pins =
-					<3 12 RK_FUNC_2 &pcfg_pull_up>,
-					<3 13 RK_FUNC_2 &pcfg_pull_none>;
+					<3 RK_PB4 RK_FUNC_2 &pcfg_pull_up>,
+					<3 RK_PB5 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		uart2a {
 			uart2a_xfer: uart2a-xfer {
 				rockchip,pins =
-					<4 8 RK_FUNC_2 &pcfg_pull_up>,
-					<4 9 RK_FUNC_2 &pcfg_pull_none>;
+					<4 RK_PB0 RK_FUNC_2 &pcfg_pull_up>,
+					<4 RK_PB1 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		uart2b {
 			uart2b_xfer: uart2b-xfer {
 				rockchip,pins =
-					<4 16 RK_FUNC_2 &pcfg_pull_up>,
-					<4 17 RK_FUNC_2 &pcfg_pull_none>;
+					<4 RK_PC0 RK_FUNC_2 &pcfg_pull_up>,
+					<4 RK_PC1 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		uart2c {
 			uart2c_xfer: uart2c-xfer {
 				rockchip,pins =
-					<4 19 RK_FUNC_1 &pcfg_pull_up>,
-					<4 20 RK_FUNC_1 &pcfg_pull_none>;
+					<4 RK_PC3 RK_FUNC_1 &pcfg_pull_up>,
+					<4 RK_PC4 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		uart3 {
 			uart3_xfer: uart3-xfer {
 				rockchip,pins =
-					<3 14 RK_FUNC_2 &pcfg_pull_up>,
-					<3 15 RK_FUNC_2 &pcfg_pull_none>;
+					<3 RK_PB6 RK_FUNC_2 &pcfg_pull_up>,
+					<3 RK_PB7 RK_FUNC_2 &pcfg_pull_none>;
 			};
 
 			uart3_cts: uart3-cts {
 				rockchip,pins =
-					<3 18 RK_FUNC_2 &pcfg_pull_none>;
+					<3 RK_PC2 RK_FUNC_2 &pcfg_pull_none>;
 			};
 
 			uart3_rts: uart3-rts {
 				rockchip,pins =
-					<3 19 RK_FUNC_2 &pcfg_pull_none>;
+					<3 RK_PC3 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		uart4 {
 			uart4_xfer: uart4-xfer {
 				rockchip,pins =
-					<1 7 RK_FUNC_1 &pcfg_pull_up>,
-					<1 8 RK_FUNC_1 &pcfg_pull_none>;
+					<1 RK_PA7 RK_FUNC_1 &pcfg_pull_up>,
+					<1 RK_PB0 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		uarthdcp {
 			uarthdcp_xfer: uarthdcp-xfer {
 				rockchip,pins =
-					<4 21 RK_FUNC_2 &pcfg_pull_up>,
-					<4 22 RK_FUNC_2 &pcfg_pull_none>;
+					<4 RK_PC5 RK_FUNC_2 &pcfg_pull_up>,
+					<4 RK_PC6 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		pwm0 {
 			pwm0_pin: pwm0-pin {
 				rockchip,pins =
-					<4 18 RK_FUNC_1 &pcfg_pull_none>;
+					<4 RK_PC2 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			vop0_pwm_pin: vop0-pwm-pin {
 				rockchip,pins =
-					<4 18 RK_FUNC_2 &pcfg_pull_none>;
+					<4 RK_PC2 RK_FUNC_2 &pcfg_pull_none>;
 			};
 		};
 
 		pwm1 {
 			pwm1_pin: pwm1-pin {
 				rockchip,pins =
-					<4 22 RK_FUNC_1 &pcfg_pull_none>;
+					<4 RK_PC6 RK_FUNC_1 &pcfg_pull_none>;
 			};
 
 			vop1_pwm_pin: vop1-pwm-pin {
 				rockchip,pins =
-					<4 18 RK_FUNC_3 &pcfg_pull_none>;
+					<4 RK_PC2 RK_FUNC_3 &pcfg_pull_none>;
 			};
 		};
 
 		pwm2 {
 			pwm2_pin: pwm2-pin {
 				rockchip,pins =
-					<1 19 RK_FUNC_1 &pcfg_pull_none>;
+					<1 RK_PC3 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		pwm3a {
 			pwm3a_pin: pwm3a-pin {
 				rockchip,pins =
-					<0 6 RK_FUNC_1 &pcfg_pull_none>;
+					<0 RK_PA6 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		pwm3b {
 			pwm3b_pin: pwm3b-pin {
 				rockchip,pins =
-					<1 14 RK_FUNC_1 &pcfg_pull_none>;
+					<1 RK_PB6 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
 		pcie {
 			pcie_clkreqn: pci-clkreqn {
 				rockchip,pins =
-					<2 26 RK_FUNC_2 &pcfg_pull_none>;
+					<2 RK_PD2 RK_FUNC_2 &pcfg_pull_none>;
 			};
 
 			pcie_clkreqnb: pci-clkreqnb {
 				rockchip,pins =
-					<4 24 RK_FUNC_1 &pcfg_pull_none>;
+					<4 RK_PD0 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
-- 
1.9.1
