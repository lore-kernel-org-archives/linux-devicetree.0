From: Mans Rullgard <mans@mansr.com>
Subject: [PATCH 1/2] devicetree: add binding for generic mmio clocksource
Date: Sat,  3 Oct 2015 15:24:46 +0100
Message-ID: <1443882287-29963-1-git-send-email-mans@mansr.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This adds a DT binding for a generic mmio clocksource as implemented
by clocksource_mmio_init().

Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 .../devicetree/bindings/timer/clocksource-mmio.txt | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/clocksource-mmio.txt

diff --git a/Documentation/devicetree/bindings/timer/clocksource-mmio.txt b/Documentation/devicetree/bindings/timer/clocksource-mmio.txt
new file mode 100644
index 0000000..d8e93f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/clocksource-mmio.txt
@@ -0,0 +1,26 @@
+Generic MMIO clocksource
+
+Required properties:
+
+- compatible: should be "clocksource-mmio"
+- reg: the physical address of the counter register
+- reg-io-width: size of counter register in bytes, should be 2 or 4
+- clocks: phandle to the source clock
+- clocksource-bits: number of valid bits
+- clocksource-rating: rating of the clocksource
+
+Optional properties:
+
+- clocksource-counts-down: indicates that counter counts down
+- label: name of the clocksource
+
+Example:
+
+clocksource {
+	compatible = "clocksource-mmio";
+        reg = <0x10000 4>;
+        reg-io-width = <4>;
+        clocksource-bits = <32>;
+        clocksource-rating = <300>;
+        clocks = <&clk>;
+}
-- 
2.5.3
