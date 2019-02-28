From: Mans Rullgard <mans@mansr.com>
Subject: [RFC][PATCH] dt-bindings: usb: add non-removable device property
Date: Thu, 28 Feb 2019 14:33:44 +0000
Message-ID: <20190228143344.16312-1-mans@mansr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a boolean property indicating that a device is hardwired to the
upstream port.  Although hubs can provide this information, they are not
always configured correctly.  An alternate means of indicating this for
built-in USB devices is thus useful.

Signed-off-by: Mans Rullgard <mans@mansr.com>
---
I have a situation where userspace would like to know which USB devices
are built-in, but the on-board hub doesn't have the right setting.
Also, the hub itself can't be indicated as fixed in any other way that
I'm aware of.

In a way, adding this property seems a bit silly since dt can only
sensibly be used for hardwired devices in the first place.  Thus the
mere presence of a dt node could be taken to indicate the same thing.
On the other hand, it's conceivable that someone might dynamically
generate a devicetree based on what happens to be connected on boot or
something.  For that reason, and explicit property seems safer.
---
 Documentation/devicetree/bindings/usb/usb-device.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-device.txt b/Documentation/devicetree/bindings/usb/usb-device.txt
index 036be172b1ae..903d39b7e415 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.txt
+++ b/Documentation/devicetree/bindings/usb/usb-device.txt
@@ -26,6 +26,10 @@ Required properties for device nodes:
 - reg: the number of the USB hub port or the USB host-controller port to which
   this device is attached. The range is 1-255.
 
+Optional properties for device nodes:
+- non-removable: boolean, if present the device is hardwired to the
+  upstream port.
+
 
 Required properties for device nodes with interface nodes:
 - #address-cells: shall be 2
@@ -55,6 +59,10 @@ Required properties for combined nodes:
 - reg: the number of the USB hub port or the USB host-controller port to which
   this device is attached. The range is 1-255.
 
+Optional properties for combined nodes:
+- non-removable: boolean, if present the device is hardwired to the
+  upstream port.
+
 
 Required properties for hub nodes with device nodes:
 - #address-cells: shall be 1
-- 
2.20.1
