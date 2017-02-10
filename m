From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/2] ARM64: dts: meson-gxbb: Add Mali node
Date: Fri, 10 Feb 2017 11:04:44 +0100
Message-ID: <1486721084-1383-3-git-send-email-narmstrong@baylibre.com>
References: <1486721084-1383-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1486721084-1383-1-git-send-email-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sboyd@codeaurora.org, khilman@baylibre.com, carlo@caione.org
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the Mali-450 MP3 node for GXBB.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 37 +++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index b353073..46d57b4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -474,6 +474,43 @@
 	};
 };
 
+&apb {
+	mali: gpu@c0000 {
+		compatible = "amlogic,meson-gxbb-mali", "arm,mali-450";
+		reg = <0x0 0xc0000 0x0 0x40000>;
+		interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "gp", "gpmmu", "pp", "pmu",
+			"pp0", "ppmmu0", "pp1", "ppmmu1",
+			"pp2", "ppmmu2";
+		clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_MALI>;
+		clock-names = "bus", "core";
+
+		/*
+		 * Mali clocking is provided by two identical clock paths
+		 * MALI_0 and MALI_1 muxed to a single clock by a glitch
+		 * free mux to safely change frequency while running.
+		 */
+		assigned-clocks = <&clkc CLKID_GP0_PLL>,
+				  <&clkc CLKID_MALI_0>,
+				  <&clkc CLKID_MALI>; /* Glitch free mux */
+		assigned-clock-parents = <0>, /* Do Nothing */
+					 <&clkc CLKID_GP0_PLL>,
+					 <&clkc CLKID_MALI_0>;
+		assigned-clock-rates = <744000000>,
+				       <744000000>,
+				       <0>; /* Do Nothing */
+	};
+};
+
 &i2c_A {
 	clocks = <&clkc CLKID_I2C>;
 };
-- 
1.9.1
