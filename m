From: Seiya Wang <seiya.wang@mediatek.com>
Subject: [PATCH v1 1/1] arm64: dts: mt8173: add pmu nodes for mt8173
Date: Wed, 9 Jan 2019 16:21:43 +0800
Message-ID: <20190109082143.26468-1-seiya.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com, Seiya Wang <seiya.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

This patch adds the device nodes of ARM Performance Monitor Uint
for mt8173.

Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 412ffd4d426b..44374c506a1c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -216,6 +216,20 @@
 		};
 	};
 
+	pmu_a53 {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_SPI 9 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-affinity = <&cpu0>, <&cpu1>;
+	};
+
+	pmu_a72 {
+		compatible = "arm,cortex-a72-pmu";
+		interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_SPI 13 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-affinity = <&cpu2>, <&cpu3>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0", "arm,psci-0.2", "arm,psci";
 		method = "smc";
-- 
2.14.1
