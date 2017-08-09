From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: display: imx: fix parallel display
 interface-pix-fmt property
Date: Wed, 9 Aug 2017 18:31:58 -0500
Message-ID: <20170809233158.uy2acn5245ignik3@rob-hp-laptop>
References: <20170731100435.11109-1-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170731100435.11109-1-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 31, 2017 at 12:04:35PM +0200, Philipp Zabel wrote:
> The parallel display device tree binding documentation incorrectly lists
> the interface-pix-fmt property with underscores ("interface_pix_fmt").
> This was never supported by any driver, and the DT example in the same
> file always contained the correct spelling ("interface-pix-fmt").
> 
> See commit 19022aaae677 ("staging: drm/imx: Add parallel display
> support") and commit 2d62da8ebd32 ("staging: drm/imx: Add devicetree
> binding documentation") for reference.
> 
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
