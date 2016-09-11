From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH resend 3/3] dt: bindings: touchscreen: silead gsl1680: Document all compatibles
Date: Sun, 11 Sep 2016 20:45:43 +0200
Message-ID: <20160911184543.11734-4-hdegoede@redhat.com>
References: <20160911184543.11734-1-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160911184543.11734-1-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The silead gsl1680 driver / binding supports a whole series of devices,
list the compatibles for all of them in the binding.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
-Drop the "silead,mssl1680" compatible thing, the "mssl1680" name is an
 ACPI thing and does not belong in the dt bindings
---
 .../devicetree/bindings/input/touchscreen/silead_gsl1680.txt          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/silead_gsl1680.txt b/Documentation/devicetree/bindings/input/touchscreen/silead_gsl1680.txt
index ce85ee5..b726823 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/silead_gsl1680.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/silead_gsl1680.txt
@@ -2,6 +2,10 @@
 
 Required properties:
 - compatible		  : "silead,gsl1680"
+			or: "silead,gsl1688"
+			or: "silead,gsl3670"
+			or: "silead,gsl3675"
+			or: "silead,gsl3692"
 - reg			  : I2C slave address of the chip (0x40)
 - interrupt-parent	  : a phandle pointing to the interrupt controller
 			    serving the interrupt for this chip
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
