From: Vignesh R <vigneshr@ti.com>
Subject: [PATCH 1/6] ARM: dts: keystone-k2g: Add QSPI DT entry
Date: Thu, 23 Nov 2017 13:21:49 +0530
Message-ID: <20171123075154.3938-2-vigneshr@ti.com>
References: <20171123075154.3938-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171123075154.3938-1-vigneshr@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vignesh R <vigneshr@ti.com>
List-Id: devicetree@vger.kernel.org

Add DT node for Cadence QSPI IP present in 66AK2G SoC.

Signed-off-by: Vignesh R <vigneshr@ti.com>
---
 arch/arm/boot/dts/keystone-k2g.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keystone-k2g.dtsi
index 8f313ff406b9..01d29320b04c 100644
--- a/arch/arm/boot/dts/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/keystone-k2g.dtsi
@@ -377,6 +377,20 @@
 			power-domains = <&k2g_pds 0xc>;
 			clocks = <&k2g_clks 0xc 1>, <&k2g_clks 0xc 2>;
 			clock-names = "fck", "mmchsdb_fck";
+		};
+
+		qspi: qspi@2940000 {
+			compatible = "ti,k2g-qspi", "cdns,qspi-nor";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x02940000 0x1000>,
+			      <0x24000000 0x4000000>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_EDGE_RISING>;
+			cdns,fifo-depth = <256>;
+			cdns,fifo-width = <4>;
+			cdns,trigger-address = <0x24000000>;
+			clocks = <&k2g_clks 0x43 0x0>;
+			power-domains = <&k2g_pds 0x43>;
 			status = "disabled";
 		};
 
-- 
2.15.0
