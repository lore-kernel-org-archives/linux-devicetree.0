From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: add mu binding doc
Date: Mon, 16 Jul 2018 13:42:07 +0200
Message-ID: <20180716114209.25242-2-o.rempel@pengutronix.de>
References: <20180716114209.25242-1-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180716114209.25242-1-o.rempel@pengutronix.de>
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
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Messaging Unit module enables two processors within
the SoC to communicate and coordinate by passing messages
(e.g. data, status and control) through the MU interface.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 .../devicetree/bindings/mailbox/fsl,mu.txt    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/fsl,mu.txt

diff --git a/Documentation/devicetree/bindings/mailbox/fsl,mu.txt b/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
new file mode 100644
index 000000000000..5d48dd75b98d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
@@ -0,0 +1,32 @@
+NXP i.MX Messaging Unit (MU)
+--------------------------------------------------------------------
+
+Required properties:
+-------------------
+- compatible :	should be "fsl,<chip>-mu", the supported chips include:
+		imx6sx	- i.MX 6SoloX
+		imx7d	- i.MX 7Dual
+		imx7s	- i.MX 7Solo
+		imx7ulp	- i.MX 7ULP
+		imx8qm	- i.MX 8QM
+		imx8qxp	- i.MX 8QXP
+- reg :		Should contain the registers location and length
+- interrupts :	Interrupt number. The interrupt specifier format depends
+		on the interrupt controller parent.
+- #mbox-cells:  Must be:
+		0 - for single channel mode. i.MX8* SCU protocol specific.
+		1 - for multichannel (generic) mode.
+
+Optional properties:
+-------------------
+- clocks :	phandle to the input clock.
+- fsl,mu-side-a : Should be set for side A MU.
+
+Examples:
+--------
+lsio_mu0: mailbox@5d1b0000 {
+	compatible = "fsl,imx8qxp-mu";
+	reg = <0x0 0x5d1b0000 0x0 0x10000>;
+	interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+	#mbox-cells = <0>;
+};
-- 
2.18.0
