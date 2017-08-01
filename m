From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 3/6] ARM: dts: keystone-k2g: Add eDMA nodes
Date: Tue, 1 Aug 2017 10:11:16 +0530
Message-ID: <20170801044119.16201-4-lokeshvutla@ti.com>
References: <20170801044119.16201-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170801044119.16201-1-lokeshvutla@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Device Tree Mailing List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Keerthy <j-keerthy@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>, Dave Gerlach <d-gerlach@ti.com>
List-Id: devicetree@vger.kernel.org

From: Peter Ujfalusi <peter.ujfalusi@ti.com>

Add nodes for eDMA0 and eDMA1.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 arch/arm/boot/dts/keystone-k2g.dtsi | 66 +++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keystone-k2g.dtsi
index f9ff29972295..3f1fd3df76d5 100644
--- a/arch/arm/boot/dts/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/keystone-k2g.dtsi
@@ -210,5 +210,71 @@
 			clocks = <&k2g_clks 0x001c 0x0>;
 			clock-names = "gpio";
 		};
+
+		edma0: edma@02700000 {
+			compatible = "ti,k2g-edma3-tpcc", "ti,edma3-tpcc";
+			reg =	<0x02700000 0x8000>;
+			reg-names = "edma3_cc";
+			interrupts = <GIC_SPI 200 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 216 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 217 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "edma3_ccint", "emda3_mperr",
+					  "edma3_ccerrint";
+			dma-requests = <64>;
+			#dma-cells = <2>;
+
+			ti,tptcs = <&edma0_tptc0 7>, <&edma0_tptc1 0>;
+
+			ti,edma-memcpy-channels = <32 33 34 35>;
+
+			power-domains = <&k2g_pds 0x3f>;
+		};
+
+		edma0_tptc0: tptc@02760000 {
+			compatible = "ti,k2g-edma3-tptc", "ti,edma3-tptc";
+			reg =	<0x02760000 0x400>;
+			power-domains = <&k2g_pds 0x3f>;
+		};
+
+		edma0_tptc1: tptc@02768000 {
+			compatible = "ti,k2g-edma3-tptc", "ti,edma3-tptc";
+			reg =	<0x02768000 0x400>;
+			power-domains = <&k2g_pds 0x3f>;
+		};
+
+		edma1: edma@02728000 {
+			compatible = "ti,k2g-edma3-tpcc", "ti,edma3-tpcc";
+			reg =	<0x02728000 0x8000>;
+			reg-names = "edma3_cc";
+			interrupts = <GIC_SPI 208 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 219 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 220 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "edma3_ccint", "emda3_mperr",
+					  "edma3_ccerrint";
+			dma-requests = <64>;
+			#dma-cells = <2>;
+
+			ti,tptcs = <&edma1_tptc0 7>, <&edma1_tptc1 0>;
+
+			/*
+			 * memcpy is disabled, can be enabled with:
+			 * ti,edma-memcpy-channels = <12 13 14 15>;
+			 * for example.
+			 */
+
+			power-domains = <&k2g_pds 0x4f>;
+		};
+
+		edma1_tptc0: tptc@027b0000 {
+			compatible = "ti,k2g-edma3-tptc", "ti,edma3-tptc";
+			reg =	<0x027b0000 0x400>;
+			power-domains = <&k2g_pds 0x4f>;
+		};
+
+		edma1_tptc1: tptc@027b8000 {
+			compatible = "ti,k2g-edma3-tptc", "ti,edma3-tptc";
+			reg =	<0x027b8000 0x400>;
+			power-domains = <&k2g_pds 0x4f>;
+		};
 	};
 };
-- 
2.13.0
