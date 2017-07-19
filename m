From: Mark yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v4 0/7] drm/rockchip: add all full framework vop support
Date: Wed, 19 Jul 2017 11:21:36 +0800
Message-ID: <596ED040.8000307@rock-chips.com>
References: <1500433036-13730-1-git-send-email-mark.yao@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500433036-13730-1-git-send-email-mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Sorry for sending this mail without thread, my send-patches scripts has a bug:-( , Already fix the script bug.

On 2017年07月19日 10:57, Mark Yao wrote:
> These patches try to make all current rockchip full framework vop works
> on drm, fill missing vop on full framework.
> Vop Full framework now has following vops:
> IP version    chipname
>        3.1           rk3288
>        3.2           rk3368
>        3.4           rk3366
>        3.5           rk3399 big
>        3.6           rk3399 lit
>        3.7           rk3228
>        3.8           rk3328
>
> Group the vop register, it would make register  definition clearer and
> more easily to reuse same group register define for difference vops.
>
> Tested on rk3399 excavator board with kernel 4.13-rc1.
>
> And other chips tested on rockchip kernel 4.4:
>     https://github.com/rockchip-linux/kernel/tree/release-4.4/drivers/gpu/drm/rockchip
>
> Changes in v4:
> - rebase to newest torvalds kernel, fix merge conflict
>
> Changes in v3:
> - group vop register instead using VOP_REG_VER mechanism
> - move write_relaxed flags to vop registers
> - Explain more on patch commit message
> - fix rk3328 overlay abnormal
>
> Changes in v2:
> - rename rk322x to rk3228(Heiko Stübner)
> - correct some vop registers define
>
> Mark Yao (7):
>    drm/rockchip: vop: initialize registers directly
>    drm/rockchip: vop: move write_relaxed flags to vop register
>    drm/rockchip: vop: move line_flag_num to interrupt registers
>    drm/rockchip: vop: group vop registers
>    drm/rockchip: vop: add a series of vop support
>    dt-bindings: display: fill Documents for series of vop
>    drm/rockchip: vop: rk3328: fix overlay abnormal
>
>   .../bindings/display/rockchip/rockchip-vop.txt     |   4 +
>   drivers/gpu/drm/rockchip/rockchip_drm_vop.c        | 109 ++-
>   drivers/gpu/drm/rockchip/rockchip_drm_vop.h        |  81 +-
>   drivers/gpu/drm/rockchip/rockchip_vop_reg.c        | 374 ++++++---
>   drivers/gpu/drm/rockchip/rockchip_vop_reg.h        | 905 ++++++++++++++++-----
>   5 files changed, 1074 insertions(+), 399 deletions(-)
>


-- 
Ｍark Yao


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
