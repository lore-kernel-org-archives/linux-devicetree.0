From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v4 5/5] ARM: dts: sun9i: Add TODO comments for
 the main and low power clocks
Date: Sun, 29 Nov 2015 11:03:10 +0800
Message-ID: <1448766190-11345-6-git-send-email-wens@csie.org>
References: <1448766190-11345-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB6WV5GZAKGQEWBIRHXA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1448766190-11345-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The main (24MHz) clock on the A80 is configurable via the PRCM address
space. The low power/speed (32kHz) clock is from an external chip, the
AC100.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun9i-a80.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/sun9i-a80.dtsi b/arch/arm/boot/dts/sun9i-a80.dtsi
index a4ce348c0831..eb69a62f6bc4 100644
--- a/arch/arm/boot/dts/sun9i-a80.dtsi
+++ b/arch/arm/boot/dts/sun9i-a80.dtsi
@@ -128,6 +128,17 @@
 		 */
 		ranges = <0 0 0 0x20000000>;
 
+		/*
+		 * This clock is actually configurable from the PRCM address
+		 * space. The external 24M oscillator can be turned off, and
+		 * the clock switched to an internal 16M RC oscillator. Under
+		 * normal operation there's no reason to do this, and the
+		 * default is to use the external good one, so just model this
+		 * as a fixed clock. Also it is not entirely clear if the
+		 * osc24M mux in the PRCM affects the entire clock tree, which
+		 * would also throw all the PLL clock rates off, or just the
+		 * downstream clocks in the PRCM.
+		 */
 		osc24M: osc24M_clk {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
@@ -135,6 +146,13 @@
 			clock-output-names = "osc24M";
 		};
 
+		/*
+		 * The 32k clock is from an external source, normally the
+		 * AC100 codec/RTC chip. This clock is by default enabled
+		 * and clocked at 32768 Hz, from the oscillator connected
+		 * to the AC100. It is configurable, but no such driver or
+		 * bindings exist yet.
+		 */
 		osc32k: osc32k_clk {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
-- 
2.6.2
