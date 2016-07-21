From: Grzegorz Jaszczyk <jaz@semihalf.com>
Subject: [PATCH 05/18] ARM: mvebu: a385-db-ap: add default partition description for NAND
Date: Thu, 21 Jul 2016 14:44:01 +0200
Message-ID: <1469105055-25181-6-git-send-email-jaz@semihalf.com>
References: <1469105055-25181-1-git-send-email-jaz@semihalf.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1469105055-25181-1-git-send-email-jaz@semihalf.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, jason@lakedaemon.net, andrew@lunn.ch, sebastian.hesselbarth@gmail.com, linux@armlinux.org.uk, thomas.petazzoni@free-electrons.com, gregory.clement@free-electrons.com, mw@semihalf.com, jaz@semihalf.com, alior@marvell.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
---
 arch/arm/boot/dts/armada-385-db-ap.dts | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/armada-385-db-ap.dts b/arch/arm/boot/dts/armada-385-db-ap.dts
index a18f516..6648a3f 100644
--- a/arch/arm/boot/dts/armada-385-db-ap.dts
+++ b/arch/arm/boot/dts/armada-385-db-ap.dts
@@ -182,15 +182,35 @@
 
 			nfc: flash@d0000 {
 				status = "okay";
-				#address-cells = <1>;
-				#size-cells = <1>;
-
 				num-cs = <1>;
 				nand-ecc-strength = <4>;
 				nand-ecc-step-size = <512>;
 				marvell,nand-keep-config;
 				marvell,nand-enable-arbiter;
 				nand-on-flash-bbt;
+
+				partitions {
+					compatible = "fixed-partitions";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					partition@0 {
+						label = "U-Boot";
+						reg = <0x00000000 0x00800000>;
+						read-only;
+					};
+
+					partition@800000 {
+						label = "uImage";
+						reg = <0x00800000 0x00400000>;
+						read-only;
+					};
+
+					partition@c00000 {
+						label = "Root";
+						reg = <0x00c00000 0x3f400000>;
+					};
+				};
 			};
 
 			usb3@f0000 {
-- 
1.8.3.1
