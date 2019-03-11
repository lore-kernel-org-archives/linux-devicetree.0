From: Stefan Popa <stefan.popa@analog.com>
Subject: [PATCH v2 2/2] dt-bindings: iio: imu: adis16480: Document external clock
Date: Mon, 11 Mar 2019 11:46:37 +0200
Message-ID: <1552297597-26640-1-git-send-email-stefan.popa@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, Michael.Hennerich@analog.com, gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stefan.popa@analog.com
List-Id: devicetree@vger.kernel.org

Add documentation for optional use of external clock. All devices
supported by this driver can work with an external clock in sync mode.
Another mode, called Pulse Per Second (PPS) is supported only by adis1649x
devices. The mode is selected by using the "clock-names" property.

The pin which is used as external clock input is selected by using a
custom optional property called "adi,ext-clk-pin". If this field is left
empty, DIO2 is assigned as default external clock input pin.

Signed-off-by: Stefan Popa <stefan.popa@analog.com>
---
Changes in v2:
	- Mentioned that both "clocks" and "clock-names" fields should be left
	  empty for internal clock to be used.

 .../devicetree/bindings/iio/imu/adi,adis16480.txt  | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/imu/adi,adis16480.txt b/Documentation/devicetree/bindings/iio/imu/adi,adis16480.txt
index 39ab016..ed7783f 100644
--- a/Documentation/devicetree/bindings/iio/imu/adi,adis16480.txt
+++ b/Documentation/devicetree/bindings/iio/imu/adi,adis16480.txt
@@ -34,6 +34,39 @@ Optional properties:
 	signal.
 - reset-gpios: must be the device tree identifier of the RESET pin. As the line
 	is active low, it should be marked GPIO_ACTIVE_LOW.
+- clocks: phandle to the external clock. Should be set according to
+	"clock-names".
+	If this field is left empty together with the "clock-names" field, then
+	the internal clock is used.
+- clock-names: The name of the external clock to be used. Valid values are:
+	* sync: In sync mode, the internal clock is disabled and the frequency
+		of the external clock signal establishes therate of data
+		collection and processing. See Fig 14 and 15 in the datasheet.
+		The clock-frequency must be:
+		* 3000 to 4500 Hz for adis1649x devices.
+		* 700 to 2400 Hz for adis1648x devices.
+	* pps: In Pulse Per Second (PPS) Mode, the rate of data collection and
+	       production is equal to the product of the external clock
+	       frequency and the scale factor in the SYNC_SCALE register, see
+	       Table 154 in the datasheet.
+	       The clock-frequency must be:
+	       * 1 to 128 Hz for adis1649x devices.
+	       * This mode is not supported by adis1648x devices.
+	If this field is left empty together with the "clocks" field, then the
+	internal clock is used.
+- adi,ext-clk-pin: The DIOx line to be used as an external clock input.
+	Valid values are:
+	* DIO1
+	* DIO2
+	* DIO3
+	* DIO4
+	Each DIOx pin supports only one function at a time (data ready line
+	selection or external clock input). When a single pin has two
+	two assignments, the enable bit for the lower priority function
+	automatically resets to zero (disabling the lower priority function).
+	Data ready has highest priority.
+	If this field is left empty, DIO2 is assigned as default external clock
+	input pin.
 
 Example:
 
@@ -46,4 +79,7 @@ Example:
 		interrupts = <25 IRQF_TRIGGER_FALLING>;
 		interrupt-parent = <&gpio>;
 		interrupt-names = "DIO2";
+		clocks = <&adis16495_sync>;
+		clock-names = "sync";
+		adi,ext-clk-pin = "DIO1";
 	};
-- 
2.7.4
