From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH RFC v9 09/20] drm/dsi: Add a helper to get bits per
 pixel of MIPI DSI pixel format
Date: Tue, 03 Mar 2015 12:07:40 +0100
Message-ID: <1425380860.3146.49.camel@pengutronix.de>
References: <1423720903-24806-1-git-send-email-Ying.Liu@freescale.com>
	 <1423720903-24806-10-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423720903-24806-10-git-send-email-Ying.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liu Ying <Ying.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org, stefan.wahren-eS4NqCHxEME@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Am Donnerstag, den 12.02.2015, 14:01 +0800 schrieb Liu Ying:
> Signed-off-by: Liu Ying <Ying.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> v8->v9:
>  * Rebase onto the imx-drm/next branch of Philipp Zabel's open git repository.

I can't test this myself for lack of hardware, but I see no further
issues with patches 09 - 13 except for the use of
imx_drm_encoder_get_mux_id. I'll either rebase my patches that remove it
or fix it up when applying.

Thierry, may I take these patches through imx-drm, or would you rather I
waited for you to pick up the drm/dsi and drm/bridge patches?

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
