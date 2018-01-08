From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 07/20] dt-bindings: clocksource: Add Spreadtrum SC9860 timer
Date: Mon,  8 Jan 2018 14:28:46 +0100
Message-ID: <1515418139-23276-7-git-send-email-daniel.lezcano@linaro.org>
References: <1bbaef2e-4080-3f54-7db3-a8989acfd691@free.fr>
 <1515418139-23276-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515418139-23276-1-git-send-email-daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>

This patch adds documentation of device tree bindings for the timers
found on Spreadtrum SC9860 platform.

Signed-off-by: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../bindings/timer/spreadtrum,sprd-timer.txt         | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/spreadtrum,sprd-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/spreadtrum,sprd-timer.txt b/Documentation/devicetree/bindings/timer/spreadtrum,sprd-timer.txt
new file mode 100644
index 0000000..6d97e7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/spreadtrum,sprd-timer.txt
@@ -0,0 +1,20 @@
+Spreadtrum timers
+
+The Spreadtrum SC9860 platform provides 3 general-purpose timers.
+These timers can support 32bit or 64bit counter, as well as supporting
+period mode or one-shot mode, and they are can be wakeup source
+during deep sleep.
+
+Required properties:
+- compatible: should be "sprd,sc9860-timer" for SC9860 platform.
+- reg: The register address of the timer device.
+- interrupts: Should contain the interrupt for the timer device.
+- clocks: The phandle to the source clock (usually a 32.768 KHz fixed clock).
+
+Example:
+	timer@40050000 {
+		compatible = "sprd,sc9860-timer";
+		reg = <0 0x40050000 0 0x20>;
+		interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&ext_32k>;
+	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
