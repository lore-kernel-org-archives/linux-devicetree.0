From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v2 3/4] ARM: dts: imx7s: add i.MX7 messaging unit support
Date: Fri, 15 Jun 2018 11:51:06 +0200
Message-ID: <20180615095107.24610-4-o.rempel@pengutronix.de>
References: <20180615095107.24610-1-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180615095107.24610-1-o.rempel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>
Cc: devicetree@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, kernel@pengutronix.de, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Define the Messaging Unit (MU) for i.MX7 in the processor's dtsi.
The respective driver is added in the next commit.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 arch/arm/boot/dts/imx7s.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index d9437e773b37..87a82c1f4dfd 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -1008,6 +1008,24 @@
 				status = "disabled";
 			};
 
+			mu0a: mailbox@30aa0000 {
+				compatible = "fsl,imx7s-mu-a";
+				reg = <0x30aa0000 0x10000>;
+				interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX7D_MU_ROOT_CLK>;
+				#mbox-cells = <1>;
+				status = "disabled";
+			};
+
+			mu0b: mailbox@30ab0000 {
+				compatible = "fsl,imx7s-mu-b";
+				reg = <0x30ab0000 0x10000>;
+				interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX7D_MU_ROOT_CLK>;
+				#mbox-cells = <1>;
+				status = "disabled";
+			};
+
 			usbotg1: usb@30b10000 {
 				compatible = "fsl,imx7d-usb", "fsl,imx27-usb";
 				reg = <0x30b10000 0x200>;
-- 
2.17.1
