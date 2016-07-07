From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 10/93] dt-bindings: clocksource: Add Oxford Semiconductor RPS Timer bindings
Date: Thu,  7 Jul 2016 10:00:43 +0200
Message-ID: <1467878526-1238-10-git-send-email-daniel.lezcano@linaro.org>
References: <577E0BED.3020608@linaro.org>
 <1467878526-1238-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467878526-1238-1-git-send-email-daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

Add DT bindings for the Oxford Semiconductor RPS dual Timer.

Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/timer/oxsemi,rps-timer.txt      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt b/Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt
new file mode 100644
index 0000000..3ca89cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt
@@ -0,0 +1,17 @@
+Oxford Semiconductor OXNAS SoCs Family RPS Timer
+================================================
+
+Required properties:
+- compatible: Should be "oxsemi,ox810se-rps-timer"
+- reg : Specifies base physical address and size of the registers.
+- interrupts : The interrupts of the two timers
+- clocks : The phandle of the timer clock source
+
+example:
+
+timer0: timer@200 {
+	compatible = "oxsemi,ox810se-rps-timer";
+	reg = <0x200 0x40>;
+	clocks = <&rpsclk>;
+	interrupts = <4 5>;
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
