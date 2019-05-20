From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 1/2] ARM: dts: rockchip: Limit GPU frequency on veyron mickey to 300 MHz when the CPU gets very hot
Date: Mon, 20 May 2019 10:01:31 -0700
Message-ID: <20190520170132.91571-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

On rk3288 the CPU and GPU temperatures are correlated. Limit the GPU
frequency on veyron mickey to 300 MHz for CPU temperatures >= 85°C.

This matches the configuration of the downstream Chrome OS 3.14 kernel,
the 'official' kernel for mickey.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Note: this patch depends on "ARM: dts: rockchip: Add #cooling-cells
entry for rk3288 GPU" (https://lore.kernel.org/patchwork/patch/1075005/)
---
 arch/arm/boot/dts/rk3288-veyron-mickey.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-veyron-mickey.dts b/arch/arm/boot/dts/rk3288-veyron-mickey.dts
index d889ab3c8235..f118d92a49d0 100644
--- a/arch/arm/boot/dts/rk3288-veyron-mickey.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-mickey.dts
@@ -125,6 +125,12 @@
 					 <&cpu2 8 THERMAL_NO_LIMIT>,
 					 <&cpu3 8 THERMAL_NO_LIMIT>;
 		};
+
+		/* At very hot, don't let GPU go over 300 MHz */
+		cpu_very_hot_limit_gpu {
+			trip = <&cpu_alert_very_hot>;
+			cooling-device = <&gpu 2 2>;
+		};
 	};
 };
 
-- 
2.21.0.1020.gf2820cf01a-goog
