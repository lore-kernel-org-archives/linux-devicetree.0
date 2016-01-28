From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH v4 1/9] ARM: dts: rockchip: add the leds control for kylin board
Date: Thu, 28 Jan 2016 16:43:30 +0800
Message-ID: <1453970618-4383-2-git-send-email-wxt@rock-chips.com>
References: <1453970618-4383-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453970618-4383-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org
Cc: hl@rock-chips.com, jay.xu@rock-chips.com, jeffy.chen@rock-chips.com, linux-rockchip@lists.infradead.org, keescook@google.com, cf@rock-chips.com, sonnyrao@chromium.org, leozwang@google.com, Caesar Wang <wxt@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

As the kylin schematic drawing, add the needed work led for
kylin board.

Run:
echo 0 > /sys/class/leds/kylin:red:led/brightness
echo 1 > /sys/class/leds/kylin:red:led/brightness

The led can normal on/off on kylin board.

Signed-off-by: Caesar Wang <wxt@rock-chips.com>

---

Changes in v4:
- Add the missing led control on kylin board.
- This patch picks up at this URL.
  (https://patchwork.kernel.org/patch/8129971/)

 arch/arm/boot/dts/rk3036-kylin.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/rk3036-kylin.dts b/arch/arm/boot/dts/rk3036-kylin.dts
index 190f22c..3332a7f 100644
--- a/arch/arm/boot/dts/rk3036-kylin.dts
+++ b/arch/arm/boot/dts/rk3036-kylin.dts
@@ -46,6 +46,17 @@
 	model = "Rockchip RK3036 KylinBoard";
 	compatible = "rockchip,rk3036-kylin", "rockchip,rk3036";
 
+	leds: gpio-leds {
+		compatible = "gpio-leds";
+
+		work {
+			gpios = <&gpio2 30 GPIO_ACTIVE_HIGH>;
+			label = "kylin:red:led";
+			pinctrl-names = "default";
+			pinctrl-0 = <&led_ctl>;
+		};
+	};
+
 	sdio_pwrseq: sdio-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		pinctrl-names = "default";
@@ -359,6 +370,12 @@
 };
 
 &pinctrl {
+	leds {
+		led_ctl: led-ctl {
+			rockchip,pins = <2 30 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	pmic {
 		pmic_int: pmic-int {
 			rockchip,pins = <2 2 RK_FUNC_GPIO &pcfg_pull_default>;
-- 
1.9.1
