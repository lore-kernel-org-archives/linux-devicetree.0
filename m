From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 08/13] arm64: dts: rockchip: remove unused pin settings from px30
Date: Tue, 17 Sep 2019 10:26:54 +0200
Message-ID: <20190917082659.25549-8-heiko@sntech.de>
References: <20190917082659.25549-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917082659.25549-1-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-rockchip@lists.infradead.org, christoph.muellner@theobroma-systems.com, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

These are unused gpio-settings for specific function pins, that
are not used by anything and only clutter up the dtsi.
They can be re-added when a relevant user is added.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 40 --------------------------
 1 file changed, 40 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index f2bbdfa0e4aa..63499d27994c 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -1159,11 +1159,6 @@
 				rockchip,pins =
 					<0 RK_PB5 1 &pcfg_pull_none>;
 			};
-
-			uart0_rts_gpio: uart0-rts-gpio {
-				rockchip,pins =
-					<0 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
-			};
 		};
 
 		uart1 {
@@ -1182,11 +1177,6 @@
 				rockchip,pins =
 					<1 RK_PC3 1 &pcfg_pull_none>;
 			};
-
-			uart1_rts_gpio: uart1-rts-gpio {
-				rockchip,pins =
-					<1 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;
-			};
 		};
 
 		uart2-m0 {
@@ -1221,11 +1211,6 @@
 				rockchip,pins =
 					<0 RK_PC3 2 &pcfg_pull_none>;
 			};
-
-			uart3m0_rts_gpio: uart3m0-rts-gpio {
-				rockchip,pins =
-					<0 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;
-			};
 		};
 
 		uart3-m1 {
@@ -1244,11 +1229,6 @@
 				rockchip,pins =
 					<1 RK_PB5 2 &pcfg_pull_none>;
 			};
-
-			uart3m1_rts_gpio: uart3m1-rts-gpio {
-				rockchip,pins =
-					<1 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
-			};
 		};
 
 		uart4 {
@@ -1597,16 +1577,6 @@
 					<1 RK_PD4 1 &pcfg_pull_up_8ma>,
 					<1 RK_PD5 1 &pcfg_pull_up_8ma>;
 			};
-
-			sdmmc_gpio: sdmmc-gpio {
-				rockchip,pins =
-					<1 RK_PD2 RK_FUNC_GPIO &pcfg_pull_up_4ma>,
-					<1 RK_PD3 RK_FUNC_GPIO &pcfg_pull_up_4ma>,
-					<1 RK_PD4 RK_FUNC_GPIO &pcfg_pull_up_4ma>,
-					<1 RK_PD5 RK_FUNC_GPIO &pcfg_pull_up_4ma>,
-					<1 RK_PD6 RK_FUNC_GPIO &pcfg_pull_up_4ma>,
-					<1 RK_PD7 RK_FUNC_GPIO &pcfg_pull_up_4ma>;
-			};
 		};
 
 		sdio {
@@ -1627,16 +1597,6 @@
 					<1 RK_PD0 1 &pcfg_pull_up>,
 					<1 RK_PD1 1 &pcfg_pull_up>;
 			};
-
-			sdio_gpio: sdio-gpio {
-				rockchip,pins =
-					<1 RK_PC6 RK_FUNC_GPIO &pcfg_pull_up>,
-					<1 RK_PC7 RK_FUNC_GPIO &pcfg_pull_up>,
-					<1 RK_PD0 RK_FUNC_GPIO &pcfg_pull_up>,
-					<1 RK_PD1 RK_FUNC_GPIO &pcfg_pull_up>,
-					<1 RK_PC4 RK_FUNC_GPIO &pcfg_pull_up>,
-					<1 RK_PC5 RK_FUNC_GPIO &pcfg_pull_up>;
-			};
 		};
 
 		emmc {
-- 
2.20.1
