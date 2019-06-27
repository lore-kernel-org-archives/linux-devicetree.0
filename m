From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 18/19] arm64: dts: marvell: Add 7k/8k PHYs in PCIe nodes
Date: Thu, 27 Jun 2019 14:25:04 +0200
Message-ID: <20190627122505.25774-6-miquel.raynal@bootlin.com>
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

Fill-in the missing PCIe phys/phy-names DT properties of Armada 7k/8k
based boards.

The MacchiatoBin is a bit particular as the Armada8k-PCI IP supports
x4 link widths and in this case the PHY for each lane must be
referenced.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm64/boot/dts/marvell/armada-7040-db.dts         |  2 ++
 .../boot/dts/marvell/armada-8040-clearfog-gt-8k.dts    |  2 ++
 arch/arm64/boot/dts/marvell/armada-8040-db.dts         | 10 ++++++++++
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi     |  4 ++++
 4 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-7040-db.dts b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
index 81b54a6ccfe5..e169800cf3f1 100644
--- a/arch/arm64/boot/dts/marvell/armada-7040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
@@ -96,6 +96,8 @@
 
 &cp0_pcie2 {
 	status = "okay";
+	phys = <&cp0_comphy5 2>;
+	phy-names = "cp0-pcie2-x1-phy";
 };
 
 &cp0_i2c0 {
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
index f5af42aa31c7..078ea1748b60 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
@@ -242,6 +242,8 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&cp0_pci0_reset_pins &cp0_wlan_disable_pins>;
 	reset-gpios = <&cp0_gpio2 0 GPIO_ACTIVE_LOW>;
+	phys = <&cp0_comphy0 0>;
+	phy-names = "cp0-pcie0-x1-phy";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-db.dts b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
index f74513056d41..a8db6b449f0e 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
@@ -111,11 +111,15 @@
 
 /* CON6 on CP0 expansion */
 &cp0_pcie0 {
+	phys = <&cp0_comphy0 0>;
+	phy-names = "cp0-pcie0-x1-phy";
 	status = "okay";
 };
 
 /* CON5 on CP0 expansion */
 &cp0_pcie2 {
+	phys = <&cp0_comphy5 2>;
+	phy-names = "cp0-pcie2-x1-phy";
 	status = "okay";
 };
 
@@ -201,16 +205,22 @@
 
 /* CON6 on CP1 expansion */
 &cp1_pcie0 {
+	phys = <&cp1_comphy0 0>;
+	phy-names = "cp1-pcie0-x1-phy";
 	status = "okay";
 };
 
 /* CON7 on CP1 expansion */
 &cp1_pcie1 {
+	phys = <&cp1_comphy4 1>;
+	phy-names = "cp1-pcie1-x1-phy";
 	status = "okay";
 };
 
 /* CON5 on CP1 expansion */
 &cp1_pcie2 {
+	phys = <&cp1_comphy5 2>;
+	phy-names = "cp1-pcie2-x1-phy";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
index 50688271158d..9f9d36541ccb 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
@@ -184,6 +184,10 @@
 	num-lanes = <4>;
 	num-viewport = <8>;
 	reset-gpios = <&cp0_gpio2 20 GPIO_ACTIVE_LOW>;
+	phys = <&cp0_comphy0 0>, <&cp0_comphy1 0>,
+	       <&cp0_comphy2 0>, <&cp0_comphy3 0>;
+	phy-names = "cp0-pcie0-x4-lane0-phy", "cp0-pcie0-x4-lane1-phy",
+		    "cp0-pcie0-x4-lane2-phy", "cp0-pcie0-x4-lane3-phy";
 	status = "okay";
 };
 
-- 
2.19.1
