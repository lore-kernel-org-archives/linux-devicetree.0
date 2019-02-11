From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v3 7/7] ARM: dts: sun5i: Add the MBUS controller
Date: Mon, 11 Feb 2019 16:02:55 +0100
Message-ID: <edf5e68d0dbb25877d2867554a5a19de1bf01236.1549897336.git-series.maxime.ripard@bootlin.com>
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

The MBUS (and its associated controller) is the bus in the Allwinner SoCs
that DMA devices use in the system to access the memory.

Among other things (and depending on the SoC generation), it can also
enforce priorities or report bandwidth usages on a per-master basis.

One of the most notable thing is that instead of having the same mapping
for the RAM than the CPU, it maps it at address 0, which means we'll have
to do address translation thanks to the dma-ranges property.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 arch/arm/boot/dts/sun5i.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
index 5497d985c54a..a29203b7661d 100644
--- a/arch/arm/boot/dts/sun5i.dtsi
+++ b/arch/arm/boot/dts/sun5i.dtsi
@@ -127,6 +127,7 @@
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
+		dma-ranges;
 		ranges;
 
 		system-control@1c00000 {
@@ -181,6 +182,14 @@
 			};
 		};
 
+		mbus: dram-controller@1c01000 {
+			compatible = "allwinner,sun5i-a13-mbus";
+			reg = <0x01c01000 0x1000>;
+			clocks = <&ccu CLK_MBUS>;
+			dma-ranges = <0x00000000 0x40000000 0x20000000>;
+			#interconnect-cells = <1>;
+		};
+
 		dma: dma-controller@1c02000 {
 			compatible = "allwinner,sun4i-a10-dma";
 			reg = <0x01c02000 0x1000>;
@@ -727,6 +736,8 @@
 			clock-names = "ahb", "mod",
 				      "ram";
 			resets = <&ccu RST_DE_FE>;
+			interconnects = <&mbus 19>;
+			interconnect-names = "dma";
 			status = "disabled";
 
 			ports {
@@ -755,6 +766,8 @@
 			clock-names = "ahb", "mod",
 				      "ram";
 			resets = <&ccu RST_DE_BE>;
+			interconnects = <&mbus 18>;
+			interconnect-names = "dma";
 			status = "disabled";
 
 			assigned-clocks = <&ccu CLK_DE_BE>;
-- 
git-series 0.9.1
