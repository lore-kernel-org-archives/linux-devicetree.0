From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: [PATCH v8 22/28] ARM: mvebu: Relocate Armada 370/XP DeviceBus device
 tree nodes
Date: Tue, 23 Jul 2013 10:31:26 -0300
Message-ID: <1374586292-4941-23-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1374586292-4941-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1374586292-4941-1-git-send-email-ezequiel.garcia@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, valentin.longchamp@keymile.com, Grant Likely <grant.likely@secretlab.ca>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Maen Suleiman <maen@marvell.com>, Lior Amsalem <alior@marvell.com>, gerlando.falauto@keymile.com, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Bjorn Helgaas <bhelgaas@google.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Now that mbus has been added to the device tree, it's possible to
move the DeviceBus out of internal registers, placing it directly
below the mbus. This is a more accurate representation of the hardware.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 arch/arm/boot/dts/armada-370-xp.dtsi             | 94 +++++++++++++-----------
 arch/arm/boot/dts/armada-xp-db.dts               | 59 +++++++--------
 arch/arm/boot/dts/armada-xp-gp.dts               | 60 +++++++--------
 arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts | 65 ++++++++--------
 4 files changed, 140 insertions(+), 138 deletions(-)

diff --git a/arch/arm/boot/dts/armada-370-xp.dtsi b/arch/arm/boot/dts/armada-370-xp.dtsi
index 62639b4..073dd20 100644
--- a/arch/arm/boot/dts/armada-370-xp.dtsi
+++ b/arch/arm/boot/dts/armada-370-xp.dtsi
@@ -45,6 +45,56 @@
 		controller = <&mbusc>;
 		interrupt-parent = <&mpic>;
 
+		devbus-bootcs {
+			compatible = "marvell,mvebu-devbus";
+			reg = <MBUS_ID(0xf0, 0x01) 0x10400 0x8>;
+			ranges = <0 MBUS_ID(0x01, 0x2f) 0 0xffffffff>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&coreclk 0>;
+			status = "disabled";
+		};
+
+		devbus-cs0 {
+			compatible = "marvell,mvebu-devbus";
+			reg = <MBUS_ID(0xf0, 0x01) 0x10408 0x8>;
+			ranges = <0 MBUS_ID(0x01, 0x3e) 0 0xffffffff>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&coreclk 0>;
+			status = "disabled";
+		};
+
+		devbus-cs1 {
+			compatible = "marvell,mvebu-devbus";
+			reg = <MBUS_ID(0xf0, 0x01) 0x10410 0x8>;
+			ranges = <0 MBUS_ID(0x01, 0x3d) 0 0xffffffff>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&coreclk 0>;
+			status = "disabled";
+		};
+
+		devbus-cs2 {
+			compatible = "marvell,mvebu-devbus";
+			reg = <MBUS_ID(0xf0, 0x01) 0x10418 0x8>;
+			ranges = <0 MBUS_ID(0x01, 0x3b) 0 0xffffffff>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&coreclk 0>;
+			status = "disabled";
+		};
+
+		devbus-cs3 {
+			compatible = "marvell,mvebu-devbus";
+			reg = <MBUS_ID(0xf0, 0x01) 0x10420 0x8>;
+			ranges = <0 MBUS_ID(0x01, 0x37) 0 0xffffffff>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&coreclk 0>;
+			status = "disabled";
+		};
+
 		internal-regs {
 			compatible = "simple-bus";
 			#address-cells = <1>;
@@ -200,50 +250,6 @@
 				status = "disabled";
 			};
 
-			devbus-bootcs@10400 {
-				compatible = "marvell,mvebu-devbus";
-				reg = <0x10400 0x8>;
-				#address-cells = <1>;
-				#size-cells = <1>;
-				clocks = <&coreclk 0>;
-				status = "disabled";
-			};
-
-			devbus-cs0@10408 {
-				compatible = "marvell,mvebu-devbus";
-				reg = <0x10408 0x8>;
-				#address-cells = <1>;
-				#size-cells = <1>;
-				clocks = <&coreclk 0>;
-				status = "disabled";
-			};
-
-			devbus-cs1@10410 {
-				compatible = "marvell,mvebu-devbus";
-				reg = <0x10410 0x8>;
-				#address-cells = <1>;
-				#size-cells = <1>;
-				clocks = <&coreclk 0>;
-				status = "disabled";
-			};
-
-			devbus-cs2@10418 {
-				compatible = "marvell,mvebu-devbus";
-				reg = <0x10418 0x8>;
-				#address-cells = <1>;
-				#size-cells = <1>;
-				clocks = <&coreclk 0>;
-				status = "disabled";
-			};
-
-			devbus-cs3@10420 {
-				compatible = "marvell,mvebu-devbus";
-				reg = <0x10420 0x8>;
-				#address-cells = <1>;
-				#size-cells = <1>;
-				clocks = <&coreclk 0>;
-				status = "disabled";
-			};
 		};
 	};
  };
diff --git a/arch/arm/boot/dts/armada-xp-db.dts b/arch/arm/boot/dts/armada-xp-db.dts
index 857f272..76ae1a9 100644
--- a/arch/arm/boot/dts/armada-xp-db.dts
+++ b/arch/arm/boot/dts/armada-xp-db.dts
@@ -31,7 +31,36 @@
 
 	soc {
 		ranges = <MBUS_ID(0xf0, 0x01) 0 0 0xd0000000 0x100000
-			  MBUS_ID(0x01, 0x1d) 0 0 0xfff00000 0x100000>;
+			  MBUS_ID(0x01, 0x1d) 0 0 0xfff00000 0x100000
+			  MBUS_ID(0x01, 0x2f) 0 0 0xf0000000 0x1000000>;
+
+		devbus-bootcs {
+			status = "okay";
+
+			/* Device Bus parameters are required */
+
+			/* Read parameters */
+			devbus,bus-width    = <8>;
+			devbus,turn-off-ps  = <60000>;
+			devbus,badr-skew-ps = <0>;
+			devbus,acc-first-ps = <124000>;
+			devbus,acc-next-ps  = <248000>;
+			devbus,rd-setup-ps  = <0>;
+			devbus,rd-hold-ps   = <0>;
+
+			/* Write parameters */
+			devbus,sync-enable = <0>;
+			devbus,wr-high-ps  = <60000>;
+			devbus,wr-low-ps   = <60000>;
+			devbus,ale-wr-ps   = <60000>;
+
+			/* NOR 16 MiB */
+			nor@0 {
+				compatible = "cfi-flash";
+				reg = <0 0x1000000>;
+				bank-width = <2>;
+			};
+		};
 
 		internal-regs {
 			serial@12000 {
@@ -160,34 +189,6 @@
 				};
 			};
 
-			devbus-bootcs@10400 {
-				status = "okay";
-				ranges = <0 0xf0000000 0x1000000>;
-
-				/* Device Bus parameters are required */
-
-				/* Read parameters */
-				devbus,bus-width    = <8>;
-				devbus,turn-off-ps  = <60000>;
-				devbus,badr-skew-ps = <0>;
-				devbus,acc-first-ps = <124000>;
-				devbus,acc-next-ps  = <248000>;
-				devbus,rd-setup-ps  = <0>;
-				devbus,rd-hold-ps   = <0>;
-
-				/* Write parameters */
-				devbus,sync-enable = <0>;
-				devbus,wr-high-ps  = <60000>;
-				devbus,wr-low-ps   = <60000>;
-				devbus,ale-wr-ps   = <60000>;
-
-				/* NOR 16 MiB */
-				nor@0 {
-					compatible = "cfi-flash";
-					reg = <0 0x1000000>;
-					bank-width = <2>;
-				};
-			};
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/armada-xp-gp.dts b/arch/arm/boot/dts/armada-xp-gp.dts
index 934dc46..8c0de20 100644
--- a/arch/arm/boot/dts/armada-xp-gp.dts
+++ b/arch/arm/boot/dts/armada-xp-gp.dts
@@ -40,7 +40,36 @@
 
 	soc {
 		ranges = <MBUS_ID(0xf0, 0x01) 0 0 0xd0000000 0x100000
-			  MBUS_ID(0x01, 0x1d) 0 0 0xfff00000 0x100000>;
+			  MBUS_ID(0x01, 0x1d) 0 0 0xfff00000 0x100000
+			  MBUS_ID(0x01, 0x2f) 0 0 0xf0000000 0x1000000>;
+
+		devbus-bootcs {
+			status = "okay";
+
+			/* Device Bus parameters are required */
+
+			/* Read parameters */
+			devbus,bus-width    = <8>;
+			devbus,turn-off-ps  = <60000>;
+			devbus,badr-skew-ps = <0>;
+			devbus,acc-first-ps = <124000>;
+			devbus,acc-next-ps  = <248000>;
+			devbus,rd-setup-ps  = <0>;
+			devbus,rd-hold-ps   = <0>;
+
+			/* Write parameters */
+			devbus,sync-enable = <0>;
+			devbus,wr-high-ps  = <60000>;
+			devbus,wr-low-ps   = <60000>;
+			devbus,ale-wr-ps   = <60000>;
+
+			/* NOR 16 MiB */
+			nor@0 {
+				compatible = "cfi-flash";
+				reg = <0 0x1000000>;
+				bank-width = <2>;
+			};
+		};
 
 		internal-regs {
 			serial@12000 {
@@ -126,35 +155,6 @@
 				};
 			};
 
-			devbus-bootcs@10400 {
-				status = "okay";
-				ranges = <0 0xf0000000 0x1000000>; /* @addr 0xf000000, size 0x1000000 */
-
-				/* Device Bus parameters are required */
-
-				/* Read parameters */
-				devbus,bus-width    = <8>;
-				devbus,turn-off-ps  = <60000>;
-				devbus,badr-skew-ps = <0>;
-				devbus,acc-first-ps = <124000>;
-				devbus,acc-next-ps  = <248000>;
-				devbus,rd-setup-ps  = <0>;
-				devbus,rd-hold-ps   = <0>;
-
-				/* Write parameters */
-				devbus,sync-enable = <0>;
-				devbus,wr-high-ps  = <60000>;
-				devbus,wr-low-ps   = <60000>;
-				devbus,ale-wr-ps   = <60000>;
-
-				/* NOR 16 MiB */
-				nor@0 {
-					compatible = "cfi-flash";
-					reg = <0 0x1000000>;
-					bank-width = <2>;
-				};
-			};
-
 			pcie-controller {
 				status = "okay";
 
diff --git a/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts b/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
index 1700f6f..2b60ee0 100644
--- a/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
+++ b/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
@@ -28,7 +28,36 @@
 
 	soc {
 		ranges = <MBUS_ID(0xf0, 0x01) 0 0 0xd0000000 0x100000
-			  MBUS_ID(0x01, 0x1d) 0 0 0xfff00000 0x100000>;
+			  MBUS_ID(0x01, 0x1d) 0 0 0xfff00000 0x100000
+			  MBUS_ID(0x01, 0x2f) 0 0 0xf0000000 0x8000000>;
+
+		devbus-bootcs {
+			status = "okay";
+
+			/* Device Bus parameters are required */
+
+			/* Read parameters */
+			devbus,bus-width    = <8>;
+			devbus,turn-off-ps  = <60000>;
+			devbus,badr-skew-ps = <0>;
+			devbus,acc-first-ps = <124000>;
+			devbus,acc-next-ps  = <248000>;
+			devbus,rd-setup-ps  = <0>;
+			devbus,rd-hold-ps   = <0>;
+
+			/* Write parameters */
+			devbus,sync-enable = <0>;
+			devbus,wr-high-ps  = <60000>;
+			devbus,wr-low-ps   = <60000>;
+			devbus,ale-wr-ps   = <60000>;
+
+			/* NOR 128 MiB */
+			nor@0 {
+				compatible = "cfi-flash";
+				reg = <0 0x8000000>;
+				bank-width = <2>;
+			};
+		};
 
 		internal-regs {
 			serial@12000 {
@@ -148,40 +177,6 @@
 				status = "okay";
 			};
 
-			/* USB interface in the mini-PCIe connector */
-			usb@52000 {
-				status = "okay";
-			};
-
-			devbus-bootcs@10400 {
-				status = "okay";
-				ranges = <0 0xf0000000 0x8000000>; /* @addr 0xf000000, size 0x8000000 */
-
-				/* Device Bus parameters are required */
-
-				/* Read parameters */
-				devbus,bus-width    = <8>;
-				devbus,turn-off-ps  = <60000>;
-				devbus,badr-skew-ps = <0>;
-				devbus,acc-first-ps = <124000>;
-				devbus,acc-next-ps  = <248000>;
-				devbus,rd-setup-ps  = <0>;
-				devbus,rd-hold-ps   = <0>;
-
-				/* Write parameters */
-				devbus,sync-enable = <0>;
-				devbus,wr-high-ps  = <60000>;
-				devbus,wr-low-ps   = <60000>;
-				devbus,ale-wr-ps   = <60000>;
-
-				/* NOR 128 MiB */
-				nor@0 {
-					compatible = "cfi-flash";
-					reg = <0 0x8000000>;
-					bank-width = <2>;
-				};
-			};
-
 			pcie-controller {
 				status = "okay";
 				/* Internal mini-PCIe connector */
-- 
1.8.1.5
