From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH 07/14] arm64: dts: imx8: add adma lpcg clocks
Date: Thu, 21 Feb 2019 18:25:17 +0000
Message-ID: <1550773093-13349-8-git-send-email-aisheng.dong@nxp.com>
References: <1550773093-13349-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1550773093-13349-1-git-send-email-aisheng.dong@nxp.com>
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
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, Mark Rutland <mark.rutland@arm.com>, "dongas86@gmail.com" <dongas86@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

Add adma lpcg clocks

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi | 73 +++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi
index 5f0e9e3..c7adeba 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi
@@ -146,6 +146,79 @@ adma_subsys: bus@59000000 {
 		clock-output-names = "uart3_clk";
 	};
 
+	/* LPCG clocks */
+	uart0_lpcg: clock-controller@5a460000 {
+		reg = <0x5a460000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&uart0_clk>, <&adma_ipg_clk>;
+		bit-offset = <0 16>;
+		clock-output-names = "uart0_lpcg_baud_clk",
+				     "uart0_lpcg_ipg_clk";
+	};
+
+	uart1_lpcg: clock-controller@5a470000 {
+		reg = <0x5a470000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&uart1_clk>, <&adma_ipg_clk>;
+		bit-offset = <0 16>;
+		clock-output-names = "uart1_lpcg_baud_clk",
+				     "uart1_lpcg_ipg_clk";
+	};
+
+	uart2_lpcg: clock-controller@5a480000 {
+		reg = <0x5a480000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&uart2_clk>, <&adma_ipg_clk>;
+		bit-offset = <0 16>;
+		clock-output-names = "uart2_lpcg_baud_clk",
+				     "uart2_lpcg_ipg_clk";
+	};
+
+	uart3_lpcg: clock-controller@5a490000 {
+		reg = <0x5a490000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&uart3_clk>, <&adma_ipg_clk>;
+		bit-offset = <0 16>;
+		clock-output-names = "uart3_lpcg_baud_clk",
+				     "uart3_lpcg_ipg_clk";
+	};
+
+	i2c0_lpcg: clock-controller@5ac00000 {
+		reg = <0x5ac00000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&i2c0_clk>, <&adma_ipg_clk>;
+		bit-offset = <0 16>;
+		clock-output-names = "i2c0_lpcg_clk",
+				     "i2c0_lpcg_ipg_clk";
+	};
+
+	i2c1_lpcg: clock-controller@5ac10000 {
+		reg = <0x5ac10000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&i2c1_clk>, <&adma_ipg_clk>;
+		bit-offset = <0 16>;
+		clock-output-names = "i2c1_lpcg_clk",
+				     "i2c1_lpcg_ipg_clk";
+	};
+
+	i2c2_lpcg: clock-controller@5ac20000 {
+		reg = <0x5ac20000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&i2c2_clk>, <&adma_ipg_clk>;
+		bit-offset = <0 16>;
+		clock-output-names = "i2c2_lpcg_clk",
+				     "i2c2_lpcg_ipg_clk";
+	};
+
+	i2c3_lpcg: clock-controller@5ac30000 {
+		reg = <0x5ac30000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&i2c3_clk>, <&adma_ipg_clk>;
+		bit-offset = <0 16>;
+		clock-output-names = "i2c3_lpcg_clk",
+				     "i2c3_lpcg_ipg_clk";
+	};
+
 	adma_lpcg: clock-controller@59000000 {
 		reg = <0x59000000 0x2000000>;
 		#clock-cells = <1>;
-- 
2.7.4
