From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v1 2/4] dt-bindings: mailbox: provide imx-mailbox documentation
Date: Fri,  1 Jun 2018 08:58:19 +0200
Message-ID: <20180601065821.28234-3-o.rempel@pengutronix.de>
References: <20180601065821.28234-1-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180601065821.28234-1-o.rempel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 .../bindings/mailbox/imx-mailbox.txt          | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/imx-mailbox.txt

diff --git a/Documentation/devicetree/bindings/mailbox/imx-mailbox.txt b/Documentation/devicetree/bindings/mailbox/imx-mailbox.txt
new file mode 100644
index 000000000000..a45604b33039
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/imx-mailbox.txt
@@ -0,0 +1,35 @@
+i.MX Messaging Unit
+===================
+
+The i.MX Messaging Unit (MU) contains two register sets: "A" and "B". In most cases
+they are accessible from all Processor Units. On one hand, at least for mailbox functionality,
+it makes no difference which application or processor is using which set of the MU. On
+other hand, the register sets for each of the MU parts are not identical.
+
+Required properties:
+- compatible :	Shell be one of:
+                    "fsl,imx7s-mu-a" and "fsl,imx7s-mu-b" for i.MX7S or i.MX7D
+- reg : 	physical base address of the mailbox and length of
+		memory mapped region.
+- #mbox-cells:	Common mailbox binding property to identify the number
+		of cells required for the mailbox specifier. Should be 1.
+- interrupts :	interrupt number. The interrupt specifier format
+		depends on the interrupt controller parent.
+- clocks     :  phandle to the input clock.
+
+Example:
+	mu0a: mu@30aa0000 {
+		compatible = "fsl,imx7s-mu-a";
+		reg = <0x30aa0000 0x28>;
+		interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clks IMX7D_MU_ROOT_CLK>;
+		#mbox-cells = <1>;
+	};
+
+	mu0b: mu@30ab0000 {
+		compatible = "fsl,imx7s-mu-b";
+		reg = <0x30ab0000 0x28>;
+		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clks IMX7D_MU_ROOT_CLK>;
+		#mbox-cells = <1>;
+	};
-- 
2.17.1
