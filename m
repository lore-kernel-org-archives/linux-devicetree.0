From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 06/11] doc: dt: Add documentation for lpc3220-timer
Date: Tue,  2 Jun 2015 14:31:51 +0200
Message-ID: <1433248316-26320-6-git-send-email-daniel.lezcano@linaro.org>
References: <556DA1E5.1030601@linaro.org>
 <1433248316-26320-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433248316-26320-1-git-send-email-daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Add DT bindings documentation for lpc3220-timer. This timer is
used as clocksource on many NXP platforms.

Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
 .../bindings/timer/nxp,lpc3220-timer.txt           | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nxp,lpc3220-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/nxp,lpc3220-timer.txt b/Documentation/devicetree/bindings/timer/nxp,lpc3220-timer.txt
new file mode 100644
index 0000000..51b05a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/nxp,lpc3220-timer.txt
@@ -0,0 +1,26 @@
+* NXP LPC3220 timer
+
+The NXP LPC3220 timer is used on a wide range of NXP SoCs. This
+includes LPC32xx, LPC178x, LPC18xx and LPC43xx parts.
+
+Required properties:
+- compatible:
+	Should be "nxp,lpc3220-timer".
+- reg:
+	Address and length of the register set.
+- interrupts:
+	Reference to the timer interrupt
+- clocks:
+	Should contain a reference to timer clock.
+- clock-names:
+	Should contain "timerclk".
+
+Example:
+
+timer1: timer@40085000 {
+	compatible = "nxp,lpc3220-timer";
+	reg = <0x40085000 0x1000>;
+	interrupts = <13>;
+	clocks = <&ccu1 CLK_CPU_TIMER1>;
+	clock-names = "timerclk";
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
