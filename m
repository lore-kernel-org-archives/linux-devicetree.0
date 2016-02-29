From: fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Subject: [PATCH v14 1/4] Documentation: add sbsa-gwdt driver documentation
Date: Mon, 29 Feb 2016 16:46:47 +0800
Message-ID: <1456735610-22012-2-git-send-email-fu.wei@linaro.org>
References: <1456735610-22012-1-git-send-email-fu.wei@linaro.org>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456735610-22012-1-git-send-email-fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, rruigrok-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, leo.duran-5C7GfCeVMHo@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

The sbsa-gwdt.txt documentation in devicetree/bindings/watchdog is for
introducing SBSA(Server Base System Architecture) Generic Watchdog
device node info into FDT.

Also add sbsa-gwdt introduction in watchdog-parameters.txt

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
---
 .../devicetree/bindings/watchdog/sbsa-gwdt.txt     | 31 ++++++++++++++++++++++
 Documentation/watchdog/watchdog-parameters.txt     |  7 +++++
 2 files changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/sbsa-gwdt.txt b/Documentation/devicetree/bindings/watchdog/sbsa-gwdt.txt
new file mode 100644
index 0000000..6f2d5f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/sbsa-gwdt.txt
@@ -0,0 +1,31 @@
+* SBSA (Server Base System Architecture) Generic Watchdog
+
+The SBSA Generic Watchdog Timer is used to force a reset of the system
+after two stages of timeout have elapsed.  A detailed definition of the
+watchdog timer can be found in the ARM document: ARM-DEN-0029 - Server
+Base System Architecture (SBSA)
+
+Required properties:
+- compatible: Should at least contain "arm,sbsa-gwdt".
+
+- reg: Each entry specifies the base physical address of a register frame
+  and the length of that frame; currently, two frames must be defined,
+  in this order:
+  1: Watchdog control frame;
+  2: Refresh frame.
+
+- interrupts: Should contain the Watchdog Signal 0 (WS0) SPI (Shared
+  Peripheral Interrupt) number of SBSA Generic Watchdog.
+
+Optional properties
+- timeout-sec: Watchdog timeout values (in seconds).
+
+Example for FVP Foundation Model v8:
+
+watchdog@2a440000 {
+	compatible = "arm,sbsa-gwdt";
+	reg = <0x0 0x2a440000 0 0x1000>,
+	      <0x0 0x2a450000 0 0x1000>;
+	interrupts = <0 27 4>;
+	timeout-sec = <30>;
+};
diff --git a/Documentation/watchdog/watchdog-parameters.txt b/Documentation/watchdog/watchdog-parameters.txt
index 9f9ec9f..ce7ae4e 100644
--- a/Documentation/watchdog/watchdog-parameters.txt
+++ b/Documentation/watchdog/watchdog-parameters.txt
@@ -284,6 +284,13 @@ sbc_fitpc2_wdt:
 margin: Watchdog margin in seconds (default 60s)
 nowayout: Watchdog cannot be stopped once started
 -------------------------------------------------
+sbsa_gwdt:
+timeout: Watchdog timeout in seconds. (default 10s)
+action: Watchdog action at the first stage timeout,
+	set to 0 to ignore, 1 to panic. (default=0)
+nowayout: Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+-------------------------------------------------
 sc1200wdt:
 isapnp: When set to 0 driver ISA PnP support will be disabled (default=1)
 io: io port
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
