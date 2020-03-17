Return-Path: <SRS0=fjOU=5C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF1DC18E5B
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 11:22:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 03D192051A
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 11:22:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbgCQLWh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Mar 2020 07:22:37 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:36760 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbgCQLWh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 17 Mar 2020 07:22:37 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 690B880475;
        Tue, 17 Mar 2020 12:22:33 +0100 (CET)
Date:   Tue, 17 Mar 2020 12:22:31 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: display: drop data-mapping from
 panel-dpi
Message-ID: <20200317112231.GA7981@ravnborg.org>
References: <20200314153047.2486-1-sam@ravnborg.org>
 <20200314153047.2486-2-sam@ravnborg.org>
 <20200317084959.atqs2anx56kamrsy@gilmour.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317084959.atqs2anx56kamrsy@gilmour.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=P1BnusSwAAAA:8 a=VwQbUJbxAAAA:8 a=QAgE-FV-s0_cZOTFy9cA:9
        a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=D0XLA9XvdZm18NrgonBM:22
        a=AjGcO6oz07-iQ99wixmX:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Maxime.

On Tue, Mar 17, 2020 at 09:49:59AM +0100, Maxime Ripard wrote:
> Hi Sam,
> 
> On Sat, Mar 14, 2020 at 04:30:45PM +0100, Sam Ravnborg wrote:
> > data-mapping may not be the best way to describe the
> > data format used between panels and display interface.
> >
> > Drop it from the panel-dpi binding so we do not start to rely on it.
> > We can then work out how to best describe this mapping and when
> > we know it, we can add it to this binding.
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Rob Herring <robh@kernel.org>
> 
> I can't say whether it's the right decision or not, but if you want to
> go forward with this, you should maintain the backward compatibility,
> so leave the code to deal with this as a fallback solution...

This was all introduced very recently and is for now only present in
drm-misc-next.
The idea was to revert is *before* people started to rely on this new
mapping. So we avoid all the backward compatibility fun.
I had hoped the revert could land before the 5.7 pull, alas that was not
the case.

	Sam

> 
> > ---
> >  .../devicetree/bindings/display/panel/panel-dpi.yaml   | 10 ----------
> >  1 file changed, 10 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > index f63870384c00..0cd74c8dab42 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > @@ -21,15 +21,6 @@ properties:
> >        - {}
> >        - const: panel-dpi
> >
> > -  data-mapping:
> > -    enum:
> > -      - rgb24
> > -      - rgb565
> > -      - bgr666
> > -    description: |
> > -      Describes the media format, how the display panel is connected
> > -      to the display interface.
> > -
> 
> And keep that DT property documented too.
> 
> You can express that it's only here for compatibility using the
> deprecated keyword though.
> 
> It doesn't do anything at the moment, but the next spec of the schema
> language uses it, so as soon as the library implements it we'll report
> it.
> 
> Maxime


