Return-Path: <SRS0=rS5h=HH=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1523956215-28154-6-git-send-email-t-kristo@ti.com>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com> <1523956215-28154-6-git-send-email-t-kristo@ti.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Apr 2018 16:20:22 +0200
Message-ID: <CAMuHMdUjXJwPajeRhgpETHOVSC7KA3NUnqPNBhKYuUGEMoyyow@mail.gmail.com>
Subject: Re: [RFC 05/13] ARM: dts: ti: add support for building .dtb files
 containing symbols
Content-Type: text/plain; charset="UTF-8"
To: Tero Kristo <t-kristo@ti.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, wmills@ti.com, ext Tony Lindgren <tony@atomide.com>, Tom Rini <trini@konsulko.com>, Russell King <rmk@armlinux.org.uk>
List-ID: <devicetree@vger.kernel.org>

Hi Tero,

On Tue, Apr 17, 2018 at 11:10 AM, Tero Kristo <t-kristo@ti.com> wrote:
> Symbols in the DTB files are needed so that overlays can be applied
> properly. Add support for building TI SoC specific .dtb files, the
> source is fetched from parent directory.
>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>

Thanks for your patch!

> ---
>  arch/arm/boot/dts/ti/Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/ti/Makefile b/arch/arm/boot/dts/ti/Makefile
> index b26328b..7d2d411 100644
> --- a/arch/arm/boot/dts/ti/Makefile
> +++ b/arch/arm/boot/dts/ti/Makefile
> @@ -1 +1,6 @@
> +DTC_FLAGS += -@ -Wno-reg_format -Wno-avoid_default_addr_size

Why the -W options?

> +
> +$(obj)/%.dtb: $(src)/../%.dts FORCE

I guess you want a dependency on $(DTC), too?

> +       $(call if_changed_dep,dtc)
> +
>  clean-files    += *.dtbo

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
