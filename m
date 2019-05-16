From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2 2/3] ARM: dts: rockchip: raise GPU trip point temperatures for veyron
Date: Thu, 16 May 2019 09:29:41 -0700
Message-ID: <20190516162942.154823-2-mka@chromium.org>
References: <20190516162942.154823-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190516162942.154823-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

The values match thorse used by the downstream Chrome OS 3.14
kernel, the 'official' kernel for veyron devices. Keep the critical
trip point for speedy at 90°C as in the downstream configuration.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v2:
- also raise temperature of critical trip point
- add entries at position in alphabetical order
- added entry to keep critical trip point for speedy at 90°C
- updated commit message
---
 arch/arm/boot/dts/rk3288-veyron-speedy.dts | 4 ++++
 arch/arm/boot/dts/rk3288-veyron.dtsi       | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-veyron-speedy.dts b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
index ab2a66aa337e..3d2769f1bef2 100644
--- a/arch/arm/boot/dts/rk3288-veyron-speedy.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
@@ -75,6 +75,10 @@
 	force-hpd;
 };
 
+&gpu_crit {
+	temperature = <90000>;
+};
+
 &panel {
 	power-supply= <&panel_regulator>;
 };
diff --git a/arch/arm/boot/dts/rk3288-veyron.dtsi b/arch/arm/boot/dts/rk3288-veyron.dtsi
index 58dc538b5df3..aee8350b2800 100644
--- a/arch/arm/boot/dts/rk3288-veyron.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron.dtsi
@@ -142,6 +142,14 @@
 	status = "okay";
 };
 
+&gpu_alert0 {
+	temperature = <72500>;
+};
+
+&gpu_crit {
+	temperature = <100000>;
+};
+
 &hdmi {
 	ddc-i2c-bus = <&i2c5>;
 	status = "okay";
-- 
2.21.0.1020.gf2820cf01a-goog
