From: <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCHv3 1/4] dt-bindings: mfd: Add Altera Arria10 SR Monitor
Date: Wed, 2 Nov 2016 09:32:55 -0500
Message-ID: <1478097178-24341-2-git-send-email-tthayer@opensource.altera.com>
References: <1478097178-24341-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478097178-24341-1-git-send-email-tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

Add the Arria10 DevKit System Resource Chip register and state
monitoring module to the MFD.

Signed-off-by: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
---
Note: This needs to be applied to the bindings document that
was Acked & Applied but didn't reach the for-next branch.
See https://patchwork.ozlabs.org/patch/629397/
---
v2  Change compatible string -mon to -monitor for clarity
v3  Replace node name a10sr_monitor with just monitor.
    Replace node name a10sr_gpio with just gpio.
---
 Documentation/devicetree/bindings/mfd/altera-a10sr.txt | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/altera-a10sr.txt b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
index ea151f2..69243d2 100644
--- a/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
+++ b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
@@ -17,7 +17,8 @@ The A10SR consists of these sub-devices:
 
 Device                   Description
 ------                   ----------
-a10sr_gpio               GPIO Controller
+gpio                     GPIO Controller
+monitor                  Register and State Monitoring
 
 Arria10 GPIO
 Required Properties:
@@ -27,6 +28,10 @@ Required Properties:
                       the second cell is used to specify flags.
                       See ../gpio/gpio.txt for more information.
 
+Arria10 Register and State Monitor
+Required Properties:
+- compatible        : Should be "altr,a10sr-monitor"
+
 Example:
 
         resource-manager@0 {
@@ -43,4 +48,8 @@ Example:
 			gpio-controller;
 			#gpio-cells = <2>;
 		};
+
+		monitor {
+			compatible = "altr,a10sr-monitor";
+		};
 	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
