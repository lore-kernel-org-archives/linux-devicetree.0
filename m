Return-Path: <SRS0=+eHa=B3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CEE4C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 00:18:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E36C3206F4
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 00:18:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U6kWgKL0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbgHQASG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 16 Aug 2020 20:18:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37124 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgHQASF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 16 Aug 2020 20:18:05 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3DBAF9;
        Mon, 17 Aug 2020 02:18:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597623483;
        bh=z7ZkF/UGtlwF2klPzyzYz70nGJVgRLeH6o8XLIQWnfI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U6kWgKL0BYS8XZCeRN8LJrzSETrcoazHGMLyZescS0XCpJzK11npnJXNqyx91LlhJ
         zEeQ0X1p1FBLJDzN5154elRs9rJOHOJfbmltsC4RBDM819uaYj31k1aCLJZxgzpCYe
         CDCGQicUxFKKQG3AVnVC0r9b2BM6Oqpxpnb1VHu8=
Date:   Mon, 17 Aug 2020 03:17:47 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>,
        devicetree@vger.kernel.org,
        Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/8] dt-bindings: display: mxsfb: Add a bus-width
 endpoint property
Message-ID: <20200817001747.GE7729@pendragon.ideasonboard.com>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-4-laurent.pinchart@ideasonboard.com>
 <20200816072520.GD1201814@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200816072520.GD1201814@ravnborg.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Sam,

On Sun, Aug 16, 2020 at 09:25:20AM +0200, Sam Ravnborg wrote:
> On Thu, Aug 13, 2020 at 04:29:05AM +0300, Laurent Pinchart wrote:
> > When the PCB routes the display data signals in an unconventional way,
> > the output bus width may differ from the bus width of the connected
> > panel or encoder. For instance, when a 18-bit RGB panel has its R[5:0],
> > G[5:0] and B[5:0] signals connected to LCD_DATA[7:2], LCD_DATA[15:10]
> > and LCD_DATA[23:18], the output bus width is 24 instead of 18 when the
> > signals are routed to LCD_DATA[5:0], LCD_DATA[11:6] and LCD_DATA[17:12].
> > 
> > Add a bus-width property to describe this data routing.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Some general comments.
> We have the bus format - for example MEDIA_BUS_FMT_RGB666_1X18.
> I was under the impression that the bus format defined the wiring used,
> so for example the bus format would tell if on used 18 bits as above.
> So with the bus format available the bus-width is not needed.
> 
> Today this detail is not expressed in DT but comes based on the
> compatible for the panel - so what this patch does is to add the bus
> format information to DT.
> 
> But then to do so would we not need to have something so we can specify
> all relevant MEDIA_BUS_FMT's? bus-width will not cut it.

Different formats can be transported with a given wiring (for instance
when the full 24-bit RGB bus is wired, the display controller can ouput
24-bit RGB, or 18-bit RGB on the MSB with dithering enabled), and
different wirings can transport the same format
(MEDIA_BUS_FMT_RGB666_1X18 can be transported with a 24 bits wiring, or
a 18 bits wiring as described in the commit message). While we may in
this case be able to express the information through bus formats
(specifying MEDIA_BUS_FMT_RGB666_1X18 would imply that only 18 bits are
wired), I think it's conceptually speaking the wrong information to
provide, and would be confusing in some cases.

> Also the bus-width property (and data-shift property you accidentally
> reference) are both described in media/video-interfaces.txt.
> If we need bus-witdh - is it possible to re-use video-interfaces?
> It may need a conversion to yaml to get full validation, but a lot
> of .yaml files refer to the text file today so conversion can come later.

How do you mean reuse ? I can reference the file in the description, but
as video-interfaces.txt documents the property just as "number of data
lines actively used, valid for the parallel busses", I would need a
description here anyway, to explain how it applies to this device in
particular, even after video-interfaces.txt gets converted to YAML.

> > ---
> >  Documentation/devicetree/bindings/display/mxsfb.yaml | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/mxsfb.yaml b/Documentation/devicetree/bindings/display/mxsfb.yaml
> > index ec6533b1d4a3..d15bb8edc29f 100644
> > --- a/Documentation/devicetree/bindings/display/mxsfb.yaml
> > +++ b/Documentation/devicetree/bindings/display/mxsfb.yaml
> > @@ -58,6 +58,18 @@ properties:
> >          type: object
> >  
> >          properties:
> > +          data-shift:
> > +            enum: [16, 18, 24]
> > +            description: |
> > +              The output bus width. This value overrides the configuration
> > +              derived from the connected device (encoder or panel). It should
> > +              only be specified when PCB routing of the data signals require a
> > +              different bus width on the LCDIF and the connected device. For
> > +              instance, when a 18-bit RGB panel has its R[5:0], G[5:0] and
> > +              B[5:0] signals connected to LCD_DATA[7:2], LCD_DATA[15:10] and
> > +              LCD_DATA[23:18] instead of LCD_DATA[5:0], LCD_DATA[11:6] and
> > +              LCD_DATA[17:12], bus-width should be set to 24.
> > +
> >            remote-endpoint:
> >              $ref: /schemas/types.yaml#/definitions/phandle
> >  

-- 
Regards,

Laurent Pinchart
