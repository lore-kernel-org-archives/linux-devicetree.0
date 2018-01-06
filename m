From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH v2 1/5] ARM64: dts: meson: uart: fix address space range
Date: Sat, 6 Jan 2018 08:10:40 +0800
Message-ID: <20180106001044.108163-2-yixun.lan@amlogic.com>
References: <20180106001044.108163-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180106001044.108163-1-yixun.lan@amlogic.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Neil Armstrong <narmstrong@baylibre.com>, Yixun Lan <yixun.lan@amlogic.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

The address space range is actually 0x18, fixed here.

Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi  | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index a80632641b39..70c776ef7aa7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -165,14 +165,14 @@
 
 			uart_A: serial@24000 {
 				compatible = "amlogic,meson-gx-uart", "amlogic,meson-uart";
-				reg = <0x0 0x24000 0x0 0x14>;
+				reg = <0x0 0x24000 0x0 0x18>;
 				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
 
 			uart_B: serial@23000 {
 				compatible = "amlogic,meson-gx-uart", "amlogic,meson-uart";
-				reg = <0x0 0x23000 0x0 0x14>;
+				reg = <0x0 0x23000 0x0 0x18>;
 				interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 6cb3c2a52baf..4ee2e7951482 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -235,14 +235,14 @@
 
 			uart_A: serial@84c0 {
 				compatible = "amlogic,meson-gx-uart";
-				reg = <0x0 0x84c0 0x0 0x14>;
+				reg = <0x0 0x84c0 0x0 0x18>;
 				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
 
 			uart_B: serial@84dc {
 				compatible = "amlogic,meson-gx-uart";
-				reg = <0x0 0x84dc 0x0 0x14>;
+				reg = <0x0 0x84dc 0x0 0x18>;
 				interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
@@ -287,7 +287,7 @@
 
 			uart_C: serial@8700 {
 				compatible = "amlogic,meson-gx-uart";
-				reg = <0x0 0x8700 0x0 0x14>;
+				reg = <0x0 0x8700 0x0 0x18>;
 				interrupts = <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
@@ -404,14 +404,14 @@
 
 			uart_AO: serial@4c0 {
 				compatible = "amlogic,meson-gx-uart", "amlogic,meson-ao-uart";
-				reg = <0x0 0x004c0 0x0 0x14>;
+				reg = <0x0 0x004c0 0x0 0x18>;
 				interrupts = <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
 
 			uart_AO_B: serial@4e0 {
 				compatible = "amlogic,meson-gx-uart", "amlogic,meson-ao-uart";
-				reg = <0x0 0x004e0 0x0 0x14>;
+				reg = <0x0 0x004e0 0x0 0x18>;
 				interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
-- 
2.15.1
