Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46ED9FA372C
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 14:10:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1631A21848
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 14:10:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NnyYnVFU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbfKHOKw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 09:10:52 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:48874 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728015AbfKHOKw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 8 Nov 2019 09:10:52 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3A302D1;
        Fri,  8 Nov 2019 15:10:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1573222250;
        bh=8lTDSUB2DSlrbMRDs9BBXnrQfxkHlqbbpfyXiYfB/aI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NnyYnVFUNqUEYzUUswjOJ7qpN8F9tZXibz6aUork6k4y2H4FHhKrZrMrbtH8g2BcY
         WmN8i2Gf118XxFrlj4pzv7GcuMCihIwCZeoIYEt37U7syjPisfrREJtWU8YGtAIhzD
         Rm8ZFiwZmF9/GamxRuySwdEQV1eeuKNOr2duqVGA=
Date:   Fri, 8 Nov 2019 16:10:40 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Satish Kumar Nagireddy <SATISHNA@xilinx.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v9 1/4] dt-bindings: display: xlnx: Add ZynqMP DP
 subsystem bindings
Message-ID: <20191108141040.GK4866@pendragon.ideasonboard.com>
References: <20190925235544.11524-1-laurent.pinchart@ideasonboard.com>
 <20190925235544.11524-2-laurent.pinchart@ideasonboard.com>
 <CAL_JsqL7-33B4CaEX0r5V7PhX9EnghxNfcbZNLT4yo+FLeCOCA@mail.gmail.com>
 <20190926142318.GB16469@pendragon.ideasonboard.com>
 <CAL_JsqJTPzXkoyhTwWtc_Rsb5tkY-kggXhJj67EfcYgEk5tq=A@mail.gmail.com>
 <20191108140733.GJ4866@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191108140733.GJ4866@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob,

On Fri, Nov 08, 2019 at 04:07:33PM +0200, Laurent Pinchart wrote:
> On Thu, Sep 26, 2019 at 09:57:29AM -0500, Rob Herring wrote:
> > On Thu, Sep 26, 2019 at 9:23 AM Laurent Pinchart wrote:
> >> On Thu, Sep 26, 2019 at 09:15:01AM -0500, Rob Herring wrote:
> >>> On Wed, Sep 25, 2019 at 6:56 PM Laurent Pinchart wrote:
> >>>>
> >>>> From: Hyun Kwon <hyun.kwon@xilinx.com>
> >>>>
> >>>> The bindings describe the ZynqMP DP subsystem. They don't support the
> >>>> interface with the programmable logic (FPGA) or audio yet.
> >>>>
> >>>> Signed-off-by: Hyun Kwon <hyun.kwon@xilinx.com>
> >>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>> ---
> >>>> Changes since v8:
> >>>>
> >>>> - Convert to yaml
> >>>> - Rename aclk to dp_apb_clk
> >>>
> >>> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.example.dt.yaml:
> >>> display@fd4a0000: clock-names:2: 'dp_vtc_pixel_clk_in' was expected
> >>
> >> If you allow me to steal a bit of your brain time, could you help me
> >> expressing the clocks constraint ?
> >>
> >>   clocks:
> >>     description:
> >>       The AXI clock and at least one video clock are mandatory, the audio clock
> >>       optional.
> >>     minItems: 2
> >>     maxItems: 4
> >>     items:
> >>       - description: AXI clock
> >>       - description: Audio clock
> >>       - description: Non-live video clock (from Processing System)
> >>       - description: Live video clock (from Programmable Logic)
> >>   clock-names:
> >>     minItems: 2
> >>     maxItems: 4
> >>     items:
> >>       - const: dp_apb_clk
> >>       - const: dp_aud_clk
> >>       - const: dp_vtc_pixel_clk_in
> >>       - const: dp_live_video_in_clk
> >>
> >> dp_apb_clk is required, dp_aud_clk is optional, and at least one of
> >> dp_vtc_pixel_clk_in and dp_live_video_in_clk is required.
> > 
> > I'm hoping people's inability to express the schema will prevent
> > complicated ones like this in the first place...
> > 
> > clock-names:
> >   oneOf:
> >     - minItems: 3
> >       maxItems: 4
> >       items:
> >         - const: dp_apb_clk
> >         - const: dp_aud_clk
> >         - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
> >         - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
> >     - minItems: 2
> >       maxItems: 3
> >       items:
> >         - const: dp_apb_clk
> >         - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
> >         - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
> 
> The above would make
> 
> 	clock-names = "dp_apb_clk", "dp_vtc_pixel_clk_in", "dp_vtc_pixel_clk_in";
> 
> valid. I've investigated a little bit and found uniqueItems which solves
> my issue.
> 
> Would the following simpler solution be acceptable ?
> 
> clock-names:
>     minItems: 2
>     maxItems: 4
>     items:
>       - const: dp_apb_clk
>       - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
>       - const: dp_aud_clk
>       - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
>     uniqueItems: true

To give more context,

  clocks:
    description:
      The AXI clock and at least one video clock are mandatory, the audio clock
      is optional.
    minItems: 2
    maxItems: 4
    items:
      - description: dp_apb_clk is the AXI clock
      - description: dp_aud_clk is the Audio clock
      - description:
          dp_vtc_pixel_clk_in is the non-live video clock (from Processing
          System)
      - description:
          dp_live_video_in_clk is the live video clock (from Programmable
          Logic)
  clock-names:
      minItems: 2
      maxItems: 4
      items:
        - const: dp_apb_clk
        - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
        - const: dp_aud_clk
        - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
      uniqueItems: true

> > Strictly speaking, that leaves items clocks wrong, but 'description'
> > doesn't do anything. So I'd just leave it as is.
> 
> Speaking of which, there doesn't seem to be anything that validates the
> size of clocks and clock-names being identical. Is that a known issue ?

-- 
Regards,

Laurent Pinchart
