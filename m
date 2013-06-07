From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 09/14] ARM: mvebu: Add MBus to Armada 370/XP device tree
Date: Fri,  7 Jun 2013 13:47:46 -0300
Message-ID: <1370623671-7748-10-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1370623671-7748-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1370623671-7748-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Armada 370/XP SoC family has a completely configurable address
space handled by the MBus controller.

This patch introduces the device tree layout of MBus, making the
'soc' node as mbus-compatible.
Since every peripheral/controller is a child of this 'soc' node,
this makes all of them sit behind the mbus, thus describing the
hardware accurately.

A translation entry has been added for the internal-regs mapping.
This can't be done in the common armada-370-xp.dtsi because A370
and AXP have different addressing width.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/armada-370-xp.dtsi             | 6 ++----
 arch/arm/boot/dts/armada-370.dtsi                | 6 ++++--
 arch/arm/boot/dts/armada-xp-gp.dts               | 3 ---
 arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts | 3 ---
 arch/arm/boot/dts/armada-xp.dtsi                 | 4 ++++
 5 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/armada-370-xp.dtsi b/arch/arm/boot/dts/armada-370-xp.dtsi
index 52a1f5e..68d9fa1 100644
--- a/arch/arm/boot/dts/armada-370-xp.dtsi
+++ b/arch/arm/boot/dts/armada-370-xp.dtsi
@@ -29,18 +29,16 @@
 	};
 
 	soc {
-		#address-cells = <1>;
+		#address-cells = <2>;
 		#size-cells = <1>;
 		compatible = "simple-bus";
 		interrupt-parent = <&mpic>;
-		ranges = <0          0 0xd0000000 0x0100000 /* internal registers */
-			  0xe0000000 0 0xe0000000 0x8100000 /* PCIe */>;
 
 		internal-regs {
 			compatible = "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
+			ranges = <0 0 0 0x100000>;
 
 			mpic: interrupt-controller@20000 {
 				compatible = "marvell,mpic";
diff --git a/arch/arm/boot/dts/armada-370.dtsi b/arch/arm/boot/dts/armada-370.dtsi
index aee2b18..54cd3ef 100644
--- a/arch/arm/boot/dts/armada-370.dtsi
+++ b/arch/arm/boot/dts/armada-370.dtsi
@@ -29,8 +29,10 @@
 	};
 
 	soc {
-		ranges = <0          0xd0000000 0x0100000 /* internal registers */
-			  0xe0000000 0xe0000000 0x8100000 /* PCIe */>;
+		compatible = "marvell,armada370-mbus", "simple-bus";
+		reg = <0xd0020000 0x100>, <0xd0020180 0x20>;
+		ranges = <0 0 0xd0000000 0x100000>;
+
 		internal-regs {
 			system-controller@18200 {
 				compatible = "marvell,armada-370-xp-system-controller";
diff --git a/arch/arm/boot/dts/armada-xp-gp.dts b/arch/arm/boot/dts/armada-xp-gp.dts
index 3ee63d1..26ad06f 100644
--- a/arch/arm/boot/dts/armada-xp-gp.dts
+++ b/arch/arm/boot/dts/armada-xp-gp.dts
@@ -39,9 +39,6 @@
 	};
 
 	soc {
-		ranges = <0          0 0xd0000000 0x100000
-			  0xf0000000 0 0xf0000000 0x1000000>;
-
 		internal-regs {
 			serial@12000 {
 				clock-frequency = <250000000>;
diff --git a/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts b/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
index 46b7850..f14d36c 100644
--- a/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
+++ b/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
@@ -27,9 +27,6 @@
 	};
 
 	soc {
-		ranges = <0          0 0xd0000000 0x100000
-			  0xf0000000 0 0xf0000000 0x8000000>;
-
 		internal-regs {
 			serial@12000 {
 				clock-frequency = <250000000>;
diff --git a/arch/arm/boot/dts/armada-xp.dtsi b/arch/arm/boot/dts/armada-xp.dtsi
index 1ee8540..a3865f7 100644
--- a/arch/arm/boot/dts/armada-xp.dtsi
+++ b/arch/arm/boot/dts/armada-xp.dtsi
@@ -23,6 +23,10 @@
 	compatible = "marvell,armadaxp", "marvell,armada-370-xp";
 
 	soc {
+		compatible = "marvell,armadaxp-mbus", "simple-bus";
+		reg = <0 0xd0020000 0 0x100>, <0 0xd0020180 0 0x20>;
+		ranges = <0 0 0 0xd0000000 0x100000>;
+
 		internal-regs {
 			L2: l2-cache {
 				compatible = "marvell,aurora-system-cache";
-- 
1.8.1.5
