From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 2/9] ARM: dts: sun9i: Add usb clock nodes to
 a80 dtsi
Date: Sun, 25 Jan 2015 20:22:03 +0800
Message-ID: <1422188530-1794-3-git-send-email-wens@csie.org>
References: <1422188530-1794-1-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB7F7SOTAKGQENA6E4OY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1422188530-1794-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The USB controller and phy clocks and resets have a separate address
block and driver. Add the nodes to represent them.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun9i-a80.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/sun9i-a80.dtsi b/arch/arm/boot/dts/sun9i-a80.dtsi
index 9e28ffc6dd90..679cf2878800 100644
--- a/arch/arm/boot/dts/sun9i-a80.dtsi
+++ b/arch/arm/boot/dts/sun9i-a80.dtsi
@@ -147,6 +147,28 @@
 			clock-output-names = "osc32k";
 		};
 
+		usb_mod_clk: clk@00a08000 {
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			compatible = "allwinner,sun9i-a80-usb-mod-clk";
+			reg = <0x00a08000 0x4>;
+			clocks = <&ahb1_gates 1>;
+			clock-output-names = "usb0_ahb", "usb_ohci0",
+					     "usb1_ahb", "usb_ohci1",
+					     "usb2_ahb", "usb_ohci2";
+		};
+
+		usb_phy_clk: clk@00a08004 {
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			compatible = "allwinner,sun9i-a80-usb-phy-clk";
+			reg = <0x00a08004 0x4>;
+			clocks = <&ahb1_gates 1>;
+			clock-output-names = "usb_phy0", "usb_hsic1_480M",
+					     "usb_phy1", "usb_hsic2_480M",
+					     "usb_phy2", "usb_hsic_12M";
+		};
+
 		pll4: clk@0600000c {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun9i-a80-pll4-clk";
-- 
2.1.4
