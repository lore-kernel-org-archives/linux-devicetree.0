From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 2/2] arm64: dts: r8a7795: Add Cortex-A53 PMU node
Date: Fri, 24 Feb 2017 14:59:28 +0100
Message-ID: <1487944768-31983-3-git-send-email-geert+renesas@glider.be>
References: <1487944768-31983-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1487944768-31983-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Dirk Behme <dirk.behme@gmail.com>, Takeshi Kihara <takeshi.kihara.df@renesas.com>, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Enable the performance monitor unit for the Cortex-A53 cores on the
R8A7795 SoC.

Extracted from a patch by Takeshi Kihara in the BSP.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - New.
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index d8e70d75781acaa0..e0d70e5ad167a10d 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -350,6 +350,18 @@
 					     <&a57_3>;
 		};
 
+		pmu_a53 {
+			compatible = "arm,cortex-a53-pmu";
+			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-affinity = <&a53_0>,
+					     <&a53_1>,
+					     <&a53_2>,
+					     <&a53_3>;
+		};
+
 		timer {
 			compatible = "arm,armv8-timer";
 			interrupts = <GIC_PPI 13
-- 
2.7.4
