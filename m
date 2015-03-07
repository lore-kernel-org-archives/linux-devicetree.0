From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/7] ARM: dts: sun5i: Add mmc2 pinmux settings
Date: Sat,  7 Mar 2015 20:01:20 +0100
Message-ID: <1425754884-7875-3-git-send-email-hdegoede@redhat.com>
References: <1425754884-7875-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBD4W5WTQKGQESIPIZDY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

Add A13 mmc2 pinmux settings, note these are for a 8bit bus.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun5i.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
index 416c4de..244d896 100644
--- a/arch/arm/boot/dts/sun5i.dtsi
+++ b/arch/arm/boot/dts/sun5i.dtsi
@@ -469,6 +469,15 @@
 				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
+
+			mmc2_pins_a: mmc2@0 {
+				allwinner,pins = "PC6", "PC7", "PC8", "PC9",
+					"PC10", "PC11", "PC12", "PC13",
+					"PC14", "PC15";
+				allwinner,function = "mmc2";
+				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
+				allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+			};
 		};
 
 		timer@01c20c00 {
-- 
2.3.1
