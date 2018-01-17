From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH v3 2/8] drm: xlnx: Xilinx DRM KMS driver
Date: Wed, 17 Jan 2018 09:11:12 +0100
Message-ID: <20180117081112.GB2759@phenom.ffwll.local>
References: <1516067831-11382-1-git-send-email-hyun.kwon@xilinx.com>
 <1516067831-11382-2-git-send-email-hyun.kwon@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1516067831-11382-2-git-send-email-hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 15, 2018 at 05:57:05PM -0800, Hyun Kwon wrote:
> +static struct drm_driver xlnx_drm_driver = {
> +       .driver_features                = DRIVER_MODESET | DRIVER_GEM |
> +                                         DRIVER_ATOMIC | DRIVER_PRIME,
> +       .lastclose                      = xlnx_lastclose,
> +
> +       .enable_vblank                  = xlnx_enable_vblank,
> +       .disable_vblank                 = xlnx_disable_vblank,

I thought I've mentioned this already: Please don't use these hooks,
they're deprecated. Instead use the ones in drm_crtc_funcs (that should
also reduce the need for a bit of casting and indirection you have going
on).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
