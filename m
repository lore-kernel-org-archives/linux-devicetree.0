From: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [RFC v3 1/3] gpio: dt-bindings: add basic-mmio-gpio bindings
Date: Wed, 27 Apr 2016 00:51:52 +0200
Message-ID: <7e8845e6b6384c6b5673532ebef79c8730ed7748.1461710784.git.chunkeey@googlemail.com>
References: <cover.1461710784.git.chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1461710784.git.chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
In-Reply-To: <cover.1461710784.git.chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
References: <cover.1461710784.git.chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=46rom: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

This patch adds the device tree bindings for the basic-mmio-gpio.
The basic-mmio-gpio is already part of a the GPIO generic library
and shares its compatible with the platform device.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 .../devicetree/bindings/gpio/basic-mmio-gpio.txt   | 73 ++++++++++++++=
++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/basic-mmio-g=
pio.txt

diff --git a/Documentation/devicetree/bindings/gpio/basic-mmio-gpio.txt=
 b/Documentation/devicetree/bindings/gpio/basic-mmio-gpio.txt
new file mode 100644
index 0000000..5efb155
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/basic-mmio-gpio.txt
@@ -0,0 +1,73 @@
+Bindings for the generic driver for memory-mapped GPIO controllers.
+
+Required properties:
+	- compatible: should be "basic-mmio-gpio"
+	- reg-names: must contain
+		"dat" - data register
+		may contain
+		"set" - data set register
+		"clr" - data clear register
+		"dirout" - direction output register
+		"dirin" - direction input register
+	- reg: address + size pairs describing the GPIO register sets;
+		order must correspond with the order of entries in reg-names
+	- #gpio-cells =3D must be set to 2
+	- gpio-controller: Marks the device node as a gpio controller.
+
+Optional properties:
+	- ngpio: specifies the number of gpio mapped in the register.
+	- big-endian: force big endian register accesses.
+	- big-endian-byte-order: assign GPIOs in reverse order.
+	- unreadable-reg-set: data set register is not readable.
+	- read-output-reg-set: cache value set for reads.
+	- unreadable-reg-dir: dirout/dirin register is not readable.
+	- no-output: GPIOs are read-only.
+
+The GPIO generic library provides support for basic memory-mapped GPIO
+controllers. The configuration is detected by which resources are pres=
ent.
+The simplest form of a GPIO controller that the driver support is just=
 a
+single "dat" register, where GPIO state can be read and/or written.
+However, the driver supports far more:
+	- 8/16/32/64 bits registers. The number of GPIOs is automatically
+	  determined by the width of the registers.
+	- GPIO controllers with clear/set registers.
+	- GPIO controllers with a single "dat" register.
+	- Big endian bits/GPIOs ordering.
+
+For setting GPIO's there are three configurations:
+	1. single input/output register resource (named "dat"),
+	2. set/clear pair (named "set" and "clr"),
+	3. single output register resource and single input resource
+	   ("set" and dat").
+
+For setting the GPIO direction, there are three configurations:
+	a. simple bidirection GPIO that requires no configuration.
+	b. an output direction register (named "dirout")
+	   where a 1 bit indicates the GPIO is an output.
+	c. an input direction register (named "dirin")
+	   where a 1 bit indicates the GPIO is an input.
+
+Examples:
+
+	/* Configuration for single input/output register
+	 * for eight simple bidirection GPIOs.
+	 */
+	gpio_a_1 {
+		compatible =3D "basic-mmio-gpio";
+		reg =3D <0x18000000 0x1>;
+		reg-names =3D "dat";
+		#gpio-cells =3D <2>;
+		gpio-controller;
+	};
+
+	/* Configuration for set/clear pair registers with
+	 * 32 output direction register GPIOs.
+	 */
+	gpio_b_2 {
+		compatible =3D "basic-mmio-gpio";
+		reg =3D <0x18000000 0x4>, <0x18000010 0x4>,
+		      <0x18000004 0x4>, <0x18000008 0x4>;
+		reg-names =3D "dat", "set", "clr", "dirout";
+		#gpio-cells =3D <2>;
+		gpio-controller;
+	};
--=20
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
