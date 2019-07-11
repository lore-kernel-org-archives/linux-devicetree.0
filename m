From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v2 4/4] arm64: dts: marvell: armada-ap806: add smmu support
Date: Thu, 11 Jul 2019 17:02:42 +0200
Message-ID: <20190711150242.25290-5-gregory.clement@bootlin.com>
References: <20190711150242.25290-1-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190711150242.25290-1-gregory.clement@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Antoine Tenart <antoine.tenart@bootlin.com>, =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>
List-Id: devicetree@vger.kernel.org

Add IOMMU node for Marvell AP806 based SoCs.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/arm64/boot/dts/marvell/armada-ap806.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
index 91dad7e4ee59..8e29d593970a 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
@@ -115,6 +115,23 @@
 				interrupts = <17>;
 			};
 
+			smmu: iommu@5000000 {
+				compatible = "marvell,mmu-500";
+				reg = <0x100000 0x100000>;
+				dma-coherent;
+				#iommu-cells = <1>;
+				#global-interrupts = <1>;
+				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					    <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					    <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					    <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					    <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					    <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					    <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					    <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					    <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
 			odmi: odmi@300000 {
 				compatible = "marvell,odmi-controller";
 				interrupt-controller;
-- 
2.20.1
