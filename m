From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/8] dt-bindings: usb: fix reg-property port-number range
Date: Thu,  9 Nov 2017 18:07:17 +0100
Message-ID: <20171109170723.10960-3-johan@kernel.org>
References: <20171109170723.10960-1-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171109170723.10960-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Alan Stern <stern@rowland.harvard.edu>, Peter Chen <peter.chen@nxp.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: devicetree@vger.kernel.org

The USB hub port-number range for USB 2.0 is 1-255 and not 1-31 which
reflects an arbitrary limit set by the current Linux implementation.

Note that for USB 3.1 hubs the valid range is 1-15.

Increase the documented valid range in the binding to 255, which is the
maximum allowed by the specifications.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 Documentation/devicetree/bindings/usb/usb-device.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-device.txt b/Documentation/devicetree/bindings/usb/usb-device.txt
index 4df7e22e0084..b749fb9f2674 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.txt
+++ b/Documentation/devicetree/bindings/usb/usb-device.txt
@@ -11,7 +11,7 @@ Required properties:
   be used, but a device adhering to this binding may leave out all except
   for usbVID,PID.
 - reg: the port number which this device is connecting to, the range
-  is 1-31.
+  is 1-255.
 
 Example:
 
-- 
2.15.0
