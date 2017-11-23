From: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 2/6] ARM: dts: keystone-k2g-evm: Fix botched up merge
Date: Thu, 23 Nov 2017 13:21:50 +0530
Message-ID: <20171123075154.3938-3-vigneshr@ti.com>
References: <20171123075154.3938-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171123075154.3938-1-vigneshr-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

spi1 and ecap0 pinmuxes ended up under root node instead of k2g_pinctrl
node. Fix this by moving them under k2g_pinctrl node.

Signed-off-by: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/keystone-k2g-evm.dts | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/keystone-k2g-evm.dts b/arch/arm/boot/dts/keystone-k2g-evm.dts
index 656af194a518..298a50555e46 100644
--- a/arch/arm/boot/dts/keystone-k2g-evm.dts
+++ b/arch/arm/boot/dts/keystone-k2g-evm.dts
@@ -45,22 +45,6 @@
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 	};
-
-	ecap0_pins: ecap0_pins {
-		pinctrl-single,pins = <
-			K2G_CORE_IOPAD(0x1374) (BUFFER_CLASS_B | MUX_MODE4)	/* pr1_mdio_data.ecap0_in_apwm0_out */
-		>;
-	};
-
-	spi1_pins: pinmux_spi1_pins {
-		pinctrl-single,pins = <
-			K2G_CORE_IOPAD(0x11a4) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0)	/* spi1_scs0.spi1_scs0 */
-			K2G_CORE_IOPAD(0x11ac) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0)	/* spi1_clk.spi1_clk */
-			K2G_CORE_IOPAD(0x11b0) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0)	/* spi1_miso.spi1_miso */
-			K2G_CORE_IOPAD(0x11b4) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0)	/* spi1_mosi.spi1_mosi */
-		>;
-	};
-
 };
 
 &k2g_pinctrl {
@@ -105,6 +89,20 @@
 		>;
 	};
 
+	ecap0_pins: ecap0_pins {
+		pinctrl-single,pins = <
+			K2G_CORE_IOPAD(0x1374) (BUFFER_CLASS_B | MUX_MODE4)	/* pr1_mdio_data.ecap0_in_apwm0_out */
+		>;
+	};
+
+	spi1_pins: pinmux_spi1_pins {
+		pinctrl-single,pins = <
+			K2G_CORE_IOPAD(0x11a4) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0)	/* spi1_scs0.spi1_scs0 */
+			K2G_CORE_IOPAD(0x11ac) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0)	/* spi1_clk.spi1_clk */
+			K2G_CORE_IOPAD(0x11b0) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0)	/* spi1_miso.spi1_miso */
+			K2G_CORE_IOPAD(0x11b4) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0)	/* spi1_mosi.spi1_mosi */
+		>;
+	};
 };
 
 &uart0 {
-- 
2.15.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
