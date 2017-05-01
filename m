From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/3] drm/vc4: Turn the V3D clock on at runtime.
Date: Mon, 1 May 2017 17:59:59 -0500
Message-ID: <CAL_JsqL6yxK19EowvEJgZ1_h9UAu=b26RnMmMg7HEed-exV9pw@mail.gmail.com>
References: <20170428224223.21904-1-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170428224223.21904-1-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 28, 2017 at 5:42 PM, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> wrote:
> For the Raspberry Pi's bindings, the power domain also implicitly
> turns on the clock and deasserts reset, but for the new Cygnus port we
> start representing the clock in the devicetree.
>
> v2: Document the clock-names property, check for -ENOENT for no clock
>     in DT.
> v3: Drop NULL checks around clk calls which embed NULL checks.
> v4: Drop clk-names (feedback by Rob Herring)
>
> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> ---
>  .../devicetree/bindings/display/brcm,bcm-vc4.txt   |  3 +++
>  drivers/gpu/drm/vc4/vc4_drv.h                      |  1 +
>  drivers/gpu/drm/vc4/vc4_v3d.c                      | 31 +++++++++++++++++++++-
>  3 files changed, 34 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
