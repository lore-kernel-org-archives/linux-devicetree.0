From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/9] ARM: dts: sunxi: Add #interrupt-cells to
 pinctrl nodes
Date: Mon, 30 Jun 2014 23:57:51 +0200
Message-ID: <1404165479-23785-2-git-send-email-hdegoede@redhat.com>
References: <1404165479-23785-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDRZXY4CYYORB6V2Y6OQKGQEYEUJQEI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1404165479-23785-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

The pinctrl device is also an interrupt controller for external
interrupts. Add the missing #interrupt-cells property.

Also remove the unused #address-cells property.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
[hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org: make the same change for sun4i, sun5i and sun6i]
Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun4i-a10.dtsi  | 2 +-
 arch/arm/boot/dts/sun5i-a10s.dtsi | 2 +-
 arch/arm/boot/dts/sun5i-a13.dtsi  | 2 +-
 arch/arm/boot/dts/sun6i-a31.dtsi  | 4 ++--
 arch/arm/boot/dts/sun7i-a20.dtsi  | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
index 9a489e2..ae6dd50 100644
--- a/arch/arm/boot/dts/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/sun4i-a10.dtsi
@@ -509,7 +509,7 @@
 			clocks = <&apb0_gates 5>;
 			gpio-controller;
 			interrupt-controller;
-			#address-cells = <1>;
+			#interrupt-cells = <2>;
 			#size-cells = <0>;
 			#gpio-cells = <3>;
 
diff --git a/arch/arm/boot/dts/sun5i-a10s.dtsi b/arch/arm/boot/dts/sun5i-a10s.dtsi
index 25549c1..695a7c6 100644
--- a/arch/arm/boot/dts/sun5i-a10s.dtsi
+++ b/arch/arm/boot/dts/sun5i-a10s.dtsi
@@ -422,7 +422,7 @@
 			clocks = <&apb0_gates 5>;
 			gpio-controller;
 			interrupt-controller;
-			#address-cells = <1>;
+			#interrupt-cells = <2>;
 			#size-cells = <0>;
 			#gpio-cells = <3>;
 
diff --git a/arch/arm/boot/dts/sun5i-a13.dtsi b/arch/arm/boot/dts/sun5i-a13.dtsi
index be28b3b..74895e5 100644
--- a/arch/arm/boot/dts/sun5i-a13.dtsi
+++ b/arch/arm/boot/dts/sun5i-a13.dtsi
@@ -395,7 +395,7 @@
 			clocks = <&apb0_gates 5>;
 			gpio-controller;
 			interrupt-controller;
-			#address-cells = <1>;
+			#interrupt-cells = <2>;
 			#size-cells = <0>;
 			#gpio-cells = <3>;
 
diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
index a9dfa12..baf8eff 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -429,7 +429,7 @@
 			clocks = <&apb1_gates 5>;
 			gpio-controller;
 			interrupt-controller;
-			#address-cells = <1>;
+			#interrupt-cells = <2>;
 			#size-cells = <0>;
 			#gpio-cells = <3>;
 
@@ -756,7 +756,7 @@
 			resets = <&apb0_rst 0>;
 			gpio-controller;
 			interrupt-controller;
-			#address-cells = <1>;
+			#interrupt-cells = <2>;
 			#size-cells = <0>;
 			#gpio-cells = <3>;
 		};
diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 7017839..7597ac1 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -586,7 +586,7 @@
 			clocks = <&apb0_gates 5>;
 			gpio-controller;
 			interrupt-controller;
-			#address-cells = <1>;
+			#interrupt-cells = <2>;
 			#size-cells = <0>;
 			#gpio-cells = <3>;
 
-- 
2.0.0
