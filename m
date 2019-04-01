From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 12/15] arm64: dts: marvell: Add 7k/8k per-port PHYs in SATA
 nodes
Date: Mon,  1 Apr 2019 18:51:28 +0200
Message-ID: <20190401165131.23370-13-miquel.raynal@bootlin.com>
References: <20190401165131.23370-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190401165131.23370-1-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Russell King <linux@armlinux.org.uk>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Fill-in the missing SATA phys/phy-names DT properties of Armada 7k/8k
based boards.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm64/boot/dts/marvell/armada-7040-db.dts |  5 +++++
 .../dts/marvell/armada-8040-clearfog-gt-8k.dts |  5 +++++
 arch/arm64/boot/dts/marvell/armada-8040-db.dts | 18 ++++++++++++++++++
 .../boot/dts/marvell/armada-8040-mcbin.dtsi    | 18 ++++++++++++++++--
 4 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-7040-db.dts b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
index d20d84ce7ca8..0ece9d5b16b4 100644
--- a/arch/arm64/boot/dts/marvell/armada-7040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
@@ -191,6 +191,11 @@
 
 &cp0_sata0 {
 	status = "okay";
+
+	sata-port@1 {
+		phys = <&cp0_comphy3 1>;
+		phy-names = "cp0-sata1-phy";
+	};
 };
 
 &cp0_usb3_0 {
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
index 2468762283a5..4ee063d2b16d 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
@@ -336,6 +336,11 @@
 &cp1_sata0 {
 	pinctrl-0 = <&cp0_pci1_reset_pins>;
 	status = "okay";
+
+	sata-port@1 {
+		phys = <&cp1_comphy0 1>;
+		phy-names = "cp1-sata1-phy";
+	};
 };
 
 &cp1_mdio {
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-db.dts b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
index 9f4f939ab65f..a2e75609b1ad 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
@@ -146,6 +146,15 @@
 /* CON4 on CP0 expansion */
 &cp0_sata0 {
 	status = "okay";
+
+	sata-port@0 {
+		phys = <&cp0_comphy1 0>;
+		phy-names = "cp0-sata0-phy";
+	};
+	sata-port@1 {
+		phys = <&cp0_comphy3 1>;
+		phy-names = "cp0-sata1-phy";
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
+		phy-names = "cp1-sata0-phy";
+	};
+	sata-port@1 {
+		phys = <&cp1_comphy3 1>;
+		phy-names = "cp1-sata1-phy";
+	};
 };
 
 /* CON9 on CP1 expansion */
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
index 329f8ceeebea..28d380769506 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
@@ -237,8 +237,13 @@
 };
 
 &cp0_sata0 {
-	/* CPM Lane 0 - U29 */
+	/* CPM Lane 5 - U29 */
 	status = "okay";
+
+	sata-port@1 {
+		phys = <&cp0_comphy5 1>;
+		phy-names = "cp0-sata1-phy";
+	};
 };
 
 &cp0_sdhci0 {
@@ -322,9 +327,18 @@
 };
 
 &cp1_sata0 {
+	status = "okay";
+
 	/* CPS Lane 1 - U32 */
+	sata-port@0 {
+		phys = <&cp1_comphy1 0>;
+		phy-names = "cp1-sata0-phy";
+	};
 	/* CPS Lane 3 - U31 */
-	status = "okay";
+	sata-port@1 {
+		phys = <&cp1_comphy3 1>;
+		phy-names = "cp1-sata1-phy";
+	};
 };
 
 &cp1_spi1 {
-- 
2.19.1
