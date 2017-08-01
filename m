From: Vignesh R <vigneshr@ti.com>
Subject: [PATCH 4/7] ARM: dts: keystone-k2g: Add QSPI DT entry
Date: Tue, 1 Aug 2017 10:24:31 +0530
Message-ID: <20170801045434.8733-5-vigneshr@ti.com>
References: <20170801045434.8733-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170801045434.8733-1-vigneshr@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Vignesh R <vigneshr@ti.com>
List-Id: devicetree@vger.kernel.org

Add DT node for Cadence QSPI IP present in 66AK2G SoC.

Signed-off-by: Vignesh R <vigneshr@ti.com>
---
 arch/arm/boot/dts/keystone-k2g.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keystone-k2g.dtsi
index bf4d1fa30840..95327aabfaa4 100644
--- a/arch/arm/boot/dts/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/keystone-k2g.dtsi
@@ -168,5 +168,20 @@
 				#reset-cells = <2>;
 			};
 		};
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
+			status = "disabled";
+		};
 	};
 };
-- 
2.13.3
