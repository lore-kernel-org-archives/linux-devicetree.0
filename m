From: Beniamin Bia <beniamin.bia@analog.com>
Subject: [PATCH v3 4/4] dt-bindings: iio: adc: Add AD7606B ADC documentation
Date: Wed, 21 Aug 2019 17:16:56 +0300
Message-ID: <20190821141656.4815-4-beniamin.bia@analog.com>
References: <20190821141656.4815-1-beniamin.bia@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20190821141656.4815-1-beniamin.bia@analog.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: jic23@kernel.org
Cc: devel@driverdev.osuosl.org, mark.rutland@arm.com, lars@metafoo.de, biabeniamin@outlook.com, Michael.Hennerich@analog.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, gregkh@linuxfoundation.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com, robh+dt@kernel.org, pmeerw@pmeerw.net, knaack.h@gmx.de, mchehab+samsung@kernel.org, paulmck@linux.ibm.com, Beniamin Bia <beniamin.bia@analog.com>
List-Id: devicetree@vger.kernel.org

Documentation for AD7606B Analog to Digital Converter and software
mode was added.

Signed-off-by: Beniamin Bia <beniamin.bia@analog.com>
---
Changes in v3:
-nothing changed

 Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
index 509dbe9c84d2..2afe31747a70 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
@@ -13,6 +13,7 @@ maintainers:
 description: |
   Analog Devices AD7606 Simultaneous Sampling ADC
   https://www.analog.com/media/en/technical-documentation/data-sheets/ad7606_7606-6_7606-4.pdf
+  https://www.analog.com/media/en/technical-documentation/data-sheets/AD7606B.pdf
   https://www.analog.com/media/en/technical-documentation/data-sheets/AD7616.pdf
 
 properties:
@@ -22,6 +23,7 @@ properties:
       - adi,ad7606-8
       - adi,ad7606-6
       - adi,ad7606-4
+      - adi,ad7606b
       - adi,ad7616
 
   reg:
@@ -87,7 +89,7 @@ properties:
 
   adi,sw-mode:
     description:
-      Software mode of operation, so far available only for ad7616.
+      Software mode of operation, so far available only for ad7616 and ad7606B.
       It is enabled when all three oversampling mode pins are connected to
       high level. The device is configured by the corresponding registers. If the
       adi,oversampling-ratio-gpios property is defined, then the driver will set the
-- 
2.17.1
