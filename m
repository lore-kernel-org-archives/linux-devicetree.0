From: Harald Geyer <harald@ccbib.org>
Subject: [PATCHv4] arm64: dts: allwinner: a64: teres-i: enable backlight
Date: Sat,  9 Feb 2019 10:40:18 +0000
Message-ID: <20190209104018.6765-1-harald@ccbib.org>
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
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Harald Geyer <harald@ccbib.org>
List-Id: devicetree@vger.kernel.org

Enable pwm and add a pretty standard backlight node.

The regulator is always on, but we include it anyway, because it is
required by the binding document.

Signed-off-by: Harald Geyer <harald@ccbib.org>
---
Changes since v3:
 * Adjust brightness-levels to follow closer to an exponential law
 * Change default value to have a similar brightness to what we had
   before.

Changes since v2:
 * Drop all the other stuff that got merged a year ago.
 * Rebased on current sunxi/for-next branch
 * Add power-supply property (just to conform to the binding)
 * Use slightly different brightness-levels

Actually I tried omitting brightness-levels completely, as it is now
optional. However automatic calculation gives unreasonable results
(depending on the exact value of pwm period). A report has been sent
to the author of the code.


 .../arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
index 7b7b14ba58e6..0ec46b969a75 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
@@ -21,6 +21,15 @@
 		serial0 = &uart0;
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 0 50000 0>;
+		power-supply = <&reg_dcdc1>;
+		brightness-levels = <0 5 7 10 14 20 28 40 56 80 112>;
+		default-brightness-level = <5>;
+		enable-gpios = <&pio 3 23 GPIO_ACTIVE_HIGH>; /* PD23 */
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 
@@ -131,6 +140,10 @@
 	status = "okay";
 };
 
+&pwm {
+	status = "okay";
+};
+
 &r_rsb {
 	status = "okay";
 
-- 
2.20.1
