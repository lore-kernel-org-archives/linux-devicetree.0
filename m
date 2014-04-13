From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/4] ARM: sun7i: dt: Add address- and size-cells
 info to i2c controller nodes
Date: Sun, 13 Apr 2014 13:41:05 +0200
Message-ID: <1397389265-22288-5-git-send-email-hdegoede@redhat.com>
References: <1397389265-22288-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBXPPVGNAKGQERNFXJ7A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1397389265-22288-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun7i-a20.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 88d44135..f4b00a5 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -848,6 +848,8 @@
 			clocks = <&apb1_gates 0>;
 			clock-frequency = <100000>;
 			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 
 		i2c1: i2c@01c2b000 {
@@ -857,6 +859,8 @@
 			clocks = <&apb1_gates 1>;
 			clock-frequency = <100000>;
 			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 
 		i2c2: i2c@01c2b400 {
@@ -866,6 +870,8 @@
 			clocks = <&apb1_gates 2>;
 			clock-frequency = <100000>;
 			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 
 		i2c3: i2c@01c2b800 {
@@ -875,6 +881,8 @@
 			clocks = <&apb1_gates 3>;
 			clock-frequency = <100000>;
 			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 
 		i2c4: i2c@01c2bc00 {
@@ -884,6 +892,8 @@
 			clocks = <&apb1_gates 15>;
 			clock-frequency = <100000>;
 			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 
 		gmac: ethernet@01c50000 {
-- 
1.9.0
