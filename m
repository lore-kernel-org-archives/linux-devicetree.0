From: Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH v2 1/6] dt-bindings: freescale: Add bindings for the tigerp
 module
Date: Tue, 10 Jul 2018 10:47:31 -0300
Message-ID: <1531230456-27717-1-git-send-email-fabio.estevam@nxp.com>
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
To: shawnguo@kernel.org
Cc: devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>, robh+dt@kernel.org, kernel@pengutronix.de, sebastian.reichel@collabora.co.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add bindings for the tigerp module present on i.MX51.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- Newly introduced in this series.

 Documentation/devicetree/bindings/arm/freescale/tigerp.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/freescale/tigerp.txt

diff --git a/Documentation/devicetree/bindings/arm/freescale/tigerp.txt b/Documentation/devicetree/bindings/arm/freescale/tigerp.txt
new file mode 100644
index 0000000..19e2aad
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/freescale/tigerp.txt
@@ -0,0 +1,12 @@
+* Freescale Tigerp platform module
+
+Required properties:
+- compatible : Should be "fsl,imx51-tigerp"
+- reg : Address and length of the register set for the device
+
+Example:
+
+tigerp: tigerp@83fa0000 {
+	compatible = "fsl,imx51-tigerp";
+	reg = <0x83fa0000 0x28>;
+};
-- 
2.7.4
