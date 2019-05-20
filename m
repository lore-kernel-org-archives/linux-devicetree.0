From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2 2/3] ARM: dts: rockchip: Use the GPU to cool CPU thermal zone of veyron mickey
Date: Mon, 20 May 2019 15:00:50 -0700
Message-ID: <20190520220051.54847-2-mka@chromium.org>
References: <20190520220051.54847-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520220051.54847-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

On rk3288 the CPU and GPU temperatures are correlated. Limit the GPU
frequency on veyron mickey to 400 MHz for CPU temperatures >= 65°C
and to 300 MHz for CPU temperatures >= 85°C.

This matches the configuration of the downstream Chrome OS 3.14 kernel,
the 'official' kernel for mickey.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v2:
- added 'cpu_warm_limit_gpu' to throttle GPU for T.cpu >= 65°C
- removed comment saying that GPU isn't throttled beyond 400 MHz
  based on CPU temperature
- updated commit message

Note: this patch depends on "ARM: dts: rockchip: Add #cooling-cells
entry for rk3288 GPU" (https://lore.kernel.org/patchwork/patch/1075005/)
---
 arch/arm/boot/dts/rk3288-veyron-mickey.dts | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-veyron-mickey.dts b/arch/arm/boot/dts/rk3288-veyron-mickey.dts
index 52f6abc22291..34797abe3403 100644
--- a/arch/arm/boot/dts/rk3288-veyron-mickey.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-mickey.dts
@@ -75,9 +75,7 @@
 	cooling-maps {
 		/*
 		 * After 1st level, throttle the CPU down to as low as 1.4 GHz
-		 * and don't let the GPU go faster than 400 MHz.  Note that we
-		 * won't throttle the GPU lower than 400 MHz due to CPU
-		 * heat--we'll let the GPU do the rest itself.
+		 * and don't let the GPU go faster than 400 MHz.
 		 */
 		cpu_warm_limit_cpu {
 			trip = <&cpu_alert_warm>;
@@ -86,6 +84,10 @@
 					 <&cpu2 THERMAL_NO_LIMIT 4>,
 					 <&cpu3 THERMAL_NO_LIMIT 4>;
 		};
+		cpu_warm_limit_gpu {
+			trip = <&cpu_alert_warm>;
+			cooling-device = <&gpu 1 1>;
+		};
 
 		/*
 		 * Add some discrete steps to help throttling system deal
@@ -125,6 +127,12 @@
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
