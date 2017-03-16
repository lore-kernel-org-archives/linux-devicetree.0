From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Subject: [PATCH v2] ARM: dts: mvebu: linksys: enable buffer manager support
Date: Thu, 16 Mar 2017 06:53:19 +0100
Message-ID: <20170316055320.7929-1-ralph.sennhauser@gmail.com>
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
To: Gregory Clement <gregory.clement@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Ralph Sennhauser <ralph.sennhauser@gmail.com>, "moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,
 ..." <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Add appropriate properties to devices in the Linksys WRT AC Series for the
mvneta driver to use hardware buffer management.

Also update "soc" ranges property and set the status of bm and bm-bppi
to "okay" (SRAM).

Signed-off-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
---

v1 -> v2:
	Use independent pools for short (suggested by Gregory Clement)


 arch/arm/boot/dts/armada-385-linksys.dtsi     | 17 ++++++++++++++++-
 arch/arm/boot/dts/armada-xp-linksys-mamba.dts | 17 ++++++++++++++++-
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/armada-385-linksys.dtsi b/arch/arm/boot/dts/armada-385-linksys.dtsi
index df47bf1..aa0d225 100644
--- a/arch/arm/boot/dts/armada-385-linksys.dtsi
+++ b/arch/arm/boot/dts/armada-385-linksys.dtsi
@@ -59,7 +59,8 @@
 		ranges = <MBUS_ID(0xf0, 0x01) 0 0xf1000000 0x100000
 			  MBUS_ID(0x01, 0x1d) 0 0xfff00000 0x100000
 			  MBUS_ID(0x09, 0x19) 0 0xf1100000 0x10000
-			  MBUS_ID(0x09, 0x15) 0 0xf1110000 0x10000>;
+			  MBUS_ID(0x09, 0x15) 0 0xf1110000 0x10000
+			  MBUS_ID(0x0c, 0x04) 0 0xf1200000 0x100000>;
 
 		internal-regs {
 			i2c@11000 {
@@ -88,6 +89,9 @@
 			ethernet@70000 {
 				status = "okay";
 				phy-mode = "rgmii-id";
+				buffer-manager = <&bm>;
+				bm,pool-long = <2>;
+				bm,pool-short = <3>;
 				fixed-link {
 					speed = <1000>;
 					full-duplex;
@@ -97,6 +101,9 @@
 			ethernet@34000 {
 				status = "okay";
 				phy-mode = "sgmii";
+				buffer-manager = <&bm>;
+				bm,pool-long = <0>;
+				bm,pool-short = <1>;
 				fixed-link {
 					speed = <1000>;
 					full-duplex;
@@ -159,6 +166,10 @@
 				status = "okay";
 			};
 
+			bm@c8000 {
+				status = "okay";
+			};
+
 			/* USB part of the eSATA/USB 2.0 port */
 			usb@58000 {
 				status = "okay";
@@ -241,6 +252,10 @@
 			};
 		};
 
+		bm-bppi {
+			status = "okay";
+		};
+
 		pcie-controller {
 			status = "okay";
 
diff --git a/arch/arm/boot/dts/armada-xp-linksys-mamba.dts b/arch/arm/boot/dts/armada-xp-linksys-mamba.dts
index 3744ba3..9efcf59 100644
--- a/arch/arm/boot/dts/armada-xp-linksys-mamba.dts
+++ b/arch/arm/boot/dts/armada-xp-linksys-mamba.dts
@@ -71,7 +71,8 @@
 		ranges = <MBUS_ID(0xf0, 0x01) 0 0 0xf1000000 0x100000
 			  MBUS_ID(0x01, 0x1d) 0 0 0xfff00000 0x100000
 			  MBUS_ID(0x09, 0x09) 0 0 0xf1100000 0x10000
-			  MBUS_ID(0x09, 0x05) 0 0 0xf1110000 0x10000>;
+			  MBUS_ID(0x09, 0x05) 0 0 0xf1110000 0x10000
+			  MBUS_ID(0x0c, 0x04) 0 0 0xf1200000 0x100000>;
 
 		internal-regs {
 
@@ -95,6 +96,9 @@
 				pinctrl-names = "default";
 				status = "okay";
 				phy-mode = "rgmii-id";
+				buffer-manager = <&bm>;
+				bm,pool-long = <0>;
+				bm,pool-short = <1>;
 				fixed-link {
 					speed = <1000>;
 					full-duplex;
@@ -106,6 +110,9 @@
 				pinctrl-names = "default";
 				status = "okay";
 				phy-mode = "rgmii-id";
+				buffer-manager = <&bm>;
+				bm,pool-long = <2>;
+				bm,pool-short = <3>;
 				fixed-link {
 					speed = <1000>;
 					full-duplex;
@@ -186,6 +193,10 @@
 				};
 			};
 
+			bm@c8000 {
+				status = "okay";
+			};
+
 			nand@d0000 {
 				status = "okay";
 				num-cs = <1>;
@@ -259,6 +270,10 @@
 				};
 			};
 		};
+
+		bm-bppi {
+			status = "okay";
+		};
 	};
 
 	gpio_keys {
-- 
2.10.2
