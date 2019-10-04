From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 17/21] dt-bindings: marvell: Declare the CN913x SoC
 compatibles
Date: Fri,  4 Oct 2019 16:27:34 +0200
Message-ID: <20191004142738.7370-18-miquel.raynal@bootlin.com>
References: <20191004142738.7370-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191004142738.7370-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Yan Markman <ymarkman@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Gregory Clement <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Stefan Chulski <stefanc@marvell.com>, Marcin Wojtas <mw@semihalf.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Grzegorz Jaszczyk <jaz@semihalf.com>

Describe the compatible properties for the new Marvell SoCs:
* CN9130: 1x AP807-quad + 1x CP115 (1x embedded)
* CN9131: 1x AP807-quad + 2x CP115 (1x embedded + 1x modular)
* CN9132: 1x AP807-quad + 3x CP115 (1x embedded + 2x modular)

CP115 are similar to CP110 in terms of features.

There are three development boards based on these SoCs:
* CN9130-DB: comes as a single mother board (with the CP115 bundled)
* CN9131-DB: same as CN9130-DB with one additional modular CP115
* CN9132-DB: same as CN9130-DB with two additional modular CP115

Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../bindings/arm/marvell/armada-7k-8k.yaml    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
index 294595e00028..a9828c50c0fb 100644
--- a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
+++ b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
@@ -38,3 +38,24 @@ properties:
           - const: marvell,armada8040
           - const: marvell,armada-ap806-quad
           - const: marvell,armada-ap806
+
+      - description: Armada CN9130 SoC with no external CP
+        items:
+          - const: marvell,cn9130
+          - const: marvell,armada-ap807-quad
+          - const: marvell,armada-ap807
+
+      - description: Armada CN9131 SoC with one external CP
+        items:
+          - const: marvell,cn9131
+          - const: marvell,cn9130
+          - const: marvell,armada-ap807-quad
+          - const: marvell,armada-ap807
+
+      - description: Armada CN9132 SoC with two external CPs
+        items:
+          - const: marvell,cn9132
+          - const: marvell,cn9131
+          - const: marvell,cn9130
+          - const: marvell,armada-ap807-quad
+          - const: marvell,armada-ap807
-- 
2.20.1
