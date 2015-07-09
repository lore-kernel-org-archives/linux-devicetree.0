From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: Re: drm/imx: parallel-display: fix drm_panel support
Date: Thu, 9 Jul 2015 20:22:48 +0200
Message-ID: <20150709182248.GA20862@t450s.lan>
References: <1432045692-2458-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1432045692-2458-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Philipp

On Tue, May 19, 2015 at 04:28:12PM +0200, Philipp Zabel wrote:
> The parallel-display driver used an undocumented, non-standard property
> "fsl,panel" to optionally associate with a drm_panel device. This patch
> fixes the driver to use the same OF graph bindings as the LDB driver
> instead:
> 
>     parallel-display {
>             compatible = "fsl,imx-parallel-display";
>             ...
> 
>             port@1 {
>                     reg = <1>;
> 
>                     parallel_out: endpoint {
>                             remote_endpoint = <&panel_in>;
>                     };
>             };
>     };
> 
>     panel {
>             ...
> 
>             port {
>                     panel_in: endpoint {
>                             remote-endpoint = <&parallel_out>;
>                     };
>             };
>     };
> 
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> 
> ---

Tested on Nitrogen6x and Sabrelite using a Okaya RS800480T-7X0GP
display. Below are the different patches submitted that make use of this
change:
https://patchwork.kernel.org/patch/6585541/
https://patchwork.kernel.org/patch/6585551/
https://patchwork.kernel.org/patch/6504711/
https://patchwork.kernel.org/patch/6504731/

Tested-by: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>

Regards,
Gary
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
