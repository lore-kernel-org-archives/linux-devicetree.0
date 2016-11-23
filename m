From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 1/3] bus: da8xx-mstpri: drop the call to
 of_flat_dt_get_machine_name()
Date: Wed, 23 Nov 2016 17:55:43 +0530
Message-ID: <34a4f4ed-37bb-e5d9-3d44-383f23d274bc@ti.com>
References: <1479899187-10199-1-git-send-email-bgolaszewski@baylibre.com>
 <1479899187-10199-2-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479899187-10199-2-git-send-email-bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-drm <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Bartosz,

On Wednesday 23 November 2016 04:36 PM, Bartosz Golaszewski wrote:
> In order to avoid a section mismatch use a locally implemented routine
> instead of of_flat_dt_get_machine_name() when printing the error
> message.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/bus/da8xx-mstpri.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/da8xx-mstpri.c b/drivers/bus/da8xx-mstpri.c
> index 85f0b53..064eeb9 100644
> --- a/drivers/bus/da8xx-mstpri.c
> +++ b/drivers/bus/da8xx-mstpri.c
> @@ -16,7 +16,6 @@
>  #include <linux/platform_device.h>
>  #include <linux/io.h>
>  #include <linux/regmap.h>
> -#include <linux/of_fdt.h>
>  
>  /*
>   * REVISIT: Linux doesn't have a good framework for the kind of performance
> @@ -190,6 +189,26 @@ static const struct da8xx_mstpri_board_priorities da8xx_mstpri_board_confs[] = {
>  	},
>  };
>  
> +/*
> + * FIXME Remove this function once of/base gets a general routine for getting
> + * the machine model/compatible string.
> + */
> +static const char *da8xx_mstpri_machine_get_compatible(void)
> +{
> +	struct device_node *root;
> +	const char *compatible;
> +	int ret = -1;
> +
> +	root = of_find_node_by_path("/");
> +	if (root) {
> +		ret = of_property_read_string_index(root, "compatible",
> +						    0, &compatible);
> +		of_node_put(root);
> +	}
> +
> +	return ret ? NULL : compatible;
> +}

As I just noted in the thread for v1 of this patch, calling
of_node_put(root) while keeping a reference to its compatible property
for later use sounds really broken.

I think it is safest to fix this by not including the compatible name in
error message at all. The error message will be little less descriptive,
but thats better than adding questionable code.

Thats what Frank suggested first up, but I did not realize at that time
that printing compatible name will be this much effort.

Can you please send a v4?

Thanks,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
