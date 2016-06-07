From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 2/2] dt-bindings: clocksource: Add Add Oxford Semiconductor RPS Timer bindings
Date: Tue,  7 Jun 2016 18:04:12 +0200
Message-ID: <1465315452-20599-3-git-send-email-narmstrong@baylibre.com>
References: <1465315452-20599-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465315452-20599-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, daniel.lezcano@linaro.org, tglx@linutronix.de, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Add DT bindings for the Oxford Semiconductor RPS dual Timer.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
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
