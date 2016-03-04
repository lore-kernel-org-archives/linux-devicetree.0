From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: add DT binding for Marvell AP806 system controller
Date: Fri,  4 Mar 2016 13:57:53 +0100
Message-ID: <1457096275-7581-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1457096275-7581-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1457096275-7581-1-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Cc: Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Yehuda Yitschak <yehuday@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../arm/marvell/ap806-system-controller.txt        | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt

diff --git a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
new file mode 100644
index 0000000..5086b89
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
@@ -0,0 +1,34 @@
+Marvell Armada AP806 System Controller
+======================================
+
+The AP806 is one of the two core HW blocks of the Marvell Armada 7K/8K
+SoCs. It contains a system controller, which provides a number
+registers giving access to numerous features: clocks, pin-muxing and
+many other SoC configuration items. This DT binding allows to describe
+this system controller.
+
+The Device Tree node representing the AP806 system controller provides
+a number of clocks:
+
+ - 0: clock of CPU cluster 0
+ - 1: clock of CPU cluster 1
+ - 2: fixed PLL at 1200 Mhz
+ - 3: MSS clock, derived from the fixed PLL
+
+Required properties:
+
+ - compatible: must be:
+     "marvell,ap806-system-controller", "syscon"
+ - reg: register area of the AP806 system controller
+ - #clock-cells: must be set to 1
+ - clock-output-names: must be defined to:
+    "cpu-cluster-0", "cpu-cluster-1", "fixed", "mss"
+
+Example:
+
+	syscon: system-controller@6f4000 {
+		compatible = "marvell,ap806-system-controller", "syscon";
+		#clock-cells = <1>;
+		clock-output-names = "cpu-cluster-0", "cpu-cluster-1", "fixed", "mss";
+		reg = <0x6f4000 0x1000>;
+	};
-- 
2.6.4

