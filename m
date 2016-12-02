From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH 9/9] arm64: dts: rockchip: add regulator info for Kevin digitizer
Date: Thu,  1 Dec 2016 18:27:33 -0800
Message-ID: <1480645653-36943-10-git-send-email-briannorris@chromium.org>
References: <1480645653-36943-1-git-send-email-briannorris@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1480645653-36943-1-git-send-email-briannorris@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Caesar Wang <wxt@rock-chips.com>, Doug Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Stephen Barber <smbarber@chromium.org>, linux-arm-kernel@lists.infradead.org, Chris Zhong <zyw@rock-chips.com>, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

We need to enable this regulator before the digitizer can be used. Wacom
recommended waiting for 100 ms before talking to the HID.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
Uses WIP bindings:

[PATCH v3 1/2] devicetree: i2c-hid: Add regulator support
https://patchwork.kernel.org/patch/9457493/
---
 arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
index 66db785375a8..d260079de2ab 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
@@ -232,6 +232,9 @@ ap_i2c_dig: &i2c2 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&cpu1_dig_irq_l &cpu1_dig_pdct_l>;
 
+		vdd-supply = <&p3_3v_dig>;
+		init-delay-ms = <100>;
+
 		interrupt-parent = <&gpio2>;
 		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
 
-- 
2.8.0.rc3.226.g39d4020
