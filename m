From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 16/19] arm64: dts: marvell: Add 7k/8k per-port PHYs in SATA
 nodes
Date: Thu, 27 Jun 2019 14:25:02 +0200
Message-ID: <20190627122505.25774-4-miquel.raynal@bootlin.com>
References: <20190627095104.22529-1-miquel.raynal@bootlin.com>
 <20190627122505.25774-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190627122505.25774-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Russell King <linux@armlinux.org.uk>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Fill-in the missing SATA phys/phy-names DT properties of Armada 7k/8k
based boards.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../arm64/boot/dts/marvell/armada-7040-db.dts |  5 +++++
 .../marvell/armada-8040-clearfog-gt-8k.dts    |  5 +++++
 .../arm64/boot/dts/marvell/armada-8040-db.dts | 18 ++++++++++++++++++
 .../boot/dts/marvell/armada-8040-mcbin.dtsi   | 19 +++++++++++++++++--
 arch/arm64/boot/dts/marvell/armada-cp110.dtsi | 10 ++++++++++
 5 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-7040-db.dts b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
index d20d84ce7ca8..1f6f79ea286b 100644
--- a/arch/arm64/boot/dts/marvell/armada-7040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
@@ -191,6 +191,11 @@
 
 &cp0_sata0 {
 	status = "okay";
+
+	sata-port@1 {
+		phys = <&cp0_comphy3 1>;
+		phy-names = "cp0-sata0-1-phy";
+	};
 };
 
 &cp0_usb3_0 {
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
index 9143aa13ceb1..afa98636cb33 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
@@ -347,6 +347,11 @@
 &cp1_sata0 {
 	pinctrl-0 = <&cp0_pci1_reset_pins>;
 	status = "okay";
+
+	sata-port@1 {
+		phys = <&cp1_comphy0 1>;
+		phy-names = "cp1-sata0-1-phy";
+	};
 };
 
 &cp1_mdio {
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-db.dts b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
index 9f4f939ab65f..4a68f99fb001 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
@@ -146,6 +146,15 @@
 /* CON4 on CP0 expansion */
 &cp0_sata0 {
 	status = "okay";
+
+	sata-port@0 {
+		phys = <&cp0_comphy1 0>;
+		phy-names = "cp0-sata0-0-phy";
+	};
+	sata-port@1 {
+		phys = <&cp0_comphy3 1>;
+		phy-names = "cp0-sata0-1-phy";
+	};
 };
 
 /* CON9 on CP0 expansion */
@@ -276,6 +285,15 @@
 /* CON4 on CP1 expansion */
 &cp1_sata0 {
 	status = "okay";
+
+	sata-port@0 {
+		phys = <&cp1_comphy1 0>;
+		phy-names = "cp1-sata0-0-phy";
+	};
+	sata-port@1 {
+		phys = <&cp1_comphy3 1>;
+		phy-names = "cp1-sata0-1-phy";
+	};
 };
 
 /* CON9 on CP1 expansion */
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
index 329f8ceeebea..a3f2bd64a750 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
@@ -237,8 +237,13 @@
 };
 
 &cp0_sata0 {
-	/* CPM Lane 0 - U29 */
 	status = "okay";
+
+	/* CPM Lane 5 - U29 */
+	sata-port@1 {
+		phys = <&cp0_comphy5 1>;
+		phy-names = "cp0-sata0-1-phy";
+	};
 };
 
 &cp0_sdhci0 {
@@ -322,9 +327,19 @@
 };
 
 &cp1_sata0 {
+	status = "okay";
+
 	/* CPS Lane 1 - U32 */
+	sata-port@0 {
+		phys = <&cp1_comphy1 0>;
+		phy-names = "cp1-sata0-0-phy";
+	};
+
 	/* CPS Lane 3 - U31 */
-	status = "okay";
+	sata-port@1 {
+		phys = <&cp1_comphy3 1>;
+		phy-names = "cp1-sata0-1-phy";
+	};
 };
 
 &cp1_spi1 {
diff --git a/arch/arm64/boot/dts/marvell/armada-cp110.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
index 404b6ac82aa0..c1764ed7e980 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
@@ -307,7 +307,17 @@
 			interrupts = <107 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&CP110_LABEL(clk) 1 15>,
 				 <&CP110_LABEL(clk) 1 16>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
+
+			sata-port@0 {
+				reg = <0>;
+			};
+
+			sata-port@1 {
+				reg = <1>;
+			};
 		};
 
 		CP110_LABEL(xor0): xor@6a0000 {
-- 
2.19.1
