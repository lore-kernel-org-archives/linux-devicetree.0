From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: dts: Fix missing usb0_reset for sun4i / sun5i
Date: Wed, 24 Dec 2014 20:19:18 +0100
Message-ID: <1419448758-22371-2-git-send-email-hdegoede@redhat.com>
References: <1419448758-22371-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBQVD5SSAKGQED76ZPGI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1419448758-22371-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alain Durand <alain-rYygLG2KK6I@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The recent sun4i-usb-phy changes to add (preliminary) support for the oth phy,
cause the ehci/ohci controllers to no longer work on sun4i / sun5i, because
the phy driver refuses to load due to a missing usb0_reset reset controller
in the dts files for sun4i / sun5i:

[    0.094293] sun4i-usb-phy 1c13400.phy: failed to get reset usb0_reset
[    0.094326] sun4i-usb-phy: probe of 1c13400.phy failed with error -22

This fixes this.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun4i-a10.dtsi  | 4 ++--
 arch/arm/boot/dts/sun5i-a10s.dtsi | 4 ++--
 arch/arm/boot/dts/sun5i-a13.dtsi  | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
index 03e6843..356efb8 100644
--- a/arch/arm/boot/dts/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/sun4i-a10.dtsi
@@ -445,8 +445,8 @@
 			reg-names = "phy_ctrl", "pmu1", "pmu2";
 			clocks = <&usb_clk 8>;
 			clock-names = "usb_phy";
-			resets = <&usb_clk 1>, <&usb_clk 2>;
-			reset-names = "usb1_reset", "usb2_reset";
+			resets = <&usb_clk 0>, <&usb_clk 1>, <&usb_clk 2>;
+			reset-names = "usb0_reset", "usb1_reset", "usb2_reset";
 			status = "disabled";
 		};
 
diff --git a/arch/arm/boot/dts/sun5i-a10s.dtsi b/arch/arm/boot/dts/sun5i-a10s.dtsi
index f936b03..668521d 100644
--- a/arch/arm/boot/dts/sun5i-a10s.dtsi
+++ b/arch/arm/boot/dts/sun5i-a10s.dtsi
@@ -397,8 +397,8 @@
 			reg-names = "phy_ctrl", "pmu1";
 			clocks = <&usb_clk 8>;
 			clock-names = "usb_phy";
-			resets = <&usb_clk 1>;
-			reset-names = "usb1_reset";
+			resets = <&usb_clk 0>, <&usb_clk 1>;
+			reset-names =  "usb0_reset", "usb1_reset";
 			status = "disabled";
 		};
 
diff --git a/arch/arm/boot/dts/sun5i-a13.dtsi b/arch/arm/boot/dts/sun5i-a13.dtsi
index 3306254..02a9459 100644
--- a/arch/arm/boot/dts/sun5i-a13.dtsi
+++ b/arch/arm/boot/dts/sun5i-a13.dtsi
@@ -362,8 +362,8 @@
 			reg-names = "phy_ctrl", "pmu1";
 			clocks = <&usb_clk 8>;
 			clock-names = "usb_phy";
-			resets = <&usb_clk 1>;
-			reset-names = "usb1_reset";
+			resets = <&usb_clk 0>, <&usb_clk 1>;
+			reset-names =  "usb0_reset", "usb1_reset";
 			status = "disabled";
 		};
 
-- 
2.1.0
