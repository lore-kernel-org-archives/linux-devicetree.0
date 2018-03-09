From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH 6/9] sunxi-cedrus: Add device tree binding document
Date: Fri,  9 Mar 2018 11:14:42 +0100
Message-ID: <20180309101445.16190-4-paul.kocialkowski@bootlin.com>
References: <20180309100933.15922-3-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180309100933.15922-3-paul.kocialkowski@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Cc: "Signed-off-by : Bob Ham" <rah@settrans.net>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Alexandre Courbot <acourbot@chromium.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Florent Revest <revestflo@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>, Icenowy Zheng <icenowy@aosc.xyz>, Sakari Ailus <sakari.ailus@linux.intel.com>, Thomas van Kleef <thomas@vitsch.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

From: Florent Revest <florent.revest@free-electrons.com>

Device Tree bindings for the Allwinner's video engine

Signed-off-by: Florent Revest <florent.revest@free-electrons.com>
---
 .../devicetree/bindings/media/sunxi-cedrus.txt     | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/sunxi-cedrus.txt

diff --git a/Documentation/devicetree/bindings/media/sunxi-cedrus.txt b/Documentation/devicetree/bindings/media/sunxi-cedrus.txt
new file mode 100644
index 000000000000..138581113c49
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/sunxi-cedrus.txt
@@ -0,0 +1,44 @@
+Device-Tree bindings for SUNXI video engine found in sunXi SoC family
+
+Required properties:
+- compatible	    : "allwinner,sun4i-a10-video-engine";
+- memory-region     : DMA pool for buffers allocation;
+- clocks	    : list of clock specifiers, corresponding to
+		      entries in clock-names property;
+- clock-names	    : should contain "ahb", "mod" and "ram" entries;
+- resets	    : phandle for reset;
+- interrupts	    : should contain VE interrupt number;
+- reg		    : should contain register base and length of VE.
+
+Example:
+
+reserved-memory {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges;
+
+	ve_reserved: cma {
+		compatible = "shared-dma-pool";
+		reg = <0x43d00000 0x9000000>;
+		no-map;
+		linux,cma-default;
+	};
+};
+
+video-engine {
+	compatible = "allwinner,sun4i-a10-video-engine";
+	memory-region = <&ve_reserved>;
+
+	clocks = <&ahb_gates 32>, <&ccu CLK_VE>,
+		 <&dram_gates 0>;
+	clock-names = "ahb", "mod", "ram";
+
+	assigned-clocks = <&ccu CLK_VE>;
+	assigned-clock-rates = <320000000>;
+
+	resets = <&ccu RST_VE>;
+
+	interrupts = <53>;
+
+	reg = <0x01c0e000 4096>;
+};
-- 
2.16.2
