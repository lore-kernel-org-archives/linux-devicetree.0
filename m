From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v3 5/8] ARM: dts: kirkwood-dir665: Utilize new DSA binding
Date: Tue, 17 Jan 2017 10:22:21 -0800
Message-ID: <20170117182224.32212-6-f.fainelli@gmail.com>
References: <20170117182224.32212-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170117182224.32212-1-f.fainelli@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Jason Cooper <jason@lakedaemon.net>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, vivien.didelot@savoirfairelinux.com, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Utilize the new DSA binding, introduced with commit 8c5ad1d6179d ("net: dsa:
Document new binding"). The legacy binding node is kept included, but is marked
disabled.

Tested-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arm/boot/dts/kirkwood-dir665.dts | 49 +++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm/boot/dts/kirkwood-dir665.dts b/arch/arm/boot/dts/kirkwood-dir665.dts
index 41acbb6dd6ab..4d2b15d6244a 100644
--- a/arch/arm/boot/dts/kirkwood-dir665.dts
+++ b/arch/arm/boot/dts/kirkwood-dir665.dts
@@ -194,6 +194,8 @@
 	};
 
 	dsa {
+		status = "disabled";
+
 		compatible = "marvell,dsa";
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -241,6 +243,53 @@
 
 &mdio {
 	status = "okay";
+
+	switch@0 {
+		compatible = "marvell,mv88e6085";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				label = "lan4";
+			};
+
+			port@1 {
+			       reg = <1>;
+			       label = "lan3";
+			};
+
+			port@2 {
+			       reg = <2>;
+			       label = "lan2";
+			};
+
+			port@3 {
+			       reg = <3>;
+			       label = "lan1";
+			};
+
+			port@4 {
+				reg = <4>;
+				label = "wan";
+			};
+
+			port@6 {
+				reg = <6>;
+				label = "cpu";
+				ethernet = <&eth0port>;
+				fixed-link {
+					speed = <1000>;
+					full-duplex;
+				};
+			};
+		};
+	};
 };
 
 /* eth0 is connected to a Marvell 88E6171 switch, without a PHY. So set
-- 
2.9.3
