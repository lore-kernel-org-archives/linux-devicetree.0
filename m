From: Harald Geyer <harald@ccbib.org>
Subject: [PATCHv3] arm64: dts: allwinner: a64: teres-i: enable backlight
Date: Fri,  8 Feb 2019 14:16:29 +0000
Message-ID: <20190208141629.14323-1-harald@ccbib.org>
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
The backlight node got dropped from the initial submission of the
teres-i DT, because PWM support wasn't available in time, and I
kind of forgot to resubmit once PWM was in. Sorry about that.

While testing this patch I noticed, that sometimes on boot the
brightness is set to max_brightness instead of the default specified
in DT. I couldn't reproduce it reliably, but it seems to be related
to changing the pwm period. I guess the logic trying to detect
the brightness set by the boot loader gets confused in some corner
case if the pwm periods don't match. However unbinding and rebinding
the device to the driver always made it go to the proper default
brightness, so the problem is clearly not in the DT.

If the theory above is true, then it implies that the version of
u-boot running on my laptop doesn't completely overwrite all pwm
parameters. As this might be specific to my installation, I didn't
mention the issue in the commit message.

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
index 7b7b14ba58e6..2a78932d5d3b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
@@ -21,6 +21,15 @@
 		serial0 = &uart0;
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 0 50000 0>;
+		power-supply = <&reg_dcdc1>;
+		brightness-levels = <0 5 10 15 20 30 40 55 70 85 100>;
+		default-brightness-level = <4>;
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
