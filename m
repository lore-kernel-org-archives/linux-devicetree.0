From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: [PATCH v8 21/28] ARM: mvebu: Add BootROM to Armada 370/XP device tree
Date: Tue, 23 Jul 2013 10:31:25 -0300
Message-ID: <1374586292-4941-22-git-send-email-ezequiel.garcia@free-electrons.com>
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

In order to access the SoC BootROM, we need to declare a mapping
(through a ranges property). The mbus driver will use this property
to allocate a suitable address decoding window.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 arch/arm/boot/dts/armada-370-db.dts              | 3 ++-
 arch/arm/boot/dts/armada-370-mirabox.dts         | 3 ++-
 arch/arm/boot/dts/armada-370-rd.dts              | 3 ++-
 arch/arm/boot/dts/armada-370.dtsi                | 5 +++++
 arch/arm/boot/dts/armada-xp-db.dts               | 3 ++-
 arch/arm/boot/dts/armada-xp-gp.dts               | 3 ++-
 arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts | 3 ++-
 arch/arm/boot/dts/armada-xp.dtsi                 | 5 +++++
 8 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/armada-370-db.dts b/arch/arm/boot/dts/armada-370-db.dts
index 5920b4e..90ce29d 100644
--- a/arch/arm/boot/dts/armada-370-db.dts
+++ b/arch/arm/boot/dts/armada-370-db.dts
@@ -30,7 +30,8 @@
 	};
 
 	soc {
-		ranges = <MBUS_ID(0xf0, 0x01) 0 0xd0000000 0x100000>;
+		ranges = <MBUS_ID(0xf0, 0x01) 0 0xd0000000 0x100000
+			  MBUS_ID(0x01, 0xe0) 0 0xfff00000 0x100000>;
 
 		internal-regs {
 			serial@12000 {
diff --git a/arch/arm/boot/dts/armada-370-mirabox.dts b/arch/arm/boot/dts/armada-370-mirabox.dts
index a4202b6..19341d2 100644
--- a/arch/arm/boot/dts/armada-370-mirabox.dts
+++ b/arch/arm/boot/dts/armada-370-mirabox.dts
@@ -25,7 +25,8 @@
 	};
 
 	soc {
-		ranges = <MBUS_ID(0xf0, 0x01) 0 0xd0000000 0x100000>;
+		ranges = <MBUS_ID(0xf0, 0x01) 0 0xd0000000 0x100000
+			  MBUS_ID(0x01, 0xe0) 0 0xfff00000 0x100000>;
 
 		internal-regs {
 			serial@12000 {
diff --git a/arch/arm/boot/dts/armada-370-rd.dts b/arch/arm/boot/dts/armada-370-rd.dts
index dd0ba01..0b3acf3 100644
--- a/arch/arm/boot/dts/armada-370-rd.dts
+++ b/arch/arm/boot/dts/armada-370-rd.dts
@@ -28,7 +28,8 @@
 	};
 
 	soc {
-		ranges = <MBUS_ID(0xf0, 0x01) 0 0xd0000000 0x100000>;
+		ranges = <MBUS_ID(0xf0, 0x01) 0 0xd0000000 0x100000
+			  MBUS_ID(0x01, 0xe0) 0 0xfff00000 0x100000>;
 
 		internal-regs {
 			serial@12000 {
diff --git a/arch/arm/boot/dts/armada-370.dtsi b/arch/arm/boot/dts/armada-370.dtsi
index 4b54e51..bd21d49 100644
--- a/arch/arm/boot/dts/armada-370.dtsi
+++ b/arch/arm/boot/dts/armada-370.dtsi
@@ -31,6 +31,11 @@
 	soc {
 		compatible = "marvell,armada370-mbus", "simple-bus";
 
+		bootrom {
+			compatible = "marvell,bootrom";
+			reg = <MBUS_ID(0x01, 0xe0) 0 0x100000>;
+		};
+
 		internal-regs {
 			system-controller@18200 {
 				compatible = "marvell,armada-370-xp-system-controller";
diff --git a/arch/arm/boot/dts/armada-xp-db.dts b/arch/arm/boot/dts/armada-xp-db.dts
index 0d4ce54..857f272 100644
--- a/arch/arm/boot/dts/armada-xp-db.dts
+++ b/arch/arm/boot/dts/armada-xp-db.dts
@@ -30,7 +30,8 @@
 	};
 
 	soc {
-		ranges = <MBUS_ID(0xf0, 0x01) 0 0 0xd0000000 0x100000>;
+		ranges = <MBUS_ID(0xf0, 0x01) 0 0 0xd0000000 0x100000
+			  MBUS_ID(0x01, 0x1d) 0 0 0xfff00000 0x100000>;
 
 		internal-regs {
 			serial@12000 {
diff --git a/arch/arm/boot/dts/armada-xp-gp.dts b/arch/arm/boot/dts/armada-xp-gp.dts
index 2fa9209..934dc46 100644
--- a/arch/arm/boot/dts/armada-xp-gp.dts
+++ b/arch/arm/boot/dts/armada-xp-gp.dts
@@ -39,7 +39,8 @@
 	};
 
 	soc {
-		ranges = <MBUS_ID(0xf0, 0x01) 0 0 0xd0000000 0x100000>;
+		ranges = <MBUS_ID(0xf0, 0x01) 0 0 0xd0000000 0x100000
+			  MBUS_ID(0x01, 0x1d) 0 0 0xfff00000 0x100000>;
 
 		internal-regs {
 			serial@12000 {
diff --git a/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts b/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
index a3e3a12..1700f6f 100644
--- a/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
+++ b/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
@@ -27,7 +27,8 @@
 	};
 
 	soc {
-		ranges = <MBUS_ID(0xf0, 0x01) 0 0 0xd0000000 0x100000>;
+		ranges = <MBUS_ID(0xf0, 0x01) 0 0 0xd0000000 0x100000
+			  MBUS_ID(0x01, 0x1d) 0 0 0xfff00000 0x100000>;
 
 		internal-regs {
 			serial@12000 {
diff --git a/arch/arm/boot/dts/armada-xp.dtsi b/arch/arm/boot/dts/armada-xp.dtsi
index 8033824..7ba99ce 100644
--- a/arch/arm/boot/dts/armada-xp.dtsi
+++ b/arch/arm/boot/dts/armada-xp.dtsi
@@ -29,6 +29,11 @@
 	soc {
 		compatible = "marvell,armadaxp-mbus", "simple-bus";
 
+		bootrom {
+			compatible = "marvell,bootrom";
+			reg = <MBUS_ID(0x01, 0x1d) 0 0x100000>;
+		};
+
 		internal-regs {
 			L2: l2-cache {
 				compatible = "marvell,aurora-system-cache";
-- 
1.8.1.5
