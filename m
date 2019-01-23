From: Remi Pommarel <repk@triplefau.lt>
Subject: [PATCH] arm64: dts: armada-3720-espressobin: Configure RGMII and SMI pins
Date: Wed, 23 Jan 2019 20:39:46 +0100
Message-ID: <20190123193946.13594-1-repk@triplefau.lt>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Remi Pommarel <repk@triplefau.lt>
List-Id: devicetree@vger.kernel.org

In order to be able to communicate with the 88e6341 switch some pins
have to be repurposed as RGMII and SMI pins.

This fixes ethernet support on system booted via a bootloader that
has not already configured those pins (e.g. mainline u-boot, or vendor
u-boot compiled without ethernet support).

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
This should be applied along with pinctrl fixes from
https://lkml.org/lkml/2018/12/21/507 which have been merged in next branch of
linux-pinctrl tree.
---
 arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts | 2 ++
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi            | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts b/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
index 846003bb480c..b60897edc885 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
@@ -196,6 +196,8 @@
 };
 
 &eth0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rgmii_pins>, <&smi_pins>;
 	phy-mode = "rgmii-id";
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index e05594ea15fb..f61538910901 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -271,6 +271,11 @@
 					function = "mii";
 				};
 
+				smi_pins: smi-pins {
+					groups = "smi";
+					function = "smi";
+				};
+
 				sdio_pins: sdio-pins {
 					groups = "sdio_sb";
 					function = "sdio";
-- 
2.20.1
