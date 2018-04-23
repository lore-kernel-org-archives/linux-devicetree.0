From: Peter Rosin <peda@axentia.se>
Subject: [PATCH v4 1/4] dt-bindings: iio: afe: add binding for current-sense-shunt
Date: Mon, 23 Apr 2018 23:08:06 +0200
Message-ID: <20180423210809.29586-2-peda@axentia.se>
References: <20180423210809.29586-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180423210809.29586-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Andrew F . Davis" <afd@ti.com>, Fabio Estevam <festevam@gmail.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

An ADC is often used to measure other quantities indirectly. This
binding describe one cases, a current through a shunt resistor
measured by the voltage over it.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Peter Rosin <peda@axentia.se>
---
 .../bindings/iio/afe/current-sense-shunt.txt       | 41 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++++
 2 files changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/afe/current-sense-shunt.txt

diff --git a/Documentation/devicetree/bindings/iio/afe/current-sense-shunt.txt b/Documentation/devicetree/bindings/iio/afe/current-sense-shunt.txt
new file mode 100644
index 000000000000..4d842aa85040
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/afe/current-sense-shunt.txt
@@ -0,0 +1,41 @@
+Current Sense Shunt
+===================
+
+When an io-channel measures the voltage over a current sense shunt,
+the interesting mesaurement is almost always the current through the
+shunt, not the voltage over it. This binding describes such a current
+sense circuit.
+
+Required properties:
+- compatible : "current-sense-shunt"
+- io-channels : Channel node of a voltage io-channel.
+- shunt-resistor-micro-ohms : The shunt resistance in microohms.
+
+Example:
+The system current is measured by measuring the voltage over a
+3.3 ohms shunt resistor.
+
+sysi {
+	compatible = "current-sense-shunt";
+	io-channels = <&tiadc 0>;
+
+	/* Divide the voltage by 3300000/1000000 (or 3.3) for the current. */
+	shunt-resistor-micro-ohms = <3300000>;
+};
+
+&i2c {
+	tiadc: adc@48 {
+		compatible = "ti,ads1015";
+	      	reg = <0x48>;
+		#io-channel-cells = <1>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		channel@0 { /* IN0,IN1 differential */
+			reg = <0>;
+			ti,gain = <1>;
+			ti,datarate = <4>;
+		};
+	};
+};
diff --git a/MAINTAINERS b/MAINTAINERS
index 36a28e979e9a..0f7bec878919 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6889,6 +6889,12 @@ F:	drivers/staging/iio/
 F:	include/linux/iio/
 F:	tools/iio/
 
+IIO UNIT CONVERTER
+M:	Peter Rosin <peda@axentia.se>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/afe/current-sense-shunt.txt
+
 IKANOS/ADI EAGLE ADSL USB DRIVER
 M:	Matthieu Castet <castet.matthieu@free.fr>
 M:	Stanislaw Gruszka <stf_xl@wp.pl>
-- 
2.11.0
