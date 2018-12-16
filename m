From: Harald Geyer <harald@ccbib.org>
Subject: [PATCH] ARM: dts: sun4i-a10: Add PMU node
Date: Sun, 16 Dec 2018 09:25:24 +0000
Message-ID: <20181216092524.20337-1-harald@ccbib.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Harald Geyer <harald@ccbib.org>
List-Id: devicetree@vger.kernel.org

This is necessary to use 'perf' for cache profiling etc.
Tested on cubieboard with 'perf stat echo foo'.

Signed-off-by: Harald Geyer <harald@ccbib.org>
---
 arch/arm/boot/dts/sun4i-a10.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

While looking into this, I noticed that the dtsi files for the allwinner
SoCs have no information about caches in them. Is this on purpose?

diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
index 5d46bb0139fa..a2fb473cbb9d 100644
--- a/arch/arm/boot/dts/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/sun4i-a10.dtsi
@@ -184,6 +184,11 @@
 		status = "disabled";
 	};
 
+	pmu {
+		compatible = "arm,cortex-a8-pmu";
+		interrupts = <3>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.11.0
