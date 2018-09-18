From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC v4 1/2] reset: Add support for dedicated reset controls
Date: Tue, 18 Sep 2018 08:42:46 +0200
Message-ID: <CAMuHMdXUsOuYwe0jbC1bCSHMp=Rcu-a_oYOz9f8q3LNxNiO1JQ@mail.gmail.com>
References: <20180917163955.19023-1-geert+renesas@glider.be> <20180917163955.19023-2-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180917163955.19023-2-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Auger Eric <eric.auger@redhat.com>, Alex Williamson <alex.williamson@redhat.com>, KVM list <kvm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 17, 2018 at 6:40 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> In some SoCs multiple hardware blocks may share a reset control.
> The existing reset control API for shared resets will only assert such a
> reset when the drivers for all hardware blocks agree.
> The existing exclusive reset control API still allows to assert such a
> reset, but that impacts all other hardware blocks sharing the reset.
>
> Sometimes a driver needs to reset a specific hardware block, and be 100%
> sure it has no impact on other hardware blocks.  This is e.g. the case
> for virtualization with device pass-through, where the host wants to
> reset any exported device before and after exporting it for use by the
> guest, for isolation.
>
> Hence a new flag for dedicated resets is added to the internal methods,
> with a new public reset_control_get_dedicated() method, to obtain an
> exclusive handle to a reset that is dedicated to one specific hardware
> block.
>
> This supports both DT-based and lookup-based reset controls.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v4:
>   - New.
>
> Notes:
>   - Dedicated lookup-based reset controls were not tested,

And untested code is buggy...

> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c

> @@ -541,9 +575,25 @@ __reset_controller_by_name(const char *name)
>         return NULL;
>  }
>
> +static bool __reset_is_dedicated(const struct reset_control_lookup *lookup)
> +{
> +       const struct reset_control_lookup *lookup2;
> +
> +       list_for_each_entry(lookup, &reset_lookup_list, list) {

... as the list_for_each() should use "lookup2" instead of "lookup" (warning
reported by kbuild robot).

> +               if (lookup2 == lookup)
> +                       continue;
> +
> +               if (lookup2->provider == lookup->provider &&
> +                   lookup2->index == lookup->index)
> +                       return false;
> +       }
> +
> +       return true;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
