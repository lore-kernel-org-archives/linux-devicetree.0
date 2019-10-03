From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 2/2] ARM: dts: sun7i: Drop the module clock from the device
 tree
Date: Thu,  3 Oct 2019 17:48:42 +0200
Message-ID: <20191003154842.248763-2-mripard@kernel.org>
References: <20191003154842.248763-1-mripard@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191003154842.248763-1-mripard@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, sakari.ailus@linux.intel.com, mchehab@kernel.org
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

What we thought would be the module clock is actually the clock meant to be
used by the sensors, and play no role in the CSI controller. Now that the
binding has been updated to reflect that, let's update the device tree too.

Fixes: d2b9c6444301 ("ARM: dts: sun7i: Add CSI0 controller")
Reported-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 arch/arm/boot/dts/sun7i-a20.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 874231be04e4..8aebefd6accf 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -380,9 +380,8 @@
 			compatible = "allwinner,sun7i-a20-csi0";
 			reg = <0x01c09000 0x1000>;
 			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_AHB_CSI0>, <&ccu CLK_CSI0>,
-				 <&ccu CLK_CSI_SCLK>, <&ccu CLK_DRAM_CSI0>;
-			clock-names = "bus", "mod", "isp", "ram";
+			clocks = <&ccu CLK_AHB_CSI0>, <&ccu CLK_CSI_SCLK>, <&ccu CLK_DRAM_CSI0>;
+			clock-names = "bus", "isp", "ram";
 			resets = <&ccu RST_CSI0>;
 			status = "disabled";
 		};
-- 
2.23.0
