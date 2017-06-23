From: Mark yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v3 0/3] Add RK3399 HDMI Support
Date: Fri, 23 Jun 2017 09:04:16 +0800
Message-ID: <594C6910.6000208@rock-chips.com>
References: <1496992228-10582-1-git-send-email-mark.yao@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496992228-10582-1-git-send-email-mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Thanks for Heiko's review and Rob's Ack.

Seems no more confuse, pushed to drm-misc-next.

Thanks.

On 2017年06月09日 15:10, Mark Yao wrote:
> RK3399 and RK3288 shared the same HDMI IP controller, only some
> light difference with GRF configure, and an external VPLL clock
> need to configure.
>
> base on Yakir's v1 thread:
>     http://lkml.iu.edu/hypermail/linux/kernel/1607.1/01468.html
>
> rely on Jose's hdmi phy patch:
>     https://patchwork.kernel.org/patch/9702229
>
> Some Yakir's hdmi patches cause hdmi no display on my test,
> so I remove them on this thread.
>
> Tested on rk3399 evb board with kernel 4.12.0-rc1.
>
> Changes in v3:
>    remove hdmi_phy_configure_dwc_hdmi_3d_tx callbak.
>
> Changes in v2:
>    rebase to newest uptream, reuse hdmi_phy_configure_dwc_hdmi_3d_tx
>
> Mark Yao (3):
>    drm/rockchip: dw_hdmi: add RK3399 HDMI support
>    drm/rockchip: dw_hdmi: introduce the VPLL clock setting
>    drm/rockchip: dw_hdmi: introduce the pclk for grf
>
>   .../bindings/display/rockchip/dw_hdmi-rockchip.txt |   6 +-
>   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        | 110 ++++++++++++++++++---
>   2 files changed, 102 insertions(+), 14 deletions(-)
>


-- 
Ｍark Yao


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
