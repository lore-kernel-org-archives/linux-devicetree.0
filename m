From: Jan Kotas <jank@cadence.com>
Subject: [PATCH v2 1/2] dt-bindings: clk: Add bindings for Fixed MMIO clock
Date: Thu, 13 Dec 2018 12:49:28 +0000
Message-ID: <20181213124929.32736-2-jank@cadence.com>
References: <20181213124929.32736-1-jank@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181213124929.32736-1-jank@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kotas <jank@cadence.com>
List-Id: devicetree@vger.kernel.org

This patch adds a DT binding documentation for Fixed
Memory Mapped IO clocks.

Signed-off-by: Jan Kotas <jank@cadence.com>
---
 .../devicetree/bindings/clock/fixed-mmio-clock.txt | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/fixed-mmio-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/fixed-mmio-clock.txt b/Documentation/devicetree/bindings/clock/fixed-mmio-clock.txt
new file mode 100644
index 000000000..c359367fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/fixed-mmio-clock.txt
@@ -0,0 +1,24 @@
+Binding for simple memory mapped io fixed-rate clock sources.
+The driver reads a clock frequency value from a single 32-bit memory mapped
+I/O register and registers it as a fixed rate clock.
+
+It was designed for test systems, like FPGA, not for complete, finished SoCs.
+
+This binding uses the common clock binding[1].
+
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+Required properties:
+- compatible : shall be "fixed-mmio-clock".
+- #clock-cells : from common clock binding; shall be set to 0.
+- reg : Address and length of the clock value register set.
+
+Optional properties:
+- clock-output-names : From common clock binding.
+
+Example:
+sysclock: sysclock@fd020004 {
+	#clock-cells = <0>;
+	compatible = "fixed-mmio-clock";
+	reg = <0xfd020004 0x4>;
+};
-- 
2.15.0
