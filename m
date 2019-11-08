Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8312FC6195
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 15:58:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B5982215EA
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 15:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573228692;
	bh=+5K+H3sTrvz6XU56aEXwcNUFhJVkwly6UERcNc0ONFQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=gixMypVBcncRwQ6FaTruS5ctHLLExi9yZLk0ulB8QFOPsjZUZyn9YgNnnS7KG03Z7
	 7+S0DRH4X87Gvj5AAucZYDFqvVzqKJjHSxLL5rdtvGK1ZQFsyljH8pfdvK3T88CUUZ
	 33bzYL9hH3+JF/Nn3wrs9GVhEZ0GOqJgxUV7wbDo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbfKHP6M (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 10:58:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:50478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726049AbfKHP6M (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 8 Nov 2019 10:58:12 -0500
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B180B21D7F
        for <devicetree@vger.kernel.org>; Fri,  8 Nov 2019 15:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573228690;
        bh=+5K+H3sTrvz6XU56aEXwcNUFhJVkwly6UERcNc0ONFQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Xf2LNDoqLvddSNQv2d48gs+z3o8q/1gGeFsSkcTbf6TxAK239L8kpICXPMa/3Jzha
         ZA+G5pN1M8NIx0P4JIBefSc74cuBw6nRE/pkpUToH5rx8VKYoAYT6EaG5VmJfg17i3
         QGlW9Pip4w03GNas27yr6kois7Eu20fTvXk/O1W8=
Received: by mail-qk1-f177.google.com with SMTP id 71so5723796qkl.0
        for <devicetree@vger.kernel.org>; Fri, 08 Nov 2019 07:58:10 -0800 (PST)
X-Gm-Message-State: APjAAAWXJ0lrfnQ/OL1xlSBpWmoImX+rPR5YkltbxWTPEnnln8DGpelw
        0+1l0NUCqYEdNLC65+BqYIsohge8PIRFHi0/rQ==
X-Google-Smtp-Source: APXvYqy7ftwTyC8xUdWt2QDu6GNaFo9wGwiI520LvixXEu8R1q30OQ5CmvqDj7ZJs8DRymTNAD51gFlW9oxK0I3gSSY=
X-Received: by 2002:a37:9847:: with SMTP id a68mr9926725qke.223.1573228689711;
 Fri, 08 Nov 2019 07:58:09 -0800 (PST)
MIME-Version: 1.0
References: <20190925235544.11524-1-laurent.pinchart@ideasonboard.com>
 <20190925235544.11524-2-laurent.pinchart@ideasonboard.com>
 <CAL_JsqL7-33B4CaEX0r5V7PhX9EnghxNfcbZNLT4yo+FLeCOCA@mail.gmail.com>
 <20190926142318.GB16469@pendragon.ideasonboard.com> <CAL_JsqJTPzXkoyhTwWtc_Rsb5tkY-kggXhJj67EfcYgEk5tq=A@mail.gmail.com>
 <20191108140733.GJ4866@pendragon.ideasonboard.com> <20191108141040.GK4866@pendragon.ideasonboard.com>
 <20191108143155.GA15731@pendragon.ideasonboard.com>
In-Reply-To: <20191108143155.GA15731@pendragon.ideasonboard.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 8 Nov 2019 09:57:55 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+jXCaEUGO8+zjZmPxF0UT8YpDf44YMPygbwwZBE1vy5w@mail.gmail.com>
Message-ID: <CAL_Jsq+jXCaEUGO8+zjZmPxF0UT8YpDf44YMPygbwwZBE1vy5w@mail.gmail.com>
Subject: Re: [PATCH v9 1/4] dt-bindings: display: xlnx: Add ZynqMP DP
 subsystem bindings
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Satish Kumar Nagireddy <SATISHNA@xilinx.com>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Nov 8, 2019 at 8:32 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Nov 08, 2019 at 04:10:40PM +0200, Laurent Pinchart wrote:
> > On Fri, Nov 08, 2019 at 04:07:33PM +0200, Laurent Pinchart wrote:
> > > On Thu, Sep 26, 2019 at 09:57:29AM -0500, Rob Herring wrote:
> > > > On Thu, Sep 26, 2019 at 9:23 AM Laurent Pinchart wrote:
> > > >> On Thu, Sep 26, 2019 at 09:15:01AM -0500, Rob Herring wrote:
> > > >>> On Wed, Sep 25, 2019 at 6:56 PM Laurent Pinchart wrote:
> > > >>>>
> > > >>>> From: Hyun Kwon <hyun.kwon@xilinx.com>
> > > >>>>
> > > >>>> The bindings describe the ZynqMP DP subsystem. They don't support the
> > > >>>> interface with the programmable logic (FPGA) or audio yet.
> > > >>>>
> > > >>>> Signed-off-by: Hyun Kwon <hyun.kwon@xilinx.com>
> > > >>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > >>>> ---
> > > >>>> Changes since v8:
> > > >>>>
> > > >>>> - Convert to yaml
> > > >>>> - Rename aclk to dp_apb_clk
> > > >>>
> > > >>> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.example.dt.yaml:
> > > >>> display@fd4a0000: clock-names:2: 'dp_vtc_pixel_clk_in' was expected
> > > >>
> > > >> If you allow me to steal a bit of your brain time, could you help me
> > > >> expressing the clocks constraint ?
> > > >>
> > > >>   clocks:
> > > >>     description:
> > > >>       The AXI clock and at least one video clock are mandatory, the audio clock
> > > >>       optional.
> > > >>     minItems: 2
> > > >>     maxItems: 4
> > > >>     items:
> > > >>       - description: AXI clock
> > > >>       - description: Audio clock
> > > >>       - description: Non-live video clock (from Processing System)
> > > >>       - description: Live video clock (from Programmable Logic)
> > > >>   clock-names:
> > > >>     minItems: 2
> > > >>     maxItems: 4
> > > >>     items:
> > > >>       - const: dp_apb_clk
> > > >>       - const: dp_aud_clk
> > > >>       - const: dp_vtc_pixel_clk_in
> > > >>       - const: dp_live_video_in_clk
> > > >>
> > > >> dp_apb_clk is required, dp_aud_clk is optional, and at least one of
> > > >> dp_vtc_pixel_clk_in and dp_live_video_in_clk is required.
> > > >
> > > > I'm hoping people's inability to express the schema will prevent
> > > > complicated ones like this in the first place...
> > > >
> > > > clock-names:
> > > >   oneOf:
> > > >     - minItems: 3
> > > >       maxItems: 4
> > > >       items:
> > > >         - const: dp_apb_clk
> > > >         - const: dp_aud_clk
> > > >         - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
> > > >         - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
> > > >     - minItems: 2
> > > >       maxItems: 3
> > > >       items:
> > > >         - const: dp_apb_clk
> > > >         - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
> > > >         - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
> > >
> > > The above would make
> > >
> > >     clock-names = "dp_apb_clk", "dp_vtc_pixel_clk_in", "dp_vtc_pixel_clk_in";
> > >
> > > valid. I've investigated a little bit and found uniqueItems which solves
> > > my issue.

It wouldn't because uniqueItems is the default (not for json-schema,
but DT schema string-arrays).

> > >
> > > Would the following simpler solution be acceptable ?
> > >
> > > clock-names:
> > >     minItems: 2
> > >     maxItems: 4
> > >     items:
> > >       - const: dp_apb_clk
> > >       - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
> > >       - const: dp_aud_clk
> > >       - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
> > >     uniqueItems: true
> >
> > To give more context,
> >
> >   clocks:
> >     description:
> >       The AXI clock and at least one video clock are mandatory, the audio clock
> >       is optional.
> >     minItems: 2
> >     maxItems: 4
> >     items:
> >       - description: dp_apb_clk is the AXI clock
> >       - description: dp_aud_clk is the Audio clock
> >       - description:
> >           dp_vtc_pixel_clk_in is the non-live video clock (from Processing
> >           System)
> >       - description:
> >           dp_live_video_in_clk is the live video clock (from Programmable
> >           Logic)
> >   clock-names:
> >       minItems: 2
> >       maxItems: 4
> >       items:
> >         - const: dp_apb_clk
> >         - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
> >         - const: dp_aud_clk
> >         - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
> >       uniqueItems: true

'clock' and 'clock-names' don't match. dp_aud_clk is in the wrong spot.

>
> There's something going on that I can't really understand...
>
> clock-names:
>   minItems: 2
>   maxItems: 4
>   items:
>     - const: dp_apb_clk
>     - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
>     - const: dp_aud_clk
>     - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
>   uniqueItems: true
>
> results in dt_mk_schema complaining about an invalid schema. However,
> the following works:

Because 'uniqueItems' is not allowed because it's not needed.

>
> clock-names:
>   oneOf:
>     - minItems: 2
>       maxItems: 4
>       items:
>         - const: dp_apb_clk
>         - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
>         - const: dp_aud_clk
>         - enum: [ dp_vtc_pixel_clk_in, dp_live_video_in_clk ]
>       uniqueItems: true
>
> I assume this is due to clock-names being a string-array, which already
> contains uniqueItems. However, if I leave uniqueItems out, an example
> with a duplicated clock-names validates fine.

Are you using 'DT_SCHEMA_FILES' as that leaves out all the core schema?

BTW, this case is probably allowed because we fail to apply the same
meta-schemas for schema behind the oneOf.

Rob
