From: Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH net-next 3/6] ARM: dts: add description for Armada 38x common
 phy
Date: Wed, 06 Feb 2019 11:34:57 +0000
Message-ID: <E1grLTl-00061S-LQ@rmk-PC.armlinux.org.uk>
References: <20190206113409.ko7lwuv5kb7l7rjo@shell.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190206113409.ko7lwuv5kb7l7rjo@shell.armlinux.org.uk>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Kishon Vijay Abraham I <kishon@ti.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Add the DT description for the Armada 38x common phy.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 arch/arm/boot/dts/armada-38x.dtsi | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
index 929459c42760..7b2e2bd6479b 100644
--- a/arch/arm/boot/dts/armada-38x.dtsi
+++ b/arch/arm/boot/dts/armada-38x.dtsi
@@ -335,6 +335,43 @@
 				#clock-cells = <1>;
 			};
 
+			comphy: phy@18300 {
+				compatible = "marvell,armada-380-comphy";
+				reg = <0x18300 0x100>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				comphy0: phy@0 {
+					reg = <0>;
+					#phy-cells = <1>;
+				};
+
+				comphy1: phy@1 {
+					reg = <1>;
+					#phy-cells = <1>;
+				};
+
+				comphy2: phy@2 {
+					reg = <2>;
+					#phy-cells = <1>;
+				};
+
+				comphy3: phy@3 {
+					reg = <3>;
+					#phy-cells = <1>;
+				};
+
+				comphy4: phy@4 {
+					reg = <4>;
+					#phy-cells = <1>;
+				};
+
+				comphy5: phy@5 {
+					reg = <5>;
+					#phy-cells = <1>;
+				};
+			};
+
 			coreclk: mvebu-sar@18600 {
 				compatible = "marvell,armada-380-core-clock";
 				reg = <0x18600 0x04>;
-- 
2.7.4
