From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v3 2/4] media: adv7180: add adv7180cp, adv7180st
 compatible strings
Date: Fri, 30 Jun 2017 11:19:01 +0200
Message-ID: <CAMuHMdU-LcB_Te_SeqkZbji81v82n-NP0VKAAdDQ=DhqE5wBwg@mail.gmail.com>
References: <1495199224-16337-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1495199224-16337-3-git-send-email-ulrich.hecht+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1495199224-16337-3-git-send-email-ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ulrich,

On Fri, May 19, 2017 at 3:07 PM, Ulrich Hecht
<ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Used to differentiate between models with 3 and 6 inputs.
>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/media/i2c/adv7180.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> index bdbbf8c..78de7dd 100644
> --- a/drivers/media/i2c/adv7180.c
> +++ b/drivers/media/i2c/adv7180.c
> @@ -1452,6 +1452,8 @@ static SIMPLE_DEV_PM_OPS(adv7180_pm_ops, adv7180_suspend, adv7180_resume);
>  #ifdef CONFIG_OF
>  static const struct of_device_id adv7180_of_id[] = {
>         { .compatible = "adi,adv7180", },
> +       { .compatible = "adi,adv7180cp", },
> +       { .compatible = "adi,adv7180st", },
>         { .compatible = "adi,adv7182", },
>         { .compatible = "adi,adv7280", },
>         { .compatible = "adi,adv7280-m", },

Adding compatible entries here is not sufficient, and causes a crash on
r8a7793/gose with renesas-drivers-2017-06-27-v4.12-rc7:

    adv7180 2-0020: chip found @ 0x20 (e6530000.i2c)
    Unable to handle kernel NULL pointer dereference at virtual address 00000014
    pgd = c0003000
    [00000014] *pgd=80000040004003, *pmd=00000000
    Internal error: Oops: 207 [#1] SMP ARM
    Modules linked in:
    CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.12.0-rc7-rcar2-initrd #37
    Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
    task: df427040 task.stack: df436000
    PC is at adv7180_probe+0x84/0x3cc

In the absence of an entry in adv7180_id[], the passed i2c_device_id
pointer is NULL, and thus dereferencing it crashes the system.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
