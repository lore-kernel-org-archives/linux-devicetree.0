From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 2/3] ARM: shmobile: r8a7740 dtsi: Add Ethernet support
Date: Wed,  7 May 2014 22:32:29 +0200
Message-ID: <1399494750-31996-2-git-send-email-geert+renesas@glider.be>
References: <1399494750-31996-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399494750-31996-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Bastian Hecht <hechtb+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
The "clocks" entry should be uncommented after the conversion to CCF is
integrated.

 arch/arm/boot/dts/r8a7740.dtsi |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
index 3834b94dc02a..560d8d71cea4 100644
--- a/arch/arm/boot/dts/r8a7740.dtsi
+++ b/arch/arm/boot/dts/r8a7740.dtsi
@@ -122,6 +122,19 @@
 			      0 149 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	ether: ethernet@e9a00000 {
+		compatible = "renesas,gether-r8a7740";
+		reg = <0xe9a00000 0x800>,
+		      <0xe9a01800 0x800>;
+		interrupt-parent = <&gic>;
+		interrupts = <0 110 IRQ_TYPE_LEVEL_HIGH>;
+		/* clocks = <&mstp3_clks R8A7740_CLK_GETHER>; */
+		phy-mode = "mii";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
 	i2c0: i2c@fff20000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
