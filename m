From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 1/2] dt-bindings: add hym8563 binding
Date: Fri, 22 Nov 2013 22:55:03 +0100
Message-ID: <201311222255.03642.heiko@sntech.de>
References: <201311222254.07730.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201311222254.07730.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, Mike Turquette <mturquette@linaro.org>
List-Id: devicetree@vger.kernel.org

Add binding documentation for the hym8563 rtc chip.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../devicetree/bindings/rtc/haoyu,hym8563.txt      |   29 ++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/haoyu,hym8563.txt

diff --git a/Documentation/devicetree/bindings/rtc/haoyu,hym8563.txt b/Documentation/devicetree/bindings/rtc/haoyu,hym8563.txt
new file mode 100644
index 0000000..2743416
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/haoyu,hym8563.txt
@@ -0,0 +1,29 @@
+Haoyu Microelectronics HYM8563 Real Time Clock
+
+The HYM8563 provides basic rtc and alarm functionality
+as well as a clock output of up to 32kHz.
+
+Required properties:
+- compatible: should be: "haoyu,hym8563"
+- reg: i2c address
+- gpios: interrupt gpio
+- interrupts: rtc alarm/event interrupt
+- #clock-cells: the value should be 0
+
+Example:
+
+hym8563: hym8563@51 {
+	compatible = "haoyu,hym8563";
+	reg = <0x51>;
+
+	gpios = <&gpio0 13 0>;
+	interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+
+	#clock-cells = <0>;
+};
+
+device {
+...
+	clocks = <&hym8563>;
+...
+};
-- 
1.7.10.4
