From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH Resend] of: fix a build error to f_graph_get_endpoint_by_regs
 function
Date: Tue, 23 Jun 2015 08:57:34 -0500
Message-ID: <CAL_JsqLZc4vPcO3hFq3MYh2ebyXZEe1L91MVFh8uFFbTAhAj0Q@mail.gmail.com>
References: <1435043204-23133-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435043204-23133-1-git-send-email-inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 23, 2015 at 2:06 AM, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> This patch fixes the below build error reported by Stephen,
>
>      Stephen reported:
>      After merging the drm-exynos tree, today's linux-next build (x86_64
>      allmodconfig) failed like this:
>
>      drivers/media/i2c/adv7604.o: In function `of_graph_get_endpoint_by_regs':
>      adv7604.c:(.text+0x586c): multiple definition of `of_graph_get_endpoint_by_regs'
>      drivers/media/i2c/adv7343.o:adv7343.c:(.text+0xa13): first defined here
>      drivers/media/platform/soc_camera/atmel-isi.o: In function `of_graph_get_endpoint_by_regs':
>      atmel-isi.c:(.text+0x1ec9): multiple definition of `of_graph_get_endpoint_by_regs'
>      drivers/media/platform/soc_camera/soc_camera.o:soc_camera.c:(.text+0x2ce3): first defined here
>      drivers/media/platform/soc_camera/rcar_vin.o: In function `of_graph_get_endpoint_by_regs':
>      rcar_vin.c:(.text+0x307c): multiple definition of `of_graph_get_endpoint_by_regs'
>      drivers/media/platform/soc_camera/soc_camera.o:soc_camera.c:(.text+0x2ce3): first defined here
>
>      Caused by commit:
>        a0f7001c18ca ("of: add helper for getting endpoint node of specific identifiers")
>
> To fix the error, this patch declares of_graph_get_endpoint_by_regs function
> with "static inline".
>
> Signed-off-by: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  include/linux/of_graph.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
> index 1c1d5b9..f8bcd0e 100644
> --- a/include/linux/of_graph.h
> +++ b/include/linux/of_graph.h
> @@ -71,7 +71,7 @@ static inline struct device_node *of_graph_get_next_endpoint(
>         return NULL;
>  }
>
> -struct device_node *of_graph_get_endpoint_by_regs(
> +static inline struct device_node *of_graph_get_endpoint_by_regs(
>                 const struct device_node *parent, int port_reg, int reg)
>  {
>         return NULL;
> --
> 1.7.9.5
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
