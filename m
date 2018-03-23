From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH net-next 7/8] MIPS: mscc: connect phys to ports on ocelot_pcb123
Date: Fri, 23 Mar 2018 21:11:16 +0100
Message-ID: <20180323201117.8416-8-alexandre.belloni@bootlin.com>
References: <20180323201117.8416-1-alexandre.belloni@bootlin.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180323201117.8416-1-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>
Cc: Allan Nielsen <Allan.Nielsen@microsemi.com>, razvan.stefanescu@nxp.com, po.liu@nxp.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, James Hogan <jhogan@kernel.org>
List-Id: devicetree@vger.kernel.org

Add phy to switch port connections for PCB123 for internal PHYs.

Cc: James Hogan <jhogan@kernel.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 arch/mips/boot/dts/mscc/ocelot_pcb123.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/mips/boot/dts/mscc/ocelot_pcb123.dts b/arch/mips/boot/dts/mscc/ocelot_pcb123.dts
index 29d6414f8886..66b48f664975 100644
--- a/arch/mips/boot/dts/mscc/ocelot_pcb123.dts
+++ b/arch/mips/boot/dts/mscc/ocelot_pcb123.dts
@@ -25,3 +25,19 @@
 &uart2 {
 	status = "okay";
 };
+
+&port0 {
+	phy-handle = <&phy0>;
+};
+
+&port1 {
+	phy-handle = <&phy1>;
+};
+
+&port2 {
+	phy-handle = <&phy2>;
+};
+
+&port3 {
+	phy-handle = <&phy3>;
+};
-- 
2.16.2
