From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: [PATCH v2 2/6] clk: dts: document pxa clock binding
Date: Mon, 14 Jul 2014 17:54:19 +0200
Message-ID: <1405353263-13424-3-git-send-email-robert.jarzmik@free.fr>
References: <1405353263-13424-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405353263-13424-1-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document the device-tree binding of Marvell PXA based SoCs.
PXA clocks are mostly fixed rate and fixed ratio clocks derived from an
external oscillator, and gated by a register set (CKEN or CKEN*).

Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
---
 Documentation/devicetree/bindings/clock/pxa-clock.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/pxa-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/pxa-clock.txt b/Documentation/devicetree/bindings/clock/pxa-clock.txt
new file mode 100644
index 0000000..4b4a902
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/pxa-clock.txt
@@ -0,0 +1,16 @@
+* Clock bindings for Marvell PXA chips
+
+Required properties:
+- compatible: Should be "marvell,pxa-clocks"
+- #clock-cells: Should be <1>
+
+The clock consumer should specify the desired clock by having the clock
+ID in its "clocks" phandle cell (see include/.../pxa-clock.h).
+
+Examples:
+
+pxa2xx_clks: pxa2xx_clks@41300004 {
+        compatible = "marvell,pxa-clocks";
+        #clock-cells = <1>;
+        status = "okay";
+};
-- 
2.0.0.rc2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
