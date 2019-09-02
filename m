From: Mircea Caprioru <mircea.caprioru@analog.com>
Subject: [PATCH V4 1/4] iio: adc: ad7192: Add sysfs ABI documentation
Date: Mon, 2 Sep 2019 16:08:28 +0300
Message-ID: <20190902130831.23057-1-mircea.caprioru@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org
Cc: Michael.Hennerich@analog.com, stefan.popa@analog.com, lars@metafoo.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, Mircea Caprioru <mircea.caprioru@analog.com>
List-Id: devicetree@vger.kernel.org

Add initial ABI documentation for ad7192 adc sysfs interfaces.

Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
---
Changelog V2:
- no changes here

Changelog V3:
- no changes here

Changelog V4:
- added sysfs ABI documentation

 .../ABI/testing/sysfs-bus-iio-adc-ad7192          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-ad7192

diff --git a/Documentation/ABI/testing/sysfs-bus-iio-adc-ad7192 b/Documentation/ABI/testing/sysfs-bus-iio-adc-ad7192
new file mode 100644
index 000000000000..74a2873045bf
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-iio-adc-ad7192
@@ -0,0 +1,15 @@
+What:		/sys/bus/iio/devices/iio:deviceX/ac_excitation_en
+KernelVersion:
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Reading gives the state of AC excitation.
+		Writing '1' enables AC excitation.
+
+What:		/sys/bus/iio/devices/iio:deviceX/bridge_switch_en
+KernelVersion:
+Contact:	linux-iio@vger.kernel.org
+Description:
+		This bridge switch is used to disconnect it when there is a
+		need to minimize the system current consumption.
+		Reading gives the state of the bridge switch.
+		Writing '1' enables the bridge switch.
-- 
2.17.1
