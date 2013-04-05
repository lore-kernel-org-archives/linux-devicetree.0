From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH v2 5/9] arm: dts: mvebu: move all peripherals inside soc
Date: Fri,  5 Apr 2013 22:24:00 +0200
Message-ID: <1365193444-13441-6-git-send-email-gregory.clement@free-electrons.com>
References: <1365193444-13441-1-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1365193444-13441-1-git-send-email-gregory.clement@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Ike Pan <ike.pan@canonical.com>, Grant Likely <grant.likely@secretlab.ca>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Leif Lindholm <leif.lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jon Masters <jcm@redhat.com>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Chris Van Hoof <vanhoof@canonical.com>, Nicolas Pitre <nico@fluxnic.net>, linux-kernel@vger.kernel.org, Maen Suleiman <maen@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Shadi Ammouri <shadi@marvell.com>
List-Id: devicetree@vger.kernel.org

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/arm/boot/dts/armada-370-xp.dtsi |   26 +++++++++++++-------------
 arch/arm/boot/dts/armada-370.dtsi    |   23 ++++++++++++-----------
 arch/arm/boot/dts/armada-xp.dtsi     |   32 ++++++++++++++++----------------
 3 files changed, 41 insertions(+), 40 deletions(-)

diff --git a/arch/arm/boot/dts/armada-370-xp.dtsi b/arch/arm/boot/dts/armada-370-xp.dtsi
index 5b70820..bd26c48 100644
--- a/arch/arm/boot/dts/armada-370-xp.dtsi
+++ b/arch/arm/boot/dts/armada-370-xp.dtsi
@@ -28,19 +28,6 @@
 		};
 	};
 
-	mpic: interrupt-controller@d0020000 {
-	      compatible = "marvell,mpic";
-	      #interrupt-cells = <1>;
-	      #size-cells = <1>;
-	      interrupt-controller;
-	};
-
-	coherency-fabric@d0020200 {
-		compatible = "marvell,coherency-fabric";
-		reg = <0xd0020200 0xb0>,
-		      <0xd0021810 0x1c>;
-	};
-
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -48,6 +35,19 @@
 		interrupt-parent = <&mpic>;
 		ranges;
 
+		mpic: interrupt-controller@d0020000 {
+			compatible = "marvell,mpic";
+			#interrupt-cells = <1>;
+			#size-cells = <1>;
+			interrupt-controller;
+		};
+
+		coherency-fabric@d0020200 {
+			compatible = "marvell,coherency-fabric";
+			reg = <0xd0020200 0xb0>,
+			      <0xd0021810 0x1c>;
+		};
+
 		serial@d0012000 {
 				compatible = "snps,dw-apb-uart";
 				reg = <0xd0012000 0x100>;
diff --git a/arch/arm/boot/dts/armada-370.dtsi b/arch/arm/boot/dts/armada-370.dtsi
index 8188d13..03808aa 100644
--- a/arch/arm/boot/dts/armada-370.dtsi
+++ b/arch/arm/boot/dts/armada-370.dtsi
@@ -20,12 +20,6 @@
 / {
 	model = "Marvell Armada 370 family SoC";
 	compatible = "marvell,armada370", "marvell,armada-370-xp";
-	L2: l2-cache {
-		compatible = "marvell,aurora-outer-cache";
-		reg = <0xd0008000 0x1000>;
-		cache-id-part = <0x100>;
-		wt-override;
-	};
 
 	aliases {
 		gpio0 = &gpio0;
@@ -33,17 +27,24 @@
 		gpio2 = &gpio2;
 	};
 
-	mpic: interrupt-controller@d0020000 {
-	      reg = <0xd0020a00 0x1d0>,
-		    <0xd0021870 0x58>;
-	};
-
 	soc {
+		mpic: interrupt-controller@d0020000 {
+			reg = <0xd0020a00 0x1d0>,
+			      <0xd0021870 0x58>;
+		};
+
 		system-controller@d0018200 {
 				compatible = "marvell,armada-370-xp-system-controller";
 				reg = <0xd0018200 0x100>;
 		};
 
+		L2: l2-cache {
+			compatible = "marvell,aurora-outer-cache";
+			reg = <0xd0008000 0x1000>;
+			cache-id-part = <0x100>;
+			wt-override;
+		};
+
 		pinctrl {
 			compatible = "marvell,mv88f6710-pinctrl";
 			reg = <0xd0018000 0x38>;
diff --git a/arch/arm/boot/dts/armada-xp.dtsi b/arch/arm/boot/dts/armada-xp.dtsi
index ca00d83..e644cc5 100644
--- a/arch/arm/boot/dts/armada-xp.dtsi
+++ b/arch/arm/boot/dts/armada-xp.dtsi
@@ -22,25 +22,25 @@
 	model = "Marvell Armada XP family SoC";
 	compatible = "marvell,armadaxp", "marvell,armada-370-xp";
 
-	L2: l2-cache {
-		compatible = "marvell,aurora-system-cache";
-		reg = <0xd0008000 0x1000>;
-		cache-id-part = <0x100>;
-		wt-override;
-	};
+	soc {
+		L2: l2-cache {
+			compatible = "marvell,aurora-system-cache";
+			reg = <0xd0008000 0x1000>;
+			cache-id-part = <0x100>;
+			wt-override;
+		};
 
-	mpic: interrupt-controller@d0020000 {
-	      reg = <0xd0020a00 0x2d0>,
-		    <0xd0021070 0x58>;
-	};
+		mpic: interrupt-controller@d0020000 {
+		      reg = <0xd0020a00 0x2d0>,
+			    <0xd0021070 0x58>;
+		};
 
-	armada-370-xp-pmsu@d0022000 {
-		compatible = "marvell,armada-370-xp-pmsu";
-		reg = <0xd0022100 0x430>,
-		      <0xd0020800 0x20>;
-	};
+		armada-370-xp-pmsu@d0022000 {
+			compatible = "marvell,armada-370-xp-pmsu";
+			reg = <0xd0022100 0x430>,
+			      <0xd0020800 0x20>;
+		};
 
-	soc {
 		serial@d0012200 {
 				compatible = "snps,dw-apb-uart";
 				reg = <0xd0012200 0x100>;
-- 
1.7.9.5
