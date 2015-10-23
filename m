From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH v4 3/3] ARM: dts: rockchip: Add the OTP gpio pinctrl
Date: Fri, 23 Oct 2015 19:25:28 +0800
Message-ID: <1445599528-18825-4-git-send-email-wxt@rock-chips.com>
References: <1445599528-18825-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445599528-18825-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, dianders@chromium.org, Eduardo Valentin <edubezval@gmail.com>, Caesar Wang <wxt@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the "init" anf "sleep" pinctrl as the OTP gpio state.
We need the OTP pin is gpio state before resetting the TSADC controller,
since the tshut polarity will generate a high signal.

"init" pinctrl property is defined by Doug's Patch[0].

Patch[0]:
https://patchwork.kernel.org/patch/7454311/

Signed-off-by: Caesar Wang <wxt@rock-chips.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4: None
Changes in v3:
  - Add the "sleep" pinctrl as the gpio state in PATCH[3/3]

Changes in v2:
  - Add some commits for more obvious in PATCH[2/2]

Changes in v1:
  - As the Doug comments, drop the thermal driver patchs since
    we can with pinctrl changing to work.
  - As the Doug's patch to add the 'init' property.

 arch/arm/boot/dts/rk3288.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 906e938..13ff09a 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -447,8 +447,10 @@
 		clock-names = "tsadc", "apb_pclk";
 		resets = <&cru SRST_TSADC>;
 		reset-names = "tsadc-apb";
-		pinctrl-names = "default";
-		pinctrl-0 = <&otp_out>;
+		pinctrl-names = "init", "default", "sleep";
+		pinctrl-0 = <&otp_gpio>;
+		pinctrl-1 = <&otp_out>;
+		pinctrl-2 = <&otp_gpio>;
 		#thermal-sensor-cells = <1>;
 		rockchip,hw-tshut-temp = <95000>;
 		status = "disabled";
@@ -1273,6 +1275,10 @@
 		};
 
 		tsadc {
+			otp_gpio: otp-gpio {
+				rockchip,pins = <0 10 RK_FUNC_GPIO &pcfg_pull_none>;
+			};
+
 			otp_out: otp-out {
 				rockchip,pins = <0 10 RK_FUNC_1 &pcfg_pull_none>;
 			};
-- 
1.9.1
