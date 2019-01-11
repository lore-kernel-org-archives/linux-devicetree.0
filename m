From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V2 1/3] dt-bindings: fsl: add imx7ulp system integration
 module binding
Date: Fri, 11 Jan 2019 06:22:40 +0000
Message-ID: <1547187469-14046-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Add i.MX7ULP system integration module (SIM) binding.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 .../bindings/arm/freescale/fsl,imx7ulp-sim.txt           | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-sim.txt

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-sim.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-sim.txt
new file mode 100644
index 0000000..7d0c7f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-sim.txt
@@ -0,0 +1,16 @@
+Freescale i.MX7ULP System Integration Module
+----------------------------------------------
+The system integration module (SIM) provides system control and chip configuration
+registers. In this module, chip revision information is located in JTAG ID register,
+and a set of registers have been made available in DGO domain for SW use, with the
+objective to maintain its value between system resets.
+
+Required properties:
+- compatible:	Should be "fsl,imx7ulp-sim".
+- reg:		Specifies base physical address and size of the register sets.
+
+Example:
+sim: sim@410a3000 {
+	compatible = "fsl,imx7ulp-sim", "syscon";
+	reg = <0x410a3000 0x1000>;
+};
-- 
2.7.4
