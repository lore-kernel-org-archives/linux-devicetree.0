From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 2/3] drm/rockchip: Add optional support for CRTC gamma LUT
Date: Mon, 24 Jun 2019 13:03:12 -0700
Message-ID: <CAD=FV=V3dq0qS2Finw7gxbZqyRvuLqGv-573LHX+41odjBOTxA@mail.gmail.com>
References: <20190621211346.1324-1-ezequiel@collabora.com> <20190621211346.1324-3-ezequiel@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190621211346.1324-3-ezequiel@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ezequiel Garcia <ezequiel@collabora.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, kernel@collabora.com, Sean Paul <seanpaul@chromium.org>, Boris Brezillon <boris.brezillon@collabora.com>, Jacopo Mondi <jacopo@jmondi.org>, Ilia Mirkin <imirkin@alum.mit.edu>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Jun 21, 2019 at 2:14 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> Add an optional CRTC gamma LUT support, and enable it on RK3288.
> This is currently enabled via a separate address resource,
> which needs to be specified in the devicetree.
>
> The address resource is required because on some SoCs, such as
> RK3288, the LUT address is after the MMU address, and the latter
> is supported by a different driver. This prevents the DRM driver
> from requesting an entire register space.
>
> The current implementation works for RGB 10-bit tables, as that
> is what seems to work on RK3288.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
> Changes from v1:
> * drop explicit linear LUT after finding a proper
>   way to disable gamma correction.
> * avoid setting gamma is the CRTC is not active.
> * s/int/unsigned int as suggested by Jacopo.
> * only enable color management and set gamma size
>   if gamma LUT is supported, suggested by Doug.
> * drop the reg-names usage, and instead just use indexed reg
>   specifiers, suggested by Doug.
>
> Changes from RFC:
> * Request (an optional) address resource for the LUT.
> * Drop support for RK3399, which doesn't seem to work
>   out of the box and needs more research.
> * Support pass-thru setting when GAMMA_LUT is NULL.
> * Add a check for the gamma size, as suggested by Ilia.
> * Move gamma setting to atomic_commit_tail, as pointed
>   out by Jacopo/Laurent, is the correct way.
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.c  |   3 +
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 114 ++++++++++++++++++++
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.h |   7 ++
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c |   2 +
>  4 files changed, 126 insertions(+)

Looks happy to me now.  Since I'm not a DRM expert and almost
certainly don't know much about gamma LUT, take this as you will:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'm not in front of my veyron device at the moment, so I can't re-test
exactly this patch so I won't add a Tested-by tag.  However, I'll note
that earlier versions worked for the test app I was able to find in
Chrome OS and I'd imagine this one does too.

-Doug
