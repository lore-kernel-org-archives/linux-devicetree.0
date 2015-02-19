From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH/RFC] ARM: shmobile: r8a7791: Fix IPMMU-GP clock to device tree
Date: Thu, 19 Feb 2015 22:29:06 +0900
Message-ID: <1424352546-27313-1-git-send-email-ykaneko0929@gmail.com>
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: linux-sh@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Ryo Kataoka <ryo.kataoka.wt@renesas.com>

Signed-off-by: Ryo Kataoka <ryo.kataoka.wt@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on devel branch of Simon Horman's renesas tree.

 arch/arm/boot/dts/r8a7791.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index afba8af..1e75a5f 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -1154,7 +1154,7 @@
 		mstp8_clks: mstp8_clks@e6150990 {
 			compatible = "renesas,r8a7791-mstp-clocks", "renesas,cpg-mstp-clocks";
 			reg = <0 0xe6150990 0 4>, <0 0xe61509a0 0 4>;
-			clocks = <&zg_clk>, <&hp_clk>, <&zg_clk>, <&zg_clk>,
+			clocks = <&zx_clk>, <&hp_clk>, <&zg_clk>, <&zg_clk>,
 			         <&zg_clk>, <&p_clk>, <&zs_clk>, <&zs_clk>;
 			#clock-cells = <1>;
 			clock-indices = <
-- 
1.9.1

