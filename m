From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 5/6] arm64: dts: k3-am6: Add PCIe Endpoint DT node
Date: Wed, 29 May 2019 14:48:11 +0530
Message-ID: <20190529091812.20764-6-kishon@ti.com>
References: <20190529091812.20764-1-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529091812.20764-1-kishon@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: devicetree@vger.kernel.org

Add PCIe Endpoint DT node.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 09f18b1e70f2..fb8a13d670d2 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -393,6 +393,19 @@
 		msi-map = <0x0 &gic_its 0x0 0x10000>;
 	};
 
+	pcie0_ep: pcie-ep@5500000 {
+		compatible = "ti,am654-pcie-ep";
+		reg =  <0x0 0x5500000 0x0 0x1000>, <0x0 0x5501000 0x0 0x1000>, <0x0 0x10000000 0x0 0x8000000>, <0x0 0x5506000 0x0 0x1000>;
+		reg-names = "app", "dbics", "addr_space", "atu";
+		power-domains = <&k3_pds 120>;
+		ti,syscon-pcie-mode = <&pcie0_mode>;
+		num-ib-windows = <16>;
+		num-ob-windows = <16>;
+		max-link-speed = <3>;
+		dma-coherent;
+		interrupts = <GIC_SPI 340 IRQ_TYPE_EDGE_RISING>;
+	};
+
 	pcie1_rc: pcie@5600000 {
 		compatible = "ti,am654-pcie-rc";
 		reg =  <0x0 0x5600000 0x0 0x1000>, <0x0 0x5601000 0x0 0x1000>, <0x0 0x18000000 0x0 0x2000>, <0x0 0x5606000 0x0 0x1000>;
@@ -411,4 +424,17 @@
 		interrupts = <GIC_SPI 355 IRQ_TYPE_EDGE_RISING>;
 		msi-map = <0x0 &gic_its 0x10000 0x10000>;
 	};
+
+	pcie1_ep: pcie-ep@5600000 {
+		compatible = "ti,am654-pcie-ep";
+		reg =  <0x0 0x5600000 0x0 0x1000>, <0x0 0x5601000 0x0 0x1000>, <0x0 0x18000000 0x0 0x4000000>, <0x0 0x5606000 0x0 0x1000>;
+		reg-names = "app", "dbics", "addr_space", "atu";
+		power-domains = <&k3_pds 121>;
+		ti,syscon-pcie-mode = <&pcie1_mode>;
+		num-ib-windows = <16>;
+		num-ob-windows = <16>;
+		max-link-speed = <3>;
+		dma-coherent;
+		interrupts = <GIC_SPI 355 IRQ_TYPE_EDGE_RISING>;
+	};
 };
-- 
2.17.1
