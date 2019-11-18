Return-Path: <SRS0=UR7X=ZK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15379C432C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 Nov 2019 23:58:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE12C222B0
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 Nov 2019 23:58:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NTexvwR4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbfKRX6J (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 Nov 2019 18:58:09 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60518 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbfKRX6J (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 Nov 2019 18:58:09 -0500
Received: from pendragon.ideasonboard.com (unknown [38.98.37.142])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2CBA563;
        Tue, 19 Nov 2019 00:58:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1574121487;
        bh=Mxk6rk2xF2thaig3R3p3Gkx/6h3F0FLe6+BRnlHkuvc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NTexvwR44K59XOTHnJRxJQvxBcwFnXbk3AfI2NBTZi6Rq+VAuiQ+0UR4zoN58y8oH
         Ji1ZOecBBRIinFjIGawGntKHcFhbjCX+4W/c5GKv1mA4KDnW34UCdB0oLORRcecfTk
         6k8R2ibCJdXr2pUM5YttJEg3QiL9gHVi6N+wmkAs=
Date:   Tue, 19 Nov 2019 01:57:55 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Peter Rosin <peda@axentia.se>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v4 04/13] dt-bindings: display: bridge: lvds-transmitter:
 Document "ti,sn75lvds83"
Message-ID: <20191118235755.GD5171@pendragon.ideasonboard.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-5-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1573660292-10629-5-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Wed, Nov 13, 2019 at 03:51:23PM +0000, Fabrizio Castro wrote:
> Compatible string "ti,sn75lvds83" is being used by device tree
> rk3188-bqedison2qc.dts, but it's not documented anywhere, therefore
> document it within lvds-transmitter.yaml.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v3->v4:
> * New patch
> ---
>  Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
> index a8326ce..27de616 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
> @@ -37,6 +37,7 @@ properties:
>        - enum:
>          - ti,ds90c185       # For the TI DS90C185 FPD-Link Serializer
>          - ti,ds90c187       # For the TI DS90C187 FPD-Link Serializer
> +        - ti,sn75lvds83     # For the TI SN75LVDS83 FlatLink transmitter
>        - const: lvds-encoder # Generic LVDS encoder compatible fallback
>  
>    ports:

-- 
Regards,

Laurent Pinchart
