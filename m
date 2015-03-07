From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/7] ARM: dts: sun5i: Stop using different
 compatibles for ehci/ohci on a13 vs a10s
Date: Sat,  7 Mar 2015 20:01:19 +0100
Message-ID: <1425754884-7875-2-git-send-email-hdegoede@redhat.com>
References: <1425754884-7875-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBDMW5WTQKGQE66OYJIA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1425754884-7875-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The A13 and the A10s use the same die (this has been confirmed by Allwinner),
as such there is no need to differentiate between the ehci/ohci parts of both,
the only reasons there were different allwinner,sun5i-a*-foo compatible
between these 2 parts is costemetically and because we could when we still
had 2 completely different dtsi files.

The allwinner,sun5i-a*-foo compatible strings are not used for binding at all,
the actual driver binds to the generic-?hci compatible, so we can safely remove
this cosmetical difference and simplify the dtsi files.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun5i-a10s.dtsi | 8 --------
 arch/arm/boot/dts/sun5i-a13.dtsi  | 8 --------
 arch/arm/boot/dts/sun5i.dtsi      | 2 ++
 3 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/sun5i-a10s.dtsi b/arch/arm/boot/dts/sun5i-a10s.dtsi
index ef516db..a78c95d 100644
--- a/arch/arm/boot/dts/sun5i-a10s.dtsi
+++ b/arch/arm/boot/dts/sun5i-a10s.dtsi
@@ -157,14 +157,6 @@
 	};
 };
 
-&ehci0 {
-	compatible = "allwinner,sun5i-a10s-ehci", "generic-ehci";
-};
-
-&ohci0 {
-	compatible = "allwinner,sun5i-a10s-ohci", "generic-ohci";
-};
-
 &pio {
 	compatible = "allwinner,sun5i-a10s-pinctrl";
 
diff --git a/arch/arm/boot/dts/sun5i-a13.dtsi b/arch/arm/boot/dts/sun5i-a13.dtsi
index 5d9ce84..136158f 100644
--- a/arch/arm/boot/dts/sun5i-a13.dtsi
+++ b/arch/arm/boot/dts/sun5i-a13.dtsi
@@ -153,14 +153,6 @@
 	cooling-max-level = <6>;
 };
 
-&ehci0 {
-	compatible = "allwinner,sun5i-a13-ehci", "generic-ehci";
-};
-
-&ohci0 {
-	compatible = "allwinner,sun5i-a13-ohci", "generic-ohci";
-};
-
 &pio {
 	compatible = "allwinner,sun5i-a13-pinctrl";
 
diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
index 610ea18..416c4de 100644
--- a/arch/arm/boot/dts/sun5i.dtsi
+++ b/arch/arm/boot/dts/sun5i.dtsi
@@ -392,6 +392,7 @@
 		};
 
 		ehci0: usb@01c14000 {
+			compatible = "allwinner,sun5i-a13-ehci", "generic-ehci";
 			reg = <0x01c14000 0x100>;
 			interrupts = <39>;
 			clocks = <&ahb_gates 1>;
@@ -401,6 +402,7 @@
 		};
 
 		ohci0: usb@01c14400 {
+			compatible = "allwinner,sun5i-a13-ohci", "generic-ohci";
 			reg = <0x01c14400 0x100>;
 			interrupts = <40>;
 			clocks = <&usb_clk 6>, <&ahb_gates 2>;
-- 
2.3.1
