From: Jeffy Chen <jeffy.chen@rock-chips.com>
Subject: [PATCH v3 3/3] arm64: dts: rockchip: use cs-gpios for cros_ec_spi
Date: Wed, 14 Jun 2017 11:38:03 +0800
Message-ID: <1497411483-23377-3-git-send-email-jeffy.chen@rock-chips.com>
References: <1497411483-23377-1-git-send-email-jeffy.chen@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1497411483-23377-1-git-send-email-jeffy.chen@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, broonie@kernel.org
Cc: briannorris@chromium.org, dianders@chromium.org, heiko@sntech.de, Jeffy Chen <jeffy.chen@rock-chips.com>, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
List-Id: devicetree@vger.kernel.org

The cros_ec requires CS line to be active after last message. But the CS
would be toggled when powering off/on rockchip spi, which breaks ec xfer.
Use GPIO CS to prevent that.

Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
---

Changes in v3: None
Changes in v2:
Fix wrong pinconf for spi5_cs0.

 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
index eb50593..b34a51d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
@@ -790,6 +790,8 @@ ap_i2c_audio: &i2c8 {
 &spi5 {
 	status = "okay";
 
+	cs-gpios = <&gpio2 23 GPIO_ACTIVE_HIGH>;
+
 	cros_ec: ec@0 {
 		compatible = "google,cros-ec-spi";
 		reg = <0>;
@@ -813,6 +815,10 @@ ap_i2c_audio: &i2c8 {
 	};
 };
 
+&spi5_cs0 {
+	rockchip,pins = <RK_GPIO2 23 RK_FUNC_GPIO &pcfg_output_high>;
+};
+
 &tsadc {
 	status = "okay";
 
-- 
2.1.4
