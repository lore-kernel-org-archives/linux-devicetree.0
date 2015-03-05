From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH v2] devicetree: cadence_ttc: Document binding for timer width
Date: Thu,  5 Mar 2015 14:12:56 +0100
Message-ID: <b4cac8e34b5f6613d479bd2b2e2b8853b302f045.1425561172.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Zach Pfeffer <zachp@xilinx.com>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Michal Simek <monstr@monstr.eu>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Modern TTC implementations can extend the timer width to 32 bit. This
feature is not self identifying so the driver needs to be made aware
via device tree.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

Changes in v2:
- Change timer-width description based on my discussion with
  Mark Rutland. https://lkml.org/lkml/2014/9/17/277
- Code change is already applied to the mainline kernel tree

 Documentation/devicetree/bindings/timer/cadence,ttc-timer.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/cadence,ttc-timer.txt b/Documentation/devicetree/bindings/timer/cadence,ttc-timer.txt
index 993695c659e1..eeee6cd51e5c 100644
--- a/Documentation/devicetree/bindings/timer/cadence,ttc-timer.txt
+++ b/Documentation/devicetree/bindings/timer/cadence,ttc-timer.txt
@@ -6,6 +6,9 @@ Required properties:
 - interrupts : A list of 3 interrupts; one per timer channel.
 - clocks: phandle to the source clock
 
+Optional properties:
+- timer-width: Bit width of the timer, necessary if not 16.
+
 Example:
 
 ttc0: ttc0@f8001000 {
@@ -14,4 +17,5 @@ ttc0: ttc0@f8001000 {
 	compatible = "cdns,ttc";
 	reg = <0xF8001000 0x1000>;
 	clocks = <&cpu_clk 3>;
+	timer-width = <32>;
 };
-- 
1.8.2.3
