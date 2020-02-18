Return-Path: <SRS0=1Pza=4G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 878B7C3404C
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Feb 2020 22:16:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 681F2207FD
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Feb 2020 22:16:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbgBRWQq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Feb 2020 17:16:46 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:44958 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgBRWQp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Feb 2020 17:16:45 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id D4B7680535;
        Tue, 18 Feb 2020 23:16:39 +0100 (CET)
Date:   Tue, 18 Feb 2020 23:16:38 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org,
        Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 4/5] dt-bindings: display: add data-mapping to
 panel-dpi
Message-ID: <20200218221638.GA27927@ravnborg.org>
References: <20200216181513.28109-1-sam@ravnborg.org>
 <20200216181513.28109-5-sam@ravnborg.org>
 <CAL_Jsq+AbXEiLCYiAvwr5qzbSnuo9G8bTwAM3G9J4cPYz1_FMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+AbXEiLCYiAvwr5qzbSnuo9G8bTwAM3G9J4cPYz1_FMw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=VQIv7C4PpHhCiZb-sUYA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Feb 18, 2020 at 02:13:45PM -0600, Rob Herring wrote:
> On Sun, Feb 16, 2020 at 12:15 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Add data-mapping property that can be used to specify
> > the media format used for the connection betwwen the
> > display controller (connector) and the panel.
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> 
> Missing blank line.
> 
> > ---
> >  .../devicetree/bindings/display/panel/panel-dpi.yaml | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > index 40079fc24a63..6a03d2449701 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > @@ -21,6 +21,16 @@ properties:
> >        - {}
> >        - const: panel-dpi
> >
> > +  data-mapping:
> > +    enum:
> > +      - rgb24
> > +      - rgb565
> > +      - bgr666
> > +      - lvds666
> 
> Doesn't lvds666 come from i.MX IPU which as I remember has built-in
> LVDS block? I'd think this format would be implicit when using the
> LVDS block and panel. It doesn't seem this is actually used anywhere
> either.
I must admit that I just copied this list from Oleksandrs original
patch. The MEDIA type it identifies(MEDIA_BUS_FMT_RGB666_1X24_CPADHI) looks special.
I will drop lvds666 while applying, unless I get other feedback.
(Note: travelling, earliest in the weekend)

Btw. anyway I can add data-mapping to panel-common - and then list the
allowed enum values in each binding?

I would love to have a central definition of data-mapping, and then let
the users only allow the relevant subset so we catch errors in DT files
early.

	Sam
