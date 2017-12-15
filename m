From: Mathieu Malaterre <malat@debian.org>
Subject: [PATCH 07/25] arm: keystone: dts: Remove leading 0x and 0s from
 bindings notation
Date: Fri, 15 Dec 2017 13:46:38 +0100
Message-ID: <20171215124638.30233-1-malat@debian.org>
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
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Mathieu Malaterre <malat@debian.org>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Santosh Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Improve the DTS files by removing all the leading "0x" and zeros to fix the
following dtc warnings:

Warning (unit_address_format): Node /XXX unit name should not have leading "0x"

and

Warning (unit_address_format): Node /XXX unit name should not have leading 0s

Converted using the following command:

find . -type f \( -iname *.dts -o -iname *.dtsi \) -exec sed -i -e "s/@\([0-9a-fA-FxX\.;:#]+\)\s*{/@\L\1 {/g" -e "s/@0x\(.*\) {/@\1 {/g" -e "s/@0+\(.*\) {/@\1 {/g" {} +^C

For simplicity, two sed expressions were used to solve each warnings separately.

To make the regex expression more robust a few other issues were resolved,
namely setting unit-address to lower case, and adding a whitespace before the
the opening curly brace:

https://elinux.org/Device_Tree_Linux#Linux_conventions

This will solve as a side effect warning:

Warning (simple_bus_reg): Node /XXX@<UPPER> simple-bus unit address format error, expected "<lower>"

This is a follow up to commit 4c9847b7375a ("dt-bindings: Remove leading 0x from bindings notation")

Reported-by: David Daney <ddaney@caviumnetworks.com>
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 arch/arm/boot/dts/keystone-k2e-netcp.dtsi  | 2 +-
 arch/arm/boot/dts/keystone-k2hk-netcp.dtsi | 2 +-
 arch/arm/boot/dts/keystone-k2l-netcp.dtsi  | 2 +-
 arch/arm/boot/dts/keystone.dtsi            | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/keystone-k2e-netcp.dtsi b/arch/arm/boot/dts/keystone-k2e-netcp.dtsi
index ba828cb59587..940b64935bde 100644
--- a/arch/arm/boot/dts/keystone-k2e-netcp.dtsi
+++ b/arch/arm/boot/dts/keystone-k2e-netcp.dtsi
@@ -98,7 +98,7 @@ qmss: qmss@2a40000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
-		pdsp0@0x2a10000 {
+		pdsp0@2a10000 {
 			reg = <0x2a10000 0x1000    /*iram */
 			       0x2a0f000 0x100     /*reg*/
 			       0x2a0c000 0x3c8	   /*intd */
diff --git a/arch/arm/boot/dts/keystone-k2hk-netcp.dtsi b/arch/arm/boot/dts/keystone-k2hk-netcp.dtsi
index a5ac845464bf..ed7287a274a0 100644
--- a/arch/arm/boot/dts/keystone-k2hk-netcp.dtsi
+++ b/arch/arm/boot/dts/keystone-k2hk-netcp.dtsi
@@ -115,7 +115,7 @@ qmss: qmss@2a40000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
-		pdsp0@0x2a10000 {
+		pdsp0@2a10000 {
 			reg = <0x2a10000 0x1000    /*iram */
 			       0x2a0f000 0x100     /*reg*/
 			       0x2a0c000 0x3c8	   /*intd */
diff --git a/arch/arm/boot/dts/keystone-k2l-netcp.dtsi b/arch/arm/boot/dts/keystone-k2l-netcp.dtsi
index 66f615a74118..b6af5f78e498 100644
--- a/arch/arm/boot/dts/keystone-k2l-netcp.dtsi
+++ b/arch/arm/boot/dts/keystone-k2l-netcp.dtsi
@@ -97,7 +97,7 @@ qmss: qmss@2a40000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
-		pdsp0@0x2a10000 {
+		pdsp0@2a10000 {
 			reg = <0x2a10000 0x1000    /*iram */
 			       0x2a0f000 0x100     /*reg*/
 			       0x2a0c000 0x3c8	   /*intd */
diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
index 06e10544f9b1..f8ecbe504182 100644
--- a/arch/arm/boot/dts/keystone.dtsi
+++ b/arch/arm/boot/dts/keystone.dtsi
@@ -271,7 +271,7 @@
 			ti,davinci-gpio-unbanked = <32>;
 		};
 
-		aemif: aemif@21000A00 {
+		aemif: aemif@21000a00 {
 			compatible = "ti,keystone-aemif", "ti,davinci-aemif";
 			#address-cells = <2>;
 			#size-cells = <1>;
-- 
2.11.0
