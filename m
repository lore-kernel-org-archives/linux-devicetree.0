From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH v2] arm64: dts: meson-axg: Enable GPIO interrupt controller
Date: Sat,  1 Dec 2018 16:43:01 +0000
Message-ID: <20181201164301.17274-1-ccaione@baylibre.com>
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
To: robh+dt@kernel.org, khilman@baylibre.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, jbrunet@baylibre.com
Cc: Carlo Caione <ccaione@baylibre.com>
List-Id: devicetree@vger.kernel.org

Enable the GPIO interrupt controller for the AXG SoCs.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Tested on a custom board derived from S400.

@Jerome: I know you had problems with this. I tested this on the apollo
board with the PHY IRQ and it seems to work fine. You probably want to
N/ACK this.
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index df017dbd2e57..a7d8219f7373 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1414,12 +1414,12 @@
 			};
 
 			gpio_intc: interrupt-controller@f080 {
-				compatible = "amlogic,meson-gpio-intc";
+				compatible = "amlogic,meson-axg-gpio-intc",
+					     "amlogic,meson-gpio-intc";
 				reg = <0x0 0xf080 0x0 0x10>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
-				status = "disabled";
 			};
 
 			pwm_ab: pwm@1b000 {
-- 
2.19.1
