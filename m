From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH] arm64: dts: imx8mq: Add on-chip OTP controller node
Date: Mon, 28 Jan 2019 19:43:43 +0000
Message-ID: <20190128194343.13713-1-ccaione@baylibre.com>
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
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de, abel.vesa@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Carlo Caione <ccaione@baylibre.com>
List-Id: devicetree@vger.kernel.org

Add the node for the OTP controller. The IP is the same as on the imx7d.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 892063a7c26c..9a5205f08f3a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -234,6 +234,14 @@
 				reg = <0x30340000 0x10000>;
 			};
 
+			ocotp: ocotp-ctrl@30350000 {
+				compatible = "fsl,imx7d-ocotp", "syscon";
+				reg = <0x30350000 0x10000>;
+				clocks = <&clk IMX8MQ_CLK_OCOTP_ROOT>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+			};
+
 			anatop: syscon@30360000 {
 				compatible = "fsl,imx8mq-anatop", "syscon";
 				reg = <0x30360000 0x10000>;
-- 
2.19.1
