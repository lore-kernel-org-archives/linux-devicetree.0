Return-Path: <SRS0=gEAL=WV=vger.kernel.org=devicetree-owner@kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:38112 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbfHYSGM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 25 Aug 2019 14:06:12 -0400
Date: Sun, 25 Aug 2019 21:06:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 2/2] drm: rcar-du: kms: Expand comment in vsps parsing
 routine
Message-ID: <20190825180603.GB5436@pendragon.ideasonboard.com>
References: <20190825140135.12150-1-jacopo+renesas@jmondi.org>
 <20190825140135.12150-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190825140135.12150-3-jacopo+renesas@jmondi.org>
Sender: devicetree-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Jacopo,

Thank you for the patch.

How about changing the subject to "drm: rcar-du: Document DT backward
compatibility" ?

On Sun, Aug 25, 2019 at 04:01:35PM +0200, Jacopo Mondi wrote:
> Exand comment in the 'vsps' parsing routine to specify why the LIF

s/Exand/Expand/

> channel index is defaulted to 0 in case the second cell of the property

s/is defaulted to 0/defaults to 0/

> is not specified.

You could explain it here too :-)

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index 2dc9caee8767..0d59f390de19 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -585,7 +585,11 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
> 
>  		vsps[j].crtcs_mask |= BIT(i);
> 
> -		/* Store the VSP pointer and pipe index in the CRTC. */
> +		/*
> +		 * Store the VSP pointer and pipe index in the CRTC. If the
> +		 * second cell of the 'vsps' specifier isn't present, default
> +		 * to 0 to remain compatible with older DT bindings.
> +		 */
>  		rcdu->crtcs[i].vsp = &rcdu->vsps[j];
>  		rcdu->crtcs[i].vsp_pipe = cells >= 1 ? args.args[0] : 0;
>  	}

-- 
Regards,

Laurent Pinchart
