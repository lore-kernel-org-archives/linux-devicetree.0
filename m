From: Michael Kao <michael.kao@mediatek.com>
Subject: [PATCH 4/4] arm64: dts: mt8183: Configure CPU cooling
Date: Wed, 14 Aug 2019 18:06:49 +0800
Message-ID: <1565777209-21869-5-git-send-email-michael.kao@mediatek.com>
References: <1565777209-21869-1-git-send-email-michael.kao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565777209-21869-1-git-send-email-michael.kao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, hsinyi@chromium.org
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Matthias Kaehlcke <mka@chromium.org>, Michael Kao <michael.kao@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Matthias Kaehlcke <mka@chromium.org>

Add SoC temperature threshold at 68°C and target at 80°C.
Add trip points and cooling maps for big and litter clusters.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Michael Kao <michael.kao@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 55 ++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index bc42b82..6611d29 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -411,6 +411,61 @@
 				polling-delay = <500>;
 				thermal-sensors = <&thermal 0>;
 				sustainable-power = <4500>;
+
+				trips {
+					threshold: trip-point@0 {
+						temperature = <68000>;
+						hysteresis = <2000>;
+						type = "passive";
+					};
+
+					target: trip-point@1 {
+						temperature = <80000>;
+						hysteresis = <2000>;
+						type = "passive";
+					};
+
+					cpu_crit: cpu-crit {
+						temperature = <115000>;
+						hysteresis = <2000>;
+						type = "critical";
+					};
+				};
+
+				cooling-maps {
+					map0 {
+						trip = <&target>;
+						cooling-device = <&cpu0
+							THERMAL_NO_LIMIT
+							THERMAL_NO_LIMIT>,
+								 <&cpu1
+							THERMAL_NO_LIMIT
+							THERMAL_NO_LIMIT>,
+								 <&cpu2
+							THERMAL_NO_LIMIT
+							THERMAL_NO_LIMIT>,
+								 <&cpu3
+							THERMAL_NO_LIMIT
+							THERMAL_NO_LIMIT>;
+						contribution = <3072>;
+					};
+					map1 {
+						trip = <&target>;
+						cooling-device = <&cpu4
+							THERMAL_NO_LIMIT
+							14>,
+								 <&cpu5
+							THERMAL_NO_LIMIT
+							14>,
+								 <&cpu6
+							THERMAL_NO_LIMIT
+							14>,
+								 <&cpu7
+							THERMAL_NO_LIMIT
+							14>;
+						contribution = <1024>;
+					};
+				};
 			};
 
 			/* The tzts1 ~ tzts6 don't need to polling */
-- 
1.9.1
