From: Afzal Mohammed <afzal@ti.com>
Subject: [PATCH v2] ARM: dts: am33xx: rtc node
Date: Tue, 30 Oct 2012 15:04:01 +0530
Message-ID: <1351589646-27082-1-git-send-email-afzal@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benoit Cousson <b-cousson@ti.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, Afzal Mohammed <afzal@ti.com>, Russell King <linux@arm.linux.org.uk>, Tony Lindgren <tony@atomide.com>, AnilKumar Ch <anilkumar@ti.com>, Rob Herring <rob.herring@calxeda.com>, Vaibhav Hiremath <hvaibhav@ti.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add am33xx rtc node.

Signed-off-by: Afzal Mohammed <afzal@ti.com>
---
Hi Benoit,

This is based on your for_3.8/dts branch.

This has been tested on Beagle Bone.

Bindings along with driver changes for DT has been picked by Andrew
Morton and is now present in linux-next.

Regards
Afzal

v2
 1. Remove interrupt parent in rtc node.
 2. Modify subject as per new convention.


 arch/arm/boot/dts/am33xx.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index 70d24b8..97a7bd3 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -291,5 +291,13 @@
 			ti,hwmods = "timer7";
 			ti,timer-pwm;
 		};
+
+		rtc@44e3e000 {
+			compatible = "ti,da830-rtc";
+			reg = <0x44e3e000 0x1000>;
+			interrupts = <75
+				      76>;
+			ti,hwmods = "rtc";
+		};
 	};
 };
-- 
1.7.12
