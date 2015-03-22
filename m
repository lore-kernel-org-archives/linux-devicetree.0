From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of/irq: Fix of_irq_parse_one() returned error codes
Date: Sun, 22 Mar 2015 15:05:04 -0500
Message-ID: <CAL_JsqJ=wVnG8FTTy4X+DWqUyo=kSMJh8dk-tZKgMk5Kb5nYEA@mail.gmail.com>
References: <1426630892-30206-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426630892-30206-1-git-send-email-laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 17, 2015 at 5:21 PM, Laurent Pinchart
<laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:
> The error code paths that require cleanup use a goto to jump to the
> cleanup code and return an error code. However, the error code variable
> res, which is initialized to -EINVAL when declared, is then overwritten
> with the return value of of_parse_phandle_with_args(), and reused as the
> return code from of_irq_parse_one(). This leads to an undetermined error
> being returned instead of the expected -EINVAL value. Fix it.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

Applied. Thanks.

Rob

> ---
>  drivers/of/irq.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 0d7765807f49..1a7980692f25 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -290,7 +290,7 @@ int of_irq_parse_one(struct device_node *device, int index, struct of_phandle_ar
>         struct device_node *p;
>         const __be32 *intspec, *tmp, *addr;
>         u32 intsize, intlen;
> -       int i, res = -EINVAL;
> +       int i, res;
>
>         pr_debug("of_irq_parse_one: dev=%s, index=%d\n", of_node_full_name(device), index);
>
> @@ -323,15 +323,19 @@ int of_irq_parse_one(struct device_node *device, int index, struct of_phandle_ar
>
>         /* Get size of interrupt specifier */
>         tmp = of_get_property(p, "#interrupt-cells", NULL);
> -       if (tmp == NULL)
> +       if (tmp == NULL) {
> +               res = -EINVAL;
>                 goto out;
> +       }
>         intsize = be32_to_cpu(*tmp);
>
>         pr_debug(" intsize=%d intlen=%d\n", intsize, intlen);
>
>         /* Check index */
> -       if ((index + 1) * intsize > intlen)
> +       if ((index + 1) * intsize > intlen) {
> +               res = -EINVAL;
>                 goto out;
> +       }
>
>         /* Copy intspec into irq structure */
>         intspec += index * intsize;
> --
> Regards,
>
> Laurent Pinchart
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
