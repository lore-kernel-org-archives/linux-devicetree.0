From: Andreas Klinger <ak@it-klinger.de>
Subject: [PATCH v5 3/3] iio: hx711: fix spurious unit-address in example
Date: Tue, 10 Jul 2018 20:19:37 +0200
Message-ID: <20180710181937.GA5398@arbeit>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, akpm@linux-foundation.org, linus.walleij@linaro.org, rdunlap@infradead.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Device tree compiler (dtc) gives a warning if a device node has "@" with a
following number as it's name but no reg property.

Fix the example in the documentation of avia,hx711 to conform to dtc
behavior.

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
---
 Documentation/devicetree/bindings/iio/adc/avia-hx711.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.txt b/Documentation/devicetree/bindings/iio/adc/avia-hx711.txt
index 2c1b67d33c49..7222328a3d0d 100644
--- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.txt
+++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.txt
@@ -14,7 +14,7 @@ Optional properties:
 			high time of 50 microseconds.
 
 Example:
-weight@0 {
+weight {
 	compatible = "avia,hx711";
 	sck-gpios = <&gpio3 10 GPIO_ACTIVE_HIGH>;
 	dout-gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
-- 
2.1.4
