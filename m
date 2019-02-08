From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 2/5] dt-bindings: iio: adc: lpc32xx-adc: Document vref-supply
Date: Fri,  8 Feb 2019 17:09:41 +0100
Message-ID: <20190208160944.13281-3-gregory.clement@bootlin.com>
References: <20190208160944.13281-1-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190208160944.13281-1-gregory.clement@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc: devicetree@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

As most of the other ADC the lpc32xx one use a vref-supply property:
document it.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 Documentation/devicetree/bindings/iio/adc/lpc32xx-adc.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/lpc32xx-adc.txt b/Documentation/devicetree/bindings/iio/adc/lpc32xx-adc.txt
index b3629d3a9adf..3a1bc669bd51 100644
--- a/Documentation/devicetree/bindings/iio/adc/lpc32xx-adc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/lpc32xx-adc.txt
@@ -6,6 +6,10 @@ Required properties:
   region.
 - interrupts: The ADC interrupt
 
+Optional:
+ - vref-supply: The regulator supply ADC reference voltage, optional
+   for legacy reason, but highly encouraging to us in new device tree
+
 Example:
 
 	adc@40048000 {
@@ -13,4 +17,5 @@ Example:
 		reg = <0x40048000 0x1000>;
 		interrupt-parent = <&mic>;
 		interrupts = <39 0>;
+		vref-supply = <&vcc>;
 	};
-- 
2.20.1
