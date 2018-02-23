From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [RFC PATCH] ARM: dts: ls1021a: add size-cells and address-cells to
 scfg and dcfg nodes
Date: Fri, 23 Feb 2018 14:31:14 +0100
Message-ID: <20180223133114.7091-1-rasmus.villemoes@prevas.dk>
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
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rasmus Villemoes <rasmus.villemoes@prevas.dk>
List-Id: devicetree@vger.kernel.org

A single u32 is sufficient to specify a register in the Device
Configuration Unit/Supplemental Configuration Unit. Moreover, they only
consist of 32 bit registers (for the DCFG we even have "These registers
only support 32-bit accesses." according to the reference manual), so no
size specification is needed.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
None of the in-tree .dts files using ls1021a.dtsi currently define a
subnode of either node. It is possible, though somewhat unlikely, that
some out-of-tree .dts file is built against the in-tree ls1021a.dtsi,
and I don't know if such files are treated the same as out-of-tree
modules (i.e., they get to fix the breakage).

The reason I'm proposing to add these is that I'm about to add a subnode
of scfg with a reg property, and if possible I'd like to avoid the
somewhat clumsy

  reg = <0 0x1ac 0 4>;

when reg = <0x1ac>; would convey the same information. But if the
#address-cells and #size-cells properties are set in stone once the
.dtsi is in mainline, I'll just accept the clumsiness.

arch/arm/boot/dts/ls1021a.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index c31dad98f989..3c9fadcd611d 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -159,6 +159,8 @@
 		dcfg: dcfg@1ee0000 {
 			compatible = "fsl,ls1021a-dcfg", "syscon";
 			reg = <0x0 0x1ee0000 0x0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			big-endian;
 		};
 
@@ -202,6 +204,8 @@
 		scfg: scfg@1570000 {
 			compatible = "fsl,ls1021a-scfg", "syscon";
 			reg = <0x0 0x1570000 0x0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			big-endian;
 		};
 
-- 
2.15.1
