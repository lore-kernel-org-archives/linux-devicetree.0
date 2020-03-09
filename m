Return-Path: <SRS0=Fzrg=42=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC26DC10F27
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 10:35:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A796020828
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 10:35:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbgCIKft (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Mar 2020 06:35:49 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59344 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgCIKfs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Mar 2020 06:35:48 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E957228DB0E;
        Mon,  9 Mar 2020 10:35:46 +0000 (GMT)
Date:   Mon, 9 Mar 2020 11:35:43 +0100
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
Message-ID: <20200309113543.24ab8a0d@collabora.com>
In-Reply-To: <20200225101354.5f621ccb@collabora.com>
References: <20200128135514.108171-1-boris.brezillon@collabora.com>
        <20200128135514.108171-10-boris.brezillon@collabora.com>
        <20200224223139.GA29578@pendragon.ideasonboard.com>
        <20200225101354.5f621ccb@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Laurent,

On Tue, 25 Feb 2020 10:13:54 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> > > diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > > index 8f373029f5d2..7c4e42f4de61 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > > @@ -55,6 +55,14 @@ properties:
> > >          description: |
> > >            For LVDS encoders, port 0 is the parallel input
> > >            For LVDS decoders, port 0 is the LVDS input
> > > +        properties:
> > > +          bus-width:
> > > +            allOf:
> > > +              - $ref: /schemas/types.yaml#/definitions/uint32
> > > +              - enum: [18, 24]
> > > +              - default: 24
> > > +          description:
> > > +            Number of data lines used to transmit the RGB data.    
> > 
> > This is a bit unclear. First of all, depending on whether the node is an
> > LVDS encoder or decoder, port@0 is either a parallel input or an LVDS
> > input. The property mentiones RGB data, does it mean it apply to LVDS
> > encoders only ? Or should it be in port@1 for LVDS decoders ?  
> 
> Right, I only considered the encoder case here. For the decoder case, we
> don't need a bus-width prop yet, as the bus format output is currently
> enforced by the bus format input of the next component in the chain
> (panel/next-bridge), but that might change if we start dealing with
> panel/bridges supporting several input formats and expecting the LVDS
> encoder/decoder to select one. What we do need for the decoder case
> though, is a data-mapping prop, otherwise this LVDS bridge exposes a
> FIXED in-format and the previous element in the chain has to use its
> 'default' output format (which might not be appropriate).
> 
> Maybe we should go for Sam's approach and expose a data-mapping prop
> on both ends of the bridge (that implies describing RGB/DPI bus width
> using the data-mapping prop), this way we wouldn't have to distinguish
> the encoder/decoder case.

Gentle ping.

Regards,

Boris
