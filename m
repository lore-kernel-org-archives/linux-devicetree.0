From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 2/2] ARM: dts: mvebu: add "marvell,prestera" to PP nodes
Date: Fri,  7 Sep 2018 12:59:26 +1200
Message-ID: <20180907005926.27134-3-chris.packham@alliedtelesis.co.nz>
References: <20180907005926.27134-1-chris.packham@alliedtelesis.co.nz>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180907005926.27134-1-chris.packham@alliedtelesis.co.nz>
Sender: netdev-owner@vger.kernel.org
To: robh+dt@kernel.org, gregory.clement@bootlin.com
Cc: jason@lakedaemon.net, davem@davemloft.net, andrew@lunn.ch, sebastian.hesselbarth@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

The compatible string "marvell,prestera" allows drivers to have code
common to any prestera variant.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 arch/arm/boot/dts/armada-xp-98dx3236.dtsi | 2 +-
 arch/arm/boot/dts/armada-xp-98dx3336.dtsi | 2 +-
 arch/arm/boot/dts/armada-xp-98dx4251.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/armada-xp-98dx3236.dtsi b/arch/arm/boot/dts/armada-xp-98dx3236.dtsi
index 8d708cc22495..2185ea58abfe 100644
--- a/arch/arm/boot/dts/armada-xp-98dx3236.dtsi
+++ b/arch/arm/boot/dts/armada-xp-98dx3236.dtsi
@@ -243,7 +243,7 @@
 			ranges = <0 MBUS_ID(0x03, 0x00) 0 0x100000>;
 
 			pp0: packet-processor@0 {
-				compatible = "marvell,prestera-98dx3236";
+				compatible = "marvell,prestera-98dx3236", "marvell,prestera";
 				reg = <0 0x4000000>;
 				interrupts = <33>, <34>, <35>;
 				dfx = <&dfx>;
diff --git a/arch/arm/boot/dts/armada-xp-98dx3336.dtsi b/arch/arm/boot/dts/armada-xp-98dx3336.dtsi
index 2f5fc67dd6dc..1d9d8a8ea60c 100644
--- a/arch/arm/boot/dts/armada-xp-98dx3336.dtsi
+++ b/arch/arm/boot/dts/armada-xp-98dx3336.dtsi
@@ -35,5 +35,5 @@
 };
 
 &pp0 {
-	compatible = "marvell,prestera-98dx3336";
+	compatible = "marvell,prestera-98dx3336", "marvell,prestera";
 };
diff --git a/arch/arm/boot/dts/armada-xp-98dx4251.dtsi b/arch/arm/boot/dts/armada-xp-98dx4251.dtsi
index 7a9e8839880b..48ffdc72bfc7 100644
--- a/arch/arm/boot/dts/armada-xp-98dx4251.dtsi
+++ b/arch/arm/boot/dts/armada-xp-98dx4251.dtsi
@@ -49,6 +49,6 @@
 };
 
 &pp0 {
-	compatible = "marvell,prestera-98dx4251";
+	compatible = "marvell,prestera-98dx4251", "marvell,prestera";
 	interrupts = <33>, <34>, <35>, <36>;
 };
-- 
2.18.0
