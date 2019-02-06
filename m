From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 5/9] ARM: dts: sun9i: Add GMAC clock node
Date: Wed,  6 Feb 2019 11:32:35 +0800
Message-ID: <20190206033239.3619-6-wens@csie.org>
References: <20190206033239.3619-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBZNK5HRAKGQETJXBYNA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190206033239.3619-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The A80 has the same DWMAC hardware as on earlier Allwinner SoCs. The
accompanying GMAC clock register has been moved into the "System
Control" area.

Add a clock node for it.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun9i-a80.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/sun9i-a80.dtsi b/arch/arm/boot/dts/sun9i-a80.dtsi
index d9532fb1ef65..724ca3b850c8 100644
--- a/arch/arm/boot/dts/sun9i-a80.dtsi
+++ b/arch/arm/boot/dts/sun9i-a80.dtsi
@@ -183,6 +183,37 @@
 			clock-output-names = "osc32k";
 		};
 
+		/*
+		 * The following two are dummy clocks, placeholders
+		 * used in the gmac_tx clock. The gmac driver will
+		 * choose one parent depending on the PHY interface
+		 * mode, using clk_set_rate auto-reparenting.
+		 *
+		 * The actual TX clock rate is not controlled by the
+		 * gmac_tx clock.
+		 */
+		mii_phy_tx_clk: mii_phy_tx_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <25000000>;
+			clock-output-names = "mii_phy_tx";
+		};
+
+		gmac_int_tx_clk: gmac_int_tx_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <125000000>;
+			clock-output-names = "gmac_int_tx";
+		};
+
+		gmac_tx_clk: clk@800030 {
+			#clock-cells = <0>;
+			compatible = "allwinner,sun7i-a20-gmac-clk";
+			reg = <0x00800030 0x4>;
+			clocks = <&mii_phy_tx_clk>, <&gmac_int_tx_clk>;
+			clock-output-names = "gmac_tx";
+		};
+
 		cpus_clk: clk@8001410 {
 			compatible = "allwinner,sun9i-a80-cpus-clk";
 			reg = <0x08001410 0x4>;
-- 
2.20.1
