Return-Path: <SRS0=+Je1=4M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61778C38BF9
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 22:32:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2EB022176D
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 22:32:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="etBpV2HK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727670AbgBXWcC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Feb 2020 17:32:02 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:59520 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727459AbgBXWcC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 24 Feb 2020 17:32:02 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81378E89;
        Mon, 24 Feb 2020 23:32:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1582583520;
        bh=jtnl65Hr+bnftvPmBVfUadMRLZSEnfG5ViWMnjRZp4Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=etBpV2HKWNIkC6SnIBViMTcVal7FgsZewpgy7XyLZLypptycZ1GaBBlCsQUCLMEvi
         WuRIIXf2oATg5r1E/qMwx/+NjlpO1c/FDEv7VP3YPQMVjx8N4KSR14uEs9UcTkGNZl
         Ng6ENPmw+emhKN1h3H1NRMavaXWgsvrbWwo5CkaI=
Date:   Tue, 25 Feb 2020 00:31:39 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
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
Message-ID: <20200224223139.GA29578@pendragon.ideasonboard.com>
References: <20200128135514.108171-1-boris.brezillon@collabora.com>
 <20200128135514.108171-10-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200128135514.108171-10-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris,

Thank you for the patch.

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

This is a bit unclear. First of all, depending on whether the node is an
LVDS encoder or decoder, port@0 is either a parallel input or an LVDS
input. The property mentiones RGB data, does it mean it apply to LVDS
encoders only ? Or should it be in port@1 for LVDS decoders ?

Then, I'm not sure what the property describes. Is it the number of data
lanes that the chip has ? Or the number of lanes routed on the board ?
Should it be specified only if the number of lanes on the board is
different than the maximum number of lanes of the hardware ? A more
detailed description is needed.

Updating the example would also be useful.

>  
>        port@1:
>          type: object

-- 
Regards,

Laurent Pinchart
