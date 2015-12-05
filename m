From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH resend 3/6] ARM: dts: sun4i: Add DRAM gates
Date: Sat,  5 Dec 2015 21:16:44 +0800
Message-ID: <1449321407-4531-4-git-send-email-wens@csie.org>
References: <1449321407-4531-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBVOHROZQKGQEXFCDDIY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1449321407-4531-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The DRAM gates controls direct memory access for some peripherals.
These peripherals include the display pipeline, so add the required
gates to the simplefb nodes as well.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun4i-a10.dtsi | 36 ++++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
index aa90f319309b..849d0242ece8 100644
--- a/arch/arm/boot/dts/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/sun4i-a10.dtsi
@@ -66,7 +66,7 @@
 				     "simple-framebuffer";
 			allwinner,pipeline = "de_be0-lcd0-hdmi";
 			clocks = <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 43>,
-				 <&ahb_gates 44>;
+				 <&ahb_gates 44>, <&dram_gates 26>;
 			status = "disabled";
 		};
 
@@ -75,7 +75,8 @@
 				     "simple-framebuffer";
 			allwinner,pipeline = "de_fe0-de_be0-lcd0-hdmi";
 			clocks = <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 43>,
-				 <&ahb_gates 44>, <&ahb_gates 46>;
+				 <&ahb_gates 44>, <&ahb_gates 46>,
+				 <&dram_gates 25>, <&dram_gates 26>;
 			status = "disabled";
 		};
 
@@ -84,7 +85,8 @@
 				     "simple-framebuffer";
 			allwinner,pipeline = "de_fe0-de_be0-lcd0";
 			clocks = <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 44>,
-				 <&ahb_gates 46>;
+				 <&ahb_gates 46>, <&dram_gates 25>,
+				 <&dram_gates 26>;
 			status = "disabled";
 		};
 
@@ -93,7 +95,8 @@
 				     "simple-framebuffer";
 			allwinner,pipeline = "de_fe0-de_be0-lcd0-tve0";
 			clocks = <&pll5 1>, <&ahb_gates 34>, <&ahb_gates 36>,
-				 <&ahb_gates 44>, <&ahb_gates 46>;
+				 <&ahb_gates 44>, <&ahb_gates 46>,
+				 <&dram_gates 25>, <&dram_gates 26>;
 			status = "disabled";
 		};
 	};
@@ -492,6 +495,31 @@
 			clock-output-names = "spi3";
 		};
 
+		dram_gates: clk@01c20100 {
+			#clock-cells = <1>;
+			compatible = "allwinner,sun4i-a10-dram-gates-clk";
+			reg = <0x01c20100 0x4>;
+			clocks = <&pll5 0>;
+			clock-indices = <0>,
+					<1>, <2>,
+					<3>,
+					<4>,
+					<5>, <6>,
+					<15>,
+					<24>, <25>,
+					<26>, <27>,
+					<28>, <29>;
+			clock-output-names = "dram_ve",
+					     "dram_csi0", "dram_csi1",
+					     "dram_ts",
+					     "dram_tvd",
+					     "dram_tve0", "dram_tve1",
+					     "dram_output",
+					     "dram_de_fe1", "dram_de_fe0",
+					     "dram_de_be0", "dram_de_be1",
+					     "dram_de_mp", "dram_ace";
+		};
+
 		codec_clk: clk@01c20140 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-codec-clk";
-- 
2.6.2
