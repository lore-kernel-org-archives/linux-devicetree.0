From: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Subject: [PATCH v4 2/4] iio: ad5755: Add DT binding documentation
Date: Tue, 1 Mar 2016 12:56:14 +0100
Message-ID: <1456833376-29758-2-git-send-email-sean.nyekjaer@prevas.dk>
References: <1456833376-29758-1-git-send-email-sean.nyekjaer@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456833376-29758-1-git-send-email-sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/iio/dac/ad5755.txt         | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/dac/ad5755.txt

diff --git a/Documentation/devicetree/bindings/iio/dac/ad5755.txt b/Documentation/devicetree/bindings/iio/dac/ad5755.txt
new file mode 100644
index 0000000..4c91583
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/dac/ad5755.txt
@@ -0,0 +1,24 @@
+* Analog Device AD5755 IIO Multi-Channel DAC Linux Driver
+
+Required properties:
+ - compatible: Has to contain one of the following:
+	adi,ad5755
+	adi,ad5755-1
+	adi,ad5757
+	adi,ad5735
+	adi,ad5737
+
+ - reg: spi chip select number for the device
+ - spi-cpha or spi-cpol: is the only modes that is supported
+
+Recommended properties:
+ - spi-max-frequency: Definition as per
+		Documentation/devicetree/bindings/spi/spi-bus.txt
+
+Example:
+dac@0 {
+	compatible = "adi,ad5755";
+	reg = <0>;
+	spi-max-frequency = <1000000>;
+	spi-cpha;
+};
-- 
2.7.2
