From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v6 4/4] ARM: dts: sun9i: Switch to the AC100 RTC
 clock outputs for osc32k
Date: Fri, 19 Aug 2016 15:42:26 +0800
Message-ID: <20160819074226.16636-5-wens@csie.org>
References: <20160819074226.16636-1-wens@csie.org>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBCMILY6JWQBBB7MK3O6QKGQE7DKP2NY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160819074226.16636-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The 32.768 kHz clock inside the A80 SoC is fed from an external source,
typically the AC100 RTC module.

Make the osc32k placeholder a fixed-factor clock so board dts files can
specify its source.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
Changes since v5:

  - Added "clk-div" and "clk-mult" fixed-factor-clock properties to osc32k
    placeholder.

Changes since v4: none
Changes since v3: none
Changes since v2: none
Changes since v1: none
---
 arch/arm/boot/dts/sun9i-a80-cubieboard4.dts |  5 +++++
 arch/arm/boot/dts/sun9i-a80-optimus.dts     |  5 +++++
 arch/arm/boot/dts/sun9i-a80.dtsi            | 11 +++++------
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts b/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
index cf2f4b72a841..04b014603659 100644
--- a/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
+++ b/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
@@ -103,6 +103,11 @@
 	allwinner,drive = <SUN4I_PINCTRL_40_MA>;
 };
 
+&osc32k {
+	/* osc32k input is from AC100 */
+	clocks = <&ac100_rtc 0>;
+};
+
 &pio {
 	led_pins_cubieboard4: led-pins@0 {
 		allwinner,pins = "PH6", "PH17";
diff --git a/arch/arm/boot/dts/sun9i-a80-optimus.dts b/arch/arm/boot/dts/sun9i-a80-optimus.dts
index e35c06c162a7..fd874ded890e 100644
--- a/arch/arm/boot/dts/sun9i-a80-optimus.dts
+++ b/arch/arm/boot/dts/sun9i-a80-optimus.dts
@@ -152,6 +152,11 @@
 	status = "okay";
 };
 
+&osc32k {
+	/* osc32k input is from AC100 */
+	clocks = <&ac100_rtc 0>;
+};
+
 &pio {
 	led_pins_optimus: led-pins@0 {
 		allwinner,pins = "PH0", "PH1";
diff --git a/arch/arm/boot/dts/sun9i-a80.dtsi b/arch/arm/boot/dts/sun9i-a80.dtsi
index f68b3242b33a..24e3cac4f571 100644
--- a/arch/arm/boot/dts/sun9i-a80.dtsi
+++ b/arch/arm/boot/dts/sun9i-a80.dtsi
@@ -148,15 +148,14 @@
 
 		/*
 		 * The 32k clock is from an external source, normally the
-		 * AC100 codec/RTC chip. This clock is by default enabled
-		 * and clocked at 32768 Hz, from the oscillator connected
-		 * to the AC100. It is configurable, but no such driver or
-		 * bindings exist yet.
+		 * AC100 codec/RTC chip. This serves as a placeholder for
+		 * board dts files to specify the source.
 		 */
 		osc32k: osc32k_clk {
 			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <32768>;
+			compatible = "fixed-factor-clock";
+			clock-div = <1>;
+			clock-mult = <1>;
 			clock-output-names = "osc32k";
 		};
 
-- 
2.9.3

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
