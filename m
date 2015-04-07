From: Howard Chen <howard.chen@linaro.org>
Subject: [PATCH v2] ARM: dts: mt8173: support arm64 cpuidle-dt
Date: Tue,  7 Apr 2015 16:05:05 +0800
Message-ID: <1428393905-32166-1-git-send-email-howard.chen@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Howard Chen <howard.chen@linaro.org>, Eddie Huang <eddie.huang@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

This patch adds an idle-states node to describe the mt8173 idle states and
also adds references to the idle-states node in all CPU nodes.

Signed-off-by: Howard Chen <howard.chen@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 8554ec3..0d31a34 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -48,6 +48,8 @@
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x000>;
+			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 		};
 
 		cpu1: cpu@1 {
@@ -55,6 +57,7 @@
 			compatible = "arm,cortex-a53";
 			reg = <0x001>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 		};
 
 		cpu2: cpu@100 {
@@ -62,6 +65,7 @@
 			compatible = "arm,cortex-a57";
 			reg = <0x100>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 		};
 
 		cpu3: cpu@101 {
@@ -69,6 +73,19 @@
 			compatible = "arm,cortex-a57";
 			reg = <0x101>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
+		};
+
+		idle-states {
+			entry-method = "arm,psci";
+
+			CPU_SLEEP_0: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x0010000>;
+				entry-latency-us = <639>;
+				exit-latency-us = <328>;
+				min-residency-us = <1088>;
+			};
 		};
 	};
 
-- 
1.9.1
