From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/3] ARM: dts: sun4i: Add touchscreen node to
 chuwi-v7 dts file
Date: Tue, 22 Dec 2015 23:35:01 +0100
Message-ID: <1450823702-21565-2-git-send-email-hdegoede@redhat.com>
References: <1450823702-21565-1-git-send-email-hdegoede@redhat.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBK5A46ZQKGQEDTRN4QA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1450823702-21565-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a node describing the focaltech ft5306de4 touchscreen found on
chuwi-v7-cw0825 tablets.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
-Drop unused pinctrl-names = "default";
---
 arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts b/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts
index 5366089..023b03e 100644
--- a/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts
+++ b/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts
@@ -45,6 +45,7 @@
 #include "sunxi-common-regulators.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "Chuwi V7 CW0825";
@@ -88,6 +89,15 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_pins_a>;
 	status = "okay";
+
+	ft5306de4: touchscreen@38 {
+		compatible = "edt,edt-ft5406";
+		reg = <0x38>;
+		interrupt-parent = <&pio>;
+		interrupts = <7 21 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <1024>;
+		touchscreen-size-y = <768>;
+	};
 };
 
 &lradc {
-- 
2.5.0
