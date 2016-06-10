From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 03/10] dt-bindings: msm/mdp: Fix up clock related bindings
Date: Fri, 10 Jun 2016 16:16:33 +0530
Message-ID: <1465555600-25742-4-git-send-email-architt@codeaurora.org>
References: <1462273081-5814-1-git-send-email-architt@codeaurora.org>
 <1465555600-25742-1-git-send-email-architt@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465555600-25742-1-git-send-email-architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

MDP5:
- Don't ask for source clock

MDP4:
- Give a better name for MDP_TV_CLK
- Remove TV_SRC
- Add MDP_AXI_CLK

Signed-off-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 Documentation/devicetree/bindings/display/msm/mdp.txt | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdp.txt b/Documentation/devicetree/bindings/display/msm/mdp.txt
index a214f6c..1d3d79d 100644
--- a/Documentation/devicetree/bindings/display/msm/mdp.txt
+++ b/Documentation/devicetree/bindings/display/msm/mdp.txt
@@ -13,14 +13,13 @@ Required properties:
   For MDP4:
    * "core_clk"
    * "iface_clk"
+   * "bus_clk"
    * "lut_clk"
-   * "src_clk"
    * "hdmi_clk"
-   * "mdp_clk"
+   * "tv_clk"
   For MDP5:
    * "bus_clk"
    * "iface_clk"
-   * "core_clk_src"
    * "core_clk"
    * "lut_clk" (some MDP5 versions may not need this)
    * "vsync_clk"
@@ -45,14 +44,13 @@ Example:
 		    "core_clk",
 		    "iface_clk",
 		    "lut_clk",
-		    "src_clk",
 		    "hdmi_clk",
 		    "mdp_clk";
 		clocks =
-		    <&mmcc MDP_SRC>,
+		    <&mmcc MDP_CLK>,
 		    <&mmcc MDP_AHB_CLK>,
+		    <&mmcc MDP_AXI_CLK>,
 		    <&mmcc MDP_LUT_CLK>,
-		    <&mmcc TV_SRC>,
 		    <&mmcc HDMI_TV_CLK>,
 		    <&mmcc MDP_TV_CLK>;
 	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
