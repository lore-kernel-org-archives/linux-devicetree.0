From: Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 2/4] dt-bindings: arm: fsl: add mu binding doc
Date: Sat, 28 Apr 2018 02:46:14 +0800
Message-ID: <1524854776-14863-3-git-send-email-aisheng.dong@nxp.com>
References: <1524854776-14863-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1524854776-14863-1-git-send-email-aisheng.dong@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Mark Rutland <mark.rutland@arm.com>, dongas86@gmail.com, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org
List-Id: devicetree@vger.kernel.org

The Messaging Unit module enables two processors within
the SoC to communicate and coordinate by passing messages
(e.g. data, status and control) through the MU interface.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 .../devicetree/bindings/arm/freescale/fsl,mu.txt   | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,mu.txt

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,mu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,mu.txt
new file mode 100644
index 0000000..a7ceb1f
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,mu.txt
@@ -0,0 +1,33 @@
+NXP i.MX Messaging Unit (MU)
+--------------------------------------------------------------------
+
+The Messaging Unit module enables two processors within the SoC to
+communicate and coordinate by passing messages (e.g. data, status
+and control) through the MU interface. The MU also provides the ability
+for one processor to signal the other processor using interrupts.
+
+Because the MU manages the messaging between processors, the MU uses
+different clocks (from each side of the different peripheral buses).
+Therefore, the MU must synchronize the accesses from one side to the
+other. The MU accomplishes synchronization using two sets of matching
+registers (Processor A-facing, Processor Bfacing).
+
+Messaging Unit Device Node:
+=============================
+
+Required properties:
+-------------------
+- compatible :	should be "fsl,<chip>-mu", the supported chips include
+		imx6sx, imx7d, imx7ulp, imx8qxp, imx8qm, imx8mq.
+- reg :		Should contain the registers location and length
+- interrupts :	Interrupt number. The interrupt specifier format depends
+		on the interrupt controller parent.
+
+Examples:
+--------
+lsio_mu0: mu@5d1b0000 {
+	compatible = "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
+	reg = <0x0 0x5d1b0000 0x0 0x10000>;
+	interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+	status = "okay";
+};
-- 
2.7.4
