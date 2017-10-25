From: rick <rickchen36-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] dt-bindings: timer: Add andestech atcpit100 timer binding doc
Date: Wed, 25 Oct 2017 13:12:13 +0800
Message-ID: <1508908333-1809-1-git-send-email-rickchen36@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rickchen36-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rick <rick-MUIXKm3Oiri1Z/+hSey0Gg@public.gmane.org>, Greentime Hu <green.hu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: rick <rickchen36-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: rick <rick-MUIXKm3Oiri1Z/+hSey0Gg@public.gmane.org>
Signed-off-by: Greentime Hu <green.hu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../bindings/timer/andestech,atcpit100-timer.txt   |   31 ++++++++++++++++++++
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
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
