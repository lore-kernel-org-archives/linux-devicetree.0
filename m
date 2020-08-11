Return-Path: <SRS0=YFsx=BV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45020C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Aug 2020 10:53:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A5362076B
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Aug 2020 10:53:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ft/gfjBi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728463AbgHKKxS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 11 Aug 2020 06:53:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56856 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728416AbgHKKxS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 11 Aug 2020 06:53:18 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F39E9A8;
        Tue, 11 Aug 2020 12:53:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597143196;
        bh=w++u0EgZYHWY6Bk9yifmavALtsPJvRS3bTusp6m37kI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ft/gfjBiopxG8zXdsarmUnraDB3a9l113on/dbDrlEnl764IX3igpR5kr4iTZaLOr
         VZe+vpAssiEGbN4B8HDSROMCJ1LRc0yiqBKBfOmUVotzknpcpGcATdSVYvbvBPdklc
         y1YEG6utUT3IWqBrSPFAZtaFoZoeuURz3ITUhTtE=
Date:   Tue, 11 Aug 2020 13:53:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Maxime Ripard <mripard@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: display: bridge: lvds-codec:
 Document vcc-supply property
Message-ID: <20200811105303.GD6054@pendragon.ideasonboard.com>
References: <20200810152219.6254-1-biju.das.jz@bp.renesas.com>
 <20200810152219.6254-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200810152219.6254-2-biju.das.jz@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Mon, Aug 10, 2020 at 04:22:17PM +0100, Biju Das wrote:
> Document optional vcc-supply property that may be used as VCC source.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> New patch Ref: Ref:https://patchwork.kernel.org/patch/11705819/
> ---
>  .../devicetree/bindings/display/bridge/lvds-codec.yaml         | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> index 68951d56ebba..3248be31eceb 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> @@ -79,6 +79,9 @@ properties:
>        The GPIO used to control the power down line of this device.
>      maxItems: 1
>  
> +  vcc-supply:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - ports

-- 
Regards,

Laurent Pinchart
