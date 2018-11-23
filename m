From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] ARM: dts: r9a06g032: Correct the GIC DT node name
Date: Fri, 23 Nov 2018 10:24:06 +0100
Message-ID: <CAMuHMdUH74QA5oSuOe9LgoS08-CEHiGSz_FzPQs6S9BzCijDag@mail.gmail.com>
References: <20181121100844.25825-1-phil.edworthy@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181121100844.25825-1-phil.edworthy@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 21, 2018 at 11:10 AM Phil Edworthy
<phil.edworthy@renesas.com> wrote:
> Harmless mistake, but it's incorrect. The DT spec provides recommendations
> for the node names:
> "The name of a node should be somewhat generic, reflecting the function
> of the device and not its precise programming model. If appropriate, the
> name should be one of the following choices:
> ...
> interrupt-controller"
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
