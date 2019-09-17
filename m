From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 10/13] arm64: dts: rockchip: add px30-evb i2c1 devices
Date: Tue, 17 Sep 2019 10:26:56 +0200
Message-ID: <20190917082659.25549-10-heiko@sntech.de>
References: <20190917082659.25549-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917082659.25549-1-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-rockchip@lists.infradead.org, christoph.muellner@theobroma-systems.com, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

Enable i2c1 and adds the devices connected to it.
This includes a magnetometer, goodix-touchscreen and accelerometer.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/px30-evb.dts | 37 +++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30-evb.dts b/arch/arm64/boot/dts/rockchip/px30-evb.dts
index 80524afe94da..1185a314ba4a 100644
--- a/arch/arm64/boot/dts/rockchip/px30-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/px30-evb.dts
@@ -349,6 +349,43 @@
 	};
 };
 
+&i2c1 {
+	status = "okay";
+
+	sensor@d {
+		compatible = "asahi-kasei,ak8963";
+		reg = <0x0d>;
+		gpios = <&gpio0 RK_PB7 GPIO_ACTIVE_HIGH>;
+		vdd-supply = <&vcc3v0_pmu>;
+		mount-matrix = "1", /* x0 */
+			       "0", /* y0 */
+			       "0", /* z0 */
+			       "0", /* x1 */
+			       "1", /* y1 */
+			       "0", /* z1 */
+			       "0", /* x2 */
+			       "0", /* y2 */
+			       "1"; /* z2 */
+	};
+
+	touchscreen@14 {
+		compatible = "goodix,gt1151";
+		reg = <0x14>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA5 IRQ_TYPE_LEVEL_LOW>;
+		irq-gpios = <&gpio0 RK_PA5 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
+		VDDIO-supply = <&vcc3v3_lcd>;
+	};
+
+	sensor@4c {
+		compatible = "fsl,mma7660";
+		reg = <0x4c>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB7 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &i2s1_2ch {
 	status = "okay";
 };
-- 
2.20.1
