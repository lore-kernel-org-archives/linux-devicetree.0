From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: [PATCH V3 01/10] dt-bindings: fsl: add compatible for imx7ulp evk
Date: Wed, 31 Oct 2018 14:42:55 +0000
Message-ID: <1540996688-23681-2-git-send-email-aisheng.dong@nxp.com>
References: <1540996688-23681-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1540996688-23681-1-git-send-email-aisheng.dong@nxp.com>
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

Cc: devicetree@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
index 7b964d8..9c7c788 100644
--- a/Documentation/devicetree/bindings/arm/fsl.txt
+++ b/Documentation/devicetree/bindings/arm/fsl.txt
@@ -101,6 +101,10 @@ i.MX7 SabreSD Board
 Required root node properties:
     - compatible = "fsl,imx7d-sdb", "fsl,imx7d";
 
+i.MX7ULP Evaluation Kit
+Required root node properties:
+    - compatible = "fsl,imx7ulp-evk", "fsl,imx7ulp";
+
 Generic i.MX boards
 -------------------
 
@@ -123,6 +127,10 @@ i.MX6q generic board
 Required root node properties:
     - compatible = "fsl,imx6q";
 
+i.MX7ULP generic board
+Required root node properties:
+    - compatible = "fsl,imx7ulp";
+
 Freescale Vybrid Platform Device Tree Bindings
 ----------------------------------------------
 
-- 
2.7.4
