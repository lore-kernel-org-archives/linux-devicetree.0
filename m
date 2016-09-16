From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Subject: [PATCH v2 3/3] ARM: dts: aspeed: Enable BT IPMI BMC device
Date: Fri, 16 Sep 2016 12:39:27 +0200
Message-ID: <1474022367-21029-4-git-send-email-clg@kaod.org>
References: <1474022367-21029-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1474022367-21029-1-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>, openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org>
---
 Changes since v1:

 - added the soc name ast2400 in the compatible cell 

 arch/arm/boot/dts/aspeed-g4.dtsi | 6 ++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 22dee5937d5c..7bb00b6f13d8 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -82,6 +82,12 @@
 				clocks = <&clk_apb>;
 			};
 
+			ibt: ibt@1e789140 {
+				compatible = "aspeed,ast2400-bt-bmc";
+				reg = <0x1e789140 0x18>;
+				interrupts = <8>;
+			};
+
 			wdt1: wdt@1e785000 {
 				compatible = "aspeed,wdt";
 				reg = <0x1e785000 0x1c>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index dd94d9361fda..1d8f81b548b3 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -86,6 +86,12 @@
 				clocks = <&clk_apb>;
 			};
 
+			ibt: ibt@1e789140 {
+				compatible = "aspeed,ast2400-bt-bmc";
+				reg = <0x1e789140 0x18>;
+				interrupts = <8>;
+			};
+
 			wdt1: wdt@1e785000 {
 				compatible = "aspeed,wdt";
 				reg = <0x1e785000 0x1c>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
