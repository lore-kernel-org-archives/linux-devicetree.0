From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH v3 3/5] dt-bindings: iio: light: add vcnl4000 devicetree bindings
Date: Thu, 21 Mar 2019 08:40:45 -0700
Message-ID: <20190321154047.23236-4-angus@akkea.ca>
References: <20190321154047.23236-1-angus@akkea.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321154047.23236-1-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Tomas Novotny <tomas@novotny.cz>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document the vishay VCNL4000 devicetree bindings.

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
---
 .../bindings/iio/light/vcnl4000.txt           | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/vcnl4000.txt

diff --git a/Documentation/devicetree/bindings/iio/light/vcnl4000.txt b/Documentation/devicetree/bindings/iio/light/vcnl4000.txt
new file mode 100644
index 000000000000..4a9d558a412a
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/vcnl4000.txt
@@ -0,0 +1,22 @@
+VISHAY VCNL4000 -  Ambient Light and proximity sensor
+
+This driver supports the VCNL4000/10/20 and VCNL4200 chips
+
+Required properties:
+
+	-compatible: must be one of :
+        vishay,vcnl4000
+        vishay,vcnl4010
+        vishay,vcnl4020
+        vishay,vcnl4200
+
+	-reg: I2C address of the sensor, should be one from below based on the model:
+        0x13
+        0x51
+
+Example:
+
+light-sensor@51 {
+	compatible = "vishay,vcnl4200";
+	reg = <0x51>;
+};
-- 
2.17.1
