Return-Path: <SRS0=rjyW=3U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91015C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 17:12:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6C4CA206D5
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 17:12:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbgAaRMx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jan 2020 12:12:53 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:34512 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbgAaRMx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jan 2020 12:12:53 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 6C3F32004A;
        Fri, 31 Jan 2020 18:12:49 +0100 (CET)
Date:   Fri, 31 Jan 2020 18:12:48 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     dri-devel@lists.freedesktop.org,
        Lucas Stach <l.stach@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        kernel@collabora.com, Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, intel-gfx-trybot@lists.freedesktop.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v10 09/12] dt-bindings: display: bridge: lvds-codec: Add
 new bus-width prop
Message-ID: <20200131171248.GB5464@ravnborg.org>
References: <20200128135514.108171-1-boris.brezillon@collabora.com>
 <20200128135514.108171-10-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200128135514.108171-10-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QX4gbG5DAAAA:8
        a=VwQbUJbxAAAA:8 a=40l160qCl5jptrrAx3AA:9 a=CjuIK1q_8ugA:10
        a=AbAUZ8qAyYyZVLSsDulk:22 a=AjGcO6oz07-iQ99wixmX:22
        a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris.

On Tue, Jan 28, 2020 at 02:55:11PM +0100, Boris Brezillon wrote:
> Add the bus-width property to describe the input bus format.
> 
> v10:
> * Add changelog to the commit message
> * Add Rob's R-b
> 
> v8 -> v9:
> * No changes
> 
> v7:
> * Rebase on top of lvds-codec changes
> * Drop the data-mapping property
> 
> v4 -> v6:
> * Not part of the series
> 
> v3:
> * New patch
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/display/bridge/lvds-codec.yaml    | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> index 8f373029f5d2..7c4e42f4de61 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> @@ -55,6 +55,14 @@ properties:
>          description: |
>            For LVDS encoders, port 0 is the parallel input
>            For LVDS decoders, port 0 is the LVDS input
> +        properties:
> +          bus-width:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +              - enum: [18, 24]
> +              - default: 24
> +          description:
> +            Number of data lines used to transmit the RGB data.

Would this be a candidate for a bridge-common.yaml?
So we share the same definition across all bridges using it.

	Sam
