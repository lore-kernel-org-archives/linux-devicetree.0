From: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH linux-next 1/2] mfd: devicetree: add bindings for Atmel Flexcom
Date: Mon, 15 Jun 2015 18:38:04 +0200
Message-ID: <9cb26f42aaba9629e48d3def610ce90aa8574e06.1434386119.git.cyrille.pitchen@atmel.com>
References: <cover.1434386119.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1434386119.git.cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/mfd/atmel-flexcom.txt      | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/atmel-flexcom.txt

diff --git a/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt b/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
new file mode 100644
index 0000000..6b1a32e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
@@ -0,0 +1,28 @@
+* Device tree bindings for Atmel Flexcom (Flexible Serial Communication Unit)
+
+The Atmel Flexcom is just a wrapper which embeds a SPI controller, an I2C
+controller and an USART. Only one function can be used at a time and is chosen
+at boot time according to the device tree.
+
+Required properties:
+- compatible: "atmel,sama5d2-flexcom"
+- reg: shall be the offset/length value for Flexcom dedicated I/O registers
+  (without USART, TWI or SPI registers).
+- clocks: shall be the Flexcom peripheral clock from PMC.
+- #address-cells: should be <1>
+- #size-cells: should be <1>
+- ranges: must be present
+- atmel,flexcom-mode: shall be a string among { "spi", "usart", "i2c", "twi" }.
+  "i2c" and "twi" are synonymous.
+
+Example:
+
+flx0: flexcom@f8034000 {
+	compatible = "atmel,sama5d2-flexcom";
+	reg = <0xf8034000 0x200>;
+	clocks = <&flx0_clk>;
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges;
+	atmel,flexcom-mode = "spi";
+};
-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
