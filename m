From: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 2/7] usb: gadget: gr_udc: Expand devicetree documentation
Date: Thu, 27 Mar 2014 16:15:54 +0100
Message-ID: <1395933359-7109-3-git-send-email-andreas@gaisler.com>
References: <1395933359-7109-1-git-send-email-andreas@gaisler.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395933359-7109-1-git-send-email-andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, software-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Provide more information on the two different interrupt cases and more
information of endpoint buffer sizes. Suggested by Mark Rutland.

Signed-off-by: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
---
Differences since v1: none

 Documentation/devicetree/bindings/usb/gr-udc.txt |   22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/gr-udc.txt b/Documentation/devicetree/bindings/usb/gr-udc.txt
index 0c5118f..e944522 100644
--- a/Documentation/devicetree/bindings/usb/gr-udc.txt
+++ b/Documentation/devicetree/bindings/usb/gr-udc.txt
@@ -12,17 +12,23 @@ Required properties:
 
 - reg : Address and length of the register set for the device
 
-- interrupts : Interrupt numbers for this device
+- interrupts : Interrupt numbers for this device. Either one interrupt number
+	for all interrupts, or one for status related interrupts, one for IN
+	endpoint related interrupts and one for OUT endpoint related interrupts.
 
 Optional properties:
 
-- epobufsizes : An array of buffer sizes for OUT endpoints. If the property is
-	not present, or for endpoints outside of the array, 1024 is assumed by
-	the driver.
-
-- epibufsizes : An array of buffer sizes for IN endpoints. If the property is
-	not present, or for endpoints outside of the array, 1024 is assumed by
-	the driver.
+- epobufsizes : Array of buffer sizes for OUT endpoints when they differ
+	from the default size of 1024. The array is indexed by the OUT endpoint
+	number. If the property is present it typically contains one entry for
+	each OUT endpoint of the core. Fewer entries overrides the default sizes
+	only for as many endpoints as the array contains.
+
+- epibufsizes : Array of buffer sizes for IN endpoints when they differ
+	from the default size of 1024. The array is indexed by the IN endpoint
+	number. If the property is present it typically contains one entry for
+	each IN endpoint of the core. Fewer entries overrides the default sizes
+	only for as many endpoints as the array contains.
 
 For further information look in the documentation for the GLIB IP core library:
 http://www.gaisler.com/products/grlib/grip.pdf
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
