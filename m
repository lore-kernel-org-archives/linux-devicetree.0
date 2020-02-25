Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71F2C35DF9
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 09:14:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 708F821927
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 09:14:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726916AbgBYJOA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 04:14:00 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37018 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgBYJN7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 04:13:59 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D636828FF0F;
        Tue, 25 Feb 2020 09:13:56 +0000 (GMT)
Date:   Tue, 25 Feb 2020 10:13:54 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Rob Herring <robh+dt@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        intel-gfx-trybot@lists.freedesktop.org, kernel@collabora.com,
        Sam Ravnborg <sam@ravnborg.org>,
        Chris Healy <cphealy@gmail.com>
Subject: Re: [PATCH v10 09/12] dt-bindings: display: bridge: lvds-codec: Add
 new bus-width prop
Message-ID: <20200225101354.5f621ccb@collabora.com>
In-Reply-To: <20200224223139.GA29578@pendragon.ideasonboard.com>
References: <20200128135514.108171-1-boris.brezillon@collabora.com>
        <20200128135514.108171-10-boris.brezillon@collabora.com>
        <20200224223139.GA29578@pendragon.ideasonboard.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 25 Feb 2020 00:31:39 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Hi Boris,
> 
> Thank you for the patch.
> 
> On Tue, Jan 28, 2020 at 02:55:11PM +0100, Boris Brezillon wrote:
> > Add the bus-width property to describe the input bus format.
> > 
> > v10:
> > * Add changelog to the commit message
> > * Add Rob's R-b
> > 
> > v8 -> v9:
> > * No changes
> > 
> > v7:
> > * Rebase on top of lvds-codec changes
> > * Drop the data-mapping property
> > 
> > v4 -> v6:
> > * Not part of the series
> > 
> > v3:
> > * New patch
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/display/bridge/lvds-codec.yaml    | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > index 8f373029f5d2..7c4e42f4de61 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > @@ -55,6 +55,14 @@ properties:
> >          description: |
> >            For LVDS encoders, port 0 is the parallel input
> >            For LVDS decoders, port 0 is the LVDS input
> > +        properties:
> > +          bus-width:
> > +            allOf:
> > +              - $ref: /schemas/types.yaml#/definitions/uint32
> > +              - enum: [18, 24]
> > +              - default: 24
> > +          description:
> > +            Number of data lines used to transmit the RGB data.  
> 
> This is a bit unclear. First of all, depending on whether the node is an
> LVDS encoder or decoder, port@0 is either a parallel input or an LVDS
> input. The property mentiones RGB data, does it mean it apply to LVDS
> encoders only ? Or should it be in port@1 for LVDS decoders ?

Right, I only considered the encoder case here. For the decoder case, we
don't need a bus-width prop yet, as the bus format output is currently
enforced by the bus format input of the next component in the chain
(panel/next-bridge), but that might change if we start dealing with
panel/bridges supporting several input formats and expecting the LVDS
encoder/decoder to select one. What we do need for the decoder case
though, is a data-mapping prop, otherwise this LVDS bridge exposes a
FIXED in-format and the previous element in the chain has to use its
'default' output format (which might not be appropriate).

Maybe we should go for Sam's approach and expose a data-mapping prop
on both ends of the bridge (that implies describing RGB/DPI bus width
using the data-mapping prop), this way we wouldn't have to distinguish
the encoder/decoder case.

> 
> Then, I'm not sure what the property describes. Is it the number of data
> lanes that the chip has ? Or the number of lanes routed on the board ?

It's the number of lanes routed on the board. I'll clarify that.

> Should it be specified only if the number of lanes on the board is
> different than the maximum number of lanes of the hardware ?

You mean default number of lanes (24)? Well, I guess defining it
explicitly is not a bad thing, so, even if the default is already 24,
I don't see a problem setting bus-width = <24>. Actually, maybe that's
even better if we force new users to explicitly define the number of
lanes exposed on the DPI interface, but we definitely need this default
value if we want to keep things backward compatible. Not sure how to
express that (it's not mandatory, it's not optional, it's recommended
:-)).

> A more
> detailed description is needed.
> 
> Updating the example would also be useful.

I can do that too.
