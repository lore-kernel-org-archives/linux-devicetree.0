From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [RESEND PATCH v7 0/7] Rockchip dw-mipi-dsi driver
Date: Tue, 21 Feb 2017 10:39:18 -0500
Message-ID: <20170221153918.GA25168@art_vandelay>
References: <1487577744-2855-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1487577744-2855-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: john-HooS5bfzL4hWk0Htik3J/w@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, yzq-TNX95d0MmH7DzftRWevZcw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 20, 2017 at 04:02:16PM +0800, Chris Zhong wrote:
> Hi all
> 
> [Resend this v7 version series, since there are 5 mails have gone missing, last
> week]
> 
> This version does not change the existing v6 patches, just to add the
> "bandwidth fix" patch back, since we really need it.
> 
> This patch serial is for RK3399 MIPI DSI. The MIPI DSI controller of
> RK3399 is almost the same as RK3288, except a little bit of difference
> in phy clock controlling and port id selection register. These patches
> add RK3399 support and the power domain support.
> 
> And these patches base on John Keeping's v3 patches[0], it fixes many bugs,
> they have been tested on rk3288 evb board.

Do we have an ETA on when John is planning on respinning his patchset based on
review feedback?

> 
> [0]:
> [01/24] https://patchwork.kernel.org/patch/9544089
> [02/24] https://patchwork.kernel.org/patch/9544061
> [03/24] https://patchwork.kernel.org/patch/9544065
> [04/24] https://patchwork.kernel.org/patch/9544077
> [05/24] https://patchwork.kernel.org/patch/9544033
> [06/24] https://patchwork.kernel.org/patch/9544037
> [07/24] https://patchwork.kernel.org/patch/9544029
> [08/24] https://patchwork.kernel.org/patch/9544031
> [09/24] https://patchwork.kernel.org/patch/9544083
> [10/24] https://patchwork.kernel.org/patch/9544063
> [11/24] https://patchwork.kernel.org/patch/9544085
> [12/24] https://patchwork.kernel.org/patch/9544093
> [13/24] https://patchwork.kernel.org/patch/9544081
> [14/24] https://patchwork.kernel.org/patch/9544057
> [15/24] https://patchwork.kernel.org/patch/9544079
> [16/24] https://patchwork.kernel.org/patch/9544035
> [17/24] https://patchwork.kernel.org/patch/9544105
> [18/24] https://patchwork.kernel.org/patch/9544059
> [21/24] https://patchwork.kernel.org/patch/9544009
> [22/24] https://patchwork.kernel.org/patch/9544049
> [23/24] https://patchwork.kernel.org/patch/9544055
> [24/24] https://patchwork.kernel.org/patch/9544109
> 
> 
> Changes in v6:
> - no need check phy_cfg_clk before enable/disable
> 
> Changes in v5:
> - check the error of phy_cfg_clk in dw_mipi_dsi_bind
> 
> Changes in v4:
> - remove the unrelated change
> 
> Changes in v3:
> - base on John Keeping's patch series
> 
> Chris Zhong (7):
>   dt-bindings: add rk3399 support for dw-mipi-rockchip
>   drm/rockchip/dsi: dw-mipi: support RK3399 mipi dsi
>   drm/rockchip/dsi: dw-mipi: correct the coding style
>   drm/rockchip/dsi: remove mode_valid function
>   dt-bindings: add power domain node for dw-mipi-rockchip
>   drm/rockchip/dsi: fix insufficient bandwidth of some panel
>   drm/rockchip/dsi: add dw-mipi power domain support
> 
>  .../display/rockchip/dw_mipi_dsi_rockchip.txt      |   7 +-
>  drivers/gpu/drm/rockchip/dw-mipi-dsi.c             | 160 ++++++++++++---------
>  2 files changed, 100 insertions(+), 67 deletions(-)
> 
> -- 
> 2.6.3
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Sean Paul, Software Engineer, Google / Chromium OS
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
