From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 3/3] dt-bindings: arm: fsl: Add TQ TQMa6{S,Q,QP} on MBa6x
Date: Fri, 11 Oct 2019 16:36:51 +0200
Message-ID: <20191011143651.6424-3-p.zabel@pengutronix.de>
References: <20191011143651.6424-1-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191011143651.6424-1-p.zabel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de, Markus Niebel <Markus.Niebel@tq-group.com>
List-Id: devicetree@vger.kernel.org

Add binding documentation for the TQ MBa6x mainboard with TQMa6S,
TQMa6Q, or TQMa6QP SoM.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1b4b4e6573b5..8cc2d4a76e77 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -114,6 +114,8 @@ properties:
               - fsl,imx6q-sabresd
               - technologic,imx6q-ts4900
               - technologic,imx6q-ts7970
+              - tq,mba6a                  # TQ TQMa6Q SoM on MBa6x
+              - tq,mba6b
           - const: fsl,imx6q
 
       - description: i.MX6QP based Boards
@@ -121,6 +123,8 @@ properties:
           - enum:
               - fsl,imx6qp-sabreauto      # i.MX6 Quad Plus SABRE Automotive Board
               - fsl,imx6qp-sabresd        # i.MX6 Quad Plus SABRE Smart Device Board
+              - tq,mba6a                  # TQ TQMa6QP SoM on MBa6x
+              - tq,mba6b
           - const: fsl,imx6qp
 
       - description: i.MX6DL based Boards
@@ -133,6 +137,8 @@ properties:
               - fsl,imx6dl-sabresd        # i.MX6 DualLite SABRE Smart Device Board
               - technologic,imx6dl-ts4900
               - technologic,imx6dl-ts7970
+              - tq,mba6a                  # TQ TQMa6S SoM on MBa6x
+              - tq,mba6b
               - ysoft,imx6dl-yapp4-draco  # i.MX6 DualLite Y Soft IOTA Draco board
               - ysoft,imx6dl-yapp4-hydra  # i.MX6 DualLite Y Soft IOTA Hydra board
               - ysoft,imx6dl-yapp4-ursa   # i.MX6 Solo Y Soft IOTA Ursa board
-- 
2.20.1
