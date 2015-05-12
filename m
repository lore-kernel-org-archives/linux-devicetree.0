From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 04/12] clocksource: bindings: Provide bindings for ST's LPC Clocksource device
Date: Tue, 12 May 2015 13:58:12 +0100
Message-ID: <1431435500-22899-5-git-send-email-lee.jones@linaro.org>
References: <1431435500-22899-1-git-send-email-lee.jones@linaro.org>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431435500-22899-1-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
Cc: kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On current ST platforms the LPC controls a number of functions including
Watchdog and Real Time Clock.  This patch provides the bindings used to
configure LPC in Clocksource mode.

Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/timer/st,stih407-lpc       | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/st,stih407-lpc

diff --git a/Documentation/devicetree/bindings/timer/st,stih407-lpc b/Documentation/devicetree/bindings/timer/st,stih407-lpc
new file mode 100644
index 0000000..72acb48
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/st,stih407-lpc
@@ -0,0 +1,28 @@
+STMicroelectronics Low Power Controller (LPC) - Clocksource
+===========================================================
+
+LPC currently supports Watchdog OR Real Time Clock OR Clocksource
+functionality.
+
+[See: ../watchdog/st_lpc_wdt.txt for Watchdog options]
+[See: ../rtc/rtc-st-lpc.txt for RTC options]
+
+Required properties
+
+- compatible   : Must be: "st,stih407-lpc"
+- reg          : LPC registers base address + size
+- interrupts   : LPC interrupt line number and associated flags
+- clocks       : Clock used by LPC device (See: ../clock/clock-bindings.txt)
+- st,lpc-mode  : The LPC can run either one of three modes:
+                  ST_LPC_MODE_RTC    [0]
+                  ST_LPC_MODE_WDT    [1]
+                  ST_LPC_MODE_CLKSRC [2]
+		 One (and only one) mode must be selected.
+
+Example:
+       lpc@fde05000 {
+               compatible      = "st,stih407-lpc";
+               reg             = <0xfde05000 0x1000>;
+               clocks          = <&clk_s_d3_flexgen CLK_LPC_0>;
+               st,lpc-mode     = <ST_LPC_MODE_CLKSRC>;
+       };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
