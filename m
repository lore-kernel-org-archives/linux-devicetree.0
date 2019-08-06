From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 03/20] dt-bindings: ap80x: replace AP806 with AP80x
Date: Tue,  6 Aug 2019 16:54:43 +0200
Message-ID: <20190806145500.24109-4-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Yan Markman <ymarkman@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Gregory Clement <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Stefan Chulski <stefanc@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Ben Peled <bpeled@marvell.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Ben Peled <bpeled@marvell.com>

Rename the text file and update "AP806" into "AP806/AP807" where
relevant.

Signed-off-by: Ben Peled <bpeled@marvell.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 ...-controller.txt => ap80x-system-controller.txt} | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
 rename Documentation/devicetree/bindings/arm/marvell/{ap806-system-controller.txt => ap80x-system-controller.txt} (91%)

diff --git a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt b/Documentation/devicetree/bindings/arm/marvell/ap80x-system-controller.txt
similarity index 91%
rename from Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
rename to Documentation/devicetree/bindings/arm/marvell/ap80x-system-controller.txt
index 26410fbb85be..098d932fc963 100644
--- a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
+++ b/Documentation/devicetree/bindings/arm/marvell/ap80x-system-controller.txt
@@ -1,15 +1,15 @@
-Marvell Armada AP806 System Controller
+Marvell Armada AP80x System Controller
 ======================================
 
-The AP806 is one of the two core HW blocks of the Marvell Armada 7K/8K
-SoCs. It contains system controllers, which provide several registers
-giving access to numerous features: clocks, pin-muxing and many other
-SoC configuration items. This DT binding allows to describe these
-system controllers.
+The AP806/AP807 is one of the two core HW blocks of the Marvell Armada
+7K/8K/931x SoCs. It contains system controllers, which provide several
+registers giving access to numerous features: clocks, pin-muxing and
+many other SoC configuration items. This DT binding allows to describe
+these system controllers.
 
 For the top level node:
  - compatible: must be: "syscon", "simple-mfd";
- - reg: register area of the AP806 system controller
+ - reg: register area of the AP80x system controller
 
 SYSTEM CONTROLLER 0
 ===================
-- 
2.20.1
