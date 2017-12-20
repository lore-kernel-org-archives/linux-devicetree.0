From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH v3 03/20] ARM: dts: aspeed: Add LPC and child devices
Date: Wed, 20 Dec 2017 13:53:11 +1030
Message-ID: <20171220032328.30584-4-joel@jms.id.au>
References: <20171220032328.30584-1-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171220032328.30584-1-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Patrick Venture <venture-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Xo Wang <xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lei YU <mine260309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>

Ensure the ordering is correct and add all of the children in the SoC
device trees for the ast2400 and ast2500.

Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Reviewed-by: Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org>
Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
---
v3:
 - Fix ast2400 compatible string
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 35 +++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 27 +++++++++++++++++----------
 2 files changed, 52 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 45d815a86d42..9422f9cb1e11 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -225,6 +225,41 @@
 				status = "disabled";
 			};
 
+			lpc: lpc@1e789000 {
+				compatible = "aspeed,ast2400-lpc", "simple-mfd";
+				reg = <0x1e789000 0x1000>;
+
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x1e789000 0x1000>;
+
+				lpc_bmc: lpc-bmc@0 {
+					compatible = "aspeed,ast2400-lpc-bmc";
+					reg = <0x0 0x80>;
+				};
+
+				lpc_host: lpc-host@80 {
+					compatible = "aspeed,ast2400-lpc-host", "simple-mfd", "syscon";
+					reg = <0x80 0x1e0>;
+					reg-io-width = <4>;
+
+					#address-cells = <1>;
+					#size-cells = <1>;
+					ranges = <0x0 0x80 0x1e0>;
+
+					lpc_ctrl: lpc-ctrl@0 {
+						compatible = "aspeed,ast2400-lpc-ctrl";
+						reg = <0x0 0x80>;
+						status = "disabled";
+					};
+
+					lhc: lhc@20 {
+						compatible = "aspeed,ast2400-lhc";
+						reg = <0x20 0x24 0x48 0x8>;
+					};
+				};
+			};
+
 			uart2: serial@1e78d000 {
 				compatible = "ns16550a";
 				reg = <0x1e78d000 0x20>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 5c4ecdba3a6b..069f13df19d1 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -265,6 +265,16 @@
 				status = "disabled";
 			};
 
+			vuart: serial@1e787000 {
+				compatible = "aspeed,ast2500-vuart";
+				reg = <0x1e787000 0x40>;
+				reg-shift = <2>;
+				interrupts = <10>;
+				clocks = <&clk_uart>;
+				no-loopback-test;
+				status = "disabled";
+			};
+
 			lpc: lpc@1e789000 {
 				compatible = "aspeed,ast2500-lpc", "simple-mfd";
 				reg = <0x1e789000 0x1000>;
@@ -288,6 +298,13 @@
 
 					reg-io-width = <4>;
 
+					lpc_ctrl: lpc-ctrl@0 {
+						compatible = "aspeed,ast2500-lpc-ctrl";
+						reg = <0x0 0x80>;
+						status = "disabled";
+					};
+
+
 					lhc: lhc@20 {
 						compatible = "aspeed,ast2500-lhc";
 						reg = <0x20 0x24 0x48 0x8>;
@@ -295,16 +312,6 @@
 				};
 			};
 
-			vuart: serial@1e787000 {
-				compatible = "aspeed,ast2500-vuart";
-				reg = <0x1e787000 0x40>;
-				reg-shift = <2>;
-				interrupts = <10>;
-				clocks = <&clk_uart>;
-				no-loopback-test;
-				status = "disabled";
-			};
-
 			uart2: serial@1e78d000 {
 				compatible = "ns16550a";
 				reg = <0x1e78d000 0x20>;
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
