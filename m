From: Pierre Bourdon <delroth@google.com>
Subject: [PATCH v3 2/2] dt-bindings: iio: light: Add bh1730fvc bindings
Date: Wed, 28 Feb 2018 01:15:25 +0100
Message-ID: <20180228001525.96044-2-delroth@google.com>
References: <20180228001525.96044-1-delroth@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180228001525.96044-1-delroth@google.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Pierre Bourdon <delroth@google.com>, linux-iio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Baluta <daniel.baluta@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Pierre Bourdon <delroth@google.com>
---
 .../devicetree/bindings/iio/light/bh1730.txt      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/bh1730.txt

diff --git a/Documentation/devicetree/bindings/iio/light/bh1730.txt b/Documentation/devicetree/bindings/iio/light/bh1730.txt
new file mode 100644
index 000000000000..6b38c4010647
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/bh1730.txt
@@ -0,0 +1,15 @@
+* ROHM BH1730FVC ambient light sensor
+
+http://www.rohm.com/web/global/products/-/product/BH1730FVC
+
+Required properties:
+
+  - compatible : should be "rohm,bh1730fvc"
+  - reg : the I2C address of the sensor
+
+Example:
+
+bh1730fvc@29 {
+	compatible = "rohm,bh1730fvc";
+	reg = <0x29>;
+};
-- 
2.16.2.395.g2e18187dfd-goog
