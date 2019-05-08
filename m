From: Wen He <wen.he_1@nxp.com>
Subject: [v1 2/4] arm64: dts: ls1028a: Add properties for HDP Controller.
Date: Wed, 8 May 2019 10:00:14 +0000
Message-ID: <20190508100136.7009-2-wen.he_1@nxp.com>
References: <20190508100136.7009-1-wen.he_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190508100136.7009-1-wen.he_1@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: Wen He <wen.he_1@nxp.com>, Leo Li <leoyang.li@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch enables the HDP controller driver on the LS1028A.

Signed-off-by: Alison Wang <aslion.wang@nxp.com>
Signed-off-by: Wen He <wen.he_1@nxp.com>
---
 .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index c0a13f9e5b95..158fdf26a117 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -91,6 +91,13 @@
 		clock-output-names= "pclk";
 	};
 
+	hdpclk: clock-hdpcore {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <162500000>;
+		clock-output-names= "hdpclk";
+	};
+
 	reboot {
 		compatible ="syscon-reboot";
 		regmap = <&dcfg>;
@@ -467,7 +474,25 @@
 
 		port {
 			dp0_out: endpoint {
+				remote-endpoint = <&dp1_out>;
+			};
+		};
+	};
 
+	hdp: display@f200000 {
+		compatible = "fsl,ls1028a-dp";
+		reg = <0x0 0xf1f0000 0x0 0xffff>,
+		    <0x0 0xf200000 0x0 0xfffff>;
+		interrupts = <0 221 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&sysclk>, <&hdpclk>, <&dpclk>,
+			 <&dpclk>, <&dpclk>, <&pclk>, <&dpclk>;
+		clock-names = "clk_ipg", "clk_core", "clk_pxl",
+			      "clk_pxl_mux", "clk_pxl_link", "clk_apb",
+			      "clk_vif";
+
+		port {
+			dp1_out: endpoint {
+				remote-endpoint = <&dp0_out>;
 			};
 		};
 	};
-- 
2.17.1
