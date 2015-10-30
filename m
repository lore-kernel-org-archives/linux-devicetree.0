From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 16/19] ARM: sun5i: dt: Add DRAM gates
Date: Fri, 30 Oct 2015 15:21:02 +0100
Message-ID: <1446214865-3972-17-git-send-email-maxime.ripard@free-electrons.com>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBFX2ZWYQKGQE5DTPKHA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1446214865-3972-1-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Wynter Woods <wynter-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The DRAM gates control whether the image / display devices on the SoC have
access to the DRAM clock or not.

Enable it.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/sun5i-a10s.dtsi |  5 +++--
 arch/arm/boot/dts/sun5i-a13.dtsi  |  2 +-
 arch/arm/boot/dts/sun5i-r8.dtsi   |  2 +-
 arch/arm/boot/dts/sun5i.dtsi      | 19 +++++++++++++++++++
 4 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/sun5i-a10s.dtsi b/arch/arm/boot/dts/sun5i-a10s.dtsi
index 0981a9e2db3b..c996b5d1851a 100644
--- a/arch/arm/boot/dts/sun5i-a10s.dtsi
+++ b/arch/arm/boot/dts/sun5i-a10s.dtsi
@@ -67,7 +67,7 @@
 			allwinner,pipeline = "de_be0-lcd0-hdmi";
 			clocks = <&ahb_gates 36>, <&ahb_gates 43>,
 				 <&ahb_gates 44>, <&de_be_clk>,
-				 <&tcon_ch1_clk>;
+				 <&tcon_ch1_clk>, <&dram_gates 26>;
 			status = "disabled";
 		};
 
@@ -76,7 +76,8 @@
 				     "simple-framebuffer";
 			allwinner,pipeline = "de_be0-lcd0";
 			clocks = <&ahb_gates 36>, <&ahb_gates 44>,
-				 <&de_be_clk>, <&tcon_ch0_clk>;
+				 <&de_be_clk>, <&tcon_ch0_clk>,
+				 <&dram_gates 26>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm/boot/dts/sun5i-a13.dtsi b/arch/arm/boot/dts/sun5i-a13.dtsi
index 130644d7e054..17b36b942d38 100644
--- a/arch/arm/boot/dts/sun5i-a13.dtsi
+++ b/arch/arm/boot/dts/sun5i-a13.dtsi
@@ -62,7 +62,7 @@
 				     "simple-framebuffer";
 			allwinner,pipeline = "de_be0-lcd0";
 			clocks = <&ahb_gates 36>, <&ahb_gates 44>, <&de_be_clk>,
-				 <&tcon_ch0_clk>;
+				 <&tcon_ch0_clk>, <&dram_gates 26>;
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm/boot/dts/sun5i-r8.dtsi b/arch/arm/boot/dts/sun5i-r8.dtsi
index b1e4e0170d51..691d3de75b35 100644
--- a/arch/arm/boot/dts/sun5i-r8.dtsi
+++ b/arch/arm/boot/dts/sun5i-r8.dtsi
@@ -53,7 +53,7 @@
 			allwinner,pipeline = "de_be0-lcd0-tve0";
 			clocks = <&ahb_gates 34>, <&ahb_gates 36>,
 				 <&ahb_gates 44>, <&de_be_clk>,
-				 <&tcon_ch1_clk>;
+				 <&tcon_ch1_clk>, <&dram_gates 26>;
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
index 861c5a621e70..426db76c0fe6 100644
--- a/arch/arm/boot/dts/sun5i.dtsi
+++ b/arch/arm/boot/dts/sun5i.dtsi
@@ -338,6 +338,25 @@
 			clock-output-names = "usb_ohci0", "usb_phy";
 		};
 
+		dram_gates: clk@01c20100 {
+			#clock-cells = <1>;
+			compatible = "allwinner,sun5i-a13-dram-gates-clk";
+			reg = <0x01c20100 0x4>;
+			clocks = <&pll5 0>;
+			clock-indices = <0>,
+					<1>,
+					<25>,
+					<26>,
+					<29>,
+					<31>;
+			clock-output-names = "dram_ve",
+					     "dram_csi",
+					     "dram_de_fe",
+					     "dram_de_be",
+					     "dram_ace",
+					     "dram_iep";
+		};
+
 		de_be_clk: clk@01c20104 {
 			#clock-cells = <0>;
 			#reset-cells = <0>;
-- 
2.6.2
