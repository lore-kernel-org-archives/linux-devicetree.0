From: <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH 1/3] ARM: socfpga: dts: Correct the parent clock for l3_sp_clk and dbg_clk
Date: Wed, 22 Jul 2015 22:30:05 -0500
Message-ID: <1437622207-1760-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org
Cc: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

The l3_sp_clk's parent should be the l3_mp_clk. This will account for
the extra divider that is present for the l3_mp_clk.

The dbg_clk's parent should be the dbg_at_clk. This will account for
the extra divider that is present for the dbg_at_clk.

Signed-off-by: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
---
 arch/arm/boot/dts/socfpga.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 1e3c833..7860935 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -318,7 +318,7 @@
 					l3_sp_clk: l3_sp_clk {
 						#clock-cells = <0>;
 						compatible = "altr,socfpga-gate-clk";
-						clocks = <&mainclk>;
+						clocks = <&l3_mp_clk>;
 						div-reg = <0x64 2 2>;
 					};
 
@@ -349,7 +349,7 @@
 					dbg_clk: dbg_clk {
 						#clock-cells = <0>;
 						compatible = "altr,socfpga-gate-clk";
-						clocks = <&dbg_base_clk>;
+						clocks = <&dbg_at_clk>;
 						div-reg = <0x68 2 2>;
 						clk-gate = <0x60 5>;
 					};
-- 
2.4.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
