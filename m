From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH v5 03/12] dt-bindings: display: sun4i-drm: Add LVDS properties
Date: Sat, 30 Dec 2017 12:45:19 +0100
Message-ID: <1927811.df6406f6u0@jernej-laptop>
References: <cover.e5a47cc96ec5274dd932daa2bde47df073087da9.1513854122.git-series.maxime.ripard@free-electrons.com> <ddbde28fe2e4f21412974e4c69fbfe1c5ff9383f.1513854122.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ddbde28fe2e4f21412974e4c69fbfe1c5ff9383f.1513854122.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

Dne četrtek, 21. december 2017 ob 12:02:29 CET je Maxime Ripard napisal(a):
> Some clocks and resets supposed to drive the LVDS logic in the display
> engine have been overlooked when the driver was first introduced.
> 
> Add those additional resources to the binding, and we'll deal with the ABI
> stability in the code.
> 
> Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt |  9 +++++++-
> 1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt index
> 50cc72ee1168..1e21cfaac9e2 100644
> --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> @@ -121,6 +121,15 @@ Required properties:
>  On SoCs other than the A33 and V3s, there is one more clock required:
>     - 'tcon-ch1': The clock driving the TCON channel 1
> 
> +On SoCs that support LVDS (all SoCs but the A13, H3, H5 and V3s), you
> +need one more reset line:
> +   - 'lvds': The reset line driving the LVDS logic
> +
> +And on the SoCs newer than the A31 (sun6i and sun8i families), you
> +need one more clock line:
> +   - 'lvds-alt': An alternative clock source, separate from the TCON
> channel 0 +                 clock, that can be used to drive the LVDS clock

I think this wording is imprecise, since A83T is part of the sun8i family, but 
from the code (patch 7) and DT changes (patch 9) you do, it doesn't need this 
property.

Maybe it would be just easier to enumerate all compatibles which needs this 
property? 

Best regards,
Jernej


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
