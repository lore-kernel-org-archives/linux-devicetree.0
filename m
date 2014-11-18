From: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Subject: [PATCHv4 07/10] arm: mvebu: define and use common Armada XP UART2/3
 pinctrl settings
Date: Wed, 19 Nov 2014 00:02:35 +0100
Message-ID: <48fff9def399198ff282ac4a0618059dfc3a1228.1416351426.git.arno@natisbad.org>
References: <cover.1416351425.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1416351425.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


This patch defines common Armada XP pinctrl settings for uart2 and
uart3 interfaces (uart0 and uart1 rx/tx do not rely on MPP):

 uart2: MPP42-43 as default
 uart3: MPP44-45 as default

Suggested-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
---
 arch/arm/boot/dts/armada-xp.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/armada-xp.dtsi b/arch/arm/boot/dts/armada-xp.dtsi
index dcfef0311a88..acb236909649 100644
--- a/arch/arm/boot/dts/armada-xp.dtsi
+++ b/arch/arm/boot/dts/armada-xp.dtsi
@@ -55,6 +55,8 @@
 
 			uart2: serial@12200 {
 				compatible = "snps,dw-apb-uart";
+				pinctrl-0 = <&uart2_pins>;
+				pinctrl-names = "default";
 				reg = <0x12200 0x100>;
 				reg-shift = <2>;
 				interrupts = <43>;
@@ -65,6 +67,8 @@
 
 			uart3: serial@12300 {
 				compatible = "snps,dw-apb-uart";
+				pinctrl-0 = <&uart3_pins>;
+				pinctrl-names = "default";
 				reg = <0x12300 0x100>;
 				reg-shift = <2>;
 				interrupts = <44>;
@@ -235,4 +239,14 @@
 			       "mpp33", "mpp34", "mpp35";
 		marvell,function = "sd0";
 	};
+
+	uart2_pins: uart2-pins {
+		marvell,pins = "mpp42", "mpp43";
+		marvell,function = "uart2";
+	};
+
+	uart3_pins: uart3-pins {
+		marvell,pins = "mpp44", "mpp45";
+		marvell,function = "uart3";
+	};
 };
\ No newline at end of file
-- 
2.1.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
