From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 2/8] ARM: dts: armada-38x: Utilize new DSA binding
Date: Sun,  1 Jan 2017 18:22:43 -0800
Message-ID: <20170102022249.10657-3-f.fainelli@gmail.com>
References: <20170102022249.10657-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170102022249.10657-1-f.fainelli@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Jason Cooper <jason@lakedaemon.net>, vivien.didelot@savoirfairelinux.com, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Utilize the new DSA binding, introduced with commit 8c5ad1d6179d ("net: dsa:
Document new binding"). The legacy binding node is kept included, but is marked
disabled.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arm/boot/dts/armada-385-linksys.dtsi | 52 ++++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/armada-385-linksys.dtsi b/arch/arm/boot/dts/armada-385-linksys.dtsi
index 8f0e508f64ae..20d5e8b00f2d 100644
--- a/arch/arm/boot/dts/armada-385-linksys.dtsi
+++ b/arch/arm/boot/dts/armada-385-linksys.dtsi
@@ -103,8 +103,56 @@
 				};
 			};
 
-			mdio {
+			mdio@72004 {
 				status = "okay";
+
+				switch@0 {
+					compatible = "marvell,mv88e6095";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+							label = "lan4";
+						};
+
+						port@1 {
+							reg = <1>;
+							label = "lan3";
+						};
+
+						port@2 {
+							reg = <2>;
+							label = "lan2";
+						};
+
+						port@3 {
+							reg = <3>;
+							label = "lan1";
+						};
+
+						port@4 {
+							reg = <4>;
+							label = "wan";
+						};
+
+						port@5 {
+							reg = <5>;
+							label = "cpu";
+							ethernet = <&eth2>;
+
+							fixed-link {
+								speed = <1000>;
+								full-duplex;
+							};
+						};
+					};
+				};
 			};
 
 			sata@a8000 {
@@ -261,6 +309,8 @@
 	};
 
 	dsa@0 {
+		status = "disabled";
+
 		compatible = "marvell,dsa";
 		#address-cells = <2>;
 		#size-cells = <0>;
-- 
2.9.3
