From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 1/2] dts: rockchip: raise GPU trip point temperature for veyron to 72.5 degC
Date: Wed, 15 May 2019 08:31:26 -0700
Message-ID: <20190515153127.24626-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

This value matches what is used by the downstream Chrome OS 3.14
kernel, the 'official' kernel for veyron devices.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 arch/arm/boot/dts/rk3288-veyron.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-veyron.dtsi b/arch/arm/boot/dts/rk3288-veyron.dtsi
index 1252522392c7..169da06e1c09 100644
--- a/arch/arm/boot/dts/rk3288-veyron.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron.dtsi
@@ -446,6 +446,14 @@
 	status = "okay";
 };
 
+&gpu_thermal {
+	trips {
+		gpu_alert0: gpu_alert0 {
+			temperature = <72500>; /* millicelsius */
+		};
+	};
+};
+
 &pinctrl {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <
-- 
2.21.0.1020.gf2820cf01a-goog
