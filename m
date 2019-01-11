From: Sebastien Bourdelin <sebastien.bourdelin@gmail.com>
Subject: [PATCH 2/2] dt-bindings: iio: chemical: Add bindings for bme680
Date: Fri, 11 Jan 2019 14:31:41 -0500
Message-ID: <20190111193141.20607-2-sebastien.bourdelin@gmail.com>
References: <20190111193141.20607-1-sebastien.bourdelin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190111193141.20607-1-sebastien.bourdelin@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org, himanshujha199640@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org, pmeerw@pmeerw.net, lars@metafoo.de, knaack.h@gmx.de, jic23@kernel.org, Sebastien Bourdelin <sebastien.bourdelin@gmail.com>
List-Id: devicetree@vger.kernel.org

BME680 is a pressure/temperature/humidity/voc sensor.

Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@gmail.com>
---
 .../devicetree/bindings/iio/chemical/bme680.txt       | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/chemical/bme680.txt

diff --git a/Documentation/devicetree/bindings/iio/chemical/bme680.txt b/Documentation/devicetree/bindings/iio/chemical/bme680.txt
new file mode 100644
index 000000000000..885a1b918340
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/chemical/bme680.txt
@@ -0,0 +1,11 @@
+Bosch Sensortec BME680 pressure/temperature/humidity/voc sensors
+
+Required properties:
+- compatible: must be "bosch,bme680"
+
+Example:
+
+bme680@77 {
+          compatible = "bosch,bme680";
+          reg = <0x77>;
+};
-- 
2.20.1
