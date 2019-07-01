Return-Path: <SRS0=mNx5=U6=gmail.com=akinobu.mita@kernel.org>
From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH v5 2/4] dt-bindings: thermal: nvme: Add binding documentation
Date: Mon,  1 Jul 2019 23:12:32 +0900
Message-Id: <1561990354-4084-3-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1561990354-4084-1-git-send-email-akinobu.mita@gmail.com>
References: <1561990354-4084-1-git-send-email-akinobu.mita@gmail.com>
To: linux-nvme@lists.infradead.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, Rob Herring <robh@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Minwoo Im <minwoo.im.dev@gmail.com>, Kenneth Heitke <kenneth.heitke@intel.com>, Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
List-ID: <devicetree@vger.kernel.org>

Add thermal binding documentation for NVMe temperature sensor.

Cc: Rob Herring <robh@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>
Cc: Eduardo Valentin <edubezval@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Keith Busch <kbusch@kernel.org>
Cc: Jens Axboe <axboe@fb.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>
Cc: Minwoo Im <minwoo.im.dev@gmail.com>
Cc: Kenneth Heitke <kenneth.heitke@intel.com>
Cc: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
* v5
- New patch

 Documentation/devicetree/bindings/thermal/nvme.txt | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/nvme.txt

diff --git a/Documentation/devicetree/bindings/thermal/nvme.txt b/Documentation/devicetree/bindings/thermal/nvme.txt
new file mode 100644
index 0000000..60b90de
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/nvme.txt
@@ -0,0 +1,56 @@
+Binding for NVMe temperature sensor
+
+An NVMe controller reports up to nine temperature values in the SMART / Health
+log.
+
+Required properties:
+- reg: A five-cell address encoded as (phys.hi phys.mid phys.lo size.hi
+  size.lo). phys.hi should contain the device's BDF (Bus/Device/Function)
+  as 0b00000000 bbbbbbbb dddddfff 00000000. The other cells should be zero.
+  See also Documentation/devicetree/bindings/pci/pci.txt
+
+- #thermal-sensor-cells: Must be 1. See ./thermal.txt for a description.
+  In the thermal-sensors property, the sensor ID 0 for composite temperature,
+  1 through 8 for NVMe temperature sensor N.
+
+Example:
+
+&pcie0 {
+	...
+	nvme: nvme@0,0 {
+		reg = <0x0000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		nvmetemp: nvmetemp {
+			reg = <0x0000 0 0 0 0>; /* DEVFN = 0x00 (0:0) */
+			#thermal-sensor-cells = <1>;
+		};
+	};
+};
+
+&thermal_zones {
+	nvme_thermal: nvme {
+		polling-delay-passive = <2000>; /* milliseconds */
+		polling-delay = <0>; /* asynchronous event driven */
+
+				/* sensor	ID */
+		thermal-sensors = <&nvmetemp	0>;
+
+		trips {
+			nvme_alert0: nvme_alert0 {
+				temperature = <80000>; /* millicelsius */
+				hysteresis = <2000>; /* millicelsius */
+				type = "passive";
+			};
+		};
+
+		cooling-maps {
+			map0 {
+				trip = <&nvme_alert0>;
+				cooling-device =
+				<&fan0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
+	};
+};
-- 
2.7.4
