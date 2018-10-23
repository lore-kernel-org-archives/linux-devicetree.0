From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: [PATCH V2 2/8] dt-bindings: fsl: add imx7ulp pm related components
 bindings
Date: Tue, 23 Oct 2018 11:49:08 +0000
Message-ID: <1540295058-26090-3-git-send-email-aisheng.dong@nxp.com>
References: <1540295058-26090-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1540295058-26090-1-git-send-email-aisheng.dong@nxp.com>
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
Cc: "A.s. Dong" <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "dongas86@gmail.com" <dongas86@gmail.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

Add imx7ulp pm related components bindings

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v1->v2:
 * new patch
---
 .../bindings/arm/freescale/fsl,imx7ulp-pm.txt      | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-pm.txt

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-pm.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-pm.txt
new file mode 100644
index 0000000..75195be
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-pm.txt
@@ -0,0 +1,23 @@
+Freescale i.MX7ULP Power Management Components
+----------------------------------------------
+
+The Multi-System Mode Controller (MSMC) is responsible for sequencing
+the MCU into and out of all stop and run power modes. Specifically, it
+monitors events to trigger transitions between power modes while
+controlling the power, clocks, and memories of the MCU to achieve the
+power consumption and functionality of that mode.
+
+The WFI or WFE instruction is used to invoke a Sleep, Deep Sleep or
+Standby modes for either Cortex family. Run, Wait, and Stop are the
+common terms used for the primary operating modes of Kinetis
+microcontrollers.
+
+Required properties:
+- compatible:	Should be "fsl,imx7ulp-smc1".
+- reg:		Specifies base physical address and size of the register sets.
+
+Example:
+smc1: smc1@40410000 {
+	compatible = "fsl,imx7ulp-smc1";
+	reg = <0x40410000 0x1000>;
+};
-- 
2.7.4
