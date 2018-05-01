From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: use canonical compatible for
 touchpad/touchscreen
Date: Tue, 1 May 2018 15:46:28 -0700
Message-ID: <20180501224628.GA150745@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Kaehlcke <mka@chromium.org>, Brian Norris <briannorris@chromium.org>, Emil Renner Berthing <kernel@esmil.dk>, Jeffy Chen <jeffy.chen@rock-chips.com>, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

"atmel,atmel_mxt_tp" and "atmel,atmel_mxt_ts" are ChromeOS inventions,
let's replace them with canonical compatible string "atmel,maxtouch".

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
index 191a6bcb17040..82179125bfb7c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
@@ -255,7 +255,7 @@ ap_i2c_dig: &i2c2 {
 
 &ap_i2c_tp {
 	trackpad@4a {
-		compatible = "atmel,atmel_mxt_tp";
+		compatible = "atmel,maxtouch";
 		reg = <0x4a>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&trackpad_int_l>;
@@ -271,7 +271,7 @@ ap_i2c_dig: &i2c2 {
 
 &ap_i2c_ts {
 	touchscreen@4b {
-		compatible = "atmel,atmel_mxt_ts";
+		compatible = "atmel,maxtouch";
 		reg = <0x4b>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&touch_int_l>;
-- 
2.17.0.441.gb46fe60e1d-goog


-- 
Dmitry
