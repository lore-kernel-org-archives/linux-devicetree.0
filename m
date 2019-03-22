From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v2 1/2] dt-bindings: iio: adc: Add bindings for TI ADS8344
 A/DC chips
Date: Fri, 22 Mar 2019 12:11:07 +0100
Message-ID: <20190322111108.19383-2-gregory.clement@bootlin.com>
References: <20190322111108.19383-1-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190322111108.19383-1-gregory.clement@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org
Cc: devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This adds device tree bindings for the TI ADS8344 A/DC chips.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 .../bindings/iio/adc/ti-ads8344.txt           | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-ads8344.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/ti-ads8344.txt b/Documentation/devicetree/bindings/iio/adc/ti-ads8344.txt
new file mode 100644
index 000000000000..e47c3759a82b
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ti-ads8344.txt
@@ -0,0 +1,19 @@
+* Texas Instruments ADS8344 A/DC chip
+
+Required properties:
+ - compatible: Must be "ti,ads8344"
+ - reg: SPI chip select number for the device
+ - vref-supply: phandle to a regulator node that supplies the
+   reference voltage
+
+Recommended properties:
+ - spi-max-frequency: Definition as per
+		Documentation/devicetree/bindings/spi/spi-bus.txt
+
+Example:
+adc@0 {
+	compatible = "ti,ads8344";
+	reg = <0>;
+	vref-supply = <&refin_supply>;
+	spi-max-frequency = <10000000>;
+};
-- 
2.20.1
