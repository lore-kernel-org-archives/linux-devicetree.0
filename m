Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9922EC2BA19
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 16:45:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D21920857
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 16:45:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410413AbgDOQpm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 12:45:42 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:41288 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404537AbgDOQpk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Apr 2020 12:45:40 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id F193D20021;
        Wed, 15 Apr 2020 18:45:37 +0200 (CEST)
Date:   Wed, 15 Apr 2020 18:45:36 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v1 3/4] dt-bindings: media: add wiring property to
 video-interfaces
Message-ID: <20200415164536.GD7965@ravnborg.org>
References: <20200412182012.27515-1-sam@ravnborg.org>
 <20200412182012.27515-4-sam@ravnborg.org>
 <20200414194054.GB29184@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414194054.GB29184@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=VwQbUJbxAAAA:8 a=0LyUp-Lxo8JsIIB5wf4A:9 a=CjuIK1q_8ugA:10
        a=E9Po1WZjFZOl8hwRPBS3:22 a=AjGcO6oz07-iQ99wixmX:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob.

On Tue, Apr 14, 2020 at 02:40:54PM -0500, Rob Herring wrote:
> On Sun, Apr 12, 2020 at 08:20:11PM +0200, Sam Ravnborg wrote:
> > The wiring property is used to describe the wiring between
> > the connector and the panel. The property can be used when the
> > wiring is used to change the mode from for example
> > BGR to RGB. The first users are the at91sam9 family where
> > such a wiring trick is sometimes used.
> > The possilbe values are so far limited to what is required
> > by the at91sam9 family, but using "text" allows us to extend
> > this in the future.
> > 
> > There exists similar properties today:
> >  - display/tilcdc/tilcdc.txt: blue-and-red-wiring
> >  - display/atmel,lcdc.txt: atmel,lcd-wiring-mode
> > 
> > Neither of the above are defined as endpoint properties.
> > 
> > The new property "wiring" has a more general name and
> > is defined as an endpoint property.
> > It will replace atmel,lcd-wiring-mode and may replace
> > blue-and-red-wiring.
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Hans Verkuil <hverkuil@xs4all.nl>
> > Cc: linux-media@vger.kernel.org
> > ---
> >  Documentation/devicetree/bindings/media/video-interfaces.txt | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > index f884ada0bffc..c3bb87c5c9a9 100644
> > --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> > +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > @@ -141,6 +141,9 @@ Optional endpoint properties
> >  - link-frequencies: Allowed data bus frequencies. For MIPI CSI-2, for
> >    instance, this is the actual frequency of the bus, not bits per clock per
> >    lane value. An array of 64-bit unsigned integers.
> > +- wiring: Wiring of data lines to display.
> > +  "straight" - normal wiring.
> 
> Don't really need a property to express this...
> 
> > +  "red-blue-reversed" - red and blue lines reversed.
> 
> For a common property, I think this needs to be looked at in terms of 
> formats and some of the format negotiation work Boris was doing.

OK, I will bite the bullet and try to understand this good enough
to come up with a proposal.
I will delay the conversion a bit, but we are in no hurry.

	Sam
