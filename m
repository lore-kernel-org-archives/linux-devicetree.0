From: Henry Chen <henryc.chen@mediatek.com>
Subject: [PATCH v4 7/7] dts: mediatek: Enable clock support for Mediatek
 MT8173.
Date: Fri, 30 Jan 2015 13:13:18 +0800
Message-ID: <1422594798-13375-8-git-send-email-henryc.chen@mediatek.com>
References: <1422594798-13375-1-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1422594798-13375-1-git-send-email-henryc.chen@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, jamesjj.liao@mediatek.com, Vladimir Murzin <vladimir.murzin@arm.com>, Russell King <linux@arm.linux.org.uk>, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, henryc.chen@mediatek.com, devicetree@vger.kernel.org, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, "Joe.C" <yingjoe.chen@mediatek.com>, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: James Liao <jamesjj.liao@mediatek.com>

This patch adds MT8173 clock controllers into device tree.

Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 46 ++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 41c1441..31ccad3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -11,6 +11,8 @@
  * GNU General Public License for more details.
  */
 
+#include <dt-bindings/clock/mt8173-clk.h>
+
 / {
 	compatible = "mediatek,mt8173";
 	interrupt-parent = <&sysirq>;
@@ -78,6 +80,26 @@
 		affinity_info = <0x84000004>;
 	};
 
+	clocks {
+		clk_null: clk_null {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <0>;
+		};
+
+		clk26m: clk26m {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <26000000>;
+		};
+
+		clk32k: clk32k {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32000>;
+		};
+	};
+
 	uart_clk: dummy26m {
 		compatible = "fixed-clock";
 		clock-frequency = <26000000>;
@@ -99,6 +121,24 @@
 		compatible = "simple-bus";
 		ranges;
 
+		topckgen: topckgen@10000000 {
+			compatible = "mediatek,mt8173-topckgen";
+			reg = <0 0x10000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		infracfg: infracfg@10001000 {
+			compatible = "mediatek,mt8173-infracfg";
+			reg = <0 0x10001000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		pericfg: pericfg@10003000 {
+			compatible = "mediatek,mt8173-pericfg";
+			reg = <0 0x10003000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		sysirq: intpol-controller@10200620 {
 			compatible = "mediatek,mt8173-sysirq", "mediatek,mt6577-sysirq";
 			interrupt-controller;
@@ -107,6 +147,12 @@
 			reg = <0 0x10200620 0 0x20>;
 		};
 
+		apmixedsys: apmixedsys@10209000 {
+			compatible = "mediatek,mt8173-apmixedsys";
+			reg = <0 0x10209000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		gic: interrupt-controller@10220000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
-- 
1.8.1.1.dirty
