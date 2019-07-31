From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 13/19] dt-bindings: phy: Add Marvell COMPHY clocks
Date: Wed, 31 Jul 2019 14:21:20 +0200
Message-ID: <20190731122126.3049-14-miquel.raynal@bootlin.com>
References: <20190731122126.3049-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190731122126.3049-1-miquel.raynal@bootlin.com>
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

Marvell CP110 COMPHY block is fed by 3 clocks. Describe each of them in the
bindings.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/phy/phy-mvebu-comphy.txt       | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-mvebu-comphy.txt b/Documentation/devicetree/bindings/phy/phy-mvebu-comphy.txt
index cf2cd86db267..8c60e6985950 100644
--- a/Documentation/devicetree/bindings/phy/phy-mvebu-comphy.txt
+++ b/Documentation/devicetree/bindings/phy/phy-mvebu-comphy.txt
@@ -25,6 +25,13 @@ Required properties:
 - #address-cells: should be 1.
 - #size-cells: should be 0.
 
+Optional properlties:
+
+- clocks: pointers to the reference clocks for this device (CP110 only),
+          consequently: MG clock, MG Core clock, AXI clock.
+- clock-names: names of used clocks for CP110 only, must be :
+               "mg_clk", "mg_core_clk" and "axi_clk".
+
 A sub-node is required for each comphy lane provided by the comphy.
 
 Required properties (child nodes):
@@ -39,6 +46,9 @@ Examples:
 		compatible = "marvell,comphy-cp110";
 		reg = <0x120000 0x6000>;
 		marvell,system-controller = <&cpm_syscon0>;
+		clocks = <&CP110_LABEL(clk) 1 5>, <&CP110_LABEL(clk) 1 6>,
+			 <&CP110_LABEL(clk) 1 18>;
+		clock-names = "mg_clk", "mg_core_clk", "axi_clk";
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-- 
2.20.1
