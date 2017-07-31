From: <sean.wang@mediatek.com>
Subject: [PATCH v5 10/10] arm: dts: mt7623: add clock-frequency to CPU nodes
Date: Mon, 31 Jul 2017 15:36:43 +0800
Message-ID: <878bfa648e0a8c4ec4e2a400e2b45a803e808abc.1501486190.git.sean.wang@mediatek.com>
References: <cover.1501486190.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1501486190.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: john@phrozen.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

Add clock-frequency property to CPU nodes. Avoids warnings like
[    0.001568] /cpus/cpu@0 missing clock-frequency property
[    0.001588] /cpus/cpu@1 missing clock-frequency property
[    0.001601] /cpus/cpu@2 missing clock-frequency property
[    0.001614] /cpus/cpu@3 missing clock-frequency property
at boot time

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 arch/arm/boot/dts/mt7623.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index 86cab5c..4ae0ab0 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -89,24 +89,28 @@
 			#cooling-cells = <2>;
 			cooling-min-level = <0>;
 			cooling-max-level = <7>;
+			clock-frequency = <1300000000>;
 		};
 		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0x1>;
 			operating-points-v2 = <&cpu_opp_table>;
+			clock-frequency = <1300000000>;
 		};
 		cpu2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0x2>;
 			operating-points-v2 = <&cpu_opp_table>;
+			clock-frequency = <1300000000>;
 		};
 		cpu3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0x3>;
 			operating-points-v2 = <&cpu_opp_table>;
+			clock-frequency = <1300000000>;
 		};
 	};
 
-- 
2.7.4
