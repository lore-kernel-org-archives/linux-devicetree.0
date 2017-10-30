From: Rick Chen <rickchen36@gmail.com>
Subject: [PATCH v2 3/3] dt-bindings: timer: Add andestech atcpit100 timer binding doc
Date: Mon, 30 Oct 2017 13:18:57 +0800
Message-ID: <1509340737-10225-3-git-send-email-rickchen36@gmail.com>
References: <1509340737-10225-1-git-send-email-rickchen36@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1509340737-10225-1-git-send-email-rickchen36@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, tglx@linutronix.de, robh@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, rick@andestech.com
Cc: Rick Chen <rickchen36@gmail.com>, Greentime Hu <green.hu@gmail.com>
List-Id: devicetree@vger.kernel.org

Add a document to describe Andestech atcpit100 timer and
binding information.

Signed-off-by: Greentime Hu <green.hu@gmail.com>
Signed-off-by: Rick Chen <rickchen36@gmail.com>
---
 .../bindings/timer/andestech,atcpit100-timer.txt   | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/andestech,atcpit100-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/andestech,atcpit100-timer.txt b/Documentation/devicetree/bindings/timer/andestech,atcpit100-timer.txt
new file mode 100644
index 0000000..a87278a
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/andestech,atcpit100-timer.txt
@@ -0,0 +1,31 @@
+Andestech ATCPIT100 timer
+------------------------------------------------------------------
+ATCPIT100 is a generic IP block from Andes Technology, embedded in
+Andestech AE3XX platforms and other designs.
+
+This timer is a set of compact multi-function timers, which can be
+used as pulse width modulators (PWM) as well as simple timers.
+
+It supports up to 4 PIT channels. Each PIT channel is a
+multi-function timer and provide the following usage scenarios:
+One 32-bit timer
+Two 16-bit timers
+Four 8-bit timers
+One 16-bit PWM
+One 16-bit timer and one 8-bit PWM
+Two 8-bit timer and one 8-bit PWM
+
+Required properties:
+- compatible	: Should be "andestech,atcpit100"
+- reg		: Address and length of the register set
+- interrupts	: Reference to the timer interrupt
+- clock-frequency : The rate in HZ in input of the Andestech ATCPIT100 timer
+
+Examples:
+
+timer0: timer@f0400000 {
+	compatible = "andestech,atcpit100";
+	reg = <0xf0400000 0x1000>;
+	interrupts = <2 4>;
+	clock-frequency = <30000000>;
+};
-- 
2.7.4
