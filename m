From: Tomasz Duszynski <tduszyns@gmail.com>
Subject: [PATCH 3/3] dt-bindings: iio: chemical: pms7003: add device tree support
Date: Sun,  6 Jan 2019 18:16:14 +0100
Message-ID: <20190106171614.12615-4-tduszyns@gmail.com>
References: <20190106171614.12615-1-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190106171614.12615-1-tduszyns@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Duszynski <tduszyns@gmail.com>
List-Id: devicetree@vger.kernel.org

Add device tree support for Plantower PMS7003 particulate matter sensor.

Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
---
 .../bindings/iio/chemical/plantower,pms7003.txt    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt

diff --git a/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt b/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
new file mode 100644
index 000000000000..79eb538eb932
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
@@ -0,0 +1,14 @@
+* Plantower PMS7003 particulate matter sensor
+
+Required properties:
+- compatible: must be "plantower,pms7003"
+
+Refer to serial/slave-device.txt for generic serial attached device bindings.
+
+Example:
+
+&uart@0 {
+	pms7003 {
+		compatible = "plantower,pms7003";
+	};
+};
-- 
2.20.1
