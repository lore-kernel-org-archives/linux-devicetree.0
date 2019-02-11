From: Seiya Wang <seiya.wang@mediatek.com>
Subject: [PATCH v1 1/2] arm64: dts: mt8173: correct cpu type of cpu2 and cpu3
 to cortex-a72
Date: Mon, 11 Feb 2019 15:15:54 +0800
Message-ID: <20190211071555.31430-1-seiya.wang@mediatek.com>
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
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, Seiya Wang <seiya.wang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The cpu type of cpu2 and cpu3 should be cortex-a72, not cortex-a57.

Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 44374c506a1c..99675c51577a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -178,12 +178,12 @@
 
 		cpu2: cpu@100 {
 			device_type = "cpu";
-			compatible = "arm,cortex-a57";
+			compatible = "arm,cortex-a72";
 			reg = <0x100>;
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			#cooling-cells = <2>;
-			clocks = <&infracfg CLK_INFRA_CA57SEL>,
+			clocks = <&infracfg CLK_INFRA_CA72SEL>,
 				 <&apmixedsys CLK_APMIXED_MAINPLL>;
 			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster1_opp>;
@@ -191,12 +191,12 @@
 
 		cpu3: cpu@101 {
 			device_type = "cpu";
-			compatible = "arm,cortex-a57";
+			compatible = "arm,cortex-a72";
 			reg = <0x101>;
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			#cooling-cells = <2>;
-			clocks = <&infracfg CLK_INFRA_CA57SEL>,
+			clocks = <&infracfg CLK_INFRA_CA72SEL>,
 				 <&apmixedsys CLK_APMIXED_MAINPLL>;
 			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster1_opp>;
-- 
2.14.1
