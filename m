From: <honghui.zhang@mediatek.com>
Subject: [PATCH 4/4] arm64: dts: mt7622: Remove un-used property for PCIe
Date: Fri, 14 Dec 2018 09:25:42 +0800
Message-ID: <1544750742-31419-5-git-send-email-honghui.zhang@mediatek.com>
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
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index de2c47bd..f619eb5 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -750,7 +750,6 @@
 			ranges;
 			status = "disabled";
 
-			num-lanes = <1>;
 			interrupt-map-mask = <0 0 0 7>;
 			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
 					<0 0 0 2 &pcie_intc0 1>,
@@ -771,7 +770,6 @@
 			ranges;
 			status = "disabled";
 
-			num-lanes = <1>;
 			interrupt-map-mask = <0 0 0 7>;
 			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
 					<0 0 0 2 &pcie_intc1 1>,
-- 
2.6.4
