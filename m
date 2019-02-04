From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH] ARM: dts: imx6qdl-phytec-pfla02: add missing
 interrupt-controller property
Date: Mon,  4 Feb 2019 14:33:33 +0100
Message-ID: <20190204133333.13338-1-m.felsch@pengutronix.de>
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
To: shawnguo@kernel.org, fabio.estevam@nxp.com, linux-imx@nxp.com, robh+dt@kernel.org, c.hemp@phytec.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

The DA9063 device need the required "interrupt-controller" property as
documented by the bindings [1].

[1] Documentation/devicetree/bindings/mfd/da9063.txt

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi b/arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi
index 1b50b01e9bac..1bfa41e01a0c 100644
--- a/arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi
@@ -117,6 +117,7 @@
 		reg = <0x58>;
 		interrupt-parent = <&gpio2>;
 		interrupts = <9 IRQ_TYPE_LEVEL_LOW>; /* active-low GPIO2_9 */
+		interrupt-controller;
 
 		regulators {
 			vddcore_reg: bcore1 {
-- 
2.20.1
