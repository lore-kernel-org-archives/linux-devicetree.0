From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 17/19] ARM: dts: armada: replace isil,irq2-can-wakeup-machine with wakeup-source property
Date: Wed, 21 Oct 2015 11:10:14 +0100
Message-ID: <1445422216-29375-18-git-send-email-sudeep.holla@arm.com>
References: <1445422216-29375-1-git-send-email-sudeep.holla@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445422216-29375-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Though the driver will continue to check for and support the legacy
"isil,irq2-can-wakeup-machine" boolean property to wakeup source,
"wakeup-source" is the new standard binding.

This patch replaces the legacy "isil,irq2-can-wakeup-machine" with the
unified "wakeup-source" property in order to avoid any futher copy-paste
duplication.

Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Gregory Clement <gregory.clement@free-electrons.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/arm/boot/dts/armada-370-netgear-rn102.dts | 2 +-
 arch/arm/boot/dts/armada-370-netgear-rn104.dts | 2 +-
 arch/arm/boot/dts/armada-xp-netgear-rn2120.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/armada-370-netgear-rn102.dts b/arch/arm/boot/dts/armada-370-netgear-rn102.dts
index a31207860f34..6012c8ff778e 100644
--- a/arch/arm/boot/dts/armada-370-netgear-rn102.dts
+++ b/arch/arm/boot/dts/armada-370-netgear-rn102.dts
@@ -120,7 +120,7 @@
 				isl12057: isl12057@68 {
 					compatible = "isil,isl12057";
 					reg = <0x68>;
-					isil,irq2-can-wakeup-machine;
+					wakeup-source;
 				};
 
 				g762: g762@3e {
diff --git a/arch/arm/boot/dts/armada-370-netgear-rn104.dts b/arch/arm/boot/dts/armada-370-netgear-rn104.dts
index 00540f292979..7c5e8041cf48 100644
--- a/arch/arm/boot/dts/armada-370-netgear-rn104.dts
+++ b/arch/arm/boot/dts/armada-370-netgear-rn104.dts
@@ -126,7 +126,7 @@
 				isl12057: isl12057@68 {
 					compatible = "isil,isl12057";
 					reg = <0x68>;
-					isil,irq2-can-wakeup-machine;
+					wakeup-source;
 				};
 
 				g762: g762@3e {
diff --git a/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts b/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
index 1516fc2627f9..daf88ede1192 100644
--- a/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
+++ b/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
@@ -133,7 +133,7 @@
 				isl12057: isl12057@68 {
 					compatible = "isil,isl12057";
 					reg = <0x68>;
-					isil,irq2-can-wakeup-machine;
+					wakeup-source;
 				};
 
 				/* Controller for rear fan #1 of 3 (Protechnic
-- 
1.9.1
