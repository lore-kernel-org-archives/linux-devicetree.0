From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 01/17] Documentation: dt-bindings: minimal documentation for
 MVEBU SDRAM controller
Date: Fri, 24 Oct 2014 13:59:14 +0200
Message-ID: <1414151970-6626-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1414151970-6626-1-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1414151970-6626-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, devicetree@vger.kernel.org, Tawfik Bayouk <tawfik@marvell.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The suspend/resume code for Armada XP has to modify certain registers
of the SDRAM controller. Therefore, we need to define a Device Tree
binding for this hardware block.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: devicetree@vger.kernel.org
Cc: Kumar Gala <galak@codeaurora.org>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>
---
 .../memory-controllers/mvebu-sdram-controller.txt   | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mvebu-sdram-controller.txt

diff --git a/Documentation/devicetree/bindings/memory-controllers/mvebu-sdram-controller.txt b/Documentation/devicetree/bindings/memory-controllers/mvebu-sdram-controller.txt
new file mode 100644
index 0000000..89657d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/mvebu-sdram-controller.txt
@@ -0,0 +1,21 @@
+Device Tree bindings for MVEBU SDRAM controllers
+
+The Marvell EBU SoCs all have a SDRAM controller. The SDRAM controller
+differs from one SoC variant to another, but they also share a number
+of commonalities.
+
+For now, this Device Tree binding documentation only documents the
+Armada XP SDRAM controller.
+
+Required properties:
+
+ - compatible: for Armada XP, "marvell,armada-xp-sdram-controller"
+ - reg: a resource specifier for the register space, which should
+   include all SDRAM controller registers as per the datasheet.
+
+Example:
+
+sdramc@1400 {
+	compatible = "marvell,armada-xp-sdram-controller";
+	reg = <0x1400 0x500>;
+};
-- 
2.0.0
