From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] nvmem: Convert to using %pOF instead of full_name
Date: Wed, 9 Aug 2017 17:14:06 -0500
Message-ID: <CAL_Jsq+bJjdfdNjpx=URP4EHPJt=MDc2V-eVr8OaPAftVph4cg@mail.gmail.com>
References: <20170718214339.7774-40-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170718214339.7774-40-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 18, 2017 at 4:43 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> Now that we have a custom printf format specifier, convert users of
> full_name to use %pOF instead. This is preparation to remove storing
> of the full path string for each node.
>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/nvmem/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Ping?

>
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 4c49285168fb..b0c60338296a 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -794,8 +794,8 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_node *np,
>
>         addr = of_get_property(cell_np, "reg", &len);
>         if (!addr || (len < 2 * sizeof(u32))) {
> -               dev_err(&nvmem->dev, "nvmem: invalid reg on %s\n",
> -                       cell_np->full_name);
> +               dev_err(&nvmem->dev, "nvmem: invalid reg on %pOF\n",
> +                       cell_np);
>                 rval  = -EINVAL;
>                 goto err_mem;
>         }
> --
> 2.11.0
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
