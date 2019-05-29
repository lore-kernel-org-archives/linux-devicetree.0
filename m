From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 4/6] arm64: dts: k3-am6: Add PCIe Root Complex DT node
Date: Wed, 29 May 2019 14:48:10 +0530
Message-ID: <20190529091812.20764-5-kishon@ti.com>
References: <20190529091812.20764-1-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529091812.20764-1-kishon@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: devicetree@vger.kernel.org

Add PCIe Root Complex DT node.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 53 ++++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am65.dtsi      |  1 +
 2 files changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 443de60576f8..09f18b1e70f2 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -265,6 +265,21 @@
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x00100000 0x1c000>;
 
+		pcie0_mode: pcie-mode@4060 {
+			compatible = "syscon";
+			reg = <0x00004060 0x4>;
+		};
+
+		pcie1_mode: pcie-mode@4070 {
+			compatible = "syscon";
+			reg = <0x00004070 0x4>;
+		};
+
+		pcie_devid: pcie-devid@210 {
+			compatible = "syscon";
+			reg = <0x00000210 0x4>;
+		};
+
 		serdes0_clk: serdes_clk@4080 {
 			compatible = "syscon";
 			reg = <0x00004080 0x4>;
@@ -358,4 +373,42 @@
 		clock-names = "wkupclk", "refclk";
 		#phy-cells = <0>;
 	};
+
+	pcie0_rc: pcie@5500000 {
+		compatible = "ti,am654-pcie-rc";
+		reg =  <0x0 0x5500000 0x0 0x1000>, <0x0 0x5501000 0x0 0x1000>, <0x0 0x10000000 0x0 0x2000>, <0x0 0x5506000 0x0 0x1000>;
+		reg-names = "app", "dbics", "config", "atu";
+		power-domains = <&k3_pds 120>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges = <0x81000000 0 0          0x0 0x10020000 0 0x00010000
+			  0x82000000 0 0x10030000 0x0 0x10030000 0 0x07FD0000>;
+		ti,syscon-pcie-id = <&pcie_devid>;
+		ti,syscon-pcie-mode = <&pcie0_mode>;
+		bus-range = <0x0 0xff>;
+		num-viewport = <16>;
+		max-link-speed = <3>;
+		dma-coherent;
+		interrupts = <GIC_SPI 340 IRQ_TYPE_EDGE_RISING>;
+		msi-map = <0x0 &gic_its 0x0 0x10000>;
+	};
+
+	pcie1_rc: pcie@5600000 {
+		compatible = "ti,am654-pcie-rc";
+		reg =  <0x0 0x5600000 0x0 0x1000>, <0x0 0x5601000 0x0 0x1000>, <0x0 0x18000000 0x0 0x2000>, <0x0 0x5606000 0x0 0x1000>;
+		reg-names = "app", "dbics", "config", "atu";
+		power-domains = <&k3_pds 121>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges = <0x81000000 0 0          0x0   0x18020000 0 0x00010000
+			  0x82000000 0 0x18030000 0x0   0x18030000 0 0x07FD0000>;
+		ti,syscon-pcie-id = <&pcie_devid>;
+		ti,syscon-pcie-mode = <&pcie1_mode>;
+		bus-range = <0x0 0xff>;
+		num-viewport = <16>;
+		max-link-speed = <3>;
+		dma-coherent;
+		interrupts = <GIC_SPI 355 IRQ_TYPE_EDGE_RISING>;
+		msi-map = <0x0 &gic_its 0x10000 0x10000>;
+	};
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am65.dtsi b/arch/arm64/boot/dts/ti/k3-am65.dtsi
index 50f4be2047a9..5a021321d4ed 100644
--- a/arch/arm64/boot/dts/ti/k3-am65.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65.dtsi
@@ -68,6 +68,7 @@
 			 <0x00 0x00900000 0x00 0x00900000 0x00 0x00012000>, /* serdes */
 			 <0x00 0x01000000 0x00 0x01000000 0x00 0x0af02400>, /* Most peripherals */
 			 <0x00 0x30800000 0x00 0x30800000 0x00 0x0bc00000>, /* MAIN NAVSS */
+			 <0x00 0x10000000 0x00 0x10000000 0x00 0x10000000>, /* PCIe DAT */
 			 /* MCUSS Range */
 			 <0x00 0x28380000 0x00 0x28380000 0x00 0x03880000>,
 			 <0x00 0x40200000 0x00 0x40200000 0x00 0x00900100>,
-- 
2.17.1
