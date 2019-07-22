From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 1/2] arm64: dts: ti: k3-am65-main: Add hwspinlock node
Date: Mon, 22 Jul 2019 14:05:38 -0500
Message-ID: <20190722190539.27816-2-s-anna@ti.com>
References: <20190722190539.27816-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190722190539.27816-1-s-anna@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The Main NavSS block on AM65x SoCs contains a HwSpinlock IP instance
that is similar to the IP on some OMAP SoCs. Add the DT node for this
on AM65x SoCs. The node is present within the NavSS block, and is
added as a child node under the cbass_main_navss interconnect node.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index ca70ff73f171..8413e80f9d3a 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -413,6 +413,12 @@
 			ti,sci-rm-range-vint = <0x0>;
 			ti,sci-rm-range-global-event = <0x1>;
 		};
+
+		hwspinlock: spinlock@30e00000 {
+			compatible = "ti,am654-hwspinlock";
+			reg = <0x00 0x30e00000 0x00 0x1000>;
+			#hwlock-cells = <1>;
+		};
 	};
 
 	main_gpio0:  main_gpio0@600000 {
-- 
2.22.0
