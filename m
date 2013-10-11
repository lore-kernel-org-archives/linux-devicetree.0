From: Andrey Konovalov <andrey.konovalov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ARM: dts: move wl12xx pins to the proper pinmux for pandaboard
Date: Fri, 11 Oct 2013 23:33:56 +0400
Message-ID: <525852A4.6090500@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: rnayak-l0cyMroinI0@public.gmane.org, bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, luca-XPOmlcxoEMv1KXRcyAk9cg@public.gmane.org, p.pisati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Commit 851320e (ARM: dts: Fix muxing and regulator for wl12xx on the
SDIO bus for pandaboard) put the wl12xx pins into omap4_pmx_wkup. This
is not correct, and results in the following messages at the boot time:

  pinctrl-single 4a31e040.pinmux: mux offset out of range: 0x38 (0x38)
  pinctrl-single 4a31e040.pinmux: could not add functions for pinmux_wl12xx_pins 56x

Actually these pins belong to omap4_pmx_core.

Signed-off-by: Andrey Konovalov <andrey.konovalov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
  arch/arm/boot/dts/omap4-panda-common.dtsi |   19 ++++++++++---------
  1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-panda-common.dtsi b/arch/arm/boot/dts/omap4-panda-common.dtsi
index 814ab67..712ddbf 100644
--- a/arch/arm/boot/dts/omap4-panda-common.dtsi
+++ b/arch/arm/boot/dts/omap4-panda-common.dtsi
@@ -239,15 +239,6 @@
  			0xf0 (PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c4_sda */
  		>;
  	};
-};
-
-&omap4_pmx_wkup {
-	led_wkgpio_pins: pinmux_leds_wkpins {
-		pinctrl-single,pins = <
-			0x1a (PIN_OUTPUT | MUX_MODE3)	/* gpio_wk7 */
-			0x1c (PIN_OUTPUT | MUX_MODE3)	/* gpio_wk8 */
-		>;
-	};

  	/*
  	 * wl12xx GPIO outputs for WLAN_EN, BT_EN, FM_EN, BT_WAKEUP
@@ -277,6 +268,16 @@
  	};
  };

+&omap4_pmx_wkup {
+	led_wkgpio_pins: pinmux_leds_wkpins {
+		pinctrl-single,pins = <
+			0x1a (PIN_OUTPUT | MUX_MODE3)	/* gpio_wk7 */
+			0x1c (PIN_OUTPUT | MUX_MODE3)	/* gpio_wk8 */
+		>;
+	};
+
+};
+
  &i2c1 {
  	pinctrl-names = "default";
  	pinctrl-0 = <&i2c1_pins>;
-- 1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
