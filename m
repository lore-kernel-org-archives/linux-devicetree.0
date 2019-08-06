From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 16/20] dt-bindings: marvell: Declare the CN913x SoC compatibles
Date: Tue,  6 Aug 2019 16:54:56 +0200
Message-ID: <20190806145500.24109-17-miquel.raynal@bootlin.com>
References: <20190806145500.24109-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190806145500.24109-1-miquel.raynal@bootlin.com>
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
 .../bindings/arm/marvell/armada-7k-8k.txt           | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.txt b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.txt
index df98a9c82a8c..8eb34ca4c4f0 100644
--- a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.txt
+++ b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.txt
@@ -1,7 +1,7 @@
 Marvell Armada 7K/8K Platforms Device Tree Bindings
 ---------------------------------------------------
 
-Boards using a SoC of the Marvell Armada 7K or 8K families must carry
+Boards using a SoC of the Marvell Armada 7K/8K or CN913x families must carry
 the following root node property:
 
  - compatible, with one of the following values:
@@ -18,6 +18,17 @@ the following root node property:
    - "marvell,armada8040", "marvell,armada-ap806-quad", "marvell,armada-ap806"
       when the SoC being used is the Armada 8040
 
+   - "marvell,cn9130", "marvell,armada-ap807-quad", "marvell,armada-ap807"
+      when the SoC being used is the Armada CN9130 with no external CP.
+
+   - "marvell,cn9131", "marvell,cn9130",
+     "marvell,armada-ap807-quad", "marvell,armada-ap807"
+      when the SoC being used is the Armada CN9130 with one external CP.
+
+   - "marvell,cn9132", "marvell,cn9131", "marvell,cn9130",
+     "marvell,armada-ap807-quad", "marvell,armada-ap807"
+      when the SoC being used is the Armada CN9130 with two external CPs.
+
 Example:
 
 compatible = "marvell,armada7040-db", "marvell,armada7040",
-- 
2.20.1
