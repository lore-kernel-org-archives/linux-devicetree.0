Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C15C5DF61
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 20:49:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 214F221D6C
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 20:49:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KKfWVT+L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbfKGUs7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 Nov 2019 15:48:59 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:35718 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727361AbfKGUs7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Nov 2019 15:48:59 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44AAD71D;
        Thu,  7 Nov 2019 21:48:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1573159736;
        bh=pmzvKL0wtmMTBCZNxQBXqoocDPWwX/PcDpvrlBEmGQg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KKfWVT+LZqmLZZDVydKtyIlOtV8wgQvtJ2kFE+L7+ICbspPUg0OH7E9tl9n44sx/s
         DIx2YaQsFjBcPyUMh8WC6mOkLd0N2Q8xCuCCd47PuUyhLbP0cSo2eYtErfdW9DnKoi
         4KshitWefmZtx8hJAQUof5bBOGCUCDSvhuQNjkjk=
Date:   Thu, 7 Nov 2019 22:48:46 +0200
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
Subject: Re: [PATCH v3 5/7] drm/panel: panel-simple: Add connector type for
 etm0700g0dh6
Message-ID: <20191107204846.GQ24983@pendragon.ideasonboard.com>
References: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573157463-14070-6-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1573157463-14070-6-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Thu, Nov 07, 2019 at 08:11:01PM +0000, Fabrizio Castro wrote:
> Add connector type for the etm0700g0dh6 from Emerging Display
> Technologies (EDT).
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> v2->v3:
> * New patch
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 5d48768..82065ff 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1342,6 +1342,7 @@ static const struct panel_desc edt_etm0700g0dh6 = {
>  	},
>  	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
>  	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> +	.connector_type = DRM_MODE_CONNECTOR_PARALLEL,

I still think we should have a DRM_MODE_CONNECTOR_PANEL, but regardless,
this panel seems to match DRM_MODE_CONNECTOR_DPI.

>  };
>  
>  static const struct panel_desc edt_etm0700g0bdh6 = {

-- 
Regards,

Laurent Pinchart
