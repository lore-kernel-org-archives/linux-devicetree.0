From: Marek Vasut <marex@denx.de>
Subject: [PATCH V5 1/3] dt-bindings: arm: fsl: Add devicetree binding for M53
 Menlo board.
Date: Fri, 12 Apr 2019 12:49:51 +0200
Message-ID: <20190412104953.9454-1-marex@denx.de>
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
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

Add devicetree binding for iMX53 SoC based M53 Menlo board.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: devicetree@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
---
V5: New patch
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 3c7ad36ebd35..597bff7b6d0e 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -67,6 +67,7 @@ properties:
               - fsl,imx53-evk
               - fsl,imx53-qsb
               - fsl,imx53-smd
+              - menlo,m53menlo
           - const: fsl,imx53
 
       - description: i.MX6Q based Boards
-- 
2.20.1
