From: <ryder.lee@kernel.org>
Subject: [PATCH 1/2] arm: dts: mt7623: add Mali-450 device node
Date: Wed, 24 Jul 2019 17:00:59 +0800
Message-ID: <af7b5a2e00eb3a4b6262807c378e43afd5f74779.1563867856.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Weijie Gao <weijie.gao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Ryder Lee <ryder.lee@mediatek.com>

Add a node for Mali-450.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
kmscube as well as X11 EGL tests work fine (use Lima driver).
---
 arch/arm/boot/dts/mt7623.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index a79f0b6c3429..6a9c5afb9a36 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2017-2018 MediaTek Inc.
  * Author: John Crispin <john@phrozen.org>
  *	   Sean Wang <sean.wang@mediatek.com>
+ *	   Ryder Lee <ryder.lee@mediatek.com>
  *
  */
 
@@ -733,6 +734,30 @@
 		#reset-cells = <1>;
 	};
 
+	mali: gpu@13040000 {
+		compatible = "mediatek,mt7623-mali", "arm,mali-450";
+		reg = <0 0x13040000 0 0x30000>;
+		interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_SPI 171 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_SPI 172 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_SPI 173 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_SPI 174 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_SPI 175 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_SPI 176 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_SPI 177 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_SPI 178 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_SPI 179 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_SPI 180 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "gp", "gpmmu", "pp0", "ppmmu0", "pp1",
+				  "ppmmu1", "pp2", "ppmmu2", "pp3", "ppmmu3",
+				  "pp";
+		clocks = <&topckgen CLK_TOP_MMPLL>,
+			 <&g3dsys CLK_G3DSYS_CORE>;
+		clock-names = "bus", "core";
+		power-domains = <&scpsys MT2701_POWER_DOMAIN_MFG>;
+		resets = <&g3dsys MT2701_G3DSYS_CORE_RST>;
+	};
+
 	mmsys: syscon@14000000 {
 		compatible = "mediatek,mt7623-mmsys",
 			     "mediatek,mt2701-mmsys",
-- 
2.18.0
