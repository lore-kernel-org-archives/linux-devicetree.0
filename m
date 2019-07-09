From: Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH 3/5] dt: bindings: add mt7621-pll dt binding documentation
Date: Wed, 10 Jul 2019 02:20:16 +0800
Message-ID: <20190709182018.23193-4-gch981213@gmail.com>
References: <20190709182018.23193-1-gch981213@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190709182018.23193-1-gch981213@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:MIPS" <linux-mips@vger.kernel.org>, "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, John Crispin <john@phrozen.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Weijie Gao <hackpascal@gmail.com>, NeilBrown <neil@brown.name>, Chuanhong Guo <gch981213@gmail.com>
List-Id: devicetree@vger.kernel.org

This commit adds device tree binding documentation for MT7621
PLL controller.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 .../bindings/clock/mediatek,mt7621-pll.txt    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.txt

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.txt b/Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.txt
new file mode 100644
index 000000000000..05c15062cd20
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.txt
@@ -0,0 +1,19 @@
+Binding for Mediatek MT7621 PLL controller
+
+The PLL controller provides the 2 main clocks of the SoC: CPU and BUS.
+
+Required Properties:
+- compatible: has to be "mediatek,mt7621-pll"
+- #clock-cells: has to be one
+
+Optional properties:
+- clock-output-names: should be "cpu", "bus"
+
+Example:
+	pll {
+		compatible = "mediatek,mt7621-pll", "syscon";
+
+		#clock-cells = <1>;
+		clock-output-names = "cpu", "bus";
+	};
+
-- 
2.21.0
