From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 4/8] dt-bindings: usb: document hub and host-controller properties
Date: Thu,  9 Nov 2017 18:07:19 +0100
Message-ID: <20171109170723.10960-5-johan@kernel.org>
References: <20171109170723.10960-1-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171109170723.10960-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Alan Stern <stern@rowland.harvard.edu>, Peter Chen <peter.chen@nxp.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: devicetree@vger.kernel.org

Hub nodes and host-controller nodes with child nodes must specify values
for #address-cells (1) and #size-cells (0).

Also make the definition of the related reg property a bit more
stringent, and add comments to the example source.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 Documentation/devicetree/bindings/usb/usb-device.txt | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-device.txt b/Documentation/devicetree/bindings/usb/usb-device.txt
index e0b562e35a0c..1b27cebb47f4 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.txt
+++ b/Documentation/devicetree/bindings/usb/usb-device.txt
@@ -4,22 +4,34 @@ Usually, we only use device tree for hard wired USB device.
 The reference binding doc is from:
 http://www.devicetree.org/open-firmware/bindings/usb/usb-1_0.ps
 
+
 Required properties:
 - compatible: "usbVID,PID", where VID is the vendor id and PID the product id.
   The textual representation of VID and PID shall be in lower case hexadecimal
   with leading zeroes suppressed. The other compatible strings from the above
   standard binding could also be used, but a device adhering to this binding
   may leave out all except for "usbVID,PID".
-- reg: the port number which this device is connecting to, the range
-  is 1-255.
+- reg: the number of the USB hub port or the USB host-controller port to which
+  this device is attached. The range is 1-255.
+
+
+Required properties for hub nodes with device nodes:
+- #address-cells: shall be 1
+- #size-cells: shall be 0
+
+
+Required properties for host-controller nodes with device nodes:
+- #address-cells: shall be 1
+- #size-cells: shall be 0
+
 
 Example:
 
-&usb1 {
+&usb1 {	/* host controller */
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	hub@1 {
+	hub@1 {	/* hub connected to port 1 */
 		compatible = "usb5e3,608";
 		reg = <1>;
 	};
-- 
2.15.0
