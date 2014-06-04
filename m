From: Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] powerpc/mpc85xx: fix fsl/p2041-post.dtsi clockgen mux2
Date: Wed,  4 Jun 2014 17:34:01 +0200
Message-ID: <1401896041-22734-1-git-send-email-valentin.longchamp@keymile.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linux PowerPC Kernel <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Linux device trees <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The mux2 node is missing the clock-output-names field that is required
by the clk-ppc-corenet driver.

Signed-off-by: Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
---

 arch/powerpc/boot/dts/fsl/p2041si-post.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi b/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi
index e2987a3..45ce43c 100644
--- a/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi
@@ -358,6 +358,7 @@
 			compatible = "fsl,qoriq-core-mux-1.0";
 			clocks = <&pll0 0>, <&pll0 1>, <&pll1 0>, <&pll1 1>;
 			clock-names = "pll0", "pll0-div2", "pll1", "pll1-div2";
+			clock-output-names = "cmux2";
 		};
 
 		mux3: mux3@60 {
-- 
1.8.0.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
