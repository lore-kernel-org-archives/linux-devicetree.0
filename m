From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] ARM: dts: r8a7794: fix PWM clock parent
Date: Sun, 04 Sep 2016 22:55:37 +0300
Message-ID: <1994467.CVFvpbaMyF@wasted.cogentembedded.com>
References: <1618499.8bcj8adpVO@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1618499.8bcj8adpVO-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

When removing the non-existing thermal clock I forgot to remove its
parent from the node's "clocks" property  -- this led to a wrong PWM
clock's parent clock.

Fixes: 2a29f9d6fea8 ("ARM: dts: r8a7794: add MSTP5 clocks")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
The patch is against the 'renesas-devel-20160902-v4.8-rc4' branch of Simon
Horman's 'renesas.git' repo...

arch/arm/boot/dts/r8a7794.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: renesas/arch/arm/boot/dts/r8a7794.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7794.dtsi
+++ renesas/arch/arm/boot/dts/r8a7794.dtsi
@@ -1251,7 +1251,7 @@
 		mstp5_clks: mstp5_clks@e6150144 {
 			compatible = "renesas,r8a7794-mstp-clocks", "renesas,cpg-mstp-clocks";
 			reg = <0 0xe6150144 0 4>, <0 0xe615003c 0 4>;
-			clocks = <&hp_clk>, <&extal_clk>, <&p_clk>;
+			clocks = <&hp_clk>, <&p_clk>;
 			#clock-cells = <1>;
 			clock-indices = <R8A7794_CLK_AUDIO_DMAC0
 					 R8A7794_CLK_PWM>;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
