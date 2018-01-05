From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH 1/6] ARM64: dts: meson-axg: uart: drop legacy compatible name
 from EE UART
Date: Fri, 5 Jan 2018 17:56:16 +0800
Message-ID: <20180105095621.196472-2-yixun.lan@amlogic.com>
References: <20180105095621.196472-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180105095621.196472-1-yixun.lan@amlogic.com>
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

For the UART controller in EE domain, they require 'pclk' to work.
Current logic of the code will force to go for legacy clock probe
if it found current compatible string match to 'amlogic,meson-ao-uart'.

Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index e2b8a9c8bf0b..1c6002b3fe34 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -142,14 +142,14 @@
 			};
 
 			uart_A: serial@24000 {
-				compatible = "amlogic,meson-gx-uart", "amlogic,meson-uart";
+				compatible = "amlogic,meson-gx-uart";
 				reg = <0x0 0x24000 0x0 0x14>;
 				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
 
 			uart_B: serial@23000 {
-				compatible = "amlogic,meson-gx-uart", "amlogic,meson-uart";
+				compatible = "amlogic,meson-gx-uart";
 				reg = <0x0 0x23000 0x0 0x14>;
 				interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
-- 
2.15.1
