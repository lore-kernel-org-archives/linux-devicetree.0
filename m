From: Dan Robertson <dan@dlrobertson.com>
Subject: [PATCH v2 1/2] dt-bindings: iio: accel: bma400: add bindings
Date: Sat, 12 Oct 2019 03:54:19 +0000
Message-ID: <20191012035420.13904-2-dan@dlrobertson.com>
References: <20191012035420.13904-1-dan@dlrobertson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191012035420.13904-1-dan@dlrobertson.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc: devicetree@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Dan Robertson <dan@dlrobertson.com>
List-Id: devicetree@vger.kernel.org

Add devicetree binding for the Bosch BMA400 3-axes ultra-low power
accelerometer sensor.

Signed-off-by: Dan Robertson <dan@dlrobertson.com>
---
 .../devicetree/bindings/iio/accel/bma400.txt     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/accel/bma400.txt

diff --git a/Documentation/devicetree/bindings/iio/accel/bma400.txt b/Documentation/devicetree/bindings/iio/accel/bma400.txt
new file mode 100644
index 000000000000..abba4f104941
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/accel/bma400.txt
@@ -0,0 +1,16 @@
+
+* Bosch BMA400 triaxial acceleration sensor
+
+https://ae-bst.resource.bosch.com/media/_tech/media/datasheets/BST-BMA400-DS000.pdf
+
+Required properties:
+
+  - compatible : should be "bosch,bma400"
+  - reg : the I2C address of the sensor
+
+Example:
+
+bma400@14 {
+	compatible = "bosch,bma400";
+	reg = <0x14>;
+};
