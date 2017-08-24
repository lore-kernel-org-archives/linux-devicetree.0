From: Jeffy Chen <jeffy.chen@rock-chips.com>
Subject: [RESENT PATCH v7 3/7] arm64: dts: rockchip: Update rt5514 devices' compatible for Gru
Date: Thu, 24 Aug 2017 12:52:23 +0800
Message-ID: <20170824045227.15504-4-jeffy.chen@rock-chips.com>
References: <20170824045227.15504-1-jeffy.chen@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170824045227.15504-1-jeffy.chen@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, dgreid@chromium.org, heiko@sntech.de
Cc: briannorris@chromium.org, mka@chromium.org, dianders@chromium.org, Jeffy Chen <jeffy.chen@rock-chips.com>, devicetree@vger.kernel.org, Klaus Goger <klaus.goger@theobroma-systems.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Caesar Wang <wxt@rock-chips.com>, Catalin Marinas <catalin.marinas@arm.com>
List-Id: devicetree@vger.kernel.org

Currently the rt5514 i2c driver and rt5514 spi driver are using the same
compatible string.

Add additional unused compatible strings to identify them for Gru
boards.

Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
---

Changes in v7: None
Changes in v6: None
Changes in v3: None
Changes in v2: None

 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
index 5772c52fbfd3..50fb11ad9f17 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
@@ -611,7 +611,7 @@ ap_i2c_mic: &i2c1 {
 	i2c-scl-rising-time-ns = <300>;
 
 	headsetcodec: rt5514@57 {
-		compatible = "realtek,rt5514";
+		compatible = "realtek,rt5514", "realtek,rt5514-i2c";
 		reg = <0x57>;
 		realtek,dmic-init-delay-ms = <20>;
 	};
@@ -820,7 +820,7 @@ ap_i2c_audio: &i2c8 {
 	status = "okay";
 
 	wacky_spi_audio: spi2@0 {
-		compatible = "realtek,rt5514";
+		compatible = "realtek,rt5514", "realtek,rt5514-spi";
 		reg = <0>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <13 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.11.0
