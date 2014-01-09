From: Andreas Larsson <andreas@gaisler.com>
Subject: [PATCH 2/6] usb: gadget: gr_udc: Expand devicetree documentation
Date: Thu,  9 Jan 2014 11:54:14 +0100
Message-ID: <1389264858-32664-3-git-send-email-andreas@gaisler.com>
References: <1389264858-32664-1-git-send-email-andreas@gaisler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1389264858-32664-1-git-send-email-andreas@gaisler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, software@gaisler.com
List-Id: devicetree@vger.kernel.org

Provide more information on the two different interrupt cases and more
information of endpoint buffer sizes. Suggested by Mark Rutland.

Signed-off-by: Andreas Larsson <andreas@gaisler.com>
---
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
