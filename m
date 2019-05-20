From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 2/2] ARM: dts: rockchip: Configure the GPU thermal zone for mickey
Date: Mon, 20 May 2019 10:01:32 -0700
Message-ID: <20190520170132.91571-2-mka@chromium.org>
References: <20190520170132.91571-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520170132.91571-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

mickey crams a lot of hardware into a tiny package, which requires
more aggressive thermal throttling than for devices with a larger
footprint. Configure the GPU thermal zone to throttle the GPU
progressively at temperatures >= 60°C. Heat dissipated by the
CPUs also affects the GPU temperature, hence we cap the CPU
frequency to 1.4 GHz for temperatures above 65°C. Further throttling
of the CPUs may be performed by the CPU thermal zone.

The configuration matches that of the downstram Chrome OS 3.14
kernel, the 'official' kernel for mickey.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Note: this patch depends on "ARM: dts: rockchip: Add #cooling-cells
entry for rk3288 GPU" (https://lore.kernel.org/patchwork/patch/1075005/)
---
 arch/arm/boot/dts/rk3288-veyron-mickey.dts | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-veyron-mickey.dts b/arch/arm/boot/dts/rk3288-veyron-mickey.dts
index f118d92a49d0..f0b83afa2a60 100644
--- a/arch/arm/boot/dts/rk3288-veyron-mickey.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-mickey.dts
@@ -138,6 +138,70 @@
 	/delete-property/mmc-hs200-1_8v;
 };
 
+&gpu_thermal {
+	/delete-node/ trips;
+	/delete-node/ cooling-maps;
+
+	trips {
+		gpu_alert_warmish: gpu_alert_warmish {
+			temperature = <60000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "passive";
+		};
+		gpu_alert_warm: gpu_alert_warm {
+			temperature = <65000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "passive";
+		};
+		gpu_alert_hotter: gpu_alert_hotter {
+			temperature = <84000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "passive";
+		};
+		gpu_alert_very_very_hot: gpu_alert_very_very_hot {
+			temperature = <86000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "passive";
+		};
+		gpu_crit: gpu_crit {
+			temperature = <90000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "critical";
+		};
+	};
+
+	cooling-maps {
+		/* After 1st level throttle the GPU down to as low as 400 MHz */
+		gpu_warmish_limit_gpu {
+			trip = <&gpu_alert_warmish>;
+			cooling-device = <&gpu THERMAL_NO_LIMIT 1>;
+		};
+
+		/*
+		 * Slightly after we throttle the GPU, we'll also make sure that
+		 * the CPU can't go faster than 1.4 GHz.  Note that we won't
+		 * throttle the CPU lower than 1.4 GHz due to GPU heat--we'll
+		 * let the CPU do the rest itself.
+		 */
+		gpu_warm_limit_cpu {
+			trip = <&gpu_alert_warm>;
+			cooling-device = <&cpu0 4 4>;
+		};
+
+		/* When hot, GPU goes down to 300 MHz */
+		gpu_hotter_limit_gpu {
+			trip = <&gpu_alert_hotter>;
+			cooling-device = <&gpu 2 2>;
+		};
+
+		/* When really hot, don't let GPU go _above_ 300 MHz */
+		gpu_very_very_hot_limit_gpu {
+			trip = <&gpu_alert_very_very_hot>;
+			cooling-device = <&gpu 2 THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
 &i2c2 {
 	status = "disabled";
 };
-- 
2.21.0.1020.gf2820cf01a-goog
