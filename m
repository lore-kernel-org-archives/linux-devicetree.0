From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v10 2/4] dt-bindings: mailbox: imx-mu: add generic MU channel
 support
Date: Fri,  3 Aug 2018 07:29:17 +0200
Message-ID: <20180803052919.820-3-o.rempel@pengutronix.de>
References: <20180803052919.820-1-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180803052919.820-1-o.rempel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Each MU has four pairs of rx/tx data register with four rx/tx interrupts
which can also be used as a separate channel.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 .../devicetree/bindings/mailbox/fsl,mu.txt    | 26 ++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/fsl,mu.txt b/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
index 90e4905dfc69..f3cf77eb5ab4 100644
--- a/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
+++ b/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
@@ -18,11 +18,31 @@ Messaging Unit Device Node:
 Required properties:
 -------------------
 - compatible :	should be "fsl,<chip>-mu", the supported chips include
-		imx8qxp, imx8qm.
+		imx6sx, imx7s, imx8qxp, imx8qm.
+		The "fsl,imx6sx-mu" compatible is seen as generic and should
+		be included together with SoC specific compatible.
 - reg :		Should contain the registers location and length
 - interrupts :	Interrupt number. The interrupt specifier format depends
 		on the interrupt controller parent.
-- #mbox-cells:  Must be 0. Number of cells in a mailbox
+- #mbox-cells:  Must be 2.
+			  <&phandle type channel>
+			    phandle   : Label name of controller
+			    type      : Channel type
+			    channel   : Channel number
+
+		This MU support 4 type of unidirectional channels, each type
+		has 4 channels. A total of 16 channels. Following types are
+		supported:
+		0 - TX channel with 32bit transmit register and IRQ transmit
+		acknowledgment support.
+		1 - RX channel with 32bit receive register and IRQ support
+		2 - TX doorbell channel. Without own register and no ACK support.
+		3 - RX doorbell channel.
+
+Optional properties:
+-------------------
+- clocks :	phandle to the input clock.
+- fsl,mu-side-b : Should be set for side B MU.
 
 Examples:
 --------
@@ -30,5 +50,5 @@ lsio_mu0: mailbox@5d1b0000 {
 	compatible = "fsl,imx8qxp-mu";
 	reg = <0x0 0x5d1b0000 0x0 0x10000>;
 	interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
-	#mbox-cells = <0>;
+	#mbox-cells = <2>;
 };
-- 
2.18.0
