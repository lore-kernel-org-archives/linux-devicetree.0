From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH] ARM: dts: BCM5301X: Change Ethernet switch management port
Date: Tue, 12 Feb 2019 20:25:59 -0800
Message-ID: <20190213042600.27729-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, "maintainer:BROADCOM BCM5301X ARM
        ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

BCM5301X has 3 Ethernet controllers: GMAC0, 1, 2 which map to ports 5, 7
and 8 respectively of the internal switch. Future changes will turn on
management mode in the Ethernet switch driver (b53) which will require
us to use port 8.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts b/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
index 3fced3b7f1a8..affa9cc7422d 100644
--- a/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
+++ b/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
@@ -150,10 +150,15 @@
 			label = "wan";
 		};
 
-		port@5 {
-			reg = <5>;
+		port@8 {
+			reg = <8>;
 			label = "cpu";
-			ethernet = <&gmac0>;
+			ethernet = <&gmac2>;
+
+			fixed-link {
+				speed = <1000>;
+				full-duplex;
+			};
 		};
 	};
 };
-- 
2.19.1
