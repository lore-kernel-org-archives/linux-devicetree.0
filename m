From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 1/2] arm64: dts: meson: Fix IRQ trigger type for macirq
Date: Tue,  4 Dec 2018 16:04:46 +0000
Message-ID: <20181204160447.27869-2-ccaione@baylibre.com>
References: <20181204160447.27869-1-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181204160447.27869-1-ccaione@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, martin.blumenstingl@googlemail.com
Cc: Carlo Caione <ccaione@baylibre.com>
List-Id: devicetree@vger.kernel.org

A long running stress test on a custom board shipping an AXG SoCs and a
Realtek RTL8211F PHY revealed that after a few hours the connection
speed would drop drastically, from ~1000Mbps to ~3Mbps. At the same time
the 'macirq' (eth0) IRQ would stop being triggered at all and as
consequence the GMAC IRQs never ACKed.

After a painful investigation the problem seemed to be due to a wrong
defined IRQ type for the GMAC IRQ that should be LEVEL_HIGH instead of
EDGE_RISING.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm/boot/dts/meson.dtsi               | 2 +-
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index 0d9faf1a51ea..a86b89086334 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -263,7 +263,7 @@
 			compatible = "amlogic,meson6-dwmac", "snps,dwmac";
 			reg = <0xc9410000 0x10000
 			       0xc1108108 0x4>;
-			interrupts = <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index df017dbd2e57..b1a42e99cb67 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -143,7 +143,7 @@
 			compatible = "amlogic,meson-axg-dwmac", "snps,dwmac";
 			reg = <0x0 0xff3f0000 0x0 0x10000
 			       0x0 0xff634540 0x0 0x8>;
-			interrupts = <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
 			clocks = <&clkc CLKID_ETH>,
 				 <&clkc CLKID_FCLK_DIV2>,
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index f1e5cdbade5e..58e6bcaac1d8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -462,7 +462,7 @@
 			compatible = "amlogic,meson-gx-dwmac", "amlogic,meson-gxbb-dwmac", "snps,dwmac";
 			reg = <0x0 0xc9410000 0x0 0x10000
 			       0x0 0xc8834540 0x0 0x4>;
-			interrupts = <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
 			status = "disabled";
 		};
-- 
2.19.1
