From: Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1 1/2] of: irq: Ignore disabled intc's when searching map
Date: Wed, 4 Dec 2013 14:42:50 +1000
Message-ID: <CAEgOgz5USCRS5cB6bchFjZfafE6syPzWob8H8yNjczgKLB_RRw@mail.gmail.com>
References: <cover.1385623064.git.peter.crosthwaite@xilinx.com>
	<ee3c0c716da8f1b1146d8829bc5184fbf1c3ead2.1385623064.git.peter.crosthwaite@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ee3c0c716da8f1b1146d8829bc5184fbf1c3ead2.1385623064.git.peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant-likely <grant-likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Ping!

On Thu, Nov 28, 2013 at 5:26 PM, Peter Crosthwaite
<peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> When searching the interrupt map, if a matched parent is disabled, just
> ignore it and move on with the search.
>
> This allows for specifying connection of a single device IRQ to
> multiple interrupt controllers via the interrupt map schema. This change
> allows for selection of the active interrupt controller via the already
> existing status = "disabled" mechanism.
>
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Acked-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/of/irq.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 786b0b4..22e414b 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -217,6 +217,9 @@ int of_irq_parse_raw(const __be32 *addr, struct of_phandle_args *out_irq)
>                                 goto fail;
>                         }
>
> +                       if (!of_device_is_available(newpar))
> +                               match = 0;
> +
>                         /* Get #interrupt-cells and #address-cells of new
>                          * parent
>                          */
> --
> 1.8.4.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
