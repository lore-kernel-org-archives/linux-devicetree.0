From: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Subject: [PATCHv2 2/2] iio: ti-ads868x: Add DT binding documentation
Date: Fri, 25 Sep 2015 08:29:40 +0200
Message-ID: <1443162580-28293-2-git-send-email-sean.nyekjaer@prevas.dk>
References: <1443162580-28293-1-git-send-email-sean.nyekjaer@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443162580-28293-1-git-send-email-sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Adding binding documentation for Texas Instruments ADS868X ADC.

Signed-off-by: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Reviewed-by: Martin Hundeb=C3=B8ll <martin.hundeboll-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
---
 .../devicetree/bindings/iio/adc/ti-ads868x.txt         | 18 ++++++++++=
++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-ads868=
x.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/ti-ads868x.txt b=
/Documentation/devicetree/bindings/iio/adc/ti-ads868x.txt
new file mode 100644
index 0000000..bc3c305
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ti-ads868x.txt
@@ -0,0 +1,18 @@
+* Texas Instruments' ADS8684 and ADS8688 ADC chip
+
+Required properties:
+ - compatible: Should be "ti,ads8684" or "ti,ads8688"
+ - reg: spi chip select number for the device
+ - vref-supply: The regulator supply for ADC reference voltage
+
+Recommended properties:
+ - spi-max-frequency: Definition as per
+		Documentation/devicetree/bindings/spi/spi-bus.txt
+
+Example:
+adc@0 {
+	compatible =3D "ti,ads8688";
+	reg =3D <0>;
+	vref-supply =3D <&vdd_supply>;
+	spi-max-frequency =3D <1000000>;
+};
--=20
2.5.3
