From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 2/2] dt-bindings: iio: add Bosch BMG160 gyroscope sensor
Date: Mon, 18 Mar 2019 16:14:15 +0100
Message-ID: <1664da2e7a9cb687eece1f27501d275219bcc4ed.1552922054.git.hns@goldelico.com>
References: <cover.1552922054.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1552922054.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org, kernel@pyra-handheld.com
List-Id: devicetree@vger.kernel.org

Define bindings for "bosch,bmg160" and "bosch,bmi055_gyro".

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 .../bindings/iio/gyroscope/bmg160.txt         | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/gyroscope/bmg160.txt

diff --git a/Documentation/devicetree/bindings/iio/gyroscope/bmg160.txt b/Documentation/devicetree/bindings/iio/gyroscope/bmg160.txt
new file mode 100644
index 000000000000..78e18a1e9c1d
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/gyroscope/bmg160.txt
@@ -0,0 +1,20 @@
+* Bosch BMG160 triaxial rotation sensor (gyroscope)
+
+Required properties:
+
+  - compatible : should be "bosch,bmg160" or "bosch,bmi055_gyro"
+  - reg : the I2C address of the sensor (0x69)
+
+Optional properties:
+
+  - interrupts : interrupt mapping for GPIO IRQ, it should by configured with
+		flags IRQ_TYPE_EDGE_RISING
+
+Example:
+
+bmg160@69 {
+	compatible = "bosch,bmg160";
+	reg = <0x69>;
+	interrupt-parent = <&gpio6>;
+	interrupts = <18 (IRQ_TYPE_EDGE_RISING)>;
+};
-- 
2.19.1
