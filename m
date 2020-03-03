Return-Path: <SRS0=BDx3=4U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1497C3F2C6
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 18:55:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A7AC7206D7
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 18:55:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n+e9/HdH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgCCSzy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Mar 2020 13:55:54 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:53030 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbgCCSzx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Mar 2020 13:55:53 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 268082AF;
        Tue,  3 Mar 2020 19:55:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583261752;
        bh=noy1WADc0ET4QwWSlF8Wtcknw2DcH2OWioSBI/pWkjc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n+e9/HdHilEFMQIN0V+Cyum7cPa4meETRYSjov9d8t8btYaAW01uq3IQiPX0Rfmwz
         zZBqG+9PF5OCQFc9TcukzgXxTkiVFKNzWlOvA3eqsjVmuI0sVx97Li/drc4MBgTC9C
         WfbFakiGAjB7B33Cfdzj69j8ibXDj6cKpHf1TSmw=
Date:   Tue, 3 Mar 2020 20:55:31 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Rob Herring <robh@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org,
        Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 4/5] dt-bindings: display: add data-mapping to
 panel-dpi
Message-ID: <20200303185531.GJ11333@pendragon.ideasonboard.com>
References: <20200216181513.28109-1-sam@ravnborg.org>
 <20200216181513.28109-5-sam@ravnborg.org>
 <CAL_Jsq+AbXEiLCYiAvwr5qzbSnuo9G8bTwAM3G9J4cPYz1_FMw@mail.gmail.com>
 <20200218221638.GA27927@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200218221638.GA27927@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Sam,

On Tue, Feb 18, 2020 at 11:16:38PM +0100, Sam Ravnborg wrote:
> On Tue, Feb 18, 2020 at 02:13:45PM -0600, Rob Herring wrote:
> > On Sun, Feb 16, 2020 at 12:15 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > Add data-mapping property that can be used to specify
> > > the media format used for the connection betwwen the
> > > display controller (connector) and the panel.
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > 
> > Missing blank line.
> > 
> > > ---
> > >  .../devicetree/bindings/display/panel/panel-dpi.yaml | 12 +++++++++++-
> > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > > index 40079fc24a63..6a03d2449701 100644
> > > --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > > +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > > @@ -21,6 +21,16 @@ properties:
> > >        - {}
> > >        - const: panel-dpi
> > >
> > > +  data-mapping:
> > > +    enum:
> > > +      - rgb24
> > > +      - rgb565
> > > +      - bgr666
> > > +      - lvds666
> > 
> > Doesn't lvds666 come from i.MX IPU which as I remember has built-in
> > LVDS block? I'd think this format would be implicit when using the
> > LVDS block and panel. It doesn't seem this is actually used anywhere
> > either.
>
> I must admit that I just copied this list from Oleksandrs original
> patch. The MEDIA type it identifies(MEDIA_BUS_FMT_RGB666_1X24_CPADHI) looks special.
> I will drop lvds666 while applying, unless I get other feedback.
> (Note: travelling, earliest in the weekend)

There are different data mappings defined for LVDS, we should follow
them. lvds666 is wrong in any case, and doesn't apply to a DPI panel
anyway.

I don't like the name data-mapping much for DPI panels I'm afraid. It
made sense for LVDS as it's really about how the different data bits are
mapped to LVDS time slots, but for DPI, what we need to describe is the
format. I also wonder whether multiple formats wouldn't be required when
the panel supports more than one, but that may not apply to panels
covered by these bindings.

If a panel expects RGB888 and receives RGB666 with the two LSBs of each
component hardwired to GND on the PCB, should DT report RGB888 or RGB666
on the panel side ? I'm tempted by the former, and specifying the latter
on the transmitting side.

Please also note that this case is already described by
Documentation/devicetree/bindings/media/video-interfaces.txt through two
entirely different properties, bus-width and data-shift. I think we
should try to standardize mappings between display and capture. This new
property should be reconsidered in my opinion, I think it was merged too
soon.

> Btw. anyway I can add data-mapping to panel-common - and then list the
> allowed enum values in each binding?
> 
> I would love to have a central definition of data-mapping, and then let
> the users only allow the relevant subset so we catch errors in DT files
> early.

-- 
Regards,

Laurent Pinchart
