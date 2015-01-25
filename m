From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 4/9] ARM: dts: sun9i: Add usb phy nodes to
 a80 dtsi
Date: Sun, 25 Jan 2015 20:22:05 +0800
Message-ID: <1422188530-1794-5-git-send-email-wens@csie.org>
References: <1422188530-1794-1-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB657SOTAKGQEF2WUDEY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

On sun9i, there are 3 independent usb phys for EHCI/OHCI.
Add device nodes for them.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun9i-a80.dtsi | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/sun9i-a80.dtsi b/arch/arm/boot/dts/sun9i-a80.dtsi
index 679cf2878800..d7ebd9390b01 100644
--- a/arch/arm/boot/dts/sun9i-a80.dtsi
+++ b/arch/arm/boot/dts/sun9i-a80.dtsi
@@ -355,6 +355,43 @@
 		 */
 		ranges = <0 0 0 0x20000000>;
 
+		usbphy1: phy@00a00800 {
+			compatible = "allwinner,sun9i-a80-usb-phy";
+			reg = <0x00a00800 0x4>;
+			clocks = <&usb_phy_clk 1>;
+			clock-names = "phy";
+			resets = <&usb_phy_clk 17>;
+			reset-names = "phy";
+			status = "disabled";
+			#phy-cells = <0>;
+		};
+
+		usbphy2: phy@00a01800 {
+			compatible = "allwinner,sun9i-a80-usb-phy";
+			reg = <0x00a01800 0x4>;
+			clocks = <&usb_phy_clk 2>, <&usb_phy_clk 10>,
+				 <&usb_phy_clk 3>;
+			clock-names = "hsic_480M", "hsic_12M", "phy";
+			resets = <&usb_phy_clk 18>, <&usb_phy_clk 19>;
+			reset-names = "hsic", "phy";
+			status = "disabled";
+			#phy-cells = <0>;
+			/* usb1 is always used with HSIC */
+			phy_type = "hsic";
+		};
+
+		usbphy3: phy@00a02800 {
+			compatible = "allwinner,sun9i-a80-usb-phy";
+			reg = <0x00a02800 0x4>;
+			clocks = <&usb_phy_clk 4>, <&usb_phy_clk 10>,
+				 <&usb_phy_clk 5>;
+			clock-names = "hsic_480M", "hsic_12M", "phy";
+			resets = <&usb_phy_clk 20>, <&usb_phy_clk 21>;
+			reset-names = "hsic", "phy";
+			status = "disabled";
+			#phy-cells = <0>;
+		};
+
 		mmc0: mmc@01c0f000 {
 			compatible = "allwinner,sun5i-a13-mmc";
 			reg = <0x01c0f000 0x1000>;
-- 
2.1.4
