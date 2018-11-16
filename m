From: Derek Basehore <dbasehore@chromium.org>
Subject: [PATCH] arm64: dts: rockchip: rk3399: Add xin32k clk
Date: Thu, 15 Nov 2018 21:17:19 -0800
Message-ID: <20181116051719.23376-1-dbasehore@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, tony.xie@rock-chips.com, zyw@rock-chips.com, ayaka@soulik.info, nickey.yang@rock-chips.com, zhengsq@rock-chips.com, klaus.goger@theobroma-systems.com, dianders@chromium.org, briannorris@chromium.org, enric.balletbo@collabora.com, heiko@sntech.de, mark.rutland@arm.com, robh+dt@kernel.org, Derek Basehore <dbasehore@chromium.org>
List-Id: devicetree@vger.kernel.org

This adds the xin32k clock to the RK3399 CPU. Even though it's not
directly used, muxes will end up traversing the entire clk tree on
calls to determine_rate if it doesn't exist.

Signed-off-by: Derek Basehore <dbasehore@chromium.org>
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 99e7f65c1779..3d09472978f8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -191,6 +191,13 @@
 		#clock-cells = <0>;
 	};
 
+	ap_rtc_clk: ap-rtc-clk {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		clock-output-names = "xin32k";
+		#clock-cells = <0>;
+	};
+
 	amba {
 		compatible = "simple-bus";
 		#address-cells = <2>;
-- 
2.19.1.1215.g8438c0b245-goog
