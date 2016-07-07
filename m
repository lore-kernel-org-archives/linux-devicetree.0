From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH v2 1/6] dt-bindings: clock: add DT binding for the Xtal clock on Armada 3700
Date: Fri,  8 Jul 2016 00:37:46 +0200
Message-ID: <1467931071-31004-2-git-send-email-gregory.clement@free-electrons.com>
References: <1467931071-31004-1-git-send-email-gregory.clement@free-electrons.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1467931071-31004-1-git-send-email-gregory.clement@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Romain Perier <romain.perier@free-electrons.com>, Omri Itach <omrii@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Terry Zhou <bjzhou@marvell.com>
List-Id: devicetree@vger.kernel.org

This commit adds the DT binding documentation for the the Xtal clock on
Armada 3700 used in the Marvell Armada 3700 SoCs.

Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/clock/armada3700-xtal-clock.txt       | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/armada3700-xtal-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/armada3700-xtal-clock.txt b/Documentation/devicetree/bindings/clock/armada3700-xtal-clock.txt
new file mode 100644
index 000000000000..176c4fe6f0e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/armada3700-xtal-clock.txt
@@ -0,0 +1,28 @@
+* Xtal Clock bindings for Marvell Armada 37xx SoCs
+
+Marvell Armada 37xx SoCs allow to determine the xtal clock frequencies by
+reading the gpio latch register.
+
+This node must be a subnode of the node exposing the register address
+of the GPIO block where the gpio latch is located.
+
+Required properties:
+- compatible : shall be one of the following:
+	"marvell,armada-3700-xtal-clock"
+- #clock-cells : from common clock binding; shall be set to 0
+
+Optional properties:
+- clock-output-names : from common clock binding; allows overwrite default clock
+	output names ("xtal")
+
+Example:
+gpio1: gpio@13800 {
+	compatible = "marvell,mvebu-gpio-3700",	"syscon", "simple-mfd";
+	reg = <0x13800 0x1000>;
+
+	xtalclk: xtal-clk {
+		compatible = "marvell,armada-3700-xtal-clock";
+		clock-output-names = "xtal";
+		#clock-cells = <0>;
+	};
+};
-- 
2.5.0

