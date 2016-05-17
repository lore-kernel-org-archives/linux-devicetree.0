From: Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: [PATCH 11/11] dt/bindings: Correct clk binding example for PIC32 gpio.
Date: Tue, 17 May 2016 10:36:00 +0530
Message-ID: <1463461560-9629-11-git-send-email-purna.mandal@microchip.com>
References: <1463461560-9629-1-git-send-email-purna.mandal@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463461560-9629-1-git-send-email-purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Update binding example based on new clock binding scheme.
[1] Documentation/devicetree/bindings/clock/microchip,pic32.txt

Signed-off-by: Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
---

 Documentation/devicetree/bindings/gpio/microchip,pic32-gpio.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/microchip,pic32-gpio.txt b/Documentation/devicetree/bindings/gpio/microchip,pic32-gpio.txt
index ef37528..dd031fc 100644
--- a/Documentation/devicetree/bindings/gpio/microchip,pic32-gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/microchip,pic32-gpio.txt
@@ -33,7 +33,7 @@ gpio0: gpio0@1f860000 {
 	gpio-controller;
 	interrupt-controller;
 	#interrupt-cells = <2>;
-	clocks = <&PBCLK4>;
+	clocks = <&rootclk PB4CLK>;
 	microchip,gpio-bank = <0>;
 	gpio-ranges = <&pic32_pinctrl 0 0 16>;
 };
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
