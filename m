From: Kever Yang <kever.yang@rock-chips.com>
Subject: [PATCH v2] arm: dts: rockchip: fix vcc_host_5v regulator for usb3 host
Date: Thu, 15 Aug 2019 16:12:52 +0800
Message-ID: <20190815081252.27405-1-kever.yang@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, Kever Yang <kever.yang@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, Jonas Karlman <jonas@kwiboo.se>, Katsuhiro Suzuki <katsuhiro@katsuster.net>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Tomohiro Mayama <parly-gh@iris.mystia.org>, Vasily Khoruzhick <anarsoul@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

According to rock64 schemetic V2 and V3, the VCC_HOST_5V output is
controlled by USB_20_HOST_DRV, which is the same as VCC_HOST1_5V.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v2:
- remove enable-active-high property

 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
index 7cfd5ca6cc85..62936b432f9a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
@@ -34,10 +34,9 @@
 
 	vcc_host_5v: vcc-host-5v-regulator {
 		compatible = "regulator-fixed";
-		enable-active-high;
-		gpio = <&gpio0 RK_PA0 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio0 RK_PA2 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&usb30_host_drv>;
+		pinctrl-0 = <&usb20_host_drv>;
 		regulator-name = "vcc_host_5v";
 		regulator-always-on;
 		regulator-boot-on;
@@ -320,12 +319,6 @@
 			rockchip,pins = <0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
-
-	usb3 {
-		usb30_host_drv: usb30-host-drv {
-			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
 };
 
 &sdmmc {
-- 
2.17.1
