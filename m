From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 02/08] clocksource: sh_cmt: Use 0x3f mask for SH_CMT_48BIT case
Date: Mon, 22 Jun 2015 11:43:17 +0200
Message-ID: <CAMuHMdVgEh3d_OU1NVTHuP2gYrHf6mj36FQaTjMKBzqn6JA_cw@mail.gmail.com>
References: <20150621080903.10187.20998.sendpatchset@little-apple>
	<20150621080927.10187.98007.sendpatchset@little-apple>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150621080927.10187.98007.sendpatchset@little-apple>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Linux-sh list <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 21, 2015 at 10:09 AM, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>
>
> Always use 0x3f as channel mask for the SH_CMT_48BIT type of devices.
> Once this patch is applied the "renesas,channels-mask" property will
> be ignored by the driver for older devices matching SH_CMT_48BIT. In
> the future when all CMT types store channel mask in the driver then
> we will be able to deprecate and remove "renesas,channels-mask" from DTS.
>
> Signed-off-by: Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>
> ---
>
>  drivers/clocksource/sh_cmt.c |   14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> --- 0001/drivers/clocksource/sh_cmt.c
> +++ work/drivers/clocksource/sh_cmt.c   2015-06-20 15:25:54.302366518 +0900

> @@ -969,9 +972,14 @@ static int sh_cmt_setup(struct sh_cmt_de
>                 id = of_match_node(sh_cmt_of_table, pdev->dev.of_node);
>                 cmt->info = id->data;
>
> -               ret = sh_cmt_parse_dt(cmt);
> -               if (ret < 0)
> -                       return ret;
> +               /* prefer in-driver channel configuration over DT */
> +               if (cmt->info->channels_mask) {
> +                       cmt->hw_channels = cmt->info_channels_mask;

drivers/clocksource/sh_cmt.c: In function 'sh_cmt_setup':
drivers/clocksource/sh_cmt.c:996:26: error: 'struct sh_cmt_device' has
no member named 'info_channels_mask'
    cmt->hw_channels = cmt->info_channels_mask;
                          ^

"cmt->info->channels_mask"

> +               } else {
> +                       ret = sh_cmt_parse_dt(cmt);
> +                       if (ret < 0)
> +                               return ret;
> +               }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
