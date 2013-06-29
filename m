From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v5 08/12] ARM: mvebu: Add MBus to Armada 370/XP device tree
Date: Sat, 29 Jun 2013 16:04:11 -0300
Message-ID: <1372532655-20321-9-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1372532655-20321-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1372532655-20321-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
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
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
 arch/arm/boot/dts/armada-370-db.dts              |  2 ++
 arch/arm/boot/dts/armada-370-mirabox.dts         |  2 ++
 arch/arm/boot/dts/armada-370-rd.dts              |  2 ++
 arch/arm/boot/dts/armada-370-xp.dtsi             | 15 ++++++++++-----
 arch/arm/boot/dts/armada-370.dtsi                |  4 ++--
 arch/arm/boot/dts/armada-xp-db.dts               |  2 ++
 arch/arm/boot/dts/armada-xp-gp.dts               |  4 +---
 arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts |  4 +---
 arch/arm/boot/dts/armada-xp.dtsi                 |  2 ++
 9 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/armada-370-db.dts b/arch/arm/boot/dts/armada-370-db.dts
index 231f8b2..4f08b4d 100644
--- a/arch/arm/boot/dts/armada-370-db.dts
+++ b/arch/arm/boot/dts/armada-370-db.dts
@@ -30,6 +30,8 @@
 	};
 
 	soc {
+		ranges = <MBUS_ID(0xf0, 0x01) 0 0xd0000000 0x100000>;
+
 		internal-regs {
 			serial@12000 {
 				clock-frequency = <200000000>;
diff --git a/arch/arm/boot/dts/armada-370-mirabox.dts b/arch/arm/boot/dts/armada-370-mirabox.dts
index 7005f27..df30065 100644
--- a/arch/arm/boot/dts/armada-370-mirabox.dts
+++ b/arch/arm/boot/dts/armada-370-mirabox.dts
@@ -25,6 +25,8 @@
 	};
 
 	soc {
+		ranges = <MBUS_ID(0xf0, 0x01) 0 0xd0000000 0x100000>;
+
 		internal-regs {
 			serial@12000 {
 				clock-frequency = <200000000>;
diff --git a/arch/arm/boot/dts/armada-370-rd.dts b/arch/arm/boot/dts/armada-370-rd.dts
index 5c3a1ec..7601b24 100644
--- a/arch/arm/boot/dts/armada-370-rd.dts
+++ b/arch/arm/boot/dts/armada-370-rd.dts
@@ -28,6 +28,8 @@
 	};
 
 	soc {
+		ranges = <MBUS_ID(0xf0, 0x01) 0 0xd0000000 0x100000>;
+
 		internal-regs {
 			serial@12000 {
 				clock-frequency = <200000000>;
diff --git a/arch/arm/boot/dts/armada-370-xp.dtsi b/arch/arm/boot/dts/armada-370-xp.dtsi
index 52a1f5e..98f540b 100644
--- a/arch/arm/boot/dts/armada-370-xp.dtsi
+++ b/arch/arm/boot/dts/armada-370-xp.dtsi
@@ -18,6 +18,8 @@
 
 /include/ "skeleton64.dtsi"
 
+#define MBUS_ID(target,attributes) (((target) << 24) | ((attributes) << 16))
+
 / {
 	model = "Marvell Armada 370 and XP SoC";
 	compatible = "marvell,armada-370-xp";
@@ -29,18 +31,21 @@
 	};
 
 	soc {
-		#address-cells = <1>;
+		#address-cells = <2>;
 		#size-cells = <1>;
-		compatible = "simple-bus";
+		controller = <&mbusc>;
 		interrupt-parent = <&mpic>;
-		ranges = <0          0 0xd0000000 0x0100000 /* internal registers */
-			  0xe0000000 0 0xe0000000 0x8100000 /* PCIe */>;
 
 		internal-regs {
 			compatible = "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
+			ranges = <0 MBUS_ID(0xf0, 0x01) 0 0x100000>;
+
+			mbusc: mbus-controller@20000 {
+				compatible = "marvell,mbus-controller";
+				reg = <0x20000 0x100>, <0x20180 0x20>;
+			};
 
 			mpic: interrupt-controller@20000 {
 				compatible = "marvell,mpic";
diff --git a/arch/arm/boot/dts/armada-370.dtsi b/arch/arm/boot/dts/armada-370.dtsi
index 08ec6e3..4b54e51 100644
--- a/arch/arm/boot/dts/armada-370.dtsi
+++ b/arch/arm/boot/dts/armada-370.dtsi
@@ -29,8 +29,8 @@
 	};
 
 	soc {
-		ranges = <0          0xd0000000 0x0100000 /* internal registers */
-			  0xe0000000 0xe0000000 0x8100000 /* PCIe */>;
+		compatible = "marvell,armada370-mbus", "simple-bus";
+
 		internal-regs {
 			system-controller@18200 {
 				compatible = "marvell,armada-370-xp-system-controller";
diff --git a/arch/arm/boot/dts/armada-xp-db.dts b/arch/arm/boot/dts/armada-xp-db.dts
index 9a6ad0e..5bc9dcb 100644
--- a/arch/arm/boot/dts/armada-xp-db.dts
+++ b/arch/arm/boot/dts/armada-xp-db.dts
@@ -30,6 +30,8 @@
 	};
 
 	soc {
+		ranges = <MBUS_ID(0xf0, 0x01) 0 0 0xd0000000 0x100000>;
+
 		internal-regs {
 			serial@12000 {
 				clock-frequency = <250000000>;
diff --git a/arch/arm/boot/dts/armada-xp-gp.dts b/arch/arm/boot/dts/armada-xp-gp.dts
index df1caa3..6c27a76 100644
--- a/arch/arm/boot/dts/armada-xp-gp.dts
+++ b/arch/arm/boot/dts/armada-xp-gp.dts
@@ -39,9 +39,7 @@
 	};
 
 	soc {
-		ranges = <0          0 0xd0000000 0x100000  /* Internal registers 1MiB */
-			  0xe0000000 0 0xe0000000 0x8100000 /* PCIe */
-			  0xf0000000 0 0xf0000000 0x1000000 /* Device Bus, NOR 16MiB  */>;
+		ranges = <MBUS_ID(0xf0, 0x01) 0 0 0xd0000000 0x100000>;
 
 		internal-regs {
 			serial@12000 {
diff --git a/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts b/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
index 5f59a17..61b17f4 100644
--- a/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
+++ b/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
@@ -27,9 +27,7 @@
 	};
 
 	soc {
-		ranges = <0          0 0xd0000000 0x100000	/* Internal registers 1MiB */
-			  0xe0000000 0 0xe0000000 0x8100000     /* PCIe */
-			  0xf0000000 0 0xf0000000 0x8000000     /* Device Bus, NOR 128MiB   */>;
+		ranges = <MBUS_ID(0xf0, 0x01) 0 0 0xd0000000 0x100000>;
 
 		internal-regs {
 			serial@12000 {
diff --git a/arch/arm/boot/dts/armada-xp.dtsi b/arch/arm/boot/dts/armada-xp.dtsi
index 3e770db..9a950d0 100644
--- a/arch/arm/boot/dts/armada-xp.dtsi
+++ b/arch/arm/boot/dts/armada-xp.dtsi
@@ -23,6 +23,8 @@
 	compatible = "marvell,armadaxp", "marvell,armada-370-xp";
 
 	soc {
+		compatible = "marvell,armadaxp-mbus", "simple-bus";
+
 		internal-regs {
 			L2: l2-cache {
 				compatible = "marvell,aurora-system-cache";
-- 
1.8.1.5
