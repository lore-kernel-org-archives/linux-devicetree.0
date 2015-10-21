From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH v1 2/2] ARM: dts: rockchip: Add the OTP gpio pinctrl
Date: Wed, 21 Oct 2015 10:43:00 +0800
Message-ID: <1445395380-5365-3-git-send-email-wxt@rock-chips.com>
References: <1445395380-5365-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445395380-5365-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, dianders@chromium.org, Eduardo Valentin <edubezval@gmail.com>, Caesar Wang <wxt@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

We need the OTP pin is gpio state before resetting the TSADC controller,
since the tshut polarity will generate a high signal.

Signed-off-by: Caesar Wang <wxt@rock-chips.com>
---

Changes in v1:
  - As the Doug comments, drop the thermal driver patchs since
    we can with pinctrl changing to work.
  - As the Doug's patch to add the 'init' property.

 arch/arm/boot/dts/rk3288.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 906e938..6ea89aa 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -447,8 +447,9 @@
 		clock-names = "tsadc", "apb_pclk";
 		resets = <&cru SRST_TSADC>;
 		reset-names = "tsadc-apb";
-		pinctrl-names = "default";
-		pinctrl-0 = <&otp_out>;
+		pinctrl-names = "init", "default";
+		pinctrl-0 = <&otp_gpio>;
+		pinctrl-1 = <&otp_out>;
 		#thermal-sensor-cells = <1>;
 		rockchip,hw-tshut-temp = <95000>;
 		status = "disabled";
@@ -1273,6 +1274,10 @@
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
