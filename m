From: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v5] drm/mediatek: fixed the calc method of data rate per
 lane
Date: Thu, 17 Nov 2016 13:36:46 +0800
Message-ID: <1479361006.13083.7.camel@mtksdaap41>
References: <1479266454-31892-1-git-send-email-jitao.shi@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479266454-31892-1-git-send-email-jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Jitao:


On Wed, 2016-11-16 at 11:20 +0800, Jitao Shi wrote:
> Tune dsi frame rate by pixel clock, dsi add some extra signal (i.e.
> Tlpx, Ths-prepare, Ths-zero, Ths-trail,Ths-exit) when enter and exit LP
> mode, those signals will cause h-time larger than normal and reduce FPS.
> So need to multiply a coefficient to offset the extra signal's effect.
>   coefficient = ((htotal*bpp/lane_number)+Tlpx+Ths_prep+Ths_zero+
> 		 Ths_trail+Ths_exit)/(htotal*bpp/lane_number)
> 
> Signed-off-by: Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

It looks good to me.
But this patch conflict with [1] which is one patch of MT2701 series. I
want to apply MT2701 patches first, so please help to refine this patch
based on MT2701 patches.

[1] https://patchwork.kernel.org/patch/9422821/

Regards,
CK

> ---
> Change since v4:
>  - tune the calc comment more clear.
>  - define the phy timings as constants.
> 
> Chnage since v3:
>  - wrapp the commit msg.
>  - fix alignment of some lines. 
> 
> Change since v2:
>  - move phy timing back to dsi_phy_timconfig.
> 
> Change since v1:
>  - phy_timing2 and phy_timing3 refer clock cycle time.
>  - define values of LPX HS_PRPR HS_ZERO HS_TRAIL TA_GO TA_SURE TA_GET DA_HS_EXIT.
> ---
>  

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
