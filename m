From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: arm: Move Emtrion i.MX6 board bindings to schema
Date: Mon, 17 Jun 2019 14:44:23 -0600
Message-ID: <20190617204423.2880-1-robh@kernel.org>
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
To: devicetree@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, Jan Tuerk <jan.tuerk@emtrion.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The Emtrion board bindings landed when the i.MX board/SoC bindings were
being converted to DT schema. Add them to the schema and remove the
separate file.

Cc: Jan Tuerk <jan.tuerk@emtrion.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/emtrion.txt | 12 ------------
 Documentation/devicetree/bindings/arm/fsl.yaml    |  4 ++++
 2 files changed, 4 insertions(+), 12 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/emtrion.txt

diff --git a/Documentation/devicetree/bindings/arm/emtrion.txt b/Documentation/devicetree/bindings/arm/emtrion.txt
deleted file mode 100644
index 83329aefc483..000000000000
--- a/Documentation/devicetree/bindings/arm/emtrion.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-Emtrion Devicetree Bindings
-===========================
-
-emCON Series:
--------------
-
-Required root node properties
-	- compatible:
-	- "emtrion,emcon-mx6", "fsl,imx6q"; 		: emCON-MX6D or emCON-MX6Q SoM
-	- "emtrion,emcon-mx6-avari", "fsl,imx6q";	: emCON-MX6D or emCON-MX6Q SoM on Avari Base
-	- "emtrion,emcon-mx6", "fsl,imx6dl"; 		: emCON-MX6S or emCON-MX6DL SoM
-	- "emtrion,emcon-mx6-avari", "fsl,imx6dl";	: emCON-MX6S or emCON-MX6DL SoM on Avari Base
diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 407138ebc0d0..fbeb56345b35 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -80,6 +80,8 @@ properties:
       - description: i.MX6Q based Boards
         items:
           - enum:
+              - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM
+              - emtrion,emcon-mx6-avari   # emCON-MX6D or emCON-MX6Q SoM on Avari Base
               - fsl,imx6q-arm2
               - fsl,imx6q-sabreauto
               - fsl,imx6q-sabrelite
@@ -99,6 +101,8 @@ properties:
         items:
           - enum:
               - eckelmann,imx6dl-ci4x10
+              - emtrion,emcon-mx6         # emCON-MX6S or emCON-MX6DL SoM
+              - emtrion,emcon-mx6-avari   # emCON-MX6S or emCON-MX6DL SoM on Avari Base
               - fsl,imx6dl-sabreauto      # i.MX6 DualLite/Solo SABRE Automotive Board
               - fsl,imx6dl-sabresd        # i.MX6 DualLite SABRE Smart Device Board
               - technologic,imx6dl-ts4900
-- 
2.20.1
