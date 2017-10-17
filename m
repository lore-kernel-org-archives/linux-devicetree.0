From: Jeffy Chen <jeffy.chen@rock-chips.com>
Subject: [RFC PATCH v4 1/8] arm64: dts: rockchip: Enable edp disaplay on kevin
Date: Tue, 17 Oct 2017 18:16:17 +0800
Message-ID: <20171017101624.12506-2-jeffy.chen@rock-chips.com>
References: <20171017101624.12506-1-jeffy.chen@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171017101624.12506-1-jeffy.chen@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, dmitry.torokhov@gmail.com, heiko@sntech.de, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will.deacon@arm.com>, briannorris@chromium.org, rjw@rjwysocki.net, dianders@chromium.org, Rob Herring <robh+dt@kernel.org>, tfiga@chromium.org, linux-rockchip@lists.infradead.org, Jeffy Chen <jeffy.chen@rock-chips.com>, broonie@kernel.org, seanpaul@chromium.org, Catalin Marinas <catalin.marinas@arm.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org, Mark Yao <mark.yao@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Add edp panel and enable related nodes on kevin.

Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
Reviewed-by: Mark Yao <mark.yao@rock-chips.com>

---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts | 29 +++++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi      | 16 +++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
index a3d3cea7dc4f..bc67b19f0af5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
@@ -93,6 +93,18 @@
 		pwm-delay-us = <10000>;
 	};
 
+	edp_panel: edp-panel {
+		compatible = "sharp,lq123p1jx31", "simple-panel";
+		backlight = <&backlight>;
+		power-supply = <&pp3300_disp>;
+
+		ports {
+			panel_in_edp: endpoint {
+				remote-endpoint = <&edp_out_panel>;
+			};
+		};
+	};
+
 	thermistor_ppvar_bigcpu: thermistor-ppvar-bigcpu {
 		compatible = "murata,ncp15wb473";
 		pullup-uv = <1800000>;
@@ -264,6 +276,23 @@ ap_i2c_dig: &i2c2 {
 	};
 };
 
+&edp {
+	status = "okay";
+
+	ports {
+		edp_out: port@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			edp_out_panel: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&panel_in_edp>;
+			};
+		};
+	};
+};
+
 &ppvar_bigcpu_pwm {
 	regulator-min-microvolt = <798674>;
 	regulator-max-microvolt = <1302172>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
index 5772c52fbfd3..470105d651c2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
@@ -927,6 +927,22 @@ ap_i2c_audio: &i2c8 {
 	dr_mode = "host";
 };
 
+&vopb {
+	status = "okay";
+};
+
+&vopb_mmu {
+	status = "okay";
+};
+
+&vopl {
+	status = "okay";
+};
+
+&vopl_mmu {
+	status = "okay";
+};
+
 #include <arm/cros-ec-keyboard.dtsi>
 #include <arm/cros-ec-sbs.dtsi>
 
-- 
2.11.0
