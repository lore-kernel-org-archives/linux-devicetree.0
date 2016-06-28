From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 10/92] dt-bindings: clocksource: Add Oxford Semiconductor RPS Timer bindings
Date: Tue, 28 Jun 2016 12:30:29 +0200
Message-ID: <1467109911-11060-10-git-send-email-daniel.lezcano@linaro.org>
References: <577251A4.7030508@linaro.org>
 <1467109911-11060-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467109911-11060-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Neil Armstrong <narmstrong@baylibre.com>

Add DT bindings for the Oxford Semiconductor RPS dual Timer.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
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
