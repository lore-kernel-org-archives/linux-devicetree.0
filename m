From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] dt/bindings: add binding for ARM Versatile character LCD
Date: Fri, 28 Mar 2014 16:20:28 -0500
Message-ID: <1396041629-28820-1-git-send-email-robherring2@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Add binding doc for Versatile platforms character LCD controller
interface.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 Documentation/devicetree/bindings/misc/arm-charlcd.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/arm-charlcd.txt

diff --git a/Documentation/devicetree/bindings/misc/arm-charlcd.txt b/Documentation/devicetree/bindings/misc/arm-charlcd.txt
new file mode 100644
index 0000000..e28e2aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/arm-charlcd.txt
@@ -0,0 +1,18 @@
+ARM Versatile Character LCD
+-----------------------------------------------------
+This binding defines the character LCD interface found on ARM Versatile AB
+and PB reference platforms.
+
+Required properties:
+- compatible : "arm,versatile-clcd"
+- reg : Location and size of character LCD registers
+
+Optional properties:
+- interrupts - single interrupt for character LCD. The character LCD can
+  operate in polled mode without an interrupt.
+
+Example:
+	lcd@10008000 {
+		compatible = "arm,versatile-lcd";
+		reg = <0x10008000 0x1000>;
+	};
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
