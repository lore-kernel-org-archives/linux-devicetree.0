From: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Subject: [PATCH v2 2/5] Documentation: devicetree: Add DT bindings to eeprom_93xx46 driver.
Date: Wed, 18 Nov 2015 22:29:38 -0500
Message-ID: <1447903781-3910-3-git-send-email-cory.tusar@pid1solutions.com>
References: <1447903781-3910-1-git-send-email-cory.tusar@pid1solutions.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447903781-3910-1-git-send-email-cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, agust-ynQEQJNshbs@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, afd-l0cyMroinI0@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, Chris.Healy-c8ZVq/bFV1I@public.gmane.org, Keith.Vennel-c8ZVq/bFV1I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This commit documents bindings to be added to the eeprom_93xx46 driver
which will allow:

  - Device word size and read-only attributes to be specified.
  - A device-specific compatible string for use with Atmel AT93C46D
    EEPROMs.
  - Specifying a GPIO line to function as a 'select' or 'enable' signal
    prior to accessing the EEPROM.

Signed-off-by: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
---
 .../devicetree/bindings/misc/eeprom-93xx46.txt     | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt b/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
new file mode 100644
index 0000000..8e116a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
@@ -0,0 +1,25 @@
+EEPROMs (SPI) compatible with Microchip Technology 93xx46 family.
+
+Required properties:
+- compatible : shall be one of:
+    "atmel,at93c46d"
+    "eeprom-93xx46"
+- data-size : number of data bits per word (either 8 or 16)
+
+Optional properties:
+- read-only : parameter-less property which disables writes to the EEPROM
+- select-gpios : if present, specifies the GPIO that will be asserted prior to
+  each access to the EEPROM (e.g. for SPI bus multiplexing)
+
+Property rules described in Documentation/devicetree/bindings/spi/spi-bus.txt
+apply.  In particular, "reg" and "spi-max-frequency" properties must be given.
+
+Example:
+	93c46c@0 {
+		compatible = "eeprom-93xx46";
+		reg = <0>;
+		spi-max-frequency = <1000000>;
+		spi-cs-high;
+		data-size = <8>;
+		select-gpios = <&gpio4 4 GPIO_ACTIVE_HIGH>;
+	};
-- 
2.4.10

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
