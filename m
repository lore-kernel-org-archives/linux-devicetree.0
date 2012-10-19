From: Afzal Mohammed <afzal@ti.com>
Subject: [PATCH] arm/dts: am33xx rtc node
Date: Fri, 19 Oct 2012 16:20:21 +0530
Message-ID: <1350643825-9657-1-git-send-email-afzal@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benoit Cousson <b-cousson@ti.com>
Cc: devicetree-discuss@lists.ozlabs.org, Afzal Mohammed <afzal@ti.com>, Russell King <linux@arm.linux.org.uk>, Tony Lindgren <tony@atomide.com>, Rob Herring <rob.herring@calxeda.com>, Vaibhav Hiremath <hvaibhav@ti.com>, Grant Likely <grant.likely@secretlab.ca>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

add am33xx rtc node.

Signed-off-by: Afzal Mohammed <afzal@ti.com>
---

Based on v3.7-rc1,
Dependent on series "rtc: omap dt support (for am33xx)",
(https://lkml.org/lkml/2012/10/19/163)
Tested on Beagle Bone.

 arch/arm/boot/dts/am33xx.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index bb31bff..356711e 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -210,5 +210,14 @@
 			interrupt-parent = <&intc>;
 			interrupts = <91>;
 		};
+
+		rtc {
+			compatible = "ti,da830-rtc";
+			ti,hwmods = "rtc";
+			reg = <0x44e3e000 0x1000>;
+			interrupt-parent = <&intc>;
+			interrupts = <75
+				      76>;
+		};
 	};
 };
-- 
1.7.12
