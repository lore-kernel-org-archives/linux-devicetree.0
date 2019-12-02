Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA8A3C432C3
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 13:07:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8CB45205ED
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 13:07:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="INI+B1Fa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727382AbfLBNH1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 08:07:27 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:58238 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727362AbfLBNH0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 08:07:26 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7D4D309;
        Mon,  2 Dec 2019 14:07:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575292045;
        bh=i0NLW6aBvPnI2JrfSoijhQ7ujUPXRt3jer7edIparCg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=INI+B1FavbSfFBM+iLJAoQKoHPnvn5dim2vG3BPSXfwkJ+L9kWLiuQXIsov6+Z1GC
         bFeoJMas5gM5u/xqDlkG5zHOso90FahtWQZ+d4T+Pf2mU2cben66dzx7JBTI8R1UDl
         ulAM1HYhXrr0yOuisuhLH75kOrCVkyqPQ1Caw2e0=
Date:   Mon, 2 Dec 2019 15:07:17 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Jyri Sarha <jsarha@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 3/3] drm/panel: simple: fix osd070t1718_19ts sync drive
 edge
Message-ID: <20191202130717.GI4929@pendragon.ideasonboard.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
 <20191114093950.4101-4-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191114093950.4101-4-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Thu, Nov 14, 2019 at 11:39:50AM +0200, Tomi Valkeinen wrote:
> The panel datasheet says that the panel samples at falling edge, but
> does not say anything about h/v sync signals. Testing shows that if the
> sync signals are driven on falling edge, the picture on the panel will
> be slightly shifted right.
> 
> Setting sync drive edge to the same as data drive edge fixes this issue.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

I don't have access to the documentation, but this makes sense, so

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/panel/panel-simple.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 5d487686d25c..0784536ae6af 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2397,7 +2397,8 @@ static const struct panel_desc osddisplays_osd070t1718_19ts = {
>  		.height = 91,
>  	},
>  	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
> +		DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE,
>  	.connector_type = DRM_MODE_CONNECTOR_DPI,
>  };
>  

-- 
Regards,

Laurent Pinchart
