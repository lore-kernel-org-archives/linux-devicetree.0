From: Mathieu Olivari <mathieu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 3/3] ARM: msm: add watchdog entries to DT timer binding doc
Date: Fri, 20 Feb 2015 18:19:36 -0800
Message-ID: <1424485176-8348-4-git-send-email-mathieu@codeaurora.org>
References: <1424485176-8348-1-git-send-email-mathieu@codeaurora.org>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424485176-8348-1-git-send-email-mathieu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, standby24x7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mathieu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The watchdog has been reworked to use the same DT node as the timer.
This change is updating the device tree doc accordingly.

Signed-off-by: Mathieu Olivari <mathieu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/msm/timer.txt | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/msm/timer.txt b/Documentation/devicetree/bindings/arm/msm/timer.txt
index 74607b6..5e10c34 100644
--- a/Documentation/devicetree/bindings/arm/msm/timer.txt
+++ b/Documentation/devicetree/bindings/arm/msm/timer.txt
@@ -9,11 +9,17 @@ Properties:
                "qcom,scss-timer" - scorpion subsystem
 
 - interrupts : Interrupts for the debug timer, the first general purpose
-               timer, and optionally a second general purpose timer in that
-               order.
+               timer, and optionally a second general purpose timer, and
+               optionally as well, 2 watchdog interrupts, in that order.
 
 - reg : Specifies the base address of the timer registers.
 
+- clocks: Reference to the parent clocks, one per output clock. The parents
+          must appear in the same order as the clock names.
+
+- clock-names: The name of the clocks as free-form strings. They should be in
+               the same order as the clocks.
+
 - clock-frequency : The frequency of the debug timer and the general purpose
                     timer(s) in Hz in that order.
 
@@ -29,9 +35,13 @@ Example:
                compatible = "qcom,scss-timer", "qcom,msm-timer";
                interrupts = <1 1 0x301>,
                             <1 2 0x301>,
-                            <1 3 0x301>;
+                            <1 3 0x301>,
+                            <1 4 0x301>,
+                            <1 5 0x301>;
                reg = <0x0200a000 0x100>;
                clock-frequency = <19200000>,
                                  <32768>;
+               clocks = <&sleep_clk>;
+               clock-names = "sleep";
                cpu-offset = <0x40000>;
        };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
