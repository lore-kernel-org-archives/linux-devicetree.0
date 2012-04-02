From: Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH] ARM: DT: Add binding for GIC virtualization extentions (VGIC)
Date: Mon,  2 Apr 2012 17:30:17 +0100
Message-ID: <1333384217-13441-1-git-send-email-marc.zyngier@arm.com>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

The GICv2 can have virtualization extension support, consisting
of an additional set of registers and interrupts. Add the necessary
binding to the GIC DT documentation.

Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
---
 Documentation/devicetree/bindings/arm/gic.txt |   29 +++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/gic.txt b/Documentation/devicetree/bindings/arm/gic.txt
index 9b4b82a..fb1b5ab 100644
--- a/Documentation/devicetree/bindings/arm/gic.txt
+++ b/Documentation/devicetree/bindings/arm/gic.txt
@@ -57,3 +57,32 @@ Example:
 		      <0xfff10100 0x100>;
 	};
 
+
+* GIC virtualization extensions (VGIC)
+
+For ARM cores that support the virtualization extensions, an
+additional node describes the VGIC hardware block. Only exists if the
+GIC is the primary interrupt controller.
+
+Required properties:
+- compatible : should be one of:
+	"arm,cortex-a15-vgic"
+	"arm,cortex-a7-vgic"
+	"arm,vgic"
+
+- reg : Specifies base physical address and size of the VGIC
+  registers. The first region is the GIC virtual interface control
+  register base and size.  the 2nd region is the GIC virtual cpu
+  interface register base and size.
+
+- interrupts : VGIC maintainance interrupt. Must be relative to the
+  primary GIC.
+
+Example:
+
+	vgic@2c004000 {
+		compatible = "arm,cortex-a15-vgic", "arm,vgic";
+		reg = <0x2c004000 0x2000>,
+		      <0x2c006000 0x2000>;
+		interrupts = <1 9 0xf04>;
+	};
-- 
1.7.7.1
