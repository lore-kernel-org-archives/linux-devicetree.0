From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: freescale: Add bindings for the M4IF
 module
Date: Mon,  9 Jul 2018 15:19:13 -0300
Message-ID: <1531160355-12384-1-git-send-email-festevam@gmail.com>
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
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam@nxp.com>

Add bindings for the M4IF module present on i.MX51.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- Newly introduced in this series (Lucas)

 Documentation/devicetree/bindings/arm/freescale/m4if.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/freescale/m4if.txt

diff --git a/Documentation/devicetree/bindings/arm/freescale/m4if.txt b/Documentation/devicetree/bindings/arm/freescale/m4if.txt
new file mode 100644
index 0000000..93bd7b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/freescale/m4if.txt
@@ -0,0 +1,12 @@
+* Freescale Multi Master Multi Memory Interface (M4IF) module
+
+Required properties:
+- compatible : Should be "fsl,imx51-m4if"
+- reg : Address and length of the register set for the device
+
+Example:
+
+m4if: m4if@83fd8000 {
+	compatible = "fsl,imx51-m4if";
+	reg = <0x83fd8000 0x1000>;
+};
-- 
2.7.4
