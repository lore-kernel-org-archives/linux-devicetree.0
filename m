From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 3/3] ARM: dts: sun8i: Add DMA controller node
Date: Sat, 13 Sep 2014 21:53:01 +0800
Message-ID: <1410616381-30226-4-git-send-email-wens@csie.org>
References: <1410616381-30226-1-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCMILY6JWQBBBT4Y2GQAKGQETN2LRLA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1410616381-30226-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add the DMA controller node and DMA bindings to the supported devices.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-a23.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a23.dtsi b/arch/arm/boot/dts/sun8i-a23.dtsi
index cc8c650..46a8cc9 100644
--- a/arch/arm/boot/dts/sun8i-a23.dtsi
+++ b/arch/arm/boot/dts/sun8i-a23.dtsi
@@ -203,6 +203,15 @@
 		#size-cells = <1>;
 		ranges;
 
+		dma: dma-controller@01c02000 {
+			compatible = "allwinner,sun8i-a23-dma";
+			reg = <0x01c02000 0x1000>;
+			interrupts = <0 50 4>;
+			clocks = <&ahb1_gates 6>;
+			resets = <&ahb1_rst 6>;
+			#dma-cells = <1>;
+		};
+
 		mmc0: mmc@01c0f000 {
 			compatible = "allwinner,sun5i-a13-mmc";
 			reg = <0x01c0f000 0x1000>;
@@ -332,6 +341,8 @@
 			reg-io-width = <4>;
 			clocks = <&apb2_gates 16>;
 			resets = <&apb2_rst 16>;
+			dmas = <&dma 6>, <&dma 6>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -343,6 +354,8 @@
 			reg-io-width = <4>;
 			clocks = <&apb2_gates 17>;
 			resets = <&apb2_rst 17>;
+			dmas = <&dma 7>, <&dma 7>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -354,6 +367,8 @@
 			reg-io-width = <4>;
 			clocks = <&apb2_gates 18>;
 			resets = <&apb2_rst 18>;
+			dmas = <&dma 8>, <&dma 8>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -365,6 +380,8 @@
 			reg-io-width = <4>;
 			clocks = <&apb2_gates 19>;
 			resets = <&apb2_rst 19>;
+			dmas = <&dma 9>, <&dma 9>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -376,6 +393,8 @@
 			reg-io-width = <4>;
 			clocks = <&apb2_gates 20>;
 			resets = <&apb2_rst 20>;
+			dmas = <&dma 10>, <&dma 10>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
-- 
2.1.0
