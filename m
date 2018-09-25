From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] dt-bindings: Add bindings for aliases node
Date: Tue, 25 Sep 2018 14:02:55 -0700
Message-ID: <20180925210255.172734-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Add a global binding for the 'aliases' node. This includes an initial list
of standardized alias names for some hardware components that are commonly
found in 'aliases'.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 Documentation/devicetree/bindings/aliases.txt | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/aliases.txt

diff --git a/Documentation/devicetree/bindings/aliases.txt b/Documentation/devicetree/bindings/aliases.txt
new file mode 100644
index 000000000000..d64ed1c7eb34
--- /dev/null
+++ b/Documentation/devicetree/bindings/aliases.txt
@@ -0,0 +1,47 @@
+The aliases node
+----------------
+
+The aliases node contains properties that represent aliases to device tree
+nodes. The name of the property is the alias name, the value is the path of
+a the device tree node that corresponds to the alias. The path may be
+specified as a string or a phandle.
+
+Alias names are often suffixed with a numeric ID, especially when there may
+be multiple instances of the same type. The ID typically corresponds to the
+hardware layout, it may also be used by drivers for a stable mapping of
+device names and hardware entities.
+
+Alias names
+-----------
+
+The devicetree specification doesn't require the use of specific alias
+names to refer to hardware entities of a given type, however the Linux
+kernel aims for a certain level of consistency.
+
+The following standardized alias names shall be used for their
+corresponding hardware components:
+
+  bluetoothN		Bluetooth controller
+  ethernetN		Ethernet interface
+  gpioN			GPIO controller
+  i2cN			i2c bus
+  mmcN			MMC bus
+  rtcN			Real time clock
+  serialN		UART port
+  spiN			SPI bus
+  wifiN			Wireless network interface
+
+The above list is not exhaustive and will be extended over time. Please
+send patches to devicetree@vger.kernel.org if you think a hardware
+component and its alias name should be on the list.
+
+Example
+-------
+
+aliases {
+	bluetooth0 = "/soc/serial@fdf01000/bluetooth";
+	rtc0 = &rtc0;
+	wifi0 = &wlcore;
+};
+
+(based on arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts)
-- 
2.19.0.605.g01d371f741-goog
