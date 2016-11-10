From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] drm/tilcdc: Add drm bridge support for attaching drm
 bridge drivers
Date: Wed, 9 Nov 2016 18:50:24 -0600
Message-ID: <20161110005024.obq64awejfnoarog@rob-hp-laptop>
References: <cover.1478103726.git.jsarha@ti.com>
 <463d18493ac508708ed764e71d11c2b89662544c.1478103726.git.jsarha@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <463d18493ac508708ed764e71d11c2b89662544c.1478103726.git.jsarha-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 02, 2016 at 06:32:17PM +0200, Jyri Sarha wrote:
> Adds drm bride support for attaching drm bridge drivers to tilcdc. The
> decision whether a video port leads to an external encoder or bridge
> is made simply based on remote device's compatible string. The code
> has been tested with BeagleBone-Black with and without BeagleBone
> DVI-D Cape Rev A3 using ti-tfp410 driver.
> 
> Signed-off-by: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
> ---
>  .../devicetree/bindings/display/tilcdc/tilcdc.txt  |   7 +-
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c                |   7 +-
>  drivers/gpu/drm/tilcdc/tilcdc_drv.h                |   2 +
>  drivers/gpu/drm/tilcdc/tilcdc_external.c           | 140 ++++++++++++++++++---
>  drivers/gpu/drm/tilcdc/tilcdc_external.h           |   1 +
>  5 files changed, 135 insertions(+), 22 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
> index 6fddb4f..ae7a942 100644
> --- a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
> +++ b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
> @@ -34,9 +34,10 @@ Optional properties:
>  
>  Optional nodes:
>  
> - - port/ports: to describe a connection to an external encoder. The
> -   binding follows Documentation/devicetree/bindings/graph.txt and
> -   suppors a single port with a single endpoint.
> + - port/ports: to describe a connection to an external encoder or
> +   bridge. The binding follows
> +   Documentation/devicetree/bindings/graph.txt and suppors a single
> +   port with a single endpoint.

I don't think a DT change is needed here. Bridge vs. encoder is all DRM 
terminology.

>  
>   - See also Documentation/devicetree/bindings/display/tilcdc/panel.txt and
>     Documentation/devicetree/bindings/display/tilcdc/tfp410.txt for connecting
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
