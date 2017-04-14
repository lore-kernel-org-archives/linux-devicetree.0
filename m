From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 3/3] ARM: dts: sk-rzg1m: add Ether pins
Date: Sat, 15 Apr 2017 00:09:44 +0300
Message-ID: <20170414211513.443487793@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline; filename=ARM-dts-sk-rzg1m-add-Ether-pins.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Add the (previously omitted) Ether/PHY pin data to the SK-RZG1M board's
device tree.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm/boot/dts/r8a7743-sk-rzg1m.dts |   13 +++++++++++++
 1 file changed, 13 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
+++ renesas/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
@@ -44,6 +44,16 @@
 		groups = "scif0_data";
 		function = "scif0";
 	};
+
+	ether_pins: ether {
+		groups = "eth_link", "eth_mdio", "eth_rmii";
+		function = "eth";
+	};
+
+	phy1_pins: phy1 {
+		groups = "intc_irq0";
+		function = "intc";
+	};
 };
 
 &scif0 {
@@ -54,6 +64,9 @@
 };
 
 &ether {
+	pinctrl-0 = <&ether_pins &phy1_pins>;
+	pinctrl-names = "default";
+
 	phy-handle = <&phy1>;
 	renesas,ether-link-active-low;
 	status = "okay";
