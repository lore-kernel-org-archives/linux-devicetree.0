From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/3] drm/rockchip: dw_hdmi: introduce the pclk for grf
Date: Wed, 14 Jun 2017 13:38:44 -0500
Message-ID: <20170614183844.hd6ckfhtvn4x3eg2@rob-hp-laptop>
References: <1496992228-10582-1-git-send-email-mark.yao@rock-chips.com>
 <1496992247-10727-1-git-send-email-mark.yao@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1496992247-10727-1-git-send-email-mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 09, 2017 at 03:10:46PM +0800, Mark Yao wrote:
> For RK3399's GRF module, if we want to operate the graphic related grf
> registers, we need to enable the pclk_vio_grf which supply power for VIO
> GRF IOs, so it's better to introduce an optional grf clock in driver.
> 
> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Signed-off-by: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> Changes in v3: none
> Changes in v2: describe grf on Documentation.
> 
>  .../bindings/display/rockchip/dw_hdmi-rockchip.txt     |  1 +
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c            | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
