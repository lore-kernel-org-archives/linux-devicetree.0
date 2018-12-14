From: <honghui.zhang@mediatek.com>
Subject: [PATCH 3/4] arm: dts: mt7623: Remove un-used property for PCIe
Date: Fri, 14 Dec 2018 09:25:41 +0800
Message-ID: <1544750742-31419-4-git-send-email-honghui.zhang@mediatek.com>
References: <1544750742-31419-1-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544750742-31419-1-git-send-email-honghui.zhang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, ryder.lee@mediatek.com, matthias.bgg@gmail.com, robh+dt@kernel.org, robh@kernel.org
Cc: devicetree@vger.kernel.org, youlin.pei@mediatek.com, jianjun.wang@mediatek.com, Honghui Zhang <honghui.zhang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Honghui Zhang <honghui.zhang@mediatek.com>

The "num-lanes" property for PCIe is not used, remove it.

Signed-off-by: Honghui Zhang <honghui.zhang@mediatek.com>
---
 arch/arm/boot/dts/mt7623.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index 1cdc346..4ca56d8 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -734,7 +734,6 @@
 			interrupt-map-mask = <0 0 0 0>;
 			interrupt-map = <0 0 0 0 &sysirq GIC_SPI 193 IRQ_TYPE_LEVEL_LOW>;
 			ranges;
-			num-lanes = <1>;
 			status = "disabled";
 		};
 
@@ -746,7 +745,6 @@
 			interrupt-map-mask = <0 0 0 0>;
 			interrupt-map = <0 0 0 0 &sysirq GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
 			ranges;
-			num-lanes = <1>;
 			status = "disabled";
 		};
 
@@ -758,7 +756,6 @@
 			interrupt-map-mask = <0 0 0 0>;
 			interrupt-map = <0 0 0 0 &sysirq GIC_SPI 195 IRQ_TYPE_LEVEL_LOW>;
 			ranges;
-			num-lanes = <1>;
 			status = "disabled";
 		};
 	};
-- 
2.6.4
