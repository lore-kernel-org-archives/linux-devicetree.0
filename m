From: Grzegorz Jaszczyk <jaz@semihalf.com>
Subject: [PATCH v2 15/17] ARM: dts: mvebu: armada-398-db: enable supported usb interfaces
Date: Thu,  4 Aug 2016 12:14:18 +0200
Message-ID: <1470305660-6601-16-git-send-email-jaz@semihalf.com>
References: <1470305660-6601-1-git-send-email-jaz@semihalf.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470305660-6601-1-git-send-email-jaz@semihalf.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, jason@lakedaemon.net, andrew@lunn.ch, sebastian.hesselbarth@gmail.com, linux@armlinux.org.uk, thomas.petazzoni@free-electrons.com, gregory.clement@free-electrons.com, mw@semihalf.com, jaz@semihalf.com, alior@marvell.com, nadavh@marvell.com
List-Id: devicetree@vger.kernel.org

The Marvell Armada 398 Development board contains both USB2.0 and USB3.0
ports, which can be handled by existing drivers.

Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
Acked-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 arch/arm/boot/dts/armada-398-db.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/armada-398-db.dts b/arch/arm/boot/dts/armada-398-db.dts
index 788c3ba..969b49f 100644
--- a/arch/arm/boot/dts/armada-398-db.dts
+++ b/arch/arm/boot/dts/armada-398-db.dts
@@ -108,6 +108,10 @@
 				status = "okay";
 			};
 
+			usb@58000 {
+				status = "okay";
+			};
+
 			flash@d0000 {
 				status = "okay";
 				pinctrl-0 = <&nand_pins>;
@@ -132,6 +136,10 @@
 					reg = <0x1000000 0x3f000000>;
 				};
 			};
+
+			usb3@f8000 {
+				status = "okay";
+			};
 		};
 
 		pcie-controller {
-- 
1.8.3.1
