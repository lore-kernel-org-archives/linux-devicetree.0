From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v4 7/7] ARM: sun6i: dt: Add A31 DMA controller
 to DTSI
Date: Mon, 10 Mar 2014 15:41:52 +0100
Message-ID: <1394462512-11620-8-git-send-email-maxime.ripard@free-electrons.com>
References: <1394462512-11620-1-git-send-email-maxime.ripard@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB6E766MAKGQEMSWQG3Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1394462512-11620-1-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sunny-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, zhuzhenhua-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Now that we have a DMA driver, we can add the DMA bindings in the DTSI for the
controller and the devices supported that can use DMA.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/sun6i-a31.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
index 7fff9a20f079..e687b0d1e838 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -237,6 +237,15 @@
 		#size-cells = <1>;
 		ranges;
 
+		dma: dma-controller@01c02000 {
+			compatible = "allwinner,sun6i-a31-dma";
+			reg = <0x01c02000 0x1000>;
+			interrupts = <0 50 4>;
+			clocks = <&ahb1_gates 6>;
+			resets = <&ahb1_rst 6>;
+			#dma-cells = <1>;
+		};
+
 		pio: pinctrl@01c20800 {
 			compatible = "allwinner,sun6i-a31-pinctrl";
 			reg = <0x01c20800 0x400>;
@@ -322,6 +331,8 @@
 			reg-io-width = <4>;
 			clocks = <&apb2_gates 16>;
 			resets = <&apb2_rst 16>;
+			dmas = <&dma 6>, <&dma 6>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -333,6 +344,8 @@
 			reg-io-width = <4>;
 			clocks = <&apb2_gates 17>;
 			resets = <&apb2_rst 17>;
+			dmas = <&dma 7>, <&dma 7>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -344,6 +357,8 @@
 			reg-io-width = <4>;
 			clocks = <&apb2_gates 18>;
 			resets = <&apb2_rst 18>;
+			dmas = <&dma 8>, <&dma 8>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -355,6 +370,8 @@
 			reg-io-width = <4>;
 			clocks = <&apb2_gates 19>;
 			resets = <&apb2_rst 19>;
+			dmas = <&dma 9>, <&dma 9>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -366,6 +383,8 @@
 			reg-io-width = <4>;
 			clocks = <&apb2_gates 20>;
 			resets = <&apb2_rst 20>;
+			dmas = <&dma 10>, <&dma 10>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -377,6 +396,8 @@
 			reg-io-width = <4>;
 			clocks = <&apb2_gates 21>;
 			resets = <&apb2_rst 21>;
+			dmas = <&dma 22>, <&dma 22>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -426,6 +447,8 @@
 			interrupts = <0 65 4>;
 			clocks = <&ahb1_gates 20>, <&spi0_clk>;
 			clock-names = "ahb", "mod";
+			dmas = <&dma 23>, <&dma 23>;
+			dma-names = "rx", "tx";
 			resets = <&ahb1_rst 20>;
 			status = "disabled";
 		};
@@ -436,6 +459,8 @@
 			interrupts = <0 66 4>;
 			clocks = <&ahb1_gates 21>, <&spi1_clk>;
 			clock-names = "ahb", "mod";
+			dmas = <&dma 24>, <&dma 24>;
+			dma-names = "rx", "tx";
 			resets = <&ahb1_rst 21>;
 			status = "disabled";
 		};
@@ -446,6 +471,8 @@
 			interrupts = <0 67 4>;
 			clocks = <&ahb1_gates 22>, <&spi2_clk>;
 			clock-names = "ahb", "mod";
+			dmas = <&dma 25>, <&dma 25>;
+			dma-names = "rx", "tx";
 			resets = <&ahb1_rst 22>;
 			status = "disabled";
 		};
@@ -456,6 +483,8 @@
 			interrupts = <0 68 4>;
 			clocks = <&ahb1_gates 23>, <&spi3_clk>;
 			clock-names = "ahb", "mod";
+			dmas = <&dma 26>, <&dma 26>;
+			dma-names = "rx", "tx";
 			resets = <&ahb1_rst 23>;
 			status = "disabled";
 		};
-- 
1.9.0
