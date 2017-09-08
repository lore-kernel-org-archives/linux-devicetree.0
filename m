From: Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 2/2] ARM: dts: keystone-k2g-evm: Add I2C EEPROM DT entry
Date: Fri, 8 Sep 2017 13:21:42 -0500
Message-ID: <20170908182142.5274-3-fcooper@ti.com>
References: <20170908182142.5274-1-fcooper@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170908182142.5274-1-fcooper-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vigneshr-l0cyMroinI0@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org
Cc: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>

K2G EVM has an onboard I2C EEPROM connected to I2C0. This patch adds
the necessary DT entry for the AT24CM01 EEPROM.

Signed-off-by: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Signed-off-by: Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/keystone-k2g-evm.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2g-evm.dts b/arch/arm/boot/dts/keystone-k2g-evm.dts
index f462f10..a6ad5fc 100644
--- a/arch/arm/boot/dts/keystone-k2g-evm.dts
+++ b/arch/arm/boot/dts/keystone-k2g-evm.dts
@@ -81,6 +81,14 @@
 			K2G_CORE_IOPAD(0x1110) (BUFFER_CLASS_B | PIN_PULLUP | MUX_MODE0)	/* mmc1_cmd.mmc1_cmd */
 		>;
 	};
+
+	i2c0_pins: pinmux_i2c0_pins {
+		pinctrl-single,pins = <
+			K2G_CORE_IOPAD(0x137c) (BUFFER_CLASS_B | PIN_PULLUP | MUX_MODE0)	/* i2c0_scl.i2c0_scl */
+			K2G_CORE_IOPAD(0x1380) (BUFFER_CLASS_B | PIN_PULLUP | MUX_MODE0)	/* i2c0_sda.i2c0_sda */
+		>;
+	};
+
 };
 
 &uart0 {
@@ -112,3 +120,14 @@
 	memory-region = <&dsp_common_memory>;
 	status = "okay";
 };
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c1024";
+		reg = <0x50>;
+	};
+};
-- 
2.9.4.dirty

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
