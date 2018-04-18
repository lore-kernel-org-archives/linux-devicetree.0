Return-Path: <SRS0=rS5h=HH=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1523956215-28154-7-git-send-email-t-kristo@ti.com>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com> <1523956215-28154-7-git-send-email-t-kristo@ti.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Apr 2018 16:36:13 +0200
Message-ID: <CAMuHMdWmsnRDBTvv+dy0uGx_6XSVErLHJgR_rQNvepOhAyDg4g@mail.gmail.com>
Subject: Re: [RFC 06/13] ARM: dts: am57xx-evm: add AM57xx-evm DT overlay
Content-Type: text/plain; charset="UTF-8"
To: Tero Kristo <t-kristo@ti.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, wmills@ti.com, ext Tony Lindgren <tony@atomide.com>, Tom Rini <trini@konsulko.com>, Russell King <rmk@armlinux.org.uk>
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 17, 2018 at 11:10 AM, Tero Kristo <t-kristo@ti.com> wrote:
> The AM57xx-evm is an overlay on top of beagle-x15 board. This contains
> a display extension macro, and a few extra peripherals. Two versions
> of the evm are supported, the base evm and the latest rev A3 evm. A
> common overlay file is used for both boards.
>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  arch/arm/boot/dts/ti/am57xx-evm-common.dtso | 175 ++++++++++++++++++++++++++++
>  arch/arm/boot/dts/ti/am57xx-evm-reva3.dtso  |  11 ++
>  arch/arm/boot/dts/ti/am57xx-evm.dtso        |  11 ++
>  3 files changed, 197 insertions(+)
>  create mode 100644 arch/arm/boot/dts/ti/am57xx-evm-common.dtso
>  create mode 100644 arch/arm/boot/dts/ti/am57xx-evm-reva3.dtso
>  create mode 100644 arch/arm/boot/dts/ti/am57xx-evm.dtso
>
> diff --git a/arch/arm/boot/dts/ti/am57xx-evm-common.dtso b/arch/arm/boot/dts/ti/am57xx-evm-common.dtso
> new file mode 100644
> index 0000000..68c3937
> --- /dev/null
> +++ b/arch/arm/boot/dts/ti/am57xx-evm-common.dtso
> @@ -0,0 +1,175 @@
> +/dts-v1/;
> +/plugin/;
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +  fragment@101 {
> +       target-path = "/";
> +
> +       __overlay__ {

It would be good to have "scripts/dtc: Correct overlay syntactic sugar for
generating target-path fragments" in the kernel's copy of dtc, so this
section can be converted to sugar syntax, too.


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
