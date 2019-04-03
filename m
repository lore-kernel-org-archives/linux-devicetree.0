From: Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: [PATCH v2 2/5] dt-bindings: arm: add TQ boards
Date: Wed,  3 Apr 2019 08:44:24 +0200
Message-ID: <20190403064427.30041-3-bruno.thomsen@gmail.com>
References: <20190304165630.18225-1-bruno.thomsen@gmail.com>
 <20190403064427.30041-1-bruno.thomsen@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190403064427.30041-1-bruno.thomsen@gmail.com>
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
Cc: devicetree@vger.kernel.org, laa@kamstrup.com, festevam@gmail.com, s.hauer@pengutronix.de, clemens.ml@gmx.net, bruno.thomsen@gmail.com, bth@kamstrup.com, ksc@kamstrup.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, shawnguo@kernel.org, markus.niebel@tq-group.com
List-Id: devicetree@vger.kernel.org

MBa is a series of Carrier Boards / Single Board Computers (SBC) for
evaluation of TQMa SoMs.
The MBa7 carrier board can only interface with TQMa7 modules.
The TQMa7 module can only be mounted with NXP i.MX7 Solo or Dual SoCs.
Primary compatible strings are of the form "tq,<SoC>-<SBC>".

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
v2:
- Patch v1 2/6 and 3/6 has been merged as they both modify the new fsl.yaml.

 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 7e2cd6ad26bd..0610d85eb0fa 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -137,10 +137,17 @@ properties:
           - const: fsl,imx6ull # This seems odd. Should be last?
           - const: fsl,imx6ulz
 
+      - description: i.MX7S based Boards
+        items:
+          - enum:
+              - tq,imx7s-mba7             # i.MX7S TQ MBa7 with TQMa7S SoM
+          - const: fsl,imx7s
+
       - description: i.MX7D based Boards
         items:
           - enum:
               - fsl,imx7d-sdb             # i.MX7 SabreSD Board
+              - tq,imx7d-mba7             # i.MX7D TQ MBa7 with TQMa7D SoM
           - const: fsl,imx7d
 
       - description:
-- 
2.20.1
