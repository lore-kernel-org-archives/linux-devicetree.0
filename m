From: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Subject: [PATCHv1 1/3] arm: mvebu: add uartX labels for Armada SoC serial nodes
Date: Sun, 16 Nov 2014 01:04:12 +0100
Message-ID: <ee5646b8e097b266f51a68f489644256d7c3df33.1416095841.git.arno@natisbad.org>
References: <cover.1416095841.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1416095841.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


This patch adds uartX labels for Armada SoC serial nodes. This is
a preliminary work to be able to easily reference the serial lines
in Device Tree files. One expected future use is when providing
stdout-path property for barebox.

Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
---
 arch/arm/boot/dts/armada-370-xp.dtsi | 5 +++--
 arch/arm/boot/dts/armada-xp.dtsi     | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/armada-370-xp.dtsi b/arch/arm/boot/dts/armada-370-xp.dtsi
index 83286ec9702c..2be9723bcdf3 100644
--- a/arch/arm/boot/dts/armada-370-xp.dtsi
+++ b/arch/arm/boot/dts/armada-370-xp.dtsi
@@ -151,7 +151,7 @@
 				status = "disabled";
 			};
 
-			serial@12000 {
+			uart0: serial@12000 {
 				compatible = "snps,dw-apb-uart";
 				reg = <0x12000 0x100>;
 				reg-shift = <2>;
@@ -160,7 +160,8 @@
 				clocks = <&coreclk 0>;
 				status = "disabled";
 			};
-			serial@12100 {
+
+			uart1: serial@12100 {
 				compatible = "snps,dw-apb-uart";
 				reg = <0x12100 0x100>;
 				reg-shift = <2>;
diff --git a/arch/arm/boot/dts/armada-xp.dtsi b/arch/arm/boot/dts/armada-xp.dtsi
index bff9f6c18db1..a68f5b837536 100644
--- a/arch/arm/boot/dts/armada-xp.dtsi
+++ b/arch/arm/boot/dts/armada-xp.dtsi
@@ -52,7 +52,7 @@
 				reg = <0x11100 0x100>;
 			};
 
-			serial@12200 {
+			uart2: serial@12200 {
 				compatible = "snps,dw-apb-uart";
 				reg = <0x12200 0x100>;
 				reg-shift = <2>;
@@ -61,7 +61,8 @@
 				clocks = <&coreclk 0>;
 				status = "disabled";
 			};
-			serial@12300 {
+
+			uart3: serial@12300 {
 				compatible = "snps,dw-apb-uart";
 				reg = <0x12300 0x100>;
 				reg-shift = <2>;
-- 
2.1.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
