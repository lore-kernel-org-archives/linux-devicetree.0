From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v3 2/7] dt-bindings: bus: Add binding for the Allwinner MBUS
 controller
Date: Mon, 11 Feb 2019 16:02:50 +0100
Message-ID: <43f965dae8b0ba8dffd3af478c2836c17feaa18b.1549897336.git-series.maxime.ripard@bootlin.com>
References: <cover.f2e5fbb4d21384168973fa32377a33d627768146.1549897336.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.f2e5fbb4d21384168973fa32377a33d627768146.1549897336.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, Georgi Djakov <georgi.djakov@linaro.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Yong Deng <yong.deng@magewell.com>, Robin Murphy <robin.murphy@arm.com>, Dave Martin <dave.martin@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The MBUS controller drives the MBUS that other devices in the SoC will
use to perform DMA. It also has a register interface that allows to
monitor and control the bandwidth and priorities for masters on that
bus.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/arm/sunxi/sunxi-mbus.txt | 36 +++++++-
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/sunxi/sunxi-mbus.txt

diff --git a/Documentation/devicetree/bindings/arm/sunxi/sunxi-mbus.txt b/Documentation/devicetree/bindings/arm/sunxi/sunxi-mbus.txt
new file mode 100644
index 000000000000..e72b7ac9e359
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/sunxi/sunxi-mbus.txt
@@ -0,0 +1,36 @@
+Allwinner Memory Bus (MBUS) controller
+
+The MBUS controller drives the MBUS that other devices in the SoC will
+use to perform DMA. It also has a register interface that allows to
+monitor and control the bandwidth and priorities for masters on that
+bus.
+
+Required properties:
+ - compatible: Must be one of:
+	- allwinner,sun5i-a13-mbus
+ - reg: Offset and length of the register set for the controller
+ - clocks: phandle to the clock driving the controller
+ - dma-ranges: see booting-without-of.txt
+ - #interconnect-cells: Must be one, with the argument being the MBUS
+   port ID
+
+Each device having to perform their DMA through the MBUS must have the
+interconnects and interconnect-names properties set to the MBUS
+controller and with "dma" as the interconnect name.
+
+Example:
+
+mbus: dram-controller@1c01000 {
+	compatible = "allwinner,sun5i-a13-mbus";
+	reg = <0x01c01000 0x1000>;
+	clocks = <&ccu CLK_MBUS>;
+	dma-ranges = <0x00000000 0x40000000 0x20000000>;
+	#interconnect-cells = <1>;
+};
+
+fe0: display-frontend@1e00000 {
+	compatible = "allwinner,sun5i-a13-display-frontend";
+	...
+	interconnects = <&mbus 19>;
+	interconnect-names = "dma";
+};
-- 
git-series 0.9.1
