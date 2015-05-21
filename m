From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] ARM: dts: sun7i: Add uart4 support for
 BananaPro, disable uart2
Date: Thu, 21 May 2015 14:32:35 +0200
Message-ID: <1432211555-25078-3-git-send-email-hdegoede@redhat.com>
References: <1432211555-25078-1-git-send-email-hdegoede@redhat.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORB3NA66VAKGQE6WXUZPI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1432211555-25078-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Michael Ring <mail-u1jPNj63thkWnkcawLe0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Michael Ring <mail-u1jPNj63thkWnkcawLe0jA@public.gmane.org>

The BananaPro uses uart4 for the default rx/tx pins on the 40 pins connector,
so enable uart4.

Uart2 is also available at the bananapro io-pins, but like on the bananapi
the primary function of the pins is to act as gpios, see:
http://forum.lemaker.org/forum.php?mod=viewthread&tid=10852

Disable the uart2 node by default, but leave it in place so that people
can easily enable it.

Signed-off-by: Michael Ring <mail-u1jPNj63thkWnkcawLe0jA@public.gmane.org>
[hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org: Disable uart2 by default]
Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun7i-a20-bananapro.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun7i-a20-bananapro.dts b/arch/arm/boot/dts/sun7i-a20-bananapro.dts
index 45e2a02..4edb8a4 100644
--- a/arch/arm/boot/dts/sun7i-a20-bananapro.dts
+++ b/arch/arm/boot/dts/sun7i-a20-bananapro.dts
@@ -52,8 +52,9 @@
 
 	aliases {
 		serial0 = &uart0;
-		serial1 = &uart2;
+		serial1 = &uart4;
 		serial2 = &uart7;
+		serial3 = &uart2;
 	};
 
 	chosen {
@@ -253,6 +254,12 @@
 &uart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart2_pins_a>;
+	status = "disabled";
+};
+
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart4_pins_b>;
 	status = "okay";
 };
 
-- 
2.4.1
