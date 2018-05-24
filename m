From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH] ARM: dts: pxa3xx: fix MMC clocks
Date: Thu, 24 May 2018 19:43:39 +0200
Message-ID: <20180524174339.12236-1-daniel@zonque.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robert.jarzmik@free.fr, haojian.zhuang@gmail.com
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, Daniel Mack <daniel@zonque.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The clocks for the 3 MMC controllers on pxa3xx platforms are CLK_MMC1,
CLK_MMC2 and CLK_MMC3. CLK_MMC is only for pxa2xx.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 arch/arm/boot/dts/pxa3xx.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/pxa3xx.dtsi b/arch/arm/boot/dts/pxa3xx.dtsi
index 132cce03414f..7ffe06f1dcc0 100644
--- a/arch/arm/boot/dts/pxa3xx.dtsi
+++ b/arch/arm/boot/dts/pxa3xx.dtsi
@@ -174,7 +174,7 @@
 			compatible = "marvell,pxa-mmc";
 			reg = <0x41100000 0x1000>;
 			interrupts = <23>;
-			clocks = <&clks CLK_MMC>;
+			clocks = <&clks CLK_MMC1>;
 			dmas = <&pdma 21 3
 				&pdma 22 3>;
 			dma-names = "rx", "tx";
@@ -185,7 +185,7 @@
 			compatible = "marvell,pxa-mmc";
 			reg = <0x42000000 0x1000>;
 			interrupts = <41>;
-			clocks = <&clks CLK_MMC1>;
+			clocks = <&clks CLK_MMC2>;
 			dmas = <&pdma 93 3
 				&pdma 94 3>;
 			dma-names = "rx", "tx";
@@ -196,7 +196,7 @@
 			compatible = "marvell,pxa-mmc";
 			reg = <0x42500000 0x1000>;
 			interrupts = <55>;
-			clocks = <&clks CLK_MMC2>;
+			clocks = <&clks CLK_MMC3>;
 			dmas = <&pdma 46 3
 				&pdma 47 3>;
 			dma-names = "rx", "tx";
-- 
2.14.3
