From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 3/5] dt-bindings: document the MPS2 timer bindings
Date: Thu, 28 Apr 2016 15:20:46 +0200
Message-ID: <1461849648-12751-3-git-send-email-daniel.lezcano@linaro.org>
References: <20160428131908.GC5197@linaro.org>
 <1461849648-12751-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461849648-12751-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, mingo@kernel.org
Cc: Vladimir Murzin <vladimir.murzin@arm.com>, Rob Herring <robh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Vladimir Murzin <vladimir.murzin@arm.com>

This adds documentation of device tree bindings for the
timers found on ARM MPS2 platform.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 .../devicetree/bindings/timer/arm,mps2-timer.txt   | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/arm,mps2-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/arm,mps2-timer.txt b/Documentation/devicetree/bindings/timer/arm,mps2-timer.txt
new file mode 100644
index 0000000..48f84d7
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/arm,mps2-timer.txt
@@ -0,0 +1,28 @@
+ARM MPS2 timer
+
+The MPS2 platform has simple general-purpose 32 bits timers.
+
+Required properties:
+- compatible	: Should be "arm,mps2-timer"
+- reg		: Address and length of the register set
+- interrupts	: Reference to the timer interrupt
+
+Required clocking property, have to be one of:
+- clocks	  : The input clock of the timer
+- clock-frequency : The rate in HZ in input of the ARM MPS2 timer
+
+Examples:
+
+timer1: mps2-timer@40000000 {
+	compatible = "arm,mps2-timer";
+	reg = <0x40000000 0x1000>;
+	interrupts = <8>;
+	clocks = <&sysclk>;
+};
+
+timer2: mps2-timer@40001000 {
+	compatible = "arm,mps2-timer";
+	reg = <0x40001000 0x1000>;
+	interrupts = <9>;
+	clock-frequency = <25000000>;
+};
-- 
1.9.1
