From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH v2 9/9] arm: dts: mvebu: Convert mvebu device tree files to 64
 bits
Date: Fri,  5 Apr 2013 22:24:04 +0200
Message-ID: <1365193444-13441-10-git-send-email-gregory.clement@free-electrons.com>
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

In order to be able to use more than 4GB of RAM when the LPAE is
activated, the dts must be converted in 64 bits.

Armada XP and Armada 370 share a dtsi file which have also be
converted to 64 bits. This lead to convert all the device tree files
to 64 bits even the one used for Armada 370 (which don't support LPAE)

This was heavily based on the work of Lior Amsalem.

Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 arch/arm/boot/dts/armada-370-db.dts              |    2 +-
 arch/arm/boot/dts/armada-370-mirabox.dts         |    2 +-
 arch/arm/boot/dts/armada-370-rd.dts              |    2 +-
 arch/arm/boot/dts/armada-370-xp.dtsi             |    4 ++--
 arch/arm/boot/dts/armada-xp-db.dts               |    2 +-
 arch/arm/boot/dts/armada-xp-gp.dts               |   14 ++++++++------
 arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts |    2 +-
 7 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/armada-370-db.dts b/arch/arm/boot/dts/armada-370-db.dts
index 6c30a9f..c996c06 100644
--- a/arch/arm/boot/dts/armada-370-db.dts
+++ b/arch/arm/boot/dts/armada-370-db.dts
@@ -26,7 +26,7 @@
 
 	memory {
 		device_type = "memory";
-		reg = <0x00000000 0x40000000>; /* 1 GB */
+		reg = <0 0x00000000 0 0x40000000>; /* 1 GB */
 	};
 
 	soc {
diff --git a/arch/arm/boot/dts/armada-370-mirabox.dts b/arch/arm/boot/dts/armada-370-mirabox.dts
index 5a06e87..29b6b64 100644
--- a/arch/arm/boot/dts/armada-370-mirabox.dts
+++ b/arch/arm/boot/dts/armada-370-mirabox.dts
@@ -21,7 +21,7 @@
 
 	memory {
 		device_type = "memory";
-		reg = <0x00000000 0x20000000>; /* 512 MB */
+		reg = <0 0x00000000 0 0x20000000>; /* 512 MB */
 	};
 
 	soc {
diff --git a/arch/arm/boot/dts/armada-370-rd.dts b/arch/arm/boot/dts/armada-370-rd.dts
index 437dcd2..09e75fc 100644
--- a/arch/arm/boot/dts/armada-370-rd.dts
+++ b/arch/arm/boot/dts/armada-370-rd.dts
@@ -24,7 +24,7 @@
 
 	memory {
 		device_type = "memory";
-		reg = <0x00000000 0x20000000>; /* 512 MB */
+		reg = <0 0x00000000 0 0x20000000>; /* 512 MB */
 	};
 
 	soc {
diff --git a/arch/arm/boot/dts/armada-370-xp.dtsi b/arch/arm/boot/dts/armada-370-xp.dtsi
index 8b9adc6..6a3b418 100644
--- a/arch/arm/boot/dts/armada-370-xp.dtsi
+++ b/arch/arm/boot/dts/armada-370-xp.dtsi
@@ -16,7 +16,7 @@
  * 370 and Armada XP SoC.
  */
 
-/include/ "skeleton.dtsi"
+/include/ "skeleton64.dtsi"
 
 / {
 	model = "Marvell Armada 370 and XP SoC";
@@ -33,7 +33,7 @@
 		#size-cells = <1>;
 		compatible = "simple-bus";
 		interrupt-parent = <&mpic>;
-		ranges = <0 0xd0000000 0x100000>;
+		ranges = <0 0 0xd0000000 0x100000>;
 
 		internal-regs {
 			compatible = "simple-bus";
diff --git a/arch/arm/boot/dts/armada-xp-db.dts b/arch/arm/boot/dts/armada-xp-db.dts
index fbd0f04..a2dd24e 100644
--- a/arch/arm/boot/dts/armada-xp-db.dts
+++ b/arch/arm/boot/dts/armada-xp-db.dts
@@ -26,7 +26,7 @@
 
 	memory {
 		device_type = "memory";
-		reg = <0x00000000 0x80000000>; /* 2 GB */
+		reg = <0 0x00000000 0 0x80000000>; /* 2 GB */
 	};
 
 	soc {
diff --git a/arch/arm/boot/dts/armada-xp-gp.dts b/arch/arm/boot/dts/armada-xp-gp.dts
index b0298d7..b022906 100644
--- a/arch/arm/boot/dts/armada-xp-gp.dts
+++ b/arch/arm/boot/dts/armada-xp-gp.dts
@@ -26,14 +26,16 @@
 
 	memory {
 		device_type = "memory";
-
 		/*
-		 * 4 GB of plug-in RAM modules by default but only 3GB
-		 * are visible, the amount of memory available can be
-		 * changed by the bootloader according the size of the
-		 * module actually plugged
+                 * 8 GB of plug-in RAM modules by default.The amount
+                 * of memory available can be changed by the
+                 * bootloader according the size of the module
+                 * actually plugged. Only 7GB are usable because
+                 * addresses from 0xC0000000 to 0xffffffff are used by
+                 * the internal registers of the SoC.
 		 */
-		reg = <0x00000000 0xC0000000>;
+		reg = <0x00000000 0x00000000 0x00000000 0xC0000000>,
+		      <0x00000001 0x00000000 0x00000001 0x00000000>;
 	};
 
 	soc {
diff --git a/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts b/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
index e2eaf4f..1f274e7 100644
--- a/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
+++ b/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
@@ -23,7 +23,7 @@
 
 	memory {
 		device_type = "memory";
-		reg = <0x00000000 0xC0000000>; /* 3 GB */
+		reg = <0 0x00000000 0 0xC0000000>; /* 3 GB */
 	};
 
 	soc {
-- 
1.7.9.5
