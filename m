From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH 2/2] dt-bindings: iio: light: Document the VCNL4xx0 device tree bindings
Date: Fri, 15 Mar 2019 14:54:25 -0700
Message-ID: <20190315215425.24140-3-angus@akkea.ca>
References: <20190315215425.24140-1-angus@akkea.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190315215425.24140-1-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: angus.ainslie@puri.sm
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tomas Novotny <tomas@novotny.cz>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Brian Masney <masneyb@onstation.org>, Robert Eshleman <bobbyeshleman@gmail.com>, Mathieu Othacehe <m.othacehe@gmail.com>, Parthiban Nallathambi <pn@denx.de>, ryang <decatf@gmail.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

devicetree hooks where added to the VCNL4xx0 light and proximity
sensor driver.

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
---
 .../devicetree/bindings/iio/light/vcnl4xx0.txt    | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/vcnl4xx0.txt

diff --git a/Documentation/devicetree/bindings/iio/light/vcnl4xx0.txt b/Documentation/devicetree/bindings/iio/light/vcnl4xx0.txt
new file mode 100644
index 000000000000..d61cf3c121c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/vcnl4xx0.txt
@@ -0,0 +1,15 @@
+VISHAY VCNL4xx0 -  Ambient Light and proximity sensor
+
+This driver supports the VCNL4000/10/20/40 and VCNL4200
+
+Required properties:
+
+	-compatible: should be "vishay,vcnl4000" or "vishay,vcnl4040"
+	-reg: I2C address of the sensor, should be 0x60
+
+Example:
+
+light-sensor@60 {
+	compatible = "vishay,vcnl4040";
+	reg = <0x60>;
+};
-- 
2.17.1
