From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v4 7/7] ARM: dts: sun9i: Switch to the AC100 RTC
 clock outputs for osc32k
Date: Thu, 30 Jun 2016 23:58:51 +0800
Message-ID: <1467302331-9663-8-git-send-email-wens@csie.org>
References: <1467302331-9663-1-git-send-email-wens@csie.org>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBCMILY6JWQBBBXUD2W5QKGQEILMEFPA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1467302331-9663-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The 32.768 kHz clock inside the A80 SoC is fed from an external source,
typically the AC100 RTC module.

Make the osc32k placeholder a fixed-factor clock so board dts files can
specify its source.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
Changes since v3: none
Changes since v2: none
Changes since v1: none
---
 arch/arm/boot/dts/sun9i-a80-cubieboard4.dts | 5 +++++
 arch/arm/boot/dts/sun9i-a80-optimus.dts     | 5 +++++
 arch/arm/boot/dts/sun9i-a80.dtsi            | 9 +++------
 3 files changed, 13 insertions(+), 6 deletions(-)

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
index f68b3242b33a..dd11115ec087 100644
--- a/arch/arm/boot/dts/sun9i-a80.dtsi
+++ b/arch/arm/boot/dts/sun9i-a80.dtsi
@@ -148,15 +148,12 @@
 
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
 			clock-output-names = "osc32k";
 		};
 
-- 
2.8.1

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
