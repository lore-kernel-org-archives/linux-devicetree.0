From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 9/9] dt-bindings: msm/dsi: Add assigned clocks bindings
Date: Wed, 11 May 2016 09:08:44 -0500
Message-ID: <20160511140844.GA3064@rob-hp-laptop>
References: <1462273081-5814-1-git-send-email-architt@codeaurora.org>
 <1462273081-5814-10-git-send-email-architt@codeaurora.org>
 <20160504134416.GA1235@rob-hp-laptop>
 <572A39B7.5020008@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <572A39B7.5020008-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 04, 2016 at 11:34:39PM +0530, Archit Taneja wrote:
> 
> 
> On 5/4/2016 7:14 PM, Rob Herring wrote:
> >On Tue, May 03, 2016 at 04:28:01PM +0530, Archit Taneja wrote:
> >>The PLL in the DSI PHY block generates 2 clock outputs (Byte and Pixel
> >>clocks) that are fed into the Multimedia Clock Controller (MMCC). The MMCC
> >>uses these as source clocks for some of its RCGs to generate clocks that
> >>finally feed to the DSI host controller.
> >>
> >>Use the assigned clocks DT bindings to set up the MMCC RCGs that feed to
> >>the DSI host. Use the DSI PHY provided clocks to set up the parents
> >>of these assigned clocks.
> >>
> >>Signed-off-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> >>---
> >>  Documentation/devicetree/bindings/display/msm/dsi.txt | 15 +++++++++++++++
> >>  1 file changed, 15 insertions(+)
> >>
> >>diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
> >>index 0223f06..686f475 100644
> >>--- a/Documentation/devicetree/bindings/display/msm/dsi.txt
> >>+++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
> >>@@ -22,6 +22,10 @@ Required properties:
> >>    * "core_clk"
> >>    For DSIv2, we need an additional clock:
> >>     * "src_clk"
> >>+- assigned-clocks: Parents of "byte_clk" and "pixel_clk" for the given platform.
> >>+  See [1] for more details.
> >>+- assigned-clock-parents: The Byte clock and Pixel clock PLL outputs provided
> >>+  by a DSI PHY block.
> >>  - vdd-supply: phandle to vdd regulator device node
> >>  - vddio-supply: phandle to vdd-io regulator device node
> >>  - vdda-supply: phandle to vdda regulator device node
> >>@@ -90,6 +94,8 @@ Required properties:
> >>    * "dsi_pll"
> >>    * "dsi_phy"
> >>    * "dsi_phy_regulator"
> >>+- clock-cells: Must be 1. The DSI PHY block acts as a clock provider, creating
> >>+  2 clocks: A byte clock (index 0), and a pixel clock (index 1).
> >
> >You can't really add new required properties unless they are for a new
> >compatible string.
> 
> Does this hold even when currently there isn't any device tree file in
> the kernel that has this DT node in it?

Generally it should, but in this case that is fine.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> I was trying to get all the properties in place before posting out
> patches that actually add the nodes into the platform files. Currently,
> they exist only DT files in downstream kernels.

"If it is not upstream, it doesn't exist." :)

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
