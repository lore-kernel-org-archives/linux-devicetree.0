From: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Subject: [PATCH v4 2/2] iio: ti-ads8688: Add DT binding documentation
Date: Tue, 6 Oct 2015 10:12:36 +0200
Message-ID: <1444119156-8316-2-git-send-email-sean.nyekjaer@prevas.dk>
References: <1444119156-8316-1-git-send-email-sean.nyekjaer@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444119156-8316-1-git-send-email-sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Adding binding documentation for Texas Instruments ADS8688 ADC.

Signed-off-by: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Reviewed-by: Martin Hundeb=C3=B8ll <martin.hundeboll-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
---
Changes since v2:
- Moved vref-supply to Optional properties

 .../devicetree/bindings/iio/adc/ti-ads8688.txt       | 20 ++++++++++++=
++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-ads868=
8.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/ti-ads8688.txt b=
/Documentation/devicetree/bindings/iio/adc/ti-ads8688.txt
new file mode 100644
index 0000000..a02337d
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ti-ads8688.txt
@@ -0,0 +1,20 @@
+* Texas Instruments' ADS8684 and ADS8688 ADC chip
+
+Required properties:
+ - compatible: Should be "ti,ads8684" or "ti,ads8688"
+ - reg: spi chip select number for the device
+
+Recommended properties:
+ - spi-max-frequency: Definition as per
+		Documentation/devicetree/bindings/spi/spi-bus.txt
+
+Optional properties:
+ - vref-supply: The regulator supply for ADC reference voltage
+
+Example:
+adc@0 {
+	compatible =3D "ti,ads8688";
+	reg =3D <0>;
+	vref-supply =3D <&vdd_supply>;
+	spi-max-frequency =3D <1000000>;
+};
--=20
2.6.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
