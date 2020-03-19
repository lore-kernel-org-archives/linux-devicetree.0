Return-Path: <SRS0=Rh3i=5E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC25C4332B
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 01:51:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B84E720768
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 01:51:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I07pFiNT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgCSBvA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Mar 2020 21:51:00 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53930 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726777AbgCSBvA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Mar 2020 21:51:00 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 40F385F;
        Thu, 19 Mar 2020 02:50:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584582656;
        bh=7LwQ4y5A+3KYVuu0zNzQcfygRe52CTl9JfmvYQqoWdA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I07pFiNT4+cIef7BfaJ/nhZZ4YKNyIS/rypqoo5QUPR15XT7ZQsvNSD+MHry90yL7
         haDSFLU2A6erUtnAW8ZApipHsxf52KeApcpUnVZU72WrDdgQYv2mGNznkZ/8Mznr7m
         G7fPcI07HBFOIQi487COvXj3Zd3j/g+E4WBUNwg0=
Date:   Thu, 19 Mar 2020 03:50:50 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Michal Simek <michal.simek@xilinx.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Satish Kumar Nagireddy <SATISHNA@xilinx.com>
Subject: Re: [PATCH v11 1/5] dt-bindings: display: xlnx: Add ZynqMP DP
 subsystem bindings
Message-ID: <20200319015050.GA27375@pendragon.ideasonboard.com>
References: <20200318153728.25843-1-laurent.pinchart@ideasonboard.com>
 <20200318153728.25843-2-laurent.pinchart@ideasonboard.com>
 <20200318192651.GA28612@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200318192651.GA28612@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Sam,

On Wed, Mar 18, 2020 at 08:26:51PM +0100, Sam Ravnborg wrote:
> On Wed, Mar 18, 2020 at 05:37:24PM +0200, Laurent Pinchart wrote:
> > From: Hyun Kwon <hyun.kwon@xilinx.com>
> > 
> > The bindings describe the ZynqMP DP subsystem. They don't support the
> > interface with the programmable logic (FPGA) or audio yet.
> > 
> > Signed-off-by: Hyun Kwon <hyun.kwon@xilinx.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Bikeshedding - examples with indent on 4 spaces to make them easier to
> read.

I'll fix that.

> Would it be possible to make this binding: (GPL-2.0-only OR BSD-2-Clause)
> This is preferred for new bindings.
> In this case asking Hyun Kwon should be enough?

I'll defer this to Hyun, and will change the license if I get his ack.

> With or without the suggestions above:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> > ---
> > Changes since v10:
> > 
> > - Update example to new PHY DT bindings without subnodes
> > - Add resets property
> > 
> > Changes since v9:
> > 
> > - Fix constraints on clock-names
> > - Document dp_apb_clk as the APB clock, not the AXI clock
> > 
> > Changes since v8:
> > 
> > - Convert to yaml
> > - Rename aclk to dp_apb_clk
> > ---
> >  .../display/xlnx/xlnx,zynqmp-dpsub.yaml       | 174 ++++++++++++++++++
> >  1 file changed, 174 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
> > new file mode 100644
> > index 000000000000..05e6a14de75c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
> > @@ -0,0 +1,174 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Xilinx ZynqMP DisplayPort Subsystem
> > +
> > +description: |
> > +  The DisplayPort subsystem of Xilinx ZynqMP (Zynq UltraScale+ MPSoC)
> > +  implements the display and audio pipelines based on the DisplayPort v1.2
> > +  standard. The subsystem includes multiple functional blocks as below:
> > +
> > +               +------------------------------------------------------------+
> > +  +--------+   | +----------------+     +-----------+                       |
> > +  | DPDMA  | --->|                | --> |   Video   | Video +-------------+ |
> > +  | 4x vid |   | |                |     | Rendering | -+--> |             | |   +------+
> > +  | 2x aud |   | |  Audio/Video   | --> | Pipeline  |  |    | DisplayPort |---> | PHY0 |
> > +  +--------+   | | Buffer Manager |     +-----------+  |    |   Source    | |   +------+
> > +               | |    and STC     |     +-----------+  |    | Controller  | |   +------+
> > +  Live Video --->|                | --> |   Audio   | Audio |             |---> | PHY1 |
> > +               | |                |     |   Mixer   | --+-> |             | |   +------+
> > +  Live Audio --->|                | --> |           |  ||   +-------------+ |
> > +               | +----------------+     +-----------+  ||                   |
> > +               +---------------------------------------||-------------------+
> > +                                                       vv
> > +                                                 Blended Video and
> > +                                                 Mixed Audio to PL
> > +
> > +  The Buffer Manager interacts with external interface such as DMA engines or
> > +  live audio/video streams from the programmable logic. The Video Rendering
> > +  Pipeline blends the video and graphics layers and performs colorspace
> > +  conversion. The Audio Mixer mixes the incoming audio streams. The DisplayPort
> > +  Source Controller handles the DisplayPort protocol and connects to external
> > +  PHYs.
> > +
> > +  The subsystem supports 2 video and 2 audio streams, and various pixel formats
> > +  and depths up to 4K@30 resolution.
> > +
> > +  Please refer to "Zynq UltraScale+ Device Technical Reference Manual"
> > +  (https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf)
> > +  for more details.
> > +
> > +maintainers:
> > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: xlnx,zynqmp-dpsub-1.7
> > +
> > +  reg:
> > +    maxItems: 4
> > +  reg-names:
> > +    items:
> > +      - const: dp
> > +      - const: blend
> > +      - const: av_buf
> > +      - const: aud
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description:
> > +      The APB clock and at least one video clock are mandatory, the audio clock
> > +      is optional.
> > +    minItems: 2
> > +    maxItems: 4
> > +    items:
> > +      - description: dp_apb_clk is the APB clock
> > +      - description: dp_aud_clk is the Audio clock
> > +      - description:
> > +          dp_vtc_pixel_clk_in is the non-live video clock (from Processing
> > +          System)
> > +      - description:
> > +          dp_live_video_in_clk is the live video clock (from Programmable
> > +          Logic)
> > +  clock-names:
> > +    oneOf:
> > +      - minItems: 2
> > +        maxItems: 3
> > +        items:
> > +          - const: dp_apb_clk
> > +          - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
> > +          - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
> > +      - minItems: 3
> > +        maxItems: 4
> > +        items:
> > +          - const: dp_apb_clk
> > +          - const: dp_aud_clk
> > +          - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
> > +          - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  dmas:
> > +    maxItems: 4
> > +    items:
> > +      - description: Video layer, plane 0 (RGB or luma)
> > +      - description: Video layer, plane 1 (U/V or U)
> > +      - description: Video layer, plane 2 (V)
> > +      - description: Graphics layer
> > +  dma-names:
> > +    items:
> > +      - const: vid0
> > +      - const: vid1
> > +      - const: vid2
> > +      - const: gfx0
> > +
> > +  phys:
> > +    description: PHYs for the DP data lanes
> > +    minItems: 1
> > +    maxItems: 2
> > +  phy-names:
> > +    minItems: 1
> > +    maxItems: 2
> > +    items:
> > +      - const: dp-phy0
> > +      - const: dp-phy1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - resets
> > +  - dmas
> > +  - dma-names
> > +  - phys
> > +  - phy-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/phy/phy.h>
> > +    #include <dt-bindings/reset/xlnx-zynqmp-resets.h>
> > +
> > +    display@fd4a0000 {
> > +      compatible = "xlnx,zynqmp-dpsub-1.7";
> > +      reg = <0x0 0xfd4a0000 0x0 0x1000>,
> > +            <0x0 0xfd4aa000 0x0 0x1000>,
> > +            <0x0 0xfd4ab000 0x0 0x1000>,
> > +            <0x0 0xfd4ac000 0x0 0x1000>;
> > +      reg-names = "dp", "blend", "av_buf", "aud";
> > +      interrupts = <0 119 4>;
> > +      interrupt-parent = <&gic>;
> > +
> > +      clock-names = "dp_apb_clk", "dp_aud_clk", "dp_live_video_in_clk";
> > +      clocks = <&dp_aclk>, <&clkc 17>, <&si570_1>;
> > +
> > +      power-domains = <&pd_dp>;
> > +      resets = <&reset ZYNQMP_RESET_DP>;
> > +
> > +      dma-names = "vid0", "vid1", "vid2", "gfx0";
> > +      dmas = <&xlnx_dpdma 0>,
> > +             <&xlnx_dpdma 1>,
> > +             <&xlnx_dpdma 2>,
> > +             <&xlnx_dpdma 3>;
> > +
> > +      phys = <&psgtr 1 PHY_TYPE_DP 0 3 27000000>,
> > +             <&psgtr 0 PHY_TYPE_DP 1 3 27000000>;
> > +
> > +      phy-names = "dp-phy0", "dp-phy1";
> > +    };
> > +
> > +...

-- 
Regards,

Laurent Pinchart
