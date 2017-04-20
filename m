From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/3] ARM: dts: sk-rzg1m: add SCIF0 pins
Date: Thu, 20 Apr 2017 16:19:09 +0200
Message-ID: <CAMuHMdWCan+XRgbjdMXNqWuUoY_ZeWR1hiicgYg3s5gKQRchpQ@mail.gmail.com>
References: <20170414211509.818645915@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170414211509.818645915@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Fri, Apr 14, 2017 at 11:09 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the (previously omitted) SCIF0 pin data to the SK-RZG1M board's
> device tree.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
>  arch/arm/boot/dts/r8a7743-sk-rzg1m.dts |   12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> Index: renesas/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
> ===================================================================
> --- renesas.orig/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
> +++ renesas/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
> @@ -1,7 +1,7 @@
>  /*
>   * Device Tree Source for the SK-RZG1M board
>   *
> - * Copyright (C) 2016 Cogent Embedded, Inc.
> + * Copyright (C) 2016-2017 Cogent Embedded, Inc.
>   *
>   * This file is licensed under the terms of the GNU General Public License
>   * version 2. This program is licensed "as is" without any warranty of any
> @@ -39,7 +39,17 @@
>         clock-frequency = <20000000>;
>  };
>
> +&pfc {
> +       scif0_pins: scif0 {
> +               groups = "scif0_data";

I don't have schematics for this board, but you told me it's very similar to
Porter. Hence I'd expect "scif0_data_d" instead.

In my experience, when changing pinctrl to map the lines of a device to a new
set of pins, but not mapping another device to the old set of pins, it may
output the signals on both the old and the new set of pins.

Does serial console input work with "scif0_data"?

> +               function = "scif0";
> +       };
> +};
> +
>  &scif0 {
> +       pinctrl-0 = <&scif0_pins>;
> +       pinctrl-names = "default";
> +
>         status = "okay";

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
