From: Erin Lo <erin.lo@mediatek.com>
Subject: [PATCH 2/5] arm: dts: mt2701: Add display bls related nodes for MT2701
Date: Tue, 1 Aug 2017 15:03:30 +0800
Message-ID: <1501571013-22327-3-git-send-email-erin.lo@mediatek.com>
References: <1501571013-22327-1-git-send-email-erin.lo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501571013-22327-1-git-send-email-erin.lo@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: srv_heupstream@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Weiqing Kong <weiqing.kong@mediatek.com>, Erin Lo <erin.lo@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Weiqing Kong <weiqing.kong@mediatek.com>

This patch adds the device node of display backlight for MT2701

Signed-off-by: Weiqing Kong <weiqing.kong@mediatek.com>
Signed-off-by: Erin Lo <erin.lo@mediatek.com>
---
 arch/arm/boot/dts/mt2701.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index 0619b86..2bcf739 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -529,6 +529,15 @@
 		#clock-cells = <1>;
 	};
 
+	bls: bls@1400a000 {
+		compatible = "mediatek,mt2701-disp-pwm";
+		reg = <0 0x1400a000 0 0x1000>;
+		#pwm-cells = <2>;
+		clocks = <&mmsys CLK_MM_MDP_BLS_26M>, <&mmsys CLK_MM_DISP_BLS>;
+		clock-names = "main", "mm";
+		status = "disabled";
+	};
+
 	larb0: larb@14010000 {
 		compatible = "mediatek,mt2701-smi-larb";
 		reg = <0 0x14010000 0 0x1000>;
-- 
1.9.1
