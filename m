From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 4/4] arm64: dts: marvell: describe the PIC and PMU on Armada 7K/8K
Date: Fri,  5 Aug 2016 16:55:21 +0200
Message-ID: <1470408921-447-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470408921-447-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470408921-447-1-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>
Cc: linux-arm-kernel@lists.infradead.org, Shadi Ammouri <shadi@marvell.com>, Yehuda Yitschak <yehuday@marvell.com>, Omri Itach <omrii@marvell.com>, Hanna Hawa <hannah@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

This commit adds the necessary Device Tree description for the PIC
interrupt controller and the PMU available in the Marvell Armada 7K and
Armada 8K SoCs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/arm64/boot/dts/marvell/armada-ap806.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
index eab1a42..e70b996 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
@@ -128,6 +128,12 @@
 					     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_EDGE_RISING)>;
 			};
 
+			pmu {
+				compatible = "arm,cortex-a72-pmu";
+				interrupt-parent = <&pic>;
+				interrupts = <17>;
+			};
+
 			odmi: odmi@300000 {
 				compatible = "marvell,odmi-controller";
 				interrupt-controller;
@@ -140,6 +146,14 @@
 				marvell,spi-base = <128>, <136>, <144>, <152>;
 			};
 
+			pic: interrupt-controller@3f0100 {
+				compatible = "marvell,armada-8k-pic";
+				reg = <0x3f0100 0x10>;
+				#interrupt-cells = <1>;
+				interrupt-controller;
+				interrupts = <GIC_PPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
 			xor@400000 {
 				compatible = "marvell,armada-7k-xor", "marvell,xor-v2";
 				reg = <0x400000 0x1000>,
-- 
2.7.4
