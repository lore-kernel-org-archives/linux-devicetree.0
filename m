From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 5/8] dt-bindings: usb: add interface binding
Date: Thu,  9 Nov 2017 18:07:20 +0100
Message-ID: <20171109170723.10960-6-johan@kernel.org>
References: <20171109170723.10960-1-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171109170723.10960-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Alan Stern <stern@rowland.harvard.edu>, Peter Chen <peter.chen@nxp.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: devicetree@vger.kernel.org

Add a new binding for USB interface nodes, which are child nodes of
USB device nodes and addressed by interface number and configuration
value tuples.

Also add a new binding for USB combined nodes, which are special case
nodes for simple USB devices for which they replace the device and
interface nodes.

For completeness, define the already used terms "host-controller node",
"device node" and "hub node".

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 .../devicetree/bindings/usb/usb-device.txt         | 68 +++++++++++++++++++++-
 1 file changed, 66 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-device.txt b/Documentation/devicetree/bindings/usb/usb-device.txt
index 1b27cebb47f4..036be172b1ae 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.txt
+++ b/Documentation/devicetree/bindings/usb/usb-device.txt
@@ -4,8 +4,49 @@ Usually, we only use device tree for hard wired USB device.
 The reference binding doc is from:
 http://www.devicetree.org/open-firmware/bindings/usb/usb-1_0.ps
 
+Four types of device-tree nodes are defined: "host-controller nodes"
+representing USB host controllers, "device nodes" representing USB devices,
+"interface nodes" representing USB interfaces and "combined nodes"
+representing simple USB devices.
 
-Required properties:
+A combined node shall be used instead of a device node and an interface node
+for devices of class 0 or 9 (hub) with a single configuration and a single
+interface.
+
+A "hub node" is a combined node or an interface node that represents a USB
+hub.
+
+
+Required properties for device nodes:
+- compatible: "usbVID,PID", where VID is the vendor id and PID the product id.
+  The textual representation of VID and PID shall be in lower case hexadecimal
+  with leading zeroes suppressed. The other compatible strings from the above
+  standard binding could also be used, but a device adhering to this binding
+  may leave out all except for "usbVID,PID".
+- reg: the number of the USB hub port or the USB host-controller port to which
+  this device is attached. The range is 1-255.
+
+
+Required properties for device nodes with interface nodes:
+- #address-cells: shall be 2
+- #size-cells: shall be 0
+
+
+Required properties for interface nodes:
+- compatible: "usbifVID,PID.configCN.IN", where VID is the vendor id, PID is
+  the product id, CN is the configuration value and IN is the interface
+  number. The textual representation of VID, PID, CN and IN shall be in lower
+  case hexadecimal with leading zeroes suppressed. The other compatible
+  strings from the above standard binding could also be used, but a device
+  adhering to this binding may leave out all except for
+  "usbifVID,PID.configCN.IN".
+- reg: the interface number and configuration value
+
+The configuration component is not included in the textual representation of
+an interface-node unit address for configuration 1.
+
+
+Required properties for combined nodes:
 - compatible: "usbVID,PID", where VID is the vendor id and PID the product id.
   The textual representation of VID and PID shall be in lower case hexadecimal
   with leading zeroes suppressed. The other compatible strings from the above
@@ -31,8 +72,31 @@ Example:
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	hub@1 {	/* hub connected to port 1 */
+	hub@1 {		/* hub connected to port 1 */
 		compatible = "usb5e3,608";
 		reg = <1>;
 	};
+
+	device@2 {	/* device connected to port 2 */
+		compatible = "usb123,4567";
+		reg = <2>;
+	};
+
+	device@3 { 	/* device connected to port 3 */
+		compatible = "usb123,abcd";
+		reg = <3>;
+
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		interface@0 {	/* interface 0 of configuration 1 */
+			compatible = "usbif123,abcd.config1.0";
+			reg = <0 1>;
+		};
+
+		interface@0,2 {	/* interface 0 of configuration 2 */
+			compatible = "usbif123,abcd.config2.0";
+			reg = <0 2>;
+		};
+	};
 };
-- 
2.15.0
