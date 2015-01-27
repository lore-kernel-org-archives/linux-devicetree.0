From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC/PATCH] pinctrl: sh-pfc: Accept standard function, pins and
 groups properties
Date: Tue, 27 Jan 2015 21:40:45 +0100
Message-ID: <CAMuHMdW5Apvbe7+y2FW6O=JS7ZMUQsW6eFMc-ooiLvF3fqY0WA@mail.gmail.com>
References: <CACRpkda4SBof0EaZVWtEYaeb6j_BGAVj39kje+mBz90eB3qAwQ@mail.gmail.com>
	<1422390694-12389-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1422390694-12389-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-sh-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niso@kth.se>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 27, 2015 at 9:31 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> +               if (of_find_property(np, "groups", NULL) ||
> +                   of_find_property(np, "pins", NULL)) {
> +                       pmx->func_prop_name = "function";
> +                       pmx->groups_prop_name = "groups";
> +                       pmx->pins_prop_name = "pins";
> +               } else {
> +                       pmx->func_prop_name = "renesas,function";
> +                       pmx->groups_prop_name = "renesas,groups";
> +                       pmx->pins_prop_name = "renesas,pins";
> +               }

Do we want to be clever and save memory?

        pmx->func_prop_name = "renesas,function";
        pmx->groups_prop_name = "renesas,groups";
        pmx->pins_prop_name = "renesas,pins";
        if (of_find_property(np, "groups", NULL) ||
            of_find_property(np, "pins", NULL)) {
                pmx->func_prop_name += strlen("renesas,");
                pmx->groups_prop_name += strlen("renesas,");
                pmx->pins_prop_name += strlen("renesas,");
        }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
