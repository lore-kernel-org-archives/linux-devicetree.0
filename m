From: Grzegorz Jaszczyk <jaz@semihalf.com>
Subject: [PATCH 04/18] ARM: mvebu: a385-db-ap: enable USB (orion-ehci) port
Date: Thu, 21 Jul 2016 14:44:00 +0200
Message-ID: <1469105055-25181-5-git-send-email-jaz@semihalf.com>
References: <1469105055-25181-1-git-send-email-jaz@semihalf.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1469105055-25181-1-git-send-email-jaz@semihalf.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, jason@lakedaemon.net, andrew@lunn.ch, sebastian.hesselbarth@gmail.com, linux@armlinux.org.uk, thomas.petazzoni@free-electrons.com, gregory.clement@free-electrons.com, mw@semihalf.com, jaz@semihalf.com, alior@marvell.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
---
 arch/arm/boot/dts/armada-385-db-ap.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/armada-385-db-ap.dts b/arch/arm/boot/dts/armada-385-db-ap.dts
index 2d3fd6e..a18f516 100644
--- a/arch/arm/boot/dts/armada-385-db-ap.dts
+++ b/arch/arm/boot/dts/armada-385-db-ap.dts
@@ -155,6 +155,10 @@
 				bm,pool-short = <3>;
 			};
 
+			usb@58000 {
+				status = "okay";
+			};
+
 			/* CON4 */
 			ethernet@70000 {
 				pinctrl-names = "default";
-- 
1.8.3.1
