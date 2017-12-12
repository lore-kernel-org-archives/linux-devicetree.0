From: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Subject: [PATCH v4 1/2] dt-bindings: clocksource: Add Spreadtrum SC9860 timer
Date: Tue, 12 Dec 2017 19:28:24 +0800
Message-ID: <346a731ce967b56514b0838bbbd8b4f500cea040.1513075872.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds documentation of device tree bindings for the timers
found on Spreadtrum SC9860 platform.

Signed-off-by: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Changes since v3:
 - Use clocks property instead of "clock-frequency".

changes since v2:
 - No updates.

Changes since v1:
 - Add acked tag from Rob.
---
 .../bindings/timer/spreadtrum,sprd-timer.txt       |   20 ++++++++++++++++++++
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
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
