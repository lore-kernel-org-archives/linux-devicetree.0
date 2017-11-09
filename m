From: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/8] dt-bindings: usb: clean up compatible property
Date: Thu,  9 Nov 2017 18:07:18 +0100
Message-ID: <20171109170723.10960-4-johan@kernel.org>
References: <20171109170723.10960-1-johan@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171109170723.10960-1-johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add quotation marks around the compatible string to avoid ambiguity due
to following punctuation, and define the VID and PID components.

Signed-off-by: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/usb-device.txt | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-device.txt b/Documentation/devicetree/bindings/usb/usb-device.txt
index b749fb9f2674..e0b562e35a0c 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.txt
+++ b/Documentation/devicetree/bindings/usb/usb-device.txt
@@ -5,11 +5,11 @@ The reference binding doc is from:
 http://www.devicetree.org/open-firmware/bindings/usb/usb-1_0.ps
 
 Required properties:
-- compatible: usbVID,PID. The textual representation of VID, PID shall
-  be in lower case hexadecimal with leading zeroes suppressed. The
-  other compatible strings from the above standard binding could also
-  be used, but a device adhering to this binding may leave out all except
-  for usbVID,PID.
+- compatible: "usbVID,PID", where VID is the vendor id and PID the product id.
+  The textual representation of VID and PID shall be in lower case hexadecimal
+  with leading zeroes suppressed. The other compatible strings from the above
+  standard binding could also be used, but a device adhering to this binding
+  may leave out all except for "usbVID,PID".
 - reg: the port number which this device is connecting to, the range
   is 1-255.
 
-- 
2.15.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
