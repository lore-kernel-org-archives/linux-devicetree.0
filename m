From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC] device-tree: resets properties, reset topology, and shared resets
Date: Tue, 8 Jan 2019 09:09:18 +0100
Message-ID: <CAMuHMdXQqAaXBBAs6e4wJHWTjDTikXjzt3N0bMmAwSgyMqEcRw@mail.gmail.com>
References: <20190107175127.21240-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190107175127.21240-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>, Auger Eric <eric.auger@redhat.com>, Alex Williamson <alex.williamson@redhat.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 7, 2019 at 6:51 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -459,6 +459,42 @@ static void __reset_control_put_internal(struct reset_control *rstc)
>         kref_put(&rstc->refcnt, __reset_control_release);
>  }
>
> +static bool __of_reset_is_exclusive(const struct device_node *node,
> +                                   const struct of_phandle_args *args,
> +                                   const char *id)
> +{
> +       struct of_phandle_args args2;
> +       struct device_node *node2;
> +       int index, ret;
> +       bool eq;
> +
> +       for_each_node_with_property(node2, "resets") {
> +               if (node == node2)
> +                       continue;
> +
> +               for (index = 0; ; index++) {
> +                       ret = of_parse_phandle_with_args(node2, "resets",
> +                                                        "#reset-cells", index,
> +                                                        &args2);
> +                       if (ret)
> +                               break;
> +
> +                       eq = (args2.np == args.np &&
> +                             args2.args_count == args.args_count &&
> +                             !memcmp(args2.args, args.args,
> +                                     args.args_count * sizeof(args.args[0])));

This is embarrasing: as kbuild test robot pointed out, these should be
"args->" instead of "args.".

I failed to notice, as I have a local follow-up patch extracting this
comparison into a common helper.

Nevertheless, this doesn't change anything w.r.t. the principle behind
this patch.
Thanks again!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
