From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/4] drm/panel: simple: add support for NLT
 NL192108AC18-02D
Date: Wed, 14 Jun 2017 10:24:36 -0500
Message-ID: <20170614152436.2swffy72xvblvmga@rob-hp-laptop>
References: <20170608180758.31020-1-l.stach@pengutronix.de>
 <20170608180758.31020-3-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170608180758.31020-3-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 08, 2017 at 08:07:57PM +0200, Lucas Stach wrote:
> This adds support for the NLT Technologies NL192108AC18-02D
> 15.6" LVDS FullHD TFT LCD panel, which can be supported
> by the simple panel driver.
> 
> Timings are taken from the preliminary datasheet, as a final
> one is not yet available.
> 
> Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
> v2: mention power-supply property
> ---
>  .../display/panel/nlt,nl192108ac18-02d.txt         |  8 ++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 29 ++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/nlt,nl192108ac18-02d.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
