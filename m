From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 3/3] arm: dts: mt2701: Add reset-cells
Date: Fri,  1 Dec 2017 13:07:08 +0100
Message-ID: <20171201120708.30129-3-matthias.bgg@gmail.com>
References: <20171201120708.30129-1-matthias.bgg@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171201120708.30129-1-matthias.bgg@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: matthias.bgg@gmail.com, sboyd@codeaurora.org, sean.wang@mediatek.com, chen.zhong@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The hifsys and ethsys needs the definition of the reset-cells
property. Fix this.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 arch/arm/boot/dts/mt2701.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index 965ddfbc9953..05557fce0f1d 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -604,6 +604,7 @@
 		compatible = "mediatek,mt2701-hifsys", "syscon";
 		reg = <0 0x1a000000 0 0x1000>;
 		#clock-cells = <1>;
+		#reset-cells = <1>;
 	};
 
 	usb0: usb@1a1c0000 {
@@ -688,6 +689,7 @@
 		compatible = "mediatek,mt2701-ethsys", "syscon";
 		reg = <0 0x1b000000 0 0x1000>;
 		#clock-cells = <1>;
+		#reset-cells = <1>;
 	};
 
 	eth: ethernet@1b100000 {
-- 
2.12.3
