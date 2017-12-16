From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: [PATCH for v4.15] dt-bindings/media/cec-gpio.txt: mention the CEC/HPD
 max voltages
Date: Sat, 16 Dec 2017 11:44:13 +0100
Message-ID: <064113a5-f8be-5b10-091f-a89b87baa5a3@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Mention the maximum voltages of the CEC and HPD lines. Since in the example
these lines are connected to a Raspberry Pi and the Rpi GPIO lines are 3.3V
it is a good idea to warn against directly connecting the HPD to the Raspberry
Pi's GPIO line.

Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
---
diff --git a/Documentation/devicetree/bindings/media/cec-gpio.txt b/Documentation/devicetree/bindings/media/cec-gpio.txt
index 46a0bac8b3b9..b36490aba7eb 100644
--- a/Documentation/devicetree/bindings/media/cec-gpio.txt
+++ b/Documentation/devicetree/bindings/media/cec-gpio.txt
@@ -4,6 +4,10 @@ The HDMI CEC GPIO module supports CEC implementations where the CEC line
 is hooked up to a pull-up GPIO line and - optionally - the HPD line is
 hooked up to another GPIO line.

+Please note: the maximum voltage for the CEC line is 3.63V, for the HPD
+line it is 5.3V. So you may need some sort of level conversion circuitry
+when connecting them to a GPIO line.
+
 Required properties:
   - compatible: value must be "cec-gpio".
   - cec-gpios: gpio that the CEC line is connected to. The line should be
@@ -21,7 +25,7 @@ the following property is optional:

 Example for the Raspberry Pi 3 where the CEC line is connected to
 pin 26 aka BCM7 aka CE1 on the GPIO pin header and the HPD line is
-connected to pin 11 aka BCM17:
+connected to pin 11 aka BCM17 (some level shifter is needed for this!):

 #include <dt-bindings/gpio/gpio.h>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
