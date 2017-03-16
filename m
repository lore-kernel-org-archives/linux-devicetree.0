From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH v2 1/8] dt-bindings: add binding for the Allwinner DE2 CCU
Date: Fri, 17 Mar 2017 04:47:41 +0800
Message-ID: <20170316204748.8596-2-icenowy@aosc.xyz>
References: <20170316204748.8596-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170316204748.8596-1-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Icenowy Zheng <icenowy@aosc.xyz>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Allwinner "Display Engine 2.0" contains some clock controls in it.

Add them as a clock driver, and make a device tree binding.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
 .../devicetree/bindings/clock/sun8i-de2.txt        | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sun8i-de2.txt

diff --git a/Documentation/devicetree/bindings/clock/sun8i-de2.txt b/Documentation/devicetree/bindings/clock/sun8i-de2.txt
new file mode 100644
index 000000000000..c19496f037a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/sun8i-de2.txt
@@ -0,0 +1,31 @@
+Allwinner Display Engine 2.0 Clock Control Binding
+--------------------------------------------------
+
+Required properties :
+- compatible: must contain one of the following compatibles:
+		- "allwinner,sun8i-a83t-de2-clk"
+		- "allwinner,sun50i-a64-de2-clk"
+		- "allwinner,sun50i-h5-de2-clk"
+
+- reg: Must contain the registers base address and length
+- clocks: phandle to the clocks feeding the display engine subsystem.
+	  Three are needed:
+  - "mod": the display engine module clock
+  - "bus": the bus clock for the whole display engine subsystem
+- clock-names: Must contain the clock names described just above
+- resets: phandle to the reset control for the display engine subsystem.
+- #clock-cells : must contain 1
+- #reset-cells : must contain 1
+
+Example:
+de2_clocks: clock@01000000 {
+	compatible = "allwinner,sun50i-a64-de2-clk";
+	reg = <0x01000000 0x1c>;
+	clocks = <&ccu CLK_DE>,
+		 <&ccu CLK_BUS_DE>;
+	clock-names = "mod",
+		      "bus";
+	resets = <&ccu RST_BUS_DE>;
+	#clock-cells = <1>;
+	#reset-cells = <1>;
+};
-- 
2.12.0
