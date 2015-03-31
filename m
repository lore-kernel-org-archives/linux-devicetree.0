From: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: dts: sun7i: Add Goodix GT911 nodes for Wexler TAB7200
Date: Tue, 31 Mar 2015 11:18:17 +0300
Message-ID: <1427789897-4085-1-git-send-email-mamlinav@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds nodes for the Goodix GT911 touchscreen controller found
on the Wexler TAB7200 tablet. Controller uses one of following I2C
addresses: 0x5d or 0x14, so just add two nodes.

Signed-off-by: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
DT support for the Goodix GT911 touchscreen controller has been queued up
by Dmitry Torokhov for merging into 4.1:
https://git.kernel.org/cgit/linux/kernel/git/dtor/input.git/commit/?h=next&id=771d8f1b178e7e09fcc641fccd48852958dbc329

IRQ flags are set by the touchscreen controller driver, so use IRQ_TYPE_NONE.

 arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts b/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
index 2ad3b09..34e2bce 100644
--- a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
+++ b/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
@@ -101,6 +101,20 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_pins_a>;
 	status = "okay";
+
+	gt911@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		interrupt-parent = <&pio>;
+		interrupts = <21 IRQ_TYPE_NONE>; /* EINT21 (PH21) */
+	};
+
+	gt911@14 {
+		compatible = "goodix,gt911";
+		reg = <0x14>;
+		interrupt-parent = <&pio>;
+		interrupts = <21 IRQ_TYPE_NONE>; /* EINT21 (PH21) */
+	};
 };
 
 &lradc {
-- 
2.0.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
