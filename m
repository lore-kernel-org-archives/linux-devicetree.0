From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 04/18] arm64: dts: m3ulcb-kf: initial device tree
Date: Wed, 20 Sep 2017 14:32:28 +0200
Message-ID: <CAMuHMdX-7MG2fCzJ-K5iQLnJcmZBaWjqMhmOhCxEemmWTh9pvw@mail.gmail.com>
References: <1505398732-4614-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1505398732-4614-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>
List-Id: devicetree@vger.kernel.org

Hi Vladimir,

[CC Pantelis]

On Thu, Sep 14, 2017 at 4:18 PM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> Add the initial device tree for the M3ULCB with Kingfisher extension
> infotainment board.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> ---
> Changes in version 2:
> - added own compatible value "shimafuji,kingfisher"

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Some food for thought below...

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts
> @@ -0,0 +1,19 @@
> +/*
> + * Device Tree Source for the M3ULCB Kingfisher board
> + *
> + * Copyright (C) 2017 Renesas Electronics Corp.
> + * Copyright (C) 2017 Cogent Embedded, Inc.
> + *
> + * This file is licensed under the terms of the GNU General Public License
> + * version 2.  This program is licensed "as is" without any warranty of any
> + * kind, whether express or implied.
> + */
> +
> +#include "r8a7796-m3ulcb.dts"

Ideally, we don't include *.dts files, only *.dtsi.
But I don't see a better immediate solution.

> +#include "ulcb-kf.dtsi"

As the Kingfisher is actually an expansion board for H3ULCB (with R-Car H3
ES1.1 and ES2.0) and M3ULCB (with R-Car M3-W), turning ulcb-kf.dtsi into a
DT overlay would make sense.
That would also solve the issue of the 3 extra DTSes needed for all possible
combinations of ULCB and Kingfisher (r8a7795-es1-h3ulcb-kf.dts,
r8a7795-h3ulcb-kf.dts, r8a7796-h3ulcb-kf.dts (perhaps more to follow?)).

But that's too premature, without upstream support for the easy loading of
DT overlays.

> +/ {
> +       model = "Renesas M3ULCB Kingfisher board based on r8a7796";
> +       compatible = "shimafuji,kingfisher", "renesas,m3ulcb",
> +                    "renesas,r8a7796";
> +};

And how to support from an overlay the addition of "shimafuji,kingfisher" to
(not replacement of!) the main compatible value?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
