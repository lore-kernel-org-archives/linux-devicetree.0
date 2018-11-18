From: Matheus Tavares <matheus.bernardino@usp.br>
Subject: [PATCH v2 4/7] dt-bindings:iio:resolver: Add docs for ad2s90
Date: Sun, 18 Nov 2018 02:25:37 -0200
Message-ID: <20181118042540.12697-5-matheus.bernardino@usp.br>
References: <20181118042540.12697-1-matheus.bernardino@usp.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20181118042540.12697-1-matheus.bernardino@usp.br>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-usp@googlegroups.com, Alexandru Ardelean <alexandru.ardelean@analog.com>, victorcolombo@gmail.com
List-Id: devicetree@vger.kernel.org

This patch adds the device tree binding documentation for the ad2s90
resolver-to-digital converter.

Signed-off-by: Matheus Tavares <matheus.bernardino@usp.br>
---
Changes in v2:
 - Rewritten 'spi-cpol and spi-cpha' item to say that the device can
 work in either mode (0,0) or (1,1) and explain how they should be
 specified in DT.

 .../bindings/iio/resolver/ad2s90.txt          | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/resolver/ad2s90.txt

diff --git a/Documentation/devicetree/bindings/iio/resolver/ad2s90.txt b/Documentation/devicetree/bindings/iio/resolver/ad2s90.txt
new file mode 100644
index 000000000000..594417539938
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/resolver/ad2s90.txt
@@ -0,0 +1,28 @@
+Analog Devices AD2S90 Resolver-to-Digital Converter
+
+https://www.analog.com/en/products/ad2s90.html
+
+Required properties:
+  - compatible: should be "adi,ad2s90"
+  - reg: SPI chip select number for the device
+  - spi-max-frequency: set maximum clock frequency, must be 830000
+  - spi-cpol and spi-cpha:
+        Either SPI mode (0,0) or (1,1) must be used, so specify none or both of
+        spi-cpha, spi-cpol.
+
+Note about max frequency:
+    Chip's max frequency, as specified in its datasheet, is 2Mhz. But a 600ns
+    delay is expected between the application of a logic LO to CS and the
+    application of SCLK, as also specified. And since the delay is not
+    implemented in the spi code, to satisfy it, SCLK's period should be at most
+    2 * 600ns, so the max frequency should be 1 / (2 * 6e-7), which gives
+    roughly 830000Hz.
+
+Example:
+resolver@0 {
+	compatible = "adi,ad2s90";
+	reg = <0>;
+	spi-max-frequency = <830000>;
+	spi-cpol;
+	spi-cpha;
+};
-- 
2.18.0
