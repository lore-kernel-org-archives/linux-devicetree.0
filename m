From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: [PATCH] auxdisplay: hd44780: Fix DT properties to include units of measurement
Date: Thu, 23 Mar 2017 14:25:37 +0100
Message-ID: <1490275537-3769-1-git-send-email-geert@linux-m68k.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Willy Tarreau <willy-W4YR9g1X7EZBDgjK7y7TUQ@public.gmane.org>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ksenija Stanojevic <ksenija.stanojevic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

DT properties specifying physical properties should contain appropriate
suffices indicating the units of measurement.

Hence amend the HD44780 DT bindings to add "chars" suffixes to the
"display-height" and "display-width" properties, and update the driver
to parse them.

Fixes: dd9502a9e9156dd8 ("dt-bindings: auxdisplay: Add bindings for Hitachi HD44780")
Fixes: d47d88361feea2ce ("auxdisplay: Add HD44780 Character LCD support")
Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
---
Against char-misc-next

 Documentation/devicetree/bindings/auxdisplay/hit,hd44780.txt | 11 ++++++-----
 drivers/auxdisplay/hd44780.c                                 |  5 +++--
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/auxdisplay/hit,hd44780.txt b/Documentation/devicetree/bindings/auxdisplay/hit,hd44780.txt
index ee4054da458d412f..2aa24b8899236882 100644
--- a/Documentation/devicetree/bindings/auxdisplay/hit,hd44780.txt
+++ b/Documentation/devicetree/bindings/auxdisplay/hit,hd44780.txt
@@ -15,8 +15,8 @@ Required properties:
   - rs-gpios: Must contain a GPIO specifier, referring to the GPIO pin
     connected to the "RS" (Register Select) signal line of the LCD Controller's
     bus interface,
-  - display-height: Height of the display, in character cells,
-  - display-width: Width of the display, in character cells.
+  - display-height-chars: Height of the display, in character cells,
+  - display-width-chars: Width of the display, in character cells.
 
 Optional properties:
   - rw-gpios: Must contain a GPIO specifier, referring to the GPIO pin
@@ -25,7 +25,8 @@ Optional properties:
   - backlight-gpios: Must contain a GPIO specifier, referring to the GPIO pin
     used for enabling the LCD's backlight,
   - internal-buffer-width: Internal buffer width (default is 40 for displays
-    with 1 or 2 lines, and display-width for displays with more than 2 lines).
+    with 1 or 2 lines, and display-width-chars for displays with more than 2
+    lines).
 
 Example:
 
@@ -39,6 +40,6 @@ Example:
 		enable-gpios = <&hc595 4 GPIO_ACTIVE_HIGH>;
 		rs-gpios = <&hc595 5 GPIO_ACTIVE_HIGH>;
 
-		display-height = <2>;
-		display-width = <16>;
+		display-height-chars = <2>;
+		display-width-chars = <16>;
 	};
diff --git a/drivers/auxdisplay/hd44780.c b/drivers/auxdisplay/hd44780.c
index 1665ac6ef9ffcb31..036eec40428943b7 100644
--- a/drivers/auxdisplay/hd44780.c
+++ b/drivers/auxdisplay/hd44780.c
@@ -264,10 +264,11 @@ static int hd44780_probe(struct platform_device *pdev)
 	}
 
 	/* Required properties */
-	ret = device_property_read_u32(dev, "display-height", &lcd->height);
+	ret = device_property_read_u32(dev, "display-height-chars",
+				       &lcd->height);
 	if (ret)
 		goto fail;
-	ret = device_property_read_u32(dev, "display-width", &lcd->width);
+	ret = device_property_read_u32(dev, "display-width-chars", &lcd->width);
 	if (ret)
 		goto fail;
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
