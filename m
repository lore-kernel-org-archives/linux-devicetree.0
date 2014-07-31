From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of/irq: lookup 'interrupts-extended' property first
Date: Thu, 31 Jul 2014 11:00:01 -0700
Message-ID: <CAGVrzcYfA8rCXGRW7g0JhT4GQKT8SQj+pMvCh25yoXLFGNM_Pw@mail.gmail.com>
References: <1403220823-19444-1-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403220823-19444-1-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2014-06-19 16:33 GMT-07:00 Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> In case the Device Tree blob passed by the boot agent supplies both an
> 'interrupts-extended' and an 'interrupts' property in order to allow for
> older kernels to be usable, prefer the new-style 'interrupts-extended'
> property which convey a lot more information.
>
> This allows us to have bootloaders willingly maintaining backwards
> compatibility with older kernels without entirely deprecating the
> 'interrupts' property (although that is a clear violation of the binding
> specified at
> Documentation/devicetree/bindings/interrupt-controller/interrupts.txt)

Any comments on this? Brian suggested that I update
interrupt-controller/interrupts.txt to specify the look up ordering
change as well.

Thanks!

>
> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/of/irq.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 3e06a699352d..1af3be2396db 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -301,16 +301,17 @@ int of_irq_parse_one(struct device_node *device, int index, struct of_phandle_ar
>         /* Get the reg property (if any) */
>         addr = of_get_property(device, "reg", NULL);
>
> +       /* Try the new-style interrupts-extended */
> +       res = of_parse_phandle_with_args(device, "interrupts-extended",
> +                                       "#interrupt-cells", index, out_irq);
> +       if (!res)
> +               return of_irq_parse_raw(addr, out_irq);
> +
>         /* Get the interrupts property */
>         intspec = of_get_property(device, "interrupts", &intlen);
> -       if (intspec == NULL) {
> -               /* Try the new-style interrupts-extended */
> -               res = of_parse_phandle_with_args(device, "interrupts-extended",
> -                                               "#interrupt-cells", index, out_irq);
> -               if (res)
> -                       return -EINVAL;
> -               return of_irq_parse_raw(addr, out_irq);
> -       }
> +       if (intspec == NULL)
> +               return -EINVAL;
> +
>         intlen /= sizeof(*intspec);
>
>         pr_debug(" intspec=%d intlen=%d\n", be32_to_cpup(intspec), intlen);
> --
> 1.9.1
>



-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
